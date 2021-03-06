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

#ifndef LTE_PDCP_H
#define LTE_PDCP_H

#include "ns3/traced-value.h"
#include "ns3/trace-source-accessor.h"

#include "ns3/object.h"

#include "ns3/lte-pdcp-sap.h"
#include "ns3/lte-rlc-sap.h"

#include "ns3/lte-rrc-sap.h" // woody
#include "ns3/lte-enb-rrc.h" // woody
#include "ns3/lte-ue-rrc.h" // woody

namespace ns3 {

/**
 * LTE PDCP entity, see 3GPP TS 36.323
 */
class LtePdcp : public Object // SimpleRefCount<LtePdcp>
{
  friend class LtePdcpSpecificLteRlcSapUser;
  friend class LtePdcpSpecificLtePdcpSapProvider<LtePdcp>;
public:
  LtePdcp ();
  virtual ~LtePdcp ();
  static TypeId GetTypeId (void);
  virtual void DoDispose ();
  bool enable1X=false; //sjkang0601
  /**
   *
   *
   * \param rnti
   */
  void SetRnti (uint16_t rnti);

  /**
   *
   *
   * \param lcId
   */
  void SetLcId (uint8_t lcId);

  /**
   *
   *
   * \param s the PDCP SAP user to be used by this LTE_PDCP
   */
  void SetLtePdcpSapUser (LtePdcpSapUser * s);

  /**
   *
   *
   * \return the PDCP SAP Provider interface offered to the RRC by this LTE_PDCP
   */
  LtePdcpSapProvider* GetLtePdcpSapProvider ();

  /**
   *
   *
   * \param s the RLC SAP Provider to be used by this LTE_PDCP
   */
  void SetLteRlcSapProvider (LteRlcSapProvider * s);

  /**
   *
   *
   * \return the RLC SAP User interface offered to the RLC by this LTE_PDCP
   */
  LteRlcSapUser* GetLteRlcSapUser ();

 static const uint16_t MAX_PDCP_SN = 32768;//16384;//4096;

  /**
   * Status variables of the PDCP
   * 
   */
  struct Status
  {
    uint16_t txSn; ///< TX sequence number
    uint16_t rxSn; ///< RX sequence number
  };
  struct BufferedPackets{
 	  uint16_t sequenceNumber;
 	  LtePdcpSapUser::ReceivePdcpSduParameters params;
 	  uint16_t RX_HFN;
   };
  /** 
   * 
   * \return the current status of the PDCP
   */
  Status GetStatus ();

  /**
   * Set the status of the PDCP
   * 
   * \param s 
   */
  void SetStatus (Status s);

  /**
   * TracedCallback for PDU transmission event.
   *
   * \param [in] rnti The C-RNTI identifying the UE.
   * \param [in] lcid The logical channel id corresponding to
   *             the sending RLC instance.
   * \param [in] size Packet size.
   */
  typedef void (* PduTxTracedCallback)
    (uint16_t rnti, uint8_t lcid, uint32_t size);

  /**
   * TracedCallback signature for PDU receive event.
   *
   * \param [in] rnti The C-RNTI identifying the UE.
   * \param [in] lcid The logical channel id corresponding to
   *             the sending RLC instance.
   * \param [in] size Packet size.
   * \param [in] delay Delay since packet sent, in ns..
   */
  typedef void (* PduRxTracedCallback)
    (const uint16_t rnti, const uint8_t lcid,
     const uint32_t size, const uint64_t delay);
  void BufferingAndReordering(Ptr<Packet> p);
  void printData(std::string filename, uint16_t SN);
  void t_ReordringTimer_Expired();

  Time PdcpDelayCalculater(uint16_t SN); // sjkang

  // woody
  void SetAssistInfoPtr (LteRrcSap::AssistInfo* assistInfoPtr);
  void IsEnbPdcp (void);
  Ptr<LteEnbRrc> m_enbRrc;
  Ptr<LteUeRrc> m_ueRrc;

protected:
  // Interface provided to upper RRC entity
  virtual void DoTransmitPdcpSdu (Ptr<Packet> p);
  virtual void DoTransmitPdcpSduDc (Ptr<Packet> p); // woody3C

  LtePdcpSapUser* m_pdcpSapUser;
  LtePdcpSapProvider* m_pdcpSapProvider;

  // Interface provided to lower RLC entity
  virtual void DoReceivePdu (Ptr<Packet> p);

  LteRlcSapUser* m_rlcSapUser;
  LteRlcSapProvider* m_rlcSapProvider;

  uint16_t m_rnti;
  uint8_t m_lcid;
  int k;

  //sjkang
  int receivedPDCP_SN;
  int Reordering_PDCP_RX_COUNT;
  int Next_PDCP_RX_SN;
  std::map <uint16_t,LtePdcpSapUser::ReceivePdcpSduParameters> PdcpBuffer;
  EventId t_ReorderingTimer;

  // sjkang, for measuring delay
  std::map<uint16_t, Time>  CheckingArrivalOfSN, PropagationDelaybySN;
  Time PdcpDelay;
  Time delay;

  /**
   * Used to inform of a PDU delivery to the RLC SAP provider.
   * The parameters are RNTI, LCID and bytes delivered
   */
  TracedCallback<uint16_t, uint8_t, uint32_t> m_txPdu;
  /**
   * Used to inform of a PDU reception from the RLC SAP user.
   * The parameters are RNTI, LCID, bytes delivered and delivery delay in nanoseconds. 
   */
  TracedCallback<uint16_t, uint8_t, uint32_t, uint64_t> m_rxPdu;

private:
  /**
   * State variables. See section 7.1 in TS 36.323
   */
  uint16_t m_txSequenceNumber;
  uint16_t m_rxSequenceNumber;
   bool check;
  /**
   * Constants. See section 7.2 in TS 36.323
   */
   static const uint16_t m_maxPdcpSn=32767;//16383;//4095;
   static const int reorderingWindow =16384;//8192;//2048;
   int Last_Submitted_PDCP_RX_SN;
   uint16_t *temp ;
  Time  expiredTime;
   // bool CheckReodering_PDCP_RX_COUNT_1;
    int randomSequence[10000] ;

  // woody
  bool m_isEnbPdcp;
  LteRrcSap::AssistInfo *m_assistInfoPtr;
  bool m_enableReordering;
};


} // namespace ns3

#endif // LTE_PDCP_H
