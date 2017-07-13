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
 * Author: Jaume Nin <jaume.nin@cttc.cat>
 */

#include "ns3/lte-helper.h"
#include "ns3/epc-helper.h"
#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/ipv4-global-routing-helper.h"
#include "ns3/internet-module.h"
#include "ns3/mobility-module.h"
#include "ns3/lte-module.h"
#include "ns3/applications-module.h"
#include "ns3/point-to-point-helper.h"
#include "ns3/config-store.h"
#include "ns3/propagation-loss-model.h"
#include <ns3/packet.h>
#include <ns3/tag.h>
#include <fstream>
#include <iostream>
#include <string>
#include <ns3/buildings-helper.h>
#include <ns3/buildings-module.h>

using namespace ns3;

/**
 * Sample simulation script for LTE+EPC. It instantiates several eNodeB,
 * attaches one UE per eNodeB starts a flow for each UE to  and from a remote host.
 * It also  starts yet another flow between each UE pair.
 */

NS_LOG_COMPONENT_DEFINE ("EpcDcTcpExample");

class MyApp : public Application
{
public:
  MyApp ();
  virtual ~MyApp ();

  /**
   * Register this type.
   * \return The TypeId.
   */
  static TypeId GetTypeId (void);
  void Setup (Ptr<Socket> socket, Address address, uint32_t packetSize, uint32_t nPackets, DataRate dataRate);

private:
  virtual void StartApplication (void);
  virtual void StopApplication (void);

  void ScheduleTx (void);
  void SendPacket (void);

  Ptr<Socket>     m_socket;
  Address         m_peer;
  uint32_t        m_packetSize;
  uint32_t        m_nPackets;
  DataRate        m_dataRate;
  EventId         m_sendEvent;
  bool            m_running;
  uint32_t        m_packetsSent;
  uint32_t         m_sent;
};

MyApp::MyApp ()
  : m_socket (0),
    m_peer (),
    m_packetSize (0),
    m_nPackets (0),
    m_dataRate (0),
    m_sendEvent (),
    m_running (false),
    m_packetsSent (0)
{
}

MyApp::~MyApp ()
{
  m_socket = 0;
}

/* static */
TypeId MyApp::GetTypeId (void)
{
  static TypeId tid = TypeId ("MyApp")
    .SetParent<Application> ()
    .SetGroupName ("Tutorial")
    .AddConstructor<MyApp> ()
    ;
  return tid;
}

void
MyApp::Setup (Ptr<Socket> socket, Address address, uint32_t packetSize, uint32_t nPackets, DataRate dataRate)
{
  m_socket = socket;
  m_peer = address;
  m_packetSize = packetSize;
  m_nPackets = nPackets;
  m_dataRate = dataRate;
}

void
MyApp::StartApplication (void)
{
  m_running = true;
  m_packetsSent = 0;
  m_socket->Bind ();
  m_socket->Connect (m_peer);
  SendPacket ();
}

void
MyApp::StopApplication (void)
{
  m_running = false;

  if (m_sendEvent.IsRunning ())
    {
      Simulator::Cancel (m_sendEvent);
    }

  if (m_socket)
    {
      m_socket->Close ();
    }
}
bool isTcp_for_MyApp=false;
void
MyApp::SendPacket (void)
{

  Ptr<Packet> packet = Create<Packet> (m_packetSize);
  if (!isTcp_for_MyApp)
  {
	  SeqTsHeader seqTs;  // for udp sequence number sjkang 0703
 	  seqTs.SetSeq (m_sent); // for udp sequence number sjkang 0703
 	  m_sent++;  // for udp sequence number sjkang
 	  packet->AddHeader(seqTs); // for udp sequence number sjkang
  }
  m_socket->Send (packet);

  if (++m_packetsSent < m_nPackets)
    {
      ScheduleTx ();
    }
}

void
MyApp::ScheduleTx (void)
{
  if (m_running)
    {
      Time tNext (Seconds (m_packetSize * 8 / static_cast<double> (m_dataRate.GetBitRate ())));
      m_sendEvent = Simulator::Schedule (tNext, &MyApp::SendPacket, this);
    }
}

double instantPacketSize, packetRxTime, lastPacketRxTime;
double sumPacketSize;

static void
Rx (Ptr<OutputStreamWrapper> stream, Ptr<const Packet> packet, const Address &from){
  packetRxTime = Simulator::Now().GetSeconds();
  if (lastPacketRxTime == packetRxTime){
    instantPacketSize += packet->GetSize();
    return;
  }
  else{
    sumPacketSize += instantPacketSize;
    *stream->GetStream () << lastPacketRxTime << "\t" << instantPacketSize << "\t" << sumPacketSize
    		<< std::endl;
    lastPacketRxTime =  packetRxTime;
    instantPacketSize = packet->GetSize();
  }
}

