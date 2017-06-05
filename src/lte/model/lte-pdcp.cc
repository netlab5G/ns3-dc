/* -*-  Mode: C++; c-file-style: "gnu"; indent-tabs-mode:nil; -*- */
/*
 * Copyright (c) 2011-2012 Centre Tecnologic de Telecomunicacions de Catalunya (CTTC)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation;
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * Author: Manuel Requena <manuel.requena@cttc.es>
 */

#include "ns3/log.h"
#include "ns3/simulator.h"

#include "ns3/lte-pdcp.h"
#include "ns3/lte-pdcp-header.h"
#include "ns3/lte-pdcp-sap.h"
#include "ns3/lte-pdcp-tag.h"
#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <stdio.h>
#include <stdlib.h>
#include <algorithm>
#include "Gtpu_SN_Header.h"
using namespace std;
namespace ns3 {

NS_LOG_COMPONENT_DEFINE ("LtePdcp");

class LtePdcpSpecificLteRlcSapUser : public LteRlcSapUser
{
public:
  LtePdcpSpecificLteRlcSapUser (LtePdcp* pdcp);

  // Interface provided to lower RLC entity (implemented from LteRlcSapUser)
  virtual void ReceivePdcpPdu (Ptr<Packet> p);

private:
  LtePdcpSpecificLteRlcSapUser ();
  LtePdcp* m_pdcp;
};

LtePdcpSpecificLteRlcSapUser::LtePdcpSpecificLteRlcSapUser (LtePdcp* pdcp)
  : m_pdcp (pdcp)
{
}

LtePdcpSpecificLteRlcSapUser::LtePdcpSpecificLteRlcSapUser ()
{
}

void
LtePdcpSpecificLteRlcSapUser::ReceivePdcpPdu (Ptr<Packet> p)
{
  m_pdcp->DoReceivePdu (p);
}

///////////////////////////////////////

NS_OBJECT_ENSURE_REGISTERED (LtePdcp);

LtePdcp::LtePdcp ()
  : m_pdcpSapUser (0),
    m_rlcSapProvider (0),
    m_rnti (0),
    m_lcid (0),
    m_txSequenceNumber (0),
    m_rxSequenceNumber (0)

{
  NS_LOG_FUNCTION (this);
  m_pdcpSapProvider = new LtePdcpSpecificLtePdcpSapProvider<LtePdcp> (this);
  m_rlcSapUser = new LtePdcpSpecificLteRlcSapUser (this);
  Last_Submitted_PDCP_RX_SN = -1;

  // sjkang
  receivedPDCP_SN =0;
  Next_PDCP_RX_SN =0;
  Reordering_PDCP_RX_COUNT =0;
  k=0;
  check =false;
  m_isEnbPdcp =false; // woody
  enable1X=false;
}

LtePdcp::~LtePdcp ()
{
  NS_LOG_FUNCTION (this);
}

TypeId
LtePdcp::GetTypeId (void)
{
  static TypeId tid = TypeId ("ns3::LtePdcp")
    .SetParent<Object> ()
    .SetGroupName("Lte")
	.AddConstructor<LtePdcp>()
	.AddAttribute("ExpiredTime", "PDCP reordering time",
			 TimeValue(MilliSeconds(100)),
			 MakeTimeAccessor (&LtePdcp::expiredTime),
             MakeTimeChecker ())
    .AddTraceSource ("TxPDU",
                     "PDU transmission notified to the RLC.",
                     MakeTraceSourceAccessor (&LtePdcp::m_txPdu),
                     "ns3::LtePdcp::PduTxTracedCallback")
    .AddTraceSource ("RxPDU",
                     "PDU received.",
                     MakeTraceSourceAccessor (&LtePdcp::m_rxPdu),
                     "ns3::LtePdcp::PduRxTracedCallback")
    .AddAttribute ("EnablePDCPReordering",
                   "Enable PDCP Reordering function",
                   BooleanValue (true),
                   MakeBooleanAccessor (&LtePdcp::m_enableReordering),
                   MakeBooleanChecker ())
    ;
  return tid;
}

void
LtePdcp::DoDispose ()
{
  NS_LOG_FUNCTION (this);
  delete (m_pdcpSapProvider);
  delete (m_rlcSapUser);
  t_ReorderingTimer.Cancel();

}


void
LtePdcp::SetRnti (uint16_t rnti)
{
  NS_LOG_FUNCTION (this << (uint32_t) rnti);
  m_rnti = rnti;
}

void
LtePdcp::SetLcId (uint8_t lcId)
{
  NS_LOG_FUNCTION (this << (uint32_t) lcId);
  m_lcid = lcId;
}

void
LtePdcp::SetLtePdcpSapUser (LtePdcpSapUser * s)
{
  NS_LOG_FUNCTION (this << s);
  m_pdcpSapUser = s;
}

LtePdcpSapProvider*
LtePdcp::GetLtePdcpSapProvider ()
{
  NS_LOG_FUNCTION (this);
  return m_pdcpSapProvider;
}

void
LtePdcp::SetLteRlcSapProvider (LteRlcSapProvider * s)
{
  NS_LOG_FUNCTION (this << s);
  m_rlcSapProvider = s;
}

LteRlcSapUser*
LtePdcp::GetLteRlcSapUser ()
{
  NS_LOG_FUNCTION (this);
  return m_rlcSapUser;
}

LtePdcp::Status
LtePdcp::GetStatus ()
{
  Status s;
  s.txSn = m_txSequenceNumber;
  s.rxSn = m_rxSequenceNumber;
  return s;
}

void
LtePdcp::SetStatus (Status s)
{
  m_txSequenceNumber = s.txSn;
  m_rxSequenceNumber = s.rxSn;
}

////////////////////////////////////////

void
LtePdcp::DoTransmitPdcpSdu (Ptr<Packet> p)
{
  NS_LOG_FUNCTION (this << m_rnti << (uint32_t) m_lcid << p->GetSize ());
LtePdcpHeader pdcpHeader;
//////////////////////////////////////////////////////// sjkang0601 for mapping Gtpu SN to Pdcp SN
if(!m_isEnbPdcp)  //for ue
{
        pdcpHeader.SetSequenceNumber (m_txSequenceNumber);
         m_txSequenceNumber++;
}
else if (enable1X)  ////  the case of 1X
{
        Gtpu_SN_Header gtpu_SN_Header;
        p->RemoveHeader(gtpu_SN_Header);
        m_txSequenceNumber= gtpu_SN_Header.GetGtpuSN();
	pdcpHeader.SetSequenceNumber (m_txSequenceNumber);
  
}
else { ////  the case of 1A and 3C
   pdcpHeader.SetSequenceNumber (m_txSequenceNumber);
         m_txSequenceNumber++;
}
/////////////////////////////////////////////////////////////////////////////
 // pdcpHeader.SetSequenceNumber (m_txSequenceNumber);

//  m_txSequenceNumber++;
  if (m_txSequenceNumber > m_maxPdcpSn)
    {
      m_txSequenceNumber = 0;
    }

  pdcpHeader.SetDcBit (LtePdcpHeader::DATA_PDU);

  NS_LOG_LOGIC ("PDCP header: " << pdcpHeader);
  p->AddHeader (pdcpHeader);

  // Sender timestamp
  PdcpTag pdcpTag (Simulator::Now ());
  p->AddByteTag (pdcpTag);
  m_txPdu (m_rnti, m_lcid, p->GetSize ());

  LteRlcSapProvider::TransmitPdcpPduParameters params;
  params.rnti = m_rnti;

  params.lcid = m_lcid;
  params.pdcpPdu = p;

  m_rlcSapProvider->TransmitPdcpPdu (params);
}

void
LtePdcp::IsEnbPdcp () // woody3C
{
  m_isEnbPdcp = true;
}

void
LtePdcp::DoTransmitPdcpSduDc (Ptr<Packet> p) // woody3C
{
  NS_LOG_FUNCTION (this << m_rnti << (uint32_t) m_lcid << p->GetSize ());

 LtePdcpHeader pdcpHeader;
  pdcpHeader.SetSequenceNumber (m_txSequenceNumber);

  m_txSequenceNumber++;
		
	if (m_txSequenceNumber > m_maxPdcpSn)
    		{
      		m_txSequenceNumber = 0;
    		}

	  pdcpHeader.SetDcBit (LtePdcpHeader::DATA_PDU);

	  NS_LOG_LOGIC ("PDCP header: " << pdcpHeader);
	  p->AddHeader (pdcpHeader);

	  // Sender timestamp
	  PdcpTag pdcpTag (Simulator::Now ());
	  p->AddPacketTag (pdcpTag);
	  m_txPdu (m_rnti, m_lcid, p->GetSize ());

	  LtePdcpSapUser::TransmitPdcpPduParametersDc params;
	  params.rnti = m_rnti;
	  params.lcid = m_lcid;
	  params.pdcpPdu = p;

	  m_pdcpSapUser->TransmitPdcpPduDc (params);

}



void
LtePdcp::DoReceivePdu (Ptr<Packet> p)
{
  NS_LOG_FUNCTION (this << m_rnti << (uint32_t) m_lcid << p->GetSize ());
  if (m_isEnbPdcp == 1 || m_enableReordering == false){
    PdcpTag pdcpTag;
    Time delay;

    // mmwave pdcp implementation
    if (p->FindFirstMatchingByteTag (pdcpTag))
    {
       delay = Simulator::Now() - pdcpTag.GetSenderTimestamp ();
    }
/*
  NS_ASSERT_MSG (p->PeekPacketTag (pdcpTag), "PdcpTag is missing");
    p->RemovePacketTag (pdcpTag);
    delay = Simulator::Now() - pdcpTag.GetSenderTimestamp ();
*/
    m_rxPdu(m_rnti, m_lcid, p->GetSize (), delay.GetNanoSeconds ());

    LtePdcpHeader pdcpHeader;
    p->RemoveHeader (pdcpHeader);
    NS_LOG_LOGIC ("PDCP header: " << pdcpHeader);
    m_rxSequenceNumber = pdcpHeader.GetSequenceNumber () + 1;
    if (m_rxSequenceNumber > m_maxPdcpSn)
    {
      m_rxSequenceNumber = 0;
    }

    LtePdcpSapUser::ReceivePdcpSduParameters params;
    params.pdcpSdu = p;
    params.rnti = m_rnti;
    params.lcid = m_lcid;

    CheckingArrivalOfSN[m_rxSequenceNumber]= Simulator::Now();
    PropagationDelaybySN[m_rxSequenceNumber] = delay;
    PdcpDelayCalculater(m_rxSequenceNumber);

    m_pdcpSapUser->ReceivePdcpSdu(params);

  }
  else
  {
    // enabling PDCP reordering in UE
    BufferingAndReordering(p);
  }
}

void
LtePdcp::BufferingAndReordering(Ptr<Packet> p){ // sjkang
  NS_LOG_FUNCTION (this);
  PdcpTag pdcpTag;
  Time delay;

  // mmwave pdcp implementation
  if (p->FindFirstMatchingByteTag (pdcpTag))
  {
    delay = Simulator::Now() - pdcpTag.GetSenderTimestamp ();
  }

/*NS_ASSERT_MSG (p->PeekPacketTag (pdcpTag), "PdcpTag is missing");
  p->RemovePacketTag (pdcpTag);
  delay = Simulator::Now() - pdcpTag.GetSenderTimestamp ();*/
  m_rxPdu(m_rnti, m_lcid, p->GetSize (), delay.GetNanoSeconds ());

  LtePdcpHeader pdcpHeader;
  p->RemoveHeader (pdcpHeader);
  NS_LOG_LOGIC ("PDCP header: " << pdcpHeader);

  m_rxSequenceNumber = pdcpHeader.GetSequenceNumber () + 1;
  if (m_rxSequenceNumber > m_maxPdcpSn)
  {
    m_rxSequenceNumber = 0;
  }

  LtePdcpSapUser::ReceivePdcpSduParameters params;
  params.pdcpSdu = p;
  params.rnti = m_rnti;
  params.lcid = m_lcid;

  BufferedPackets PacketInBuffer;
  PacketInBuffer.sequenceNumber = pdcpHeader.GetSequenceNumber();
  PacketInBuffer.params =params;
  receivedPDCP_SN =PacketInBuffer.sequenceNumber;

  CheckingArrivalOfSN[pdcpHeader.GetSequenceNumber()]= Simulator::Now();
  PropagationDelaybySN[pdcpHeader.GetSequenceNumber()] = delay;

  printData("RX_SN", PacketInBuffer.sequenceNumber);

  // for checking whether there is the same PDCP SDU in buffer
  std::map<uint16_t, LtePdcpSapUser::ReceivePdcpSduParameters>::iterator iter;
  for (iter =PdcpBuffer.begin(); iter != PdcpBuffer.end() ; ++iter)
  {
    if (iter->first == receivedPDCP_SN ) {
	NS_LOG_INFO(iter->first << "   discard ");
	return;
    }
  }

  PdcpBuffer[PacketInBuffer.sequenceNumber] = params;

// Logging module
/*    uint16_t nextPDCP_SN = (Last_Submitted_PDCP_RX_SN + 1)%(m_maxPdcpSn+1);
    std::map<uint16_t, LtePdcpSapUser::ReceivePdcpSduParameters>::iterator it;
NS_LOG_UNCOND("Buffer status when receivedPDCP " << PacketInBuffer.sequenceNumber << " nextPDCP " << nextPDCP_SN << " LastPDCP " << Last_Submitted_PDCP_RX_SN << " Next_PDCP_RX_SN " << Next_PDCP_RX_SN << " Reordering_PDCP_RX_COUNT " << Reordering_PDCP_RX_COUNT);
    for (it = PdcpBuffer.begin(); it->first != nextPDCP_SN && it != PdcpBuffer.end(); it++)
    {
NS_LOG_UNCOND(it->first);
    }
*/


  // ETSI TS 136 323 v14.2.0.
  if (((receivedPDCP_SN -Last_Submitted_PDCP_RX_SN) > reorderingWindow)
      ||((((Last_Submitted_PDCP_RX_SN-receivedPDCP_SN)) >= 1400 && ((Last_Submitted_PDCP_RX_SN-receivedPDCP_SN)< reorderingWindow))))
  {
    NS_LOG_INFO("last SN " << Last_Submitted_PDCP_RX_SN << "\t"
                "received SN"	<< PacketInBuffer.sequenceNumber<< " _discard");
    PdcpBuffer.erase(PacketInBuffer.sequenceNumber);
    return ;
  }
  else if ((Next_PDCP_RX_SN-receivedPDCP_SN) > reorderingWindow)
  {
    PacketInBuffer.RX_HFN ++;
    Next_PDCP_RX_SN = receivedPDCP_SN +1;
  }
  else if (receivedPDCP_SN - Next_PDCP_RX_SN >= reorderingWindow)
  {
    PacketInBuffer.RX_HFN --;
  }
  else if (receivedPDCP_SN >= Next_PDCP_RX_SN){
    Next_PDCP_RX_SN = receivedPDCP_SN +1;
    if (Next_PDCP_RX_SN > m_maxPdcpSn)
    {
      Next_PDCP_RX_SN =0;
      PacketInBuffer.RX_HFN ++;
    }
  }
  else if (receivedPDCP_SN < Next_PDCP_RX_SN) { }

/*  if ((receivedPDCP_SN==Last_Submitted_PDCP_RX_SN-m_maxPdcpSn))
  {
    PdcpDelayCalculater(receivedPDCP_SN); 
    m_pdcpSapUser->ReceivePdcpSdu(PdcpBuffer[receivedPDCP_SN]);

    Last_Submitted_PDCP_RX_SN = receivedPDCP_SN;
    PdcpBuffer.erase(receivedPDCP_SN);
  }
  else if ((receivedPDCP_SN == Last_Submitted_PDCP_RX_SN +1))*/
  if ((receivedPDCP_SN==Last_Submitted_PDCP_RX_SN-m_maxPdcpSn) || (receivedPDCP_SN == Last_Submitted_PDCP_RX_SN +1))
  {
    uint16_t nextPDCP_SN;
    while(PdcpBuffer.size() > 0)
    {
      nextPDCP_SN = (Last_Submitted_PDCP_RX_SN + 1)%(m_maxPdcpSn+1);
      std::map<uint16_t, LtePdcpSapUser::ReceivePdcpSduParameters>::iterator it;
      for (it = PdcpBuffer.begin(); it->first != nextPDCP_SN && it != PdcpBuffer.end(); it++)
      { }

      if (it == PdcpBuffer.end()) break;

      PdcpDelayCalculater(nextPDCP_SN); 
      m_pdcpSapUser->ReceivePdcpSdu(PdcpBuffer[nextPDCP_SN]);

      printData("Reordered_SN", nextPDCP_SN);
      PdcpBuffer.erase(nextPDCP_SN);
      Last_Submitted_PDCP_RX_SN = nextPDCP_SN;

      if(Last_Submitted_PDCP_RX_SN == Reordering_PDCP_RX_COUNT-1) check =true;
    }
  }

  if (t_ReorderingTimer.IsRunning())
  {
    if(check == true)
    {
      t_ReorderingTimer.Cancel();
      check = false;
    }
  }

  if (!t_ReorderingTimer.IsRunning())
  {
    if (PdcpBuffer.size()>=1){
      t_ReorderingTimer = Simulator::Schedule(expiredTime, &LtePdcp::t_ReordringTimer_Expired, this);
      Reordering_PDCP_RX_COUNT = Next_PDCP_RX_SN;
    }
  }
}


void
LtePdcp::t_ReordringTimer_Expired(){ // sjkang
  NS_LOG_FUNCTION (this);
NS_LOG_INFO("PDCP Reordering Timer Expired at " << Simulator::Now().GetSeconds() << " Reordering_PDCP_RX_COUNT " << Reordering_PDCP_RX_COUNT);

  uint16_t nextPDCP_SN;
  bool compareFlag = false;
  nextPDCP_SN = (Last_Submitted_PDCP_RX_SN + 1)%(m_maxPdcpSn+1);
  while(PdcpBuffer.size() > 0)
  {
//NS_LOG_UNCOND("nextPDCP_SN " << nextPDCP_SN << " Last_Submitted_PDCP_RX_SN " << Last_Submitted_PDCP_RX_SN);

    if (nextPDCP_SN == Reordering_PDCP_RX_COUNT) compareFlag = true;

    std::map<uint16_t, LtePdcpSapUser::ReceivePdcpSduParameters>::iterator it;
    for (it = PdcpBuffer.begin(); it->first != nextPDCP_SN && it != PdcpBuffer.end(); it++)
    { }

    if (it == PdcpBuffer.end())
    {
      if (compareFlag == true) break;
      nextPDCP_SN = (nextPDCP_SN + 1)%(m_maxPdcpSn+1);
    }
    else
    {
      PdcpDelayCalculater(nextPDCP_SN); 
      m_pdcpSapUser->ReceivePdcpSdu(PdcpBuffer[nextPDCP_SN]);

      printData("Reordered_SN", nextPDCP_SN);
      PdcpBuffer.erase(nextPDCP_SN);
      Last_Submitted_PDCP_RX_SN = nextPDCP_SN;
      nextPDCP_SN = (Last_Submitted_PDCP_RX_SN + 1)%(m_maxPdcpSn+1);
    }
  }
/*
  Reordering_PDCP_RX_COUNT = Next_PDCP_RX_SN;
  std::map<uint16_t, LtePdcpSapUser::ReceivePdcpSduParameters> ::iterator it;

  // copy the SN from buffer for a while
  temp = new uint16_t [(size_t)PdcpBuffer.size()];
  int i=0;
  for (it = PdcpBuffer.begin();it !=PdcpBuffer.end(); ++it, ++i) temp[i] = it->first;

  // sort the SN in acsending order
  std::sort(temp , temp +i);

// ETSI TS 136 323  5.1.2.4.2 procedure: when t- reordering expires

  for (uint16_t c=0; c<i; c++)
  {
    if (temp[c] <= Reordering_PDCP_RX_COUNT )
    {
      PdcpDelayCalculater(temp[c]); 
      m_pdcpSapUser->ReceivePdcpSdu(PdcpBuffer[temp[c]]);

      Last_Submitted_PDCP_RX_SN =temp[c];
      printData("Reordered_SN", temp[c]);
      PdcpBuffer.erase(temp[c]);
      if(Last_Submitted_PDCP_RX_SN == Reordering_PDCP_RX_COUNT-1) check =true;
    }
  }
  delete [] temp;
  i=0;


  temp =new uint16_t [(size_t)PdcpBuffer.size()+1];
  for (it = PdcpBuffer.begin();it !=PdcpBuffer.end(); ++it, ++i) temp[i] = it->first;

  // sort the SN in acsending order
  std::sort(temp , temp +i);

  uint16_t sum = temp[0],p=0;
  while (sum == temp[p] && p!=k)
  {
    sum =temp[p]+1;
    p++;
  }

  for (uint16_t c = 0 ; c< p; c++)
  {
    PdcpDelayCalculater(temp[c]); 
     m_pdcpSapUser->ReceivePdcpSdu(PdcpBuffer[temp[c]]);

     printData("Reordered_SN", temp[c]);
     PdcpBuffer.erase(temp[c]);
     Last_Submitted_PDCP_RX_SN = temp[c];

     if(Last_Submitted_PDCP_RX_SN == Reordering_PDCP_RX_COUNT-1) check =true;
  }
  delete [] temp;*/
  if (PdcpBuffer.size()>=1 )
  {
    Reordering_PDCP_RX_COUNT = Next_PDCP_RX_SN;
    t_ReorderingTimer= Simulator::Schedule(expiredTime, &LtePdcp::t_ReordringTimer_Expired, this);
  }
}

std::ofstream OutFile0("pdcp_delay_measure.txt");

// the function for getting total delay (= pdcp propagation dealy + pdcp reordering delay)
Time
LtePdcp::PdcpDelayCalculater(uint16_t SN){
  NS_LOG_FUNCTION (this);
  PdcpDelay = Simulator::Now() - CheckingArrivalOfSN[SN]+PropagationDelaybySN[SN];
  CheckingArrivalOfSN.erase(SN);
  PropagationDelaybySN.erase(SN);
  if (!OutFile0.is_open ())
  {
    OutFile0.open ("PdcpDelay_Measure.txt");
  }
  OutFile0<<Simulator::Now().GetSeconds()<< "\t" << "SequenceNumber" << "\t" << SN <<"\t"<<"Delay" << "\t" << PdcpDelay.GetSeconds()<< "\t" << std::endl;

  // woody
  m_assistInfoPtr->pdcp_sn = SN;
  m_assistInfoPtr->pdcp_delay = PdcpDelay.GetSeconds();
  if (m_isEnbPdcp)
  {
    m_enbRrc->SendAssistInfo (*m_assistInfoPtr);
  }
  else
  {
    m_ueRrc->SendAssistInfo (*m_assistInfoPtr);
  }

  return PdcpDelay;
}

std::ofstream OutFile1("pdcp_1_RX_SN.txt");
std::ofstream OutFile2("pdcp_1_Reordered_SN.txt");
std::ofstream OutFile3("pdcp_1_RX_SN.txt");
std::ofstream OutFile4("pdcp_2_Reordered_SN.txt");

int count =0;

Ptr <ns3::LtePdcp> tempAddress1;

void
LtePdcp::printData(string filename, uint16_t SN) // sjkang
{
  NS_LOG_FUNCTION (this);
  if (count ==0){ tempAddress1 =this;count ++;}
  count ++;

  if (tempAddress1==this)
  {
    if (filename == "RX_SN")
    {
      if (!OutFile1.is_open ())
      {
        OutFile1.open ("1_RX_SN.txt");
      }
    OutFile1 << this<< "\t"<<Simulator::Now ().GetSeconds() << "\t"<<"Received SN "<< "\t" << SN<< std::endl;
    }
    else if (filename == "Reordered_SN")
    {
      if (!OutFile2.is_open ())
      {
        OutFile2.open ("1_Reordered_SN.txt");
      }
      OutFile2 << this<< "\t"<<Simulator::Now ().GetSeconds() << "\t"<< "Reordered SN " << "\t" << SN<< std::endl;
     }
  }
  else
  {
    if (filename == "RX_SN")
    {
      if (!OutFile3.is_open ())
      {
        OutFile3.open ("2_RX_SN.txt");
      }
      OutFile3 <<this<< "\t"<< Simulator::Now ().GetSeconds() << "\t"<<"Received SN "<< "\t" << SN<< std::endl;
    }
    else if (filename == "Reordered_SN")
    {
      if (!OutFile4.is_open ())
      {
        OutFile4.open ("2_Reordered_SN.txt");
      }
      OutFile4<<this<< "\t"<< Simulator::Now ().GetSeconds() << "\t"<< "Reordered SN " << "\t" << SN<< std::endl;
    }
  }
}

void
LtePdcp::SetAssistInfoPtr (LteRrcSap::AssistInfo* assistInfoPtr){ // woody
  NS_LOG_FUNCTION (this);
  m_assistInfoPtr = assistInfoPtr;
}

} // namespace ns3
