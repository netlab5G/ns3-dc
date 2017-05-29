/* -*-  Mode: C++; c-file-style: "gnu"; indent-tabs-mode:nil; -*- */
/*
 * Copyright (c) 2011 Centre Tecnologic de Telecomunicacions de Catalunya (CTTC)
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
 * Author: Jaume Nin <jnin@cttc.cat>
 *         Nicola Baldo <nbaldo@cttc.cat>
 */


#include "epc-sgw-pgw-application.h"
#include "ns3/log.h"
#include "ns3/mac48-address.h"
#include "ns3/ipv4.h"
#include "ns3/inet-socket-address.h"
#include "ns3/epc-gtpu-header.h"
#include "ns3/abort.h"

#include "ns3/simulator.h"

namespace ns3 {

NS_LOG_COMPONENT_DEFINE ("EpcSgwPgwApplication");

/////////////////////////
// UeInfo
/////////////////////////


EpcSgwPgwApplication::UeInfo::UeInfo ()
{
  NS_LOG_FUNCTION (this);
}

void
EpcSgwPgwApplication::UeInfo::AddBearer (Ptr<EpcTft> tft, uint8_t bearerId, uint32_t teid)
{
  NS_LOG_FUNCTION (this << tft << teid);
  m_teidByBearerIdMap[bearerId] = teid;
  return m_tftClassifier.Add (tft, teid);
}

void
EpcSgwPgwApplication::UeInfo::RemoveBearer (uint8_t bearerId)
{
  NS_LOG_FUNCTION (this << bearerId);
  m_teidByBearerIdMap.erase (bearerId);
}

uint32_t
EpcSgwPgwApplication::UeInfo::Classify (Ptr<Packet> p)
{
  NS_LOG_FUNCTION (this << p);
  // we hardcode DOWNLINK direction since the PGW is espected to
  // classify only downlink packets (uplink packets will go to the
  // internet without any classification). 
  return m_tftClassifier.Classify (p, EpcTft::DOWNLINK);
}

Ipv4Address 
EpcSgwPgwApplication::UeInfo::GetEnbAddr ()
{
  return m_enbAddr;
}

void
EpcSgwPgwApplication::UeInfo::SetEnbAddr (Ipv4Address enbAddr)
{
  m_enbAddr = enbAddr;
}


Ipv4Address 
EpcSgwPgwApplication::UeInfo::GetSenbAddr () // sychoi, woody inserted
{
  return m_senbAddr;
}

void
EpcSgwPgwApplication::UeInfo::SetSenbAddr (Ipv4Address senbAddr) // sychoi, woody inserted
{
  m_senbAddr = senbAddr;
}


Ipv4Address 
EpcSgwPgwApplication::UeInfo::GetUeAddr ()
{
  return m_ueAddr;
}

void
EpcSgwPgwApplication::UeInfo::SetUeAddr (Ipv4Address ueAddr)
{
  m_ueAddr = ueAddr;
}

/////////////////////////
// EpcSgwPgwApplication
/////////////////////////


TypeId
EpcSgwPgwApplication::GetTypeId (void)
{
  static TypeId tid = TypeId ("ns3::EpcSgwPgwApplication")
    .SetParent<Object> ()
    .SetGroupName("Lte");
  return tid;
}

void
EpcSgwPgwApplication::DoDispose ()
{
  NS_LOG_FUNCTION (this);
  m_s1uSocket->SetRecvCallback (MakeNullCallback<void, Ptr<Socket> > ());
  m_s1uSocket = 0;
  delete (m_s11SapSgw);
}

  

EpcSgwPgwApplication::EpcSgwPgwApplication (const Ptr<VirtualNetDevice> tunDevice, const Ptr<Socket> s1uSocket)
  : m_s1uSocket (s1uSocket),
    m_tunDevice (tunDevice),
    m_gtpuUdpPort (2152), // fixed by the standard
    m_teidCount (0),
    m_s11SapMme (0)
{
  NS_LOG_FUNCTION (this << tunDevice << s1uSocket);
  m_s1uSocket->SetRecvCallback (MakeCallback (&EpcSgwPgwApplication::RecvFromS1uSocket, this));
  m_s11SapSgw = new MemberEpcS11SapSgw<EpcSgwPgwApplication> (this);
}

  
EpcSgwPgwApplication::~EpcSgwPgwApplication ()
{
  NS_LOG_FUNCTION (this);
}

void
EpcSgwPgwApplication::SetSplitAlgorithm (uint16_t splitAlgorithm) // woody
{
  m_splitAlgorithm = splitAlgorithm;
}

LteRrcSap::AssistInfo info1X[3];

void
EpcSgwPgwApplication::RecvAssistInfo (LteRrcSap::AssistInfo assistInfo){ // woody
  NS_LOG_FUNCTION (this);
  NS_ASSERT_MSG (m_isAssistInfoSink == true, "Not a assist info sink");

  int nodeNum;
  if (assistInfo.is_enb && assistInfo.is_menb) nodeNum = 0;
  else if (assistInfo.is_enb) nodeNum = 1;
  else nodeNum = 2;

//NS_LOG_UNCOND("nodeNum " << nodeNum << " pdcp_sn " << assistInfo.pdcp_sn << " pdcp_delay " << assistInfo.pdcp_delay << " rlc_avg_buffer " << assistInfo.rlc_avg_buffer << " rlc_tx_queue " << assistInfo.rlc_tx_queue << " rlc_retx_queue " << assistInfo.rlc_retx_queue << " rlc_tx_queue_hol_delay " << assistInfo.rlc_tx_queue_hol_delay << " rlc_retx_queue_hol_delay " << assistInfo.rlc_retx_queue_hol_delay );
  info1X[nodeNum] = assistInfo;

  return;
}

int
EpcSgwPgwApplication::SplitAlgorithm ()
{
  NS_LOG_FUNCTION (this);
/*
 0: MeNB only
 1: SeNB only
 2: alternative splitting

*/


  // return 0 for Tx through MeNB &  return 1 for Tx through SeNB
  switch (m_splitAlgorithm)
  {
    case 0:
      return 0;
      break;

    case 1:
      return 1;
      break;

    case 2:
      if (m_lastDirection1X == 0) return 1;
      else return 0;
      break;
  }
  return -1;
}

bool
EpcSgwPgwApplication::RecvFromTunDevice (Ptr<Packet> packet, const Address& source, const Address& dest, uint16_t protocolNumber)
{
  NS_LOG_FUNCTION (this << source << dest << packet << packet->GetSize ());

  // get IP address of UE
  Ptr<Packet> pCopy = packet->Copy ();
  Ipv4Header ipv4Header;
  pCopy->RemoveHeader (ipv4Header);
  Ipv4Address ueAddr =  ipv4Header.GetDestination ();
  NS_LOG_LOGIC ("packet addressed to UE " << ueAddr);

  // woody, for observing packet flow
  NS_LOG_INFO ("***SgwPgw, " << Simulator::Now ().GetSeconds () << "s "
              <<  packet->GetSize () << " bytes from "
              << ipv4Header.GetSource () << " to " << ueAddr );


  // find corresponding UeInfo address
  std::map<Ipv4Address, Ptr<UeInfo> >::iterator it = m_ueInfoByAddrMap.find (ueAddr);
  if (it == m_ueInfoByAddrMap.end ())
    {        
      NS_LOG_WARN ("unknown UE address " << ueAddr);
    }
  else
    {
      Ipv4Address enbAddr = it->second->GetEnbAddr ();      
      uint32_t teid = it->second->Classify (packet);   
      if (teid == 0)
        {
          NS_LOG_WARN ("no matching bearer for this packet");                   
        }
      else
        {

    	  /** sychoi, modified by woody
    	   * Here, we need to implement the branch point for selecting the next eNB to steer DL packet.
    	   * Using newly defined map, m_dcEnbAddrByTeidMap, find the SeNB address, senbAddr.
    	   * Because of backward compatibility, m_dcEnbAddrByTeidMap is used only for DC packet routing.
    	   * If there is no SeNB Address, then the packet is forwarded to MeNB.
    	   * Otherwise, the packet is forwarded to SeNB.
    	   */
          if(it->second->dcType == 0 || it->second->dcType == 2){
            NS_LOG_INFO ("***SgwPgw send to MeNB " << enbAddr << " with teid " << teid);
            SendToS1uSocket (packet, enbAddr, teid);
          }
          else if(it->second->dcType == 1){
            std::map<uint32_t, Ipv4Address>::iterator senbAddrIt = m_dcEnbAddrByTeidMap.find (teid);
            Ipv4Address senbAddr = senbAddrIt->second;
            if (senbAddrIt == m_dcEnbAddrByTeidMap.end ()) NS_FATAL_ERROR("Cannot find senbAddr");

            NS_LOG_INFO ("***SgwPgw send to SeNB " << senbAddr << " with teid " << teid);
            SendToS1uSocket (packet, senbAddr, teid);
          }
          else if(it->second->dcType == 3){
            int t_splitter = SplitAlgorithm();

            std::map<uint32_t, Ipv4Address>::iterator senbAddrIt = m_dcEnbAddrByTeidMap.find (teid);
            Ipv4Address senbAddr = senbAddrIt->second;
            if (senbAddrIt == m_dcEnbAddrByTeidMap.end ()) NS_FATAL_ERROR("Cannot find senbAddr");

            if (t_splitter == 1){
              NS_LOG_INFO ("***SgwPgw send to SeNB " << senbAddr << " with teid " << teid);
              m_lastDirection1X = 1;
              SendToS1uSocket (packet, senbAddr, teid);
            }
            else if (t_splitter == 0) {
              NS_LOG_INFO ("***SgwPgw send to MeNB " << enbAddr << " with teid " << teid);
              m_lastDirection1X = 0;
              SendToS1uSocket (packet, enbAddr, teid);
            }
            else NS_FATAL_ERROR ("unknwon t_splitter value");
          }
          else NS_FATAL_ERROR("Unimplemented DC type");

        }
    }
  // there is no reason why we should notify the TUN
  // VirtualNetDevice that he failed to send the packet: if we receive
  // any bogus packet, it will just be silently discarded.
  const bool succeeded = true;
  return succeeded;
}

void 
EpcSgwPgwApplication::RecvFromS1uSocket (Ptr<Socket> socket)
{
  NS_LOG_FUNCTION (this << socket);  
  NS_ASSERT (socket == m_s1uSocket);
  Ptr<Packet> packet = socket->Recv ();
  GtpuHeader gtpu;
  packet->RemoveHeader (gtpu);
  uint32_t teid = gtpu.GetTeid ();

  SendToTunDevice (packet, teid);
}

void 
EpcSgwPgwApplication::SendToTunDevice (Ptr<Packet> packet, uint32_t teid)
{
  NS_LOG_FUNCTION (this << packet << teid);
  NS_LOG_LOGIC (" packet size: " << packet->GetSize () << " bytes");
  m_tunDevice->Receive (packet, 0x0800, m_tunDevice->GetAddress (), m_tunDevice->GetAddress (), NetDevice::PACKET_HOST);
}

void 
EpcSgwPgwApplication::SendToS1uSocket (Ptr<Packet> packet, Ipv4Address enbAddr, uint32_t teid)
{
  NS_LOG_FUNCTION (this << packet << enbAddr << teid);

  GtpuHeader gtpu;
  gtpu.SetTeid (teid);
  // From 3GPP TS 29.281 v10.0.0 Section 5.1
  // Length of the payload + the non obligatory GTP-U header
  gtpu.SetLength (packet->GetSize () + gtpu.GetSerializedSize () - 8);  
  packet->AddHeader (gtpu);
  uint32_t flags = 0;
  m_s1uSocket->SendTo (packet, flags, InetSocketAddress (enbAddr, m_gtpuUdpPort));
}


void 
EpcSgwPgwApplication::SetS11SapMme (EpcS11SapMme * s)
{
  m_s11SapMme = s;
}

EpcS11SapSgw* 
EpcSgwPgwApplication::GetS11SapSgw ()
{
  return m_s11SapSgw;
}

void 
EpcSgwPgwApplication::AddEnb (uint16_t cellId, Ipv4Address enbAddr, Ipv4Address sgwAddr)
{
  NS_LOG_FUNCTION (this << cellId << enbAddr << sgwAddr);
  EnbInfo enbInfo;
  enbInfo.enbAddr = enbAddr;
  enbInfo.sgwAddr = sgwAddr;
  m_enbInfoByCellId[cellId] = enbInfo;
}

void 
EpcSgwPgwApplication::AddUe (uint64_t imsi)
{
  NS_LOG_FUNCTION (this << imsi);
  Ptr<UeInfo> ueInfo = Create<UeInfo> ();
  m_ueInfoByImsiMap[imsi] = ueInfo;
}

void 
EpcSgwPgwApplication::SetUeAddress (uint64_t imsi, Ipv4Address ueAddr)
{
  NS_LOG_FUNCTION (this << imsi << ueAddr);
  std::map<uint64_t, Ptr<UeInfo> >::iterator ueit = m_ueInfoByImsiMap.find (imsi);
  NS_ASSERT_MSG (ueit != m_ueInfoByImsiMap.end (), "unknown IMSI " << imsi); 
  m_ueInfoByAddrMap[ueAddr] = ueit->second;
  ueit->second->SetUeAddr (ueAddr);
}

void 
EpcSgwPgwApplication::DoCreateSessionRequest (EpcS11SapSgw::CreateSessionRequestMessage req) // woody, modified
{
  NS_LOG_FUNCTION (this << req.imsi);
  std::map<uint64_t, Ptr<UeInfo> >::iterator ueit = m_ueInfoByImsiMap.find (req.imsi);
  NS_ASSERT_MSG (ueit != m_ueInfoByImsiMap.end (), "unknown IMSI " << req.imsi); 
  uint16_t cellId = req.uli.gci;
  std::map<uint16_t, EnbInfo>::iterator enbit = m_enbInfoByCellId.find (cellId);
  NS_ASSERT_MSG (enbit != m_enbInfoByCellId.end (), "unknown CellId " << cellId); 
  Ipv4Address enbAddr = enbit->second.enbAddr;
  //ueit->second->SetEnbAddr (enbAddr);

  EpcS11SapMme::CreateSessionResponseMessage res;
  res.teid = req.imsi; // trick to avoid the need for allocating TEIDs on the S11 interface

  for (std::list<EpcS11SapSgw::BearerContextToBeCreated>::iterator bit = req.bearerContextsToBeCreated.begin ();
       bit != req.bearerContextsToBeCreated.end ();
       ++bit)
    {
      // simple sanity check. If you ever need more than 4M teids
      // throughout your simulation, you'll need to implement a smarter teid
      // management algorithm. 
      NS_ABORT_IF (m_teidCount == 0xFFFFFFFF);
      uint32_t teid = ++m_teidCount;  
      ueit->second->AddBearer (bit->tft, bit->epsBearerId, teid);

      ueit->second->dcType = bit->dcType;
      // if the bearer type is DC, add list eNB addr into SenbMap
      if(bit->dcType == 0 || bit->dcType == 2) { // woody3C
          NS_LOG_FUNCTION ("SetEnbAddr " << enbAddr << " dcType " << (unsigned)bit->dcType);
          ueit->second->SetEnbAddr (enbAddr);
      }
      else if(bit->dcType == 1) {  // woody
          NS_LOG_FUNCTION ("SetSenbAddr " << enbAddr << " dcType " << (unsigned)bit->dcType);
          ueit->second->SetSenbAddr (enbAddr); // woody, actually SetSenbAddr is currently not utilized
          m_dcEnbAddrByTeidMap[teid] = enbAddr;
      }
      else if(bit->dcType == 3) {  // woody1X
          if (req.isSenb == 1)
          {
            NS_LOG_FUNCTION ("SetSenbAddr " << enbAddr << " dcType " << (unsigned)bit->dcType);
            ueit->second->SetSenbAddr (enbAddr); // woody, actually SetSenbAddr is currently not utilized
            m_dcEnbAddrByTeidMap[teid] = enbAddr;
 
          }
          else
          {
            NS_LOG_FUNCTION ("SetEnbAddr " << enbAddr << " dcType " << (unsigned)bit->dcType);
            ueit->second->SetEnbAddr (enbAddr);
          }
      }
      else {
          NS_FATAL_ERROR("unimplemented DC type");
      }
      EpcS11SapMme::BearerContextCreated bearerContext;
      bearerContext.sgwFteid.teid = teid;
      bearerContext.sgwFteid.address = enbit->second.sgwAddr;
      bearerContext.epsBearerId =  bit->epsBearerId; 
      bearerContext.bearerLevelQos = bit->bearerLevelQos; 
      bearerContext.tft = bit->tft;
      bearerContext.dcType = bit->dcType; // woody
      res.bearerContextsCreated.push_back (bearerContext);
    }
  m_s11SapMme->CreateSessionResponse (res);
  
}

void 
EpcSgwPgwApplication::DoModifyBearerRequest (EpcS11SapSgw::ModifyBearerRequestMessage req)
{
  NS_LOG_FUNCTION (this << req.teid);
  uint64_t imsi = req.teid; // trick to avoid the need for allocating TEIDs on the S11 interface
  std::map<uint64_t, Ptr<UeInfo> >::iterator ueit = m_ueInfoByImsiMap.find (imsi);
  NS_ASSERT_MSG (ueit != m_ueInfoByImsiMap.end (), "unknown IMSI " << imsi); 
  uint16_t cellId = req.uli.gci;
  std::map<uint16_t, EnbInfo>::iterator enbit = m_enbInfoByCellId.find (cellId);
  NS_ASSERT_MSG (enbit != m_enbInfoByCellId.end (), "unknown CellId " << cellId); 
  Ipv4Address enbAddr = enbit->second.enbAddr;
  ueit->second->SetEnbAddr (enbAddr);
  // no actual bearer modification: for now we just support the minimum needed for path switch request (handover)
  EpcS11SapMme::ModifyBearerResponseMessage res;
  res.teid = imsi; // trick to avoid the need for allocating TEIDs on the S11 interface
  res.cause = EpcS11SapMme::ModifyBearerResponseMessage::REQUEST_ACCEPTED;
  m_s11SapMme->ModifyBearerResponse (res);
}
 
void
EpcSgwPgwApplication::DoDeleteBearerCommand (EpcS11SapSgw::DeleteBearerCommandMessage req)
{
  NS_LOG_FUNCTION (this << req.teid);
  uint64_t imsi = req.teid; // trick to avoid the need for allocating TEIDs on the S11 interface
  std::map<uint64_t, Ptr<UeInfo> >::iterator ueit = m_ueInfoByImsiMap.find (imsi);
  NS_ASSERT_MSG (ueit != m_ueInfoByImsiMap.end (), "unknown IMSI " << imsi);

  EpcS11SapMme::DeleteBearerRequestMessage res;
  res.teid = imsi;

  for (std::list<EpcS11SapSgw::BearerContextToBeRemoved>::iterator bit = req.bearerContextsToBeRemoved.begin ();
       bit != req.bearerContextsToBeRemoved.end ();
       ++bit)
    {
      EpcS11SapMme::BearerContextRemoved bearerContext;
      bearerContext.epsBearerId =  bit->epsBearerId;
      res.bearerContextsRemoved.push_back (bearerContext);
    }
  //schedules Delete Bearer Request towards MME
  m_s11SapMme->DeleteBearerRequest (res);
}

void
EpcSgwPgwApplication::DoDeleteBearerResponse (EpcS11SapSgw::DeleteBearerResponseMessage req)
{
  NS_LOG_FUNCTION (this << req.teid);
  uint64_t imsi = req.teid; // trick to avoid the need for allocating TEIDs on the S11 interface
  std::map<uint64_t, Ptr<UeInfo> >::iterator ueit = m_ueInfoByImsiMap.find (imsi);
  NS_ASSERT_MSG (ueit != m_ueInfoByImsiMap.end (), "unknown IMSI " << imsi);

  for (std::list<EpcS11SapSgw::BearerContextRemovedSgwPgw>::iterator bit = req.bearerContextsRemoved.begin ();
       bit != req.bearerContextsRemoved.end ();
       ++bit)
    {
      //Function to remove de-activated bearer contexts from S-Gw and P-Gw side
      ueit->second->RemoveBearer (bit->epsBearerId);
    }
}

void
EpcSgwPgwApplication::IsAssistInfoSink (){ // woody
  NS_LOG_FUNCTION (this);
  m_isAssistInfoSink = true;
}

}  // namespace ns3