double RTT_value;
int previousLoss=0;
static void
UdpRx(Ptr<OutputStreamWrapper> stream, Ptr<const Packet> packet, uint32_t loss){
	  packetRxTime = Simulator::Now().GetSeconds();
	  if (lastPacketRxTime == packetRxTime){
	    instantPacketSize += packet->GetSize();
	    return;
	  }
	  else{
	    sumPacketSize += instantPacketSize;
	    *stream->GetStream () << lastPacketRxTime << "\t" << instantPacketSize << "\t" << sumPacketSize
	    		<< "\t" << loss << "\t" << loss-previousLoss << std::endl;
	    previousLoss = loss;
	    lastPacketRxTime =  packetRxTime;
	    instantPacketSize = packet->GetSize();
	  }
	}
static void
RttChange (Ptr<OutputStreamWrapper> stream, Time oldRtt, Time newRtt)
{
  *stream->GetStream () << Simulator::Now ().GetSeconds () << "\t" << oldRtt.GetSeconds () << "\t" << newRtt.GetSeconds () << std::endl;
  RTT_value = newRtt.GetSeconds();
}

static void
CwndChange (Ptr<OutputStreamWrapper> stream, uint32_t oldCwnd, uint32_t newCwnd)
{
	*stream->GetStream () << Simulator::Now ().GetSeconds () << "\t" << oldCwnd << "\t" << newCwnd << std::endl;
}

Ptr<PacketSink> sink;
Ptr<UdpServer> server;
uint64_t lastTotalRx = 0;
std::ofstream *streamThroughput;

void
CalculateThroughput ()
{
  Time now = Simulator::Now ();                                         /* Return the simulator's virtual time. */
  double cur = (sink->GetTotalRx () - lastTotalRx) * (double) 8 / 1e5;     /* Convert Application RX Packets to MBits. */
  *streamThroughput  << now.GetSeconds () << "\t" << cur <<std::endl;
  lastTotalRx = sink->GetTotalRx ();
  Simulator::Schedule (MilliSeconds (100), &CalculateThroughput);
}

void
ChangeSpeed(Ptr<Node>  n, Vector speed)
{
	n->GetObject<ConstantVelocityMobilityModel> ()->SetVelocity (speed);
}
void changRBSize(uint32_t RB_Size, NetDeviceContainer enbLteDevs, NetDeviceContainer senbLteDevs) {
	senbLteDevs.Get(0)->GetObject<LteEnbNetDevice>() ->
			  GetFfMacScheduler ()->GetObject<PfFfMacScheduler>()->Set_Bandwidth_Again(true, RB_Size); //sjkang

	enbLteDevs.Get(0)->GetObject<LteEnbNetDevice>() ->
			  GetFfMacScheduler ()->GetObject<PfFfMacScheduler>()->Set_Bandwidth_Again(true ,RB_Size); //sjkang

}

void changePathLossFromMenbInDownlink(Ptr<LteHelper> ltehelper, double referenceDistance, double referenceloss){
ltehelper ->m_dlPlm_1->GetObject<LogDistancePropagationLossModel>()->SetReference(referenceDistance,
		referenceloss);
	}
void changePathLossFromSenbInDownlink(Ptr<LteHelper> ltehelper, double referenceDistance, double referenceloss){
	ltehelper ->m_dlPlm_2->GetObject<LogDistancePropagationLossModel>()->SetReference(referenceDistance,
			referenceloss);

}
void changePathLossFromMenbInUplink(Ptr<LteHelper> ltehelper, double referenceDistance, double referenceloss){
	ltehelper ->m_ulPlm_1->GetObject<LogDistancePropagationLossModel>()->SetReference(referenceDistance,
			referenceloss);
}
void changePathLossFromSenbInUplink(Ptr<LteHelper> ltehelper, double referenceDistance, double referenceloss){
	ltehelper ->m_ulPlm_2->GetObject<LogDistancePropagationLossModel>()->SetReference(referenceDistance,
			referenceloss);

}
/////////////////// change pathlossmodel
void changePathLossModelAtMenb (Ptr<LteHelper> ltehelper, std::string S){ //sjkang0705

	ObjectFactory m_dlPathlossModelFactory = ObjectFactory();
	m_dlPathlossModelFactory.SetTypeId (S);
	Ptr<Object> m_downlinkPathlossModel = m_dlPathlossModelFactory.Create();
	Ptr<PropagationLossModel> lossmodel = m_downlinkPathlossModel->GetObject<PropagationLossModel>();
	ltehelper->GetDlChannel_1()->AddPropagationLossModel(lossmodel);
	ltehelper->GetUlChannel_1()->AddPropagationLossModel(lossmodel);

}

