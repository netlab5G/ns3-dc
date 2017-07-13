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
#include <ns3/packet.h>
#include <ns3/tag.h>
#include <fstream>
#include <iostream>
#include <string>

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

void
MyApp::SendPacket (void)
{
  Ptr<Packet> packet = Create<Packet> (m_packetSize);
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
Rx (Ptr<OutputStreamWrapper> stream, Ptr<const Packet> packet, const Address &from)
{
  packetRxTime = Simulator::Now().GetSeconds();
  if (lastPacketRxTime == packetRxTime){
    instantPacketSize += packet->GetSize();
    return;
  }
  else{
    sumPacketSize += instantPacketSize;
    *stream->GetStream () << lastPacketRxTime << "\t" << instantPacketSize << "\t" << sumPacketSize << std::endl;
    lastPacketRxTime =  packetRxTime;
    instantPacketSize = packet->GetSize();
  }
}

double RTT_value;

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
uint64_t lastTotalRx = 0;
std::ofstream *streamThroughput;

void
CalculateThroughput ()
{
  Time now = Simulator::Now ();                                         /* Return the simulator's virtual time. */
  double cur = (sink->GetTotalRx () - lastTotalRx) * (double) 8 / 1e5;     /* Convert Application RX Packets to MBits. */
  *streamThroughput  << now.GetSeconds () << "\t" << cur << " Mbit/s" << std::endl;
  lastTotalRx = sink->GetTotalRx ();
  Simulator::Schedule (MilliSeconds (100), &CalculateThroughput);
}


int
main (int argc, char *argv[])
{
  // default values
  double simTime = 9.0;
  double startTime =1.0;
  int log_packetflow = 0;
  int dcType_t = 2; // 0:Single Connection, 1:1A, 2:3C, 3:1X
  int pdcpReorderingTimer_t = 100;
  int x2LinkDelay = 20;
  bool enablePDCPReordering = true;
  uint16_t downlinkRb = 100;
  int splitAlgorithm_t = 2; // 3 : delay model, 4: queue model
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
  NS_LOG_UNCOND(" -App = TCP");
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
 // LogComponentEnable ("QueueDisc", LOG_INFO);

  // Logging PDCP packet discarding and PDCP reordering timer operation
  //LogComponentEnable ("LtePdcp", LOG_INFO);

  // These attributes need to be checked before simulation
  Config::SetDefault ("ns3::LtePdcp::ExpiredTime",TimeValue(MilliSeconds(pdcpReorderingTimer)));
  Config::SetDefault ("ns3::CoDelQueueDisc::Interval", StringValue ("500ms"));
  Config::SetDefault ("ns3::CoDelQueueDisc::Target", StringValue ("50ms"));
  Config::SetDefault ("ns3::UeManager::SplitAlgorithm", UintegerValue (splitAlgorithm));
  Config::SetDefault ("ns3::PointToPointEpcHelper::X2LinkDelay", TimeValue (MilliSeconds(x2LinkDelay)));
  Config::SetDefault ("ns3::PointToPointEpcHelper::X2LinkDataRate", DataRateValue (DataRate("1Gb/s")));
  Config::SetDefault ("ns3::LteRlcAm::EnableAQM", BooleanValue (true));
  Config::SetDefault ("ns3::LtePdcp::EnablePDCPReordering", BooleanValue (enablePDCPReordering));
  Config::SetDefault ("ns3::LteEnbRrc::EpsBearerToRlcMapping", EnumValue (ns3::LteEnbRrc::RLC_AM_ALWAYS));

  // These would be used as default in most cases
  Config::SetDefault ("ns3::LteRlcAm::MaxTxBufferSize", UintegerValue (20 * 1024 * 1024));
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

  NS_LOG_UNCOND("# Set lteHelper, PointToPointEpcHelper");
  Ptr<LteHelper> lteHelper = CreateObject<LteHelper> ();
  Ptr<PointToPointEpcHelper>  epcHelper = CreateObject<PointToPointEpcHelper> ();
  lteHelper->SetEpcHelper (epcHelper);

  lteHelper->SetEnbDeviceAttribute ("DlBandwidth", UintegerValue (downlinkRb));
  lteHelper->SetEnbDeviceAttribute ("UlBandwidth", UintegerValue (downlinkRb));
//  lteHelper->EnableRlcTraces();
  ConfigStore inputConfig;
  inputConfig.ConfigureDefaults();

  // parse again so you can override default values from the command line
  cmd.Parse(argc, argv);
  Ptr<Node> pgw = epcHelper->GetPgwNode ();

  pgw->GetApplication(0) -> GetObject<EpcSgwPgwApplication> () -> SetSplitAlgorithm(splitAlgorithm); // woody

   // Create a single RemoteHost
  NS_LOG_UNCOND("# Create a remote host");
  NodeContainer remoteHostContainer;
  remoteHostContainer.Create (1);
  Ptr<Node> remoteHost = remoteHostContainer.Get (0);
  InternetStackHelper internet;
  internet.Install (remoteHostContainer);

  // Create the Internet
  NS_LOG_UNCOND("# Connect remost host and p-gw through the internet");
  PointToPointHelper p2ph;
  p2ph.SetDeviceAttribute ("DataRate", DataRateValue (DataRate ("100Gb/s")));
  p2ph.SetDeviceAttribute ("Mtu", UintegerValue (1500));
  p2ph.SetChannelAttribute ("Delay", TimeValue (Seconds (0.010)));
  NetDeviceContainer internetDevices = p2ph.Install (pgw, remoteHost);
  Ipv4AddressHelper ipv4h;
  ipv4h.SetBase ("1.0.0.0", "255.0.0.0");
  Ipv4InterfaceContainer internetIpIfaces = ipv4h.Assign (internetDevices);
  // interface 0 is localhost, 1 is the p2p device

  NS_LOG_UNCOND("# Routing setting on the remote host");
  Ipv4StaticRoutingHelper ipv4RoutingHelper;
  Ptr<Ipv4StaticRouting> remoteHostStaticRouting = ipv4RoutingHelper.GetStaticRouting (remoteHost->GetObject<Ipv4> ());
  remoteHostStaticRouting->AddNetworkRouteTo (Ipv4Address ("7.0.0.0"), Ipv4Mask ("255.0.0.0"), 1);

  NS_LOG_UNCOND("# Create UE, eNB nodes");
  NodeContainer ueNodes;
  NodeContainer enbNodes;
  enbNodes.Create(1);
  ueNodes.Create(1);

  NodeContainer senbNodes; // woody
  senbNodes.Create(1);

  // Install Mobility Model
  NS_LOG_UNCOND("# Mobility set up");
  lteHelper->SetAttribute ("PathlossModel", StringValue ("ns3::LogDistancePropagationLossModel"));

  Ptr<ListPositionAllocator> positionAlloc = CreateObject<ListPositionAllocator> ();
  positionAlloc->Add (Vector(0, 0, 0)); // for LTE MeNB
  positionAlloc->Add (Vector(100, 0, 0)); // for LTE SeNB
  positionAlloc->Add (Vector(80, 0, 0)); // for LTE UE

  MobilityHelper mobility;
  mobility.SetPositionAllocator (positionAlloc);
  mobility.SetMobilityModel("ns3::ConstantPositionMobilityModel");
  mobility.Install (enbNodes);
  mobility.Install (senbNodes);
  mobility.Install (ueNodes);

  // Install LTE Devices to the nodes
  NS_LOG_UNCOND("# Install LTE device to the nodes");
  NetDeviceContainer enbLteDevs = lteHelper->InstallEnbDevice (enbNodes);
  NetDeviceContainer senbLteDevs = lteHelper->InstallSenbDevice (senbNodes); // woody
  NetDeviceContainer ueLteDevs = lteHelper->InstallDcUeDevice (ueNodes); // woody

  lteHelper->NotifyEnbNeighbor (enbNodes.Get(0), senbNodes.Get(0)); // woody3C

  lteHelper->ConnectAssistInfo (enbNodes.Get(0), senbNodes.Get(0), ueNodes.Get(0), dcType); // woody

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
  // side effect: the default EPS bearer will be activated

  // Add X2 interface
  lteHelper->AddX2Interface (enbNodes.Get(0), senbNodes.Get(0)); // woody3C

  // Install and start applications on UEs and remote host
  NS_LOG_UNCOND("# Install applications");
  // Installing TCP packet sink in UE
  ApplicationContainer serverApps;
  PacketSinkHelper tcpPacketSinkHelperDc ("ns3::TcpSocketFactory", InetSocketAddress (Ipv4Address::GetAny (), dlPortDc));
  serverApps = tcpPacketSinkHelperDc.Install (ueNodes.Get(0));
  // Installing TCP Socket in remote host
  Address sinkAddress (InetSocketAddress (ueIpIface.GetAddress (0), dlPortDc));
  Ptr<Socket> ns3TcpSocket = Socket::CreateSocket (remoteHost, TcpSocketFactory::GetTypeId ());
  Ptr<MyApp> app = CreateObject<MyApp> ();
  app->Setup (ns3TcpSocket, sinkAddress, 1360, 5000000, DataRate ("300Mbps"));
  remoteHost->AddApplication (app);

  app->SetStartTime (Seconds (startTime));
  serverApps.Start (Seconds (startTime));

//  lteHelper->EnableTraces ();

  // Uncomment to enable PCAP tracing
//  p2ph.EnablePcapAll("dc-tcp");

  AsciiTraceHelper asciiTraceHelper;
  Ptr<OutputStreamWrapper> stream_packet_size = asciiTraceHelper.CreateFileStream (outputName + "_packet_size.txt");
  serverApps.Get(0)->TraceConnectWithoutContext("Rx",MakeBoundCallback (&Rx, stream_packet_size));

  Ptr<OutputStreamWrapper> stream_rtt = asciiTraceHelper.CreateFileStream (outputName + "_rtt.txt");
  ns3TcpSocket->TraceConnectWithoutContext ("RTT", MakeBoundCallback (&RttChange, stream_rtt));

  Ptr<OutputStreamWrapper> stream_cwnd = asciiTraceHelper.CreateFileStream (outputName + "_tcp_cwnd.txt");
  ns3TcpSocket->TraceConnectWithoutContext ("CongestionWindow", MakeBoundCallback (&CwndChange, stream_cwnd));

  streamThroughput = new std::ofstream(outputName + "_throughput.txt");
  Simulator::Schedule (Seconds (startTime), &CalculateThroughput);

  app->SetStopTime(Seconds(simTime));
  Simulator::Stop(Seconds(simTime+0.5));

  NS_LOG_UNCOND("# Run simulation");
  sink = serverApps.Get (0)->GetObject<PacketSink> ();
  Simulator::Run();

  double lteThroughput = sink->GetTotalRx () * 8.0 / (1000000.0*(simTime - startTime));
  NS_LOG_UNCOND ("LastPacket " << packetRxTime << " TotalFlow " << sumPacketSize << "Mb");
  NS_LOG_UNCOND ("UE(" << ueIpIface.GetAddress(0) <<") AverageLteThroughput: " << lteThroughput << "Mbps");

  Simulator::Destroy();
  std::ofstream output(outputName + ".txt", std::ios::app);
  output << "simTime" << "\t" << simTime << "\t" << "throughput" << "\t" << lteThroughput << "\t"
         << "RTT"<< "\t" << RTT_value << std ::endl;

  return 0;
}