void changePathLossModelAtSenb (Ptr<LteHelper> ltehelper, std::string S){  //sjkang0705

	ObjectFactory m_dlPathlossModelFactory = ObjectFactory();
	m_dlPathlossModelFactory.SetTypeId (S);
	Ptr<Object> m_downlinkPathlossModel = m_dlPathlossModelFactory.Create();
	Ptr<PropagationLossModel> lossmodel = m_downlinkPathlossModel->GetObject<PropagationLossModel>();

	ltehelper->GetDlChannel_2()->AddPropagationLossModel(lossmodel);
	ltehelper->GetUlChannel_2()->AddPropagationLossModel(lossmodel);

}

static void
Traces(uint16_t nodeNum)
{
	AsciiTraceHelper asciiTraceHelper;

	std::ostringstream pathCW;
	pathCW<<"/NodeList/"<<nodeNum+1<<"/$ns3::TcpL4Protocol/SocketList/0/CongestionWindow";

	std::ostringstream fileCW;
	fileCW<<"UE-"<<nodeNum+1<<"-TCP-CWND.txt";

	std::ostringstream pathRTT;
	pathRTT<<"/NodeList/"<<nodeNum+1<<"/$ns3::TcpL4Protocol/SocketList/0/RTT";

	std::ostringstream fileRTT;
	fileRTT<<"UE-"<<nodeNum+1<<"-TCP-RTT.txt";

	std::ostringstream pathRCWnd;
	pathRCWnd<<"/NodeList/"<<nodeNum+1<<"/$ns3::TcpL4Protocol/SocketList/0/RWND";

	std::ostringstream fileRCWnd;
	fileRCWnd<<"UE-"<<nodeNum+1<<"-TCP-RCWND.txt";

	Ptr<OutputStreamWrapper> stream1 = asciiTraceHelper.CreateFileStream (fileCW.str ().c_str ());
	Config::ConnectWithoutContext (pathCW.str ().c_str (), MakeBoundCallback(&CwndChange, stream1));

	Ptr<OutputStreamWrapper> stream2 = asciiTraceHelper.CreateFileStream (fileRTT.str ().c_str ());
	Config::ConnectWithoutContext (pathRTT.str ().c_str (), MakeBoundCallback(&RttChange, stream2));

	Ptr<OutputStreamWrapper> stream4 = asciiTraceHelper.CreateFileStream (fileRCWnd.str ().c_str ());
	Config::ConnectWithoutContext (pathRCWnd.str ().c_str (), MakeBoundCallback(&CwndChange, stream4));

}


int
main (int argc, char *argv[])
{
  // default values
  double simTime = 5.0; // total duration of simulation (s)
  double startTime =1.0;
  bool log_packetflow = false; // enabling log module for packet tracing
  int dcType_t = 2; // Dual connectivity type (0:Single Connection, 1:1A, 2:3C, 3:1X)
  int pdcpReorderingTimer_t = 100; // PDCP packet reordering timer (ms)
  int x2LinkDelay = 0;
  bool enablePDCPReordering = true; // enabling PDCP packet reordering function
  uint16_t downlinkRb = 100;
  double distance = 100.0; // distance between MeNB and SeNB
  double velocity = 1.0; // velocity of UE
  bool isTcp = true; // true:TCP, false:UDP
  int splitAlgorithm_t = 2; // choose split algorithm among the list below
  isTcp_for_MyApp = isTcp;
/*
--Split Algorithm List--
 0: MeNB only
 1: SeNB only
 2: alternative splitting
 3: Proposed V1
*/

  std::string outputName;
  uint8_t dcType;
  uint16_t  pdcpReorderingTimer, splitAlgorithm;

  CommandLine cmd;
  cmd.AddValue("simTime", "Total duration of the simulation [s])", simTime);
  cmd.AddValue("pdcpReorderingTimer", "PDCP reordering timer [ms])", pdcpReorderingTimer_t);
  cmd.AddValue("outputName", "Output file namei prefix", outputName);
  cmd.AddValue("splitAlgorithm", "Selecting splitting algorithm", splitAlgorithm_t);
  cmd.AddValue("dcType", "Select DC Type", dcType_t);
  cmd.AddValue("x2LinkDelay", "X2 interface link delay", x2LinkDelay);
  cmd.Parse(argc, argv);

  dcType = (unsigned) dcType_t;
  pdcpReorderingTimer = (unsigned) pdcpReorderingTimer_t;
  splitAlgorithm = (unsigned) splitAlgorithm_t;

  NS_LOG_UNCOND("Simulation Setting");
  NS_LOG_UNCOND(" -simTime(s) = " << simTime);
  if (isTcp)  NS_LOG_UNCOND(" -App = TCP");
  else NS_LOG_UNCOND(" -App = UDP");
  NS_LOG_UNCOND(" -dcType = " << (unsigned) dcType);
  NS_LOG_UNCOND(" -splitAlgorithm = " << (unsigned) splitAlgorithm);
  NS_LOG_UNCOND(" -pdcpReorderingTimer(ms) = " << (unsigned) pdcpReorderingTimer);
  NS_LOG_UNCOND(" -x2LinkDelay(ms) = " << x2LinkDelay);

//  LogComponentEnable ("LteHelper", LOG_FUNCTION);
//  LogComponentEnable ("PointToPointEpcHelper", LOG_FUNCTION);
//  LogComponentEnable ("EpcEnbApplication", LOG_FUNCTION);
//  LogComponentEnable ("EpcSgwPgwApplication", LOG_FUNCTION);

  if (log_packetflow){
    LogComponentEnable ("EpcEnbApplication", LOG_INFO);
    LogComponentEnable ("EpcSgwPgwApplication", LOG_INFO);
    LogComponentEnable ("LteEnbRrc", LOG_INFO);
    LogComponentEnable ("PacketSink", LOG_INFO);
    LogComponentEnable ("UdpClient", LOG_INFO);
  }

  // Logging CoDel queue packet drop
  LogComponentEnable ("QueueDisc", LOG_INFO);

  // Logging PDCP packet discarding and PDCP reordering timer operation
  LogComponentEnable ("LtePdcp", LOG_INFO);

  // These attributes need to be checked before simulation
  Config::SetDefault ("ns3::UeManager::SplitAlgorithm", UintegerValue (splitAlgorithm));
  Config::SetDefault ("ns3::PointToPointEpcHelper::X2LinkDelay", TimeValue (MilliSeconds(x2LinkDelay)));
  Config::SetDefault ("ns3::PointToPointEpcHelper::X2LinkDataRate", DataRateValue (DataRate("1Gb/s")));
  Config::SetDefault ("ns3::CoDelQueueDisc::Interval", StringValue ("500ms"));
  Config::SetDefault ("ns3::CoDelQueueDisc::Target", StringValue ("50ms"));

 // Config::SetDefault ("ns3::LteHelper::UseCa", BooleanValue (true));
  //  Config::SetDefault ("ns3::LteHelper::NumberOfComponentCarriers", UintegerValue(5));
  //  Config::SetDefault ("ns3::LteHelper::EnbComponentCarrierManager", StringValue ("ns3::RrComponentCarrierManager"));
  //   Config::SetDefault ("ns3::LteSpectrumPhy::CtrlErrorModelEnabled", BooleanValue (false));
  //   Config::SetDefault ("ns3::LteSpectrumPhy::DataErrorModelEnabled", BooleanValue (false));
    // Config::SetDefault ("ns3::LteHelper::UseIdealRrc", BooleanValue (true));
//   Config::SetDefault("ns3::LteHelper::Scheduler", StringValue ("ns3::RrFfMacScheduler"));
   //Config::SetDefault("ns3::LteRlcAm::TxOpportunityForRetxAlwaysBigEnough", BooleanValue (true));
  // Config::SetDefault ("ns3::LteUePowerControl::AccumulationEnabled", BooleanValue (false)); //sjkang0606
  // These would be used as default in most cases
  if(isTcp)
  {
    Config::SetDefault ("ns3::LteEnbRrc::EpsBearerToRlcMapping", EnumValue (ns3::LteEnbRrc::RLC_AM_ALWAYS));
   Config::SetDefault ("ns3::LteRlcAm::EnableAQM", BooleanValue (true));
    Config::SetDefault ("ns3::LteRlcAm::MaxTxBufferSize", UintegerValue (20* 1024 * 1024));
    Config::SetDefault ("ns3::LtePdcp::EnablePDCPReordering", BooleanValue (enablePDCPReordering));
    Config::SetDefault ("ns3::LtePdcp::ExpiredTime",TimeValue(MilliSeconds(pdcpReorderingTimer)));
  }
  else
  {
    Config::SetDefault ("ns3::LteEnbRrc::EpsBearerToRlcMapping", EnumValue (ns3::LteEnbRrc::RLC_UM_ALWAYS));
    Config::SetDefault ("ns3::LteRlcUm::MaxTxBufferSize", UintegerValue (20 * 1024 * 1024));
    Config::SetDefault ("ns3::LtePdcp::EnablePDCPReordering", BooleanValue (false));
  }
  Config::SetDefault ("ns3::Queue::MaxPackets", UintegerValue (1000));
  Config::SetDefault ("ns3::Ipv4L3Protocol::FragmentExpirationTimeout", TimeValue (Seconds (1)));
  Config::SetDefault ("ns3::TcpL4Protocol::SocketType", TypeIdValue (TcpNewReno::GetTypeId ()));
  Config::SetDefault ("ns3::TcpSocketBase::MinRto", TimeValue (MilliSeconds (200)));
  Config::SetDefault ("ns3::TcpSocket::SegmentSize", UintegerValue (1400));
  Config::SetDefault ("ns3::TcpSocket::SndBufSize", UintegerValue (131072*200));
  Config::SetDefault ("ns3::TcpSocket::RcvBufSize", UintegerValue (131072*200));
  Config::SetDefault ("ns3::TcpSocket::DelAckCount", UintegerValue (1));
  Config::SetDefault ("ns3::CoDelQueueDisc::Mode", StringValue ("QUEUE_MODE_PACKETS"));
  Config::SetDefault ("ns3::CoDelQueueDisc::MaxPackets", UintegerValue (50000));

///////building setting /////////////////////


  Ptr < Building > building= CreateObject<Building>();
  			building = Create<Building> ();
  			building->SetBoundaries (Box (5.0,40.0,
  										-100, 100,
  										0.0, 15.0));
  			building->SetBuildingType (Building::Residential);
  			  building->SetExtWallsType (Building::ConcreteWithWindows);
  			  building->SetNFloors (3);
  //MobilityBuildingInfo MobilityBuilding(building) ;



  NS_LOG_UNCOND("# Set lteHelper, PointToPointEpcHelper");
  Ptr<LteHelper> lteHelper = CreateObject<LteHelper> ();
  Ptr<PointToPointEpcHelper>  epcHelper = CreateObject<PointToPointEpcHelper> ();
  lteHelper->SetEpcHelper (epcHelper);
  lteHelper->SetEnbDeviceAttribute ("DlBandwidth", UintegerValue (downlinkRb));
  lteHelper->SetEnbDeviceAttribute ("UlBandwidth", UintegerValue (downlinkRb));
  lteHelper->EnableTraces();
 //lteHelper->SetAttribute ("PathlossModelAtMenb", StringValue ("ns3::BuildingsPropagationLossModel"));

 // lteHelper->SetAttribute ("PathlossModelAtSenb", StringValue ("ns3::LogDistancePropagationLossModel"));
  ConfigStore inputConfig;
  inputConfig.ConfigureDefaults();

  // parse again so you can override default values from the command line
  cmd.Parse(argc, argv);
  Ptr<Node> pgw = epcHelper->GetPgwNode ();

  pgw->GetApplication (0) -> GetObject<EpcSgwPgwApplication> () -> SetSplitAlgorithm(splitAlgorithm); // woody

   // Create a single RemoteHost
  NS_LOG_UNCOND("# Create a remote host");
  NodeContainer remoteHostContainer;
  remoteHostContainer.Create (3);
  Ptr<Node> remoteHost_0 = remoteHostContainer.Get (0);
  Ptr<Node> remoteHost_1 = remoteHostContainer.Get (1);
  Ptr<Node> remoteHost_2 = remoteHostContainer.Get (2);
  //Ptr<Node> remoteHost_3 = remoteHostContainer.Get (3);
  //Ptr<Node> remoteHost = remoteHostContainer.Get (0);
  InternetStackHelper internet;
  internet.Install (remoteHostContainer);

  // Create the Internet
  NS_LOG_UNCOND("# Connect remost host and p-gw through the internet");
  PointToPointHelper p2ph;
  p2ph.SetDeviceAttribute ("DataRate", DataRateValue (DataRate ("100Gb/s")));
  p2ph.SetDeviceAttribute ("Mtu", UintegerValue (1500));
  p2ph.SetChannelAttribute ("Delay", TimeValue (Seconds (0.010)));
  NetDeviceContainer internetDevices_0 = p2ph.Install (pgw, remoteHost_0);
  NetDeviceContainer internetDevices_1 = p2ph.Install (pgw, remoteHost_1);
  NetDeviceContainer internetDevices_2 = p2ph.Install (pgw, remoteHost_2);

  Ipv4AddressHelper ipv4h;
  ipv4h.SetBase ("1.0.0.0", "255.0.0.0");
  Ipv4InterfaceContainer internetIpIfaces_0 = ipv4h.Assign (internetDevices_0);
  Ipv4InterfaceContainer internetIpIfaces_1 = ipv4h.Assign (internetDevices_1);
  Ipv4InterfaceContainer internetIpIfaces_2 = ipv4h.Assign (internetDevices_2);

  // interface 0 is localhost, 1 is the p2p device

  NS_LOG_UNCOND("# Routing setting on the remote host");
  Ipv4StaticRoutingHelper ipv4RoutingHelper;
  Ptr<Ipv4StaticRouting> remoteHostStaticRouting_0 = ipv4RoutingHelper.GetStaticRouting (remoteHost_0->GetObject<Ipv4> ());
  remoteHostStaticRouting_0->AddNetworkRouteTo (Ipv4Address ("7.0.0.0"), Ipv4Mask ("255.0.0.0"), 1);

  Ptr<Ipv4StaticRouting> remoteHostStaticRouting_1 = ipv4RoutingHelper.GetStaticRouting (remoteHost_1->GetObject<Ipv4> ());
    remoteHostStaticRouting_1->AddNetworkRouteTo (Ipv4Address ("7.0.0.0"), Ipv4Mask ("255.0.0.0"), 1);

    Ptr<Ipv4StaticRouting> remoteHostStaticRouting_2 = ipv4RoutingHelper.GetStaticRouting (remoteHost_2->GetObject<Ipv4> ());
      remoteHostStaticRouting_2->AddNetworkRouteTo (Ipv4Address ("7.0.0.0"), Ipv4Mask ("255.0.0.0"), 1);

  NS_LOG_UNCOND("# Create UE, eNB nodes");
  NodeContainer ueNodes;
  NodeContainer enbNodes;
  enbNodes.Create(1);
  ueNodes.Create(3);

  NodeContainer senbNodes; // woody
  senbNodes.Create(1);

  // Install Mobility Model
  NS_LOG_UNCOND("# Mobility set up");
  Ptr<ListPositionAllocator> enbPositionAlloc = CreateObject<ListPositionAllocator> ();
  enbPositionAlloc->Add (Vector (0.0, 0.0, 0.0)); //for MeNB
  enbPositionAlloc->Add (Vector (distance, 0.0, 0.0)); //for SeNB
  MobilityHelper enbMobility;
  enbMobility.SetMobilityModel ("ns3::ConstantPositionMobilityModel");
  enbMobility.SetPositionAllocator(enbPositionAlloc);
  enbMobility.Install (enbNodes);
  enbMobility.Install (senbNodes);


  MobilityHelper ueMobility;
  ueMobility.SetMobilityModel ("ns3::ConstantVelocityMobilityModel");
  ueMobility.Install (ueNodes);
  ueNodes.Get (0)->GetObject<MobilityModel> ()->SetPosition (Vector (distance/2, 0, 0));  //for Ue
  ueNodes.Get (0)->GetObject<ConstantVelocityMobilityModel> ()->SetVelocity (Vector (0, 0, 0));

  ueNodes.Get (1)->GetObject<MobilityModel> ()->SetPosition (Vector (distance/2, distance, 0));  //for Ue
  ueNodes.Get (1)->GetObject<ConstantVelocityMobilityModel> ()->SetVelocity (Vector (0, 0, 0));

   ueNodes.Get (2)->GetObject<MobilityModel> ()->SetPosition (Vector (-distance/2, -distance, 0));  //for Ue
   ueNodes.Get (2)->GetObject<ConstantVelocityMobilityModel> ()->SetVelocity (Vector (0, 0, 0));

  Simulator::Schedule (Seconds (4), &ChangeSpeed, ueNodes.Get (0), Vector (velocity, 0, 0));
  Simulator::Schedule (Seconds (15), &ChangeSpeed, ueNodes.Get (0), Vector (-1*velocity, 0, 0)); //sychoi 170530

  // Install LTE Devices to the nodes
  NS_LOG_UNCOND("# Install LTE device to the nodes");
  NetDeviceContainer enbLteDevs = lteHelper->InstallEnbDevice (enbNodes);
  NetDeviceContainer senbLteDevs = lteHelper->InstallSenbDevice (senbNodes); // woody
  NetDeviceContainer ueLteDevs = lteHelper->InstallDcUeDevice (ueNodes); // woody

  ////changing RB_SIZE
  //Simulator::Schedule (Seconds(3), &changRBSize, 50,enbLteDevs,senbLteDevs); //sjkang
  //Simulator::Schedule (Seconds(6), &changRBSize, -25,enbLteDevs,senbLteDevs); //sjkang

  lteHelper->NotifyEnbNeighbor (enbNodes.Get(0), senbNodes.Get(0)); // woody3C
for (uint16_t i=0; i<3; i++)
  lteHelper->ConnectAssistInfo (enbNodes.Get(0), senbNodes.Get(0), ueNodes.Get(i), dcType); // woody

  // Install the IP stack on the UEs
  NS_LOG_UNCOND("# install the IP stack on the UEs");
  internet.Install (ueNodes);
  Ipv4InterfaceContainer ueIpIface;
  ueIpIface = epcHelper->AssignUeIpv4Address (NetDeviceContainer (ueLteDevs));
  // Assign IP address to UEs, and install applications
  for (uint32_t u = 0; u < ueNodes.GetN (); ++u)
    {
      Ptr<Node> ueNode = ueNodes.Get (u);
      // Set the default gateway for the UE
      Ptr<Ipv4StaticRouting> ueStaticRouting = ipv4RoutingHelper.GetStaticRouting (ueNode->GetObject<Ipv4> ());
      ueStaticRouting->SetDefaultRoute (epcHelper->GetUeDefaultGatewayAddress (), 1);
    }

  // Attach one UE per eNodeB
  NS_LOG_UNCOND("# Attach UEs to the eNodeBs");

  uint16_t dlPortDc = 1235;
  Ptr<EpcTft> tftDc = Create<EpcTft> ();
  EpcTft::PacketFilter tftPacketFilter;
  tftPacketFilter.localPortStart = dlPortDc;
  tftPacketFilter.localPortEnd = dlPortDc;
  tftDc->Add (tftPacketFilter);

  lteHelper->Attach (ueLteDevs.Get(0), enbLteDevs.Get(0));
  lteHelper->AttachDc (ueLteDevs.Get(0), senbLteDevs.Get(0), tftDc, dcType); // woody, woody3C
  lteHelper->Attach (ueLteDevs.Get(1), enbLteDevs.Get(0));
  lteHelper->AttachDc (ueLteDevs.Get(1), senbLteDevs.Get(0), tftDc, dcType); // woody, woody3C
  lteHelper->Attach (ueLteDevs.Get(2), enbLteDevs.Get(0));
  lteHelper->AttachDc (ueLteDevs.Get(2), senbLteDevs.Get(0), tftDc, dcType); // woody, woody3C


  // Add X2 interface
  lteHelper->AddX2Interface (enbNodes.Get(0), senbNodes.Get(0)); // woody3C

  // Install and start applications on UEs and remote host
  NS_LOG_UNCOND("# Install applications");
  if(isTcp)
  {
	  Address sinkAddress_0 (InetSocketAddress (ueIpIface.GetAddress (0), dlPortDc));
	  Address sinkAddress_1 (InetSocketAddress (ueIpIface.GetAddress (1), dlPortDc));
	  Address sinkAddress_2 (InetSocketAddress (ueIpIface.GetAddress (2), dlPortDc));

    PacketSinkHelper packetSinkHelper ("ns3::TcpSocketFactory", InetSocketAddress (Ipv4Address::GetAny (), dlPortDc));
    ApplicationContainer sinkApps_0 = packetSinkHelper.Install (ueNodes.Get (0));
    ApplicationContainer sinkApps_1 = packetSinkHelper.Install (ueNodes.Get (1));
    ApplicationContainer sinkApps_2 = packetSinkHelper.Install (ueNodes.Get (2));

    sinkApps_0.Start (Seconds (0.));
    sinkApps_0.Stop (Seconds (simTime));
    sinkApps_1.Start (Seconds (0.));
    sinkApps_1.Stop (Seconds (simTime));
    sinkApps_2.Start (Seconds (0.));
    sinkApps_2.Stop (Seconds (simTime));

  std::cout << sinkAddress_0 << sinkAddress_1 << sinkAddress_2 << std::endl;

    Ptr<Socket> ns3TcpSocket_0 = Socket::CreateSocket (remoteHostContainer.Get (0), TcpSocketFactory::GetTypeId ());
    Ptr<Socket> ns3TcpSocket_1 = Socket::CreateSocket (remoteHostContainer.Get (1), TcpSocketFactory::GetTypeId ());
    Ptr<Socket> ns3TcpSocket_2 = Socket::CreateSocket (remoteHostContainer.Get (2), TcpSocketFactory::GetTypeId ());

    Ptr<MyApp> app_0 = CreateObject<MyApp> ();
    app_0->Setup (ns3TcpSocket_0, sinkAddress_0, 1400, 5000000, DataRate ("100Mb/s"));//sychoi, tcp data rate config
    Ptr<MyApp> app_1 = CreateObject<MyApp> ();
     app_1->Setup (ns3TcpSocket_1, sinkAddress_1, 1400, 5000000, DataRate ("100Mb/s"));//sychoi, tcp data rate config
      Ptr<MyApp> app_2 = CreateObject<MyApp> ();
      app_2->Setup (ns3TcpSocket_2, sinkAddress_2, 1400, 5000000, DataRate ("100Mb/s"));//sychoi, tcp data rate config

    remoteHostContainer.Get (0)->AddApplication (app_0);
    remoteHostContainer.Get (1)->AddApplication (app_1);
    remoteHostContainer.Get (2)->AddApplication (app_2);

    AsciiTraceHelper asciiTraceHelper;
    Ptr<OutputStreamWrapper> stream_packet_size = asciiTraceHelper.CreateFileStream (outputName + "_packet_size.txt");
    sinkApps_0.Get(0)->TraceConnectWithoutContext("Rx",MakeBoundCallback (&Rx, stream_packet_size));

    Ptr<OutputStreamWrapper> stream_rtt = asciiTraceHelper.CreateFileStream (outputName + "_rtt.txt");
    ns3TcpSocket_0->TraceConnectWithoutContext ("RTT", MakeBoundCallback (&RttChange, stream_rtt));

    Ptr<OutputStreamWrapper> stream_cwnd = asciiTraceHelper.CreateFileStream (outputName + "_tcp_cwnd.txt");
    ns3TcpSocket_0->TraceConnectWithoutContext ("CongestionWindow", MakeBoundCallback (&CwndChange, stream_cwnd));

    Ptr<OutputStreamWrapper> stream_packet_size_ue1 = asciiTraceHelper.CreateFileStream (outputName + "_packet_size_ue1.txt");
   sinkApps_1.Get(0)->TraceConnectWithoutContext("Rx",MakeBoundCallback (&Rx, stream_packet_size_ue1));



    streamThroughput = new std::ofstream(outputName + "_throughput.txt");
    Simulator::Schedule (Seconds (startTime), &CalculateThroughput);

    //Simulator::Schedule (Seconds (2.0), &changePathLossFromMenbInDownlink, lteHelper, 1.0, 60); //change path loss
   // Simulator::Schedule (Seconds (2.0), &changePathLossFromSenbInDownlink, lteHelper, 1.0, 70.0); //change path loss
   // Simulator::Schedule (Seconds (3.0), &changePathLossFromSenbInDownlink, lteHelper, 1.0, 47.0); //change path loss
   // BuildingsHelper::Install (ueNodes);
   // BuildingsHelper::Install(senbNodes);
   // BuildingsHelper::Install (enbNodes);
    Traces(0);
     Traces(1);
     Traces(2);
    Simulator::Schedule (Seconds (5.0), &changePathLossModelAtSenb, lteHelper,
    		"ns3::RandomPropagationLossModel"); //change path lossmodel
    Simulator::Schedule (Seconds (3.0), &changePathLossModelAtMenb, lteHelper,
    		///"ns3::BuildingsPropagationLossModel");
       		"ns3::LogDistancePropagationLossModel"); //change path lossmodel

     app_0->SetStartTime (Seconds (startTime));
    app_0->SetStopTime (Seconds (simTime));
    app_1->SetStartTime (Seconds (startTime+0.1));
      app_1->SetStopTime (Seconds (simTime));
     app_2->SetStartTime (Seconds (startTime+0.2));
     app_2->SetStopTime (Seconds (simTime));

    sink = sinkApps_0.Get (0)->GetObject<PacketSink> ();
    Simulator::Stop(Seconds(simTime+0.5));

 ;

     NS_LOG_UNCOND("# Run simulation");
     Simulator::Run();


     double lteThroughput = sink->GetTotalRx () * 8.0 / (1000000.0*(simTime - startTime));
     NS_LOG_UNCOND ("LastPacket " << packetRxTime << " TotalFlow " << sumPacketSize << "Mb");
     NS_LOG_UNCOND ("UE(" << ueIpIface.GetAddress(0) <<") AverageLteThroughput: " << lteThroughput << "Mbps");

     Simulator::Destroy();
    std::ofstream output( "ExpiredTime_Throuput.txt", std::ios::app);
     output << "simTime" << "\t" << simTime << "\t" <<"pdcpReorderingTime" << "\t" << pdcpReorderingTimer <<"\t"
         << "throughput" << "\t" << lteThroughput << "\t"
           << "RTT"<< "\t" << RTT_value << std ::endl;
  }
  else
  {
    Address sinkAddress (InetSocketAddress (ueIpIface.GetAddress (0), dlPortDc));
    PacketSinkHelper packetSinkHelper ("ns3::UdpSocketFactory", InetSocketAddress (Ipv4Address::GetAny (), dlPortDc));
    UdpServerHelper UdpServer(dlPortDc);
   ApplicationContainer sinkApps = UdpServer.Install (ueNodes.Get (0));
  // ApplicationContainer sinkApps = packetSinkHelper.Install (ueNodes.Get (0));



    sinkApps.Start (Seconds (0.));
    sinkApps.Stop (Seconds (simTime));

    Ptr<Socket> ns3UdpSocket = Socket::CreateSocket (remoteHostContainer.Get (0), UdpSocketFactory::GetTypeId ());
    Ptr<MyApp> app = CreateObject<MyApp> ();
    app->Setup (ns3UdpSocket, sinkAddress, 1400, 5000000, DataRate ("100Mb/s"));

    remoteHostContainer.Get (0)->AddApplication (app);
    AsciiTraceHelper asciiTraceHelper;
    Ptr<OutputStreamWrapper> stream2 = asciiTraceHelper.CreateFileStream (outputName + "_udp_data.txt");
    sinkApps.Get(0)->TraceConnectWithoutContext("Rx",MakeBoundCallback (&UdpRx, stream2));

    app->SetStartTime (Seconds (startTime));
    app->SetStopTime (Seconds (simTime));

  Simulator::Stop(Seconds(simTime+0.5));
  NS_LOG_UNCOND("# Run simulation");
  Simulator::Run();
  Simulator::Destroy();

  std::cout << "Loss Packet  " << UdpServer.GetServer()->GetLost() << std::endl;
  std::cout << "Received Packet " << UdpServer.GetServer() ->GetReceived() << std::endl;
  }
  return 0;
}

