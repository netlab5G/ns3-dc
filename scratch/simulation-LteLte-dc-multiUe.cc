
#include "ns3/point-to-point-module.h"
#include "ns3/lte-helper.h"
#include "ns3/epc-helper.h"
#include "ns3/point-to-point-epc-helper.h"
#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/ipv4-global-routing-helper.h"
#include "ns3/internet-module.h"
#include "ns3/mobility-module.h"
#include "ns3/applications-module.h"
#include "ns3/point-to-point-helper.h"
#include "ns3/config-store.h"
#include <ns3/buildings-helper.h>
#include <ns3/buildings-module.h>
#include <ns3/packet.h>
#include <ns3/tag.h>
#include <ns3/lte-helper.h>
#include <ns3/epc-helper.h>
#include <ns3/point-to-point-helper.h>
#include <ns3/lte-module.h>

//#include "ns3/gtk-config-store.h"

using namespace ns3;

/**
 * A script to simulate the DOWNLINK TCP data over mmWave links
 * with the mmWave devices and the LTE EPC.
 */
NS_LOG_COMPONENT_DEFINE ("muti-UE-TCPExample");


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
    m_packetsSent (0),
	m_sent(0)
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

static void
CwndChange (Ptr<OutputStreamWrapper> stream, uint32_t oldCwnd, uint32_t newCwnd)
{
	*stream->GetStream () << Simulator::Now ().GetSeconds () << "\t" << oldCwnd << "\t" << newCwnd << std::endl;
}

static void
RttChange (Ptr<OutputStreamWrapper> stream, Time oldRtt, Time newRtt)
{
	*stream->GetStream () << Simulator::Now ().GetSeconds () << "\t" << oldRtt.GetSeconds () << "\t" << newRtt.GetSeconds () << std::endl;
}
void
ChangeSpeed(Ptr<Node>  n, Vector speed)
{
	n->GetObject<ConstantVelocityMobilityModel> ()->SetVelocity (speed);
}

double instantPacketSize[100], packetRxTime[100], lastPacketRxTime[100];
double sumPacketSize[100];

static void
Rx (Ptr<OutputStreamWrapper> stream, uint16_t i, Ptr<const Packet> packet, const Address &from){
  packetRxTime[i] = Simulator::Now().GetSeconds();
  if (lastPacketRxTime[i] == packetRxTime[i]){
    instantPacketSize[i] += packet->GetSize();
    return;
  }
  else{
    sumPacketSize[i] += instantPacketSize[i];
    *stream->GetStream () << lastPacketRxTime[i] << "\t" << instantPacketSize[i] << "\t" << sumPacketSize[i]
    		<< std::endl;
    lastPacketRxTime[i] =  packetRxTime[i];
    instantPacketSize[i] = packet->GetSize();
  }
}
int previousLoss[100];
void
Loss(Ptr<OutputStreamWrapper> stream, uint16_t i, uint64_t received, uint32_t loss ){
	*stream->GetStream () << Simulator::Now ().GetSeconds () << "\t" <<received<< "\t"<<
			loss << "\t" << loss-previousLoss[i] <<std::endl;
	previousLoss[i]=loss;
}

//Ptr<UdpServer> server;
uint64_t lastTotalRx[100];

void
CalculateThroughput (Ptr<OutputStreamWrapper> stream, Ptr<PacketSink> sink, uint16_t i)
{
  Time now = Simulator::Now ();                                         /* Return the simulator's virtual time. */
  double cur = (sink->GetTotalRx () - lastTotalRx[i]) * (double) 8 / 1e5;     /* Convert Application RX Packets to MBits. */
  *stream->GetStream()  << now.GetSeconds () << "\t" << cur <<std::endl;
  lastTotalRx[i] = sink->GetTotalRx ();
  Simulator::Schedule (MilliSeconds (100), &CalculateThroughput,stream,sink,i);
}

void changRBSize(uint32_t RB_Size, NetDeviceContainer enbLteDevs, NetDeviceContainer senbLteDevs) {
	senbLteDevs.Get(0)->GetObject<LteEnbNetDevice>() ->
			  GetFfMacScheduler ()->GetObject<PfFfMacScheduler>()->Set_Bandwidth_Again(true, RB_Size); //sjkang

	enbLteDevs.Get(0)->GetObject<LteEnbNetDevice>() ->
			  GetFfMacScheduler ()->GetObject<PfFfMacScheduler>()->Set_Bandwidth_Again(true ,RB_Size); //sjkang

}
///changing the path loss at Menb and Senb

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

void Attach(Ptr<LteHelper> lteHelper, Ptr<NetDevice> ueDevice,
		Ptr<NetDevice> Senb, Ptr<NetDevice> Menb, Ptr<EpcTft> tftDc , uint8_t dcType, uint8_t nodeNumber){
	lteHelper->Attach (ueDevice, Menb);
   lteHelper->AttachDc (ueDevice, Senb, tftDc, dcType);
}

int
main (int argc, char *argv[])
{
	uint16_t nodeNum = 8;
	double simStopTime = 10;
    double simStartTime =0.0;
	bool isTcp=true;
    uint16_t downlinkRb= 100;
    uint16_t uplinkRb=100;
    uint16_t pdcpReorderingTimer_t = 150;
    uint16_t splitAlgorithm_t = 4;
    uint16_t dcType_t=3;
     int x2LinkDelay = 0;
    bool enablePDCPReordering = true; // enabling PDCP packet reordering function
    isTcp_for_MyApp= isTcp;

    std::string outputName;
    uint8_t dcType;
    uint16_t  pdcpReorderingTimer, splitAlgorithm;

    CommandLine cmd;
    cmd.AddValue("simTime", "Total duration of the simulation [s])", simStopTime);
    cmd.AddValue("pdcpReorderingTimer", "PDCP reordering timer [ms])", pdcpReorderingTimer_t);
    cmd.AddValue("outputName", "Output file namei prefix", outputName);
    cmd.AddValue("splitAlgorithm", "Selecting splitting algorithm", splitAlgorithm_t);
    cmd.AddValue("dcType", "Select DC Type", dcType_t);
    cmd.AddValue("x2LinkDelay", "X2 interface link delay", x2LinkDelay);
    cmd.Parse(argc, argv);

    /*LogComponentEnable ("PointToPointEpcHelper", LOG_ALL);
    LogComponentEnable ("EpcEnbApplication", LOG_ALL);
    LogComponentEnable ("LteEnbRrc", LOG_ALL);
    LogComponentEnable ("EpcMme", LOG_ALL);
    LogComponentEnable("EpcSgwPgwApplication", LOG_ALL);*/
    // Logging CoDel queue packet drop
    LogComponentEnable ("QueueDisc", LOG_INFO);

    // Logging PDCP packet discarding and PDCP reordering timer operation
    LogComponentEnable ("LtePdcp", LOG_INFO);

    dcType = (unsigned) dcType_t;
    pdcpReorderingTimer = (unsigned) pdcpReorderingTimer_t;
    splitAlgorithm = (unsigned) splitAlgorithm_t;

    NS_LOG_UNCOND("Simulation Setting");
    NS_LOG_UNCOND(" -simTime(s) = " << simStopTime);
    if (isTcp)  NS_LOG_UNCOND(" -App = TCP");
    else NS_LOG_UNCOND(" -App = UDP");
    NS_LOG_UNCOND(" -dcType = " << (unsigned) dcType);
    NS_LOG_UNCOND(" -splitAlgorithm = " << (unsigned) splitAlgorithm);
    NS_LOG_UNCOND(" -pdcpReorderingTimer(ms) = " << (unsigned) pdcpReorderingTimer);
    NS_LOG_UNCOND(" -x2LinkDelay(ms) = " << x2LinkDelay);

	Config::SetDefault ("ns3::TcpSocketBase::MinRto", TimeValue (MilliSeconds (200)));

	Config::SetDefault ("ns3::TcpSocket::SegmentSize", UintegerValue (1400));
	Config::SetDefault ("ns3::TcpSocket::DelAckCount", UintegerValue (1));
	//Config::SetDefault ("ns3::TcpSocket::DelAckTimeout", TimeValue (MilliSeconds (10)));
	 // These attributes need to be checked before simulation
	  Config::SetDefault ("ns3::UeManager::SplitAlgorithm", UintegerValue (splitAlgorithm));
	  Config::SetDefault ("ns3::PointToPointEpcHelper::X2LinkDelay", TimeValue (MilliSeconds(x2LinkDelay)));
	  Config::SetDefault ("ns3::PointToPointEpcHelper::X2LinkDataRate", DataRateValue (DataRate("1Gb/s")));
	  Config::SetDefault ("ns3::CoDelQueueDisc::Interval", StringValue ("500ms"));
	  Config::SetDefault ("ns3::CoDelQueueDisc::Target", StringValue ("50ms"));

	Config::SetDefault ("ns3::TcpSocket::SndBufSize", UintegerValue (131072*200));
	Config::SetDefault ("ns3::TcpSocket::RcvBufSize", UintegerValue (131072*200));

	//Config::SetDefault ("ns3::LteRlcAm::PollRetransmitTimer", TimeValue(MilliSeconds(2.0)));
	//Config::SetDefault ("ns3::LteRlcAm::ReorderingTimer", TimeValue(MilliSeconds(1.0)));
	//Config::SetDefault ("ns3::LteRlcAm::StatusProhibitTimer", TimeValue(MilliSeconds(1.0)));
	//Config::SetDefault ("ns3::LteRlcAm::ReportBufferStatusTimer", TimeValue(MilliSeconds(2.0)));
     Config::SetDefault ("ns3::Queue::MaxPackets", UintegerValue (1000));
   if(isTcp){
     Config::SetDefault ("ns3::LteEnbRrc::EpsBearerToRlcMapping", EnumValue (ns3::LteEnbRrc::RLC_AM_ALWAYS));
    Config::SetDefault ("ns3::LteRlcAm::EnableAQM", BooleanValue (true));
    Config::SetDefault ("ns3::LteRlcAm::MaxTxBufferSize", UintegerValue (20* 1024 * 1024));
    Config::SetDefault ("ns3::LtePdcp::EnablePDCPReordering", BooleanValue (enablePDCPReordering));
    Config::SetDefault ("ns3::LtePdcp::ExpiredTime",TimeValue(MilliSeconds(pdcpReorderingTimer)));
   }else{
	  Config::SetDefault ("ns3::LteEnbRrc::EpsBearerToRlcMapping", EnumValue (ns3::LteEnbRrc::RLC_UM_ALWAYS));
	 Config::SetDefault ("ns3::LteRlcUm::MaxTxBufferSize", UintegerValue (200 * 1024 * 1024));
	  Config::SetDefault ("ns3::LtePdcp::EnablePDCPReordering", BooleanValue (false));
   }
    /*Config::SetDefault ("ns3::RedQueue::Mode", StringValue ("QUEUE_MODE_PACKETS"));
    Config::SetDefault ("ns3::RedQueue::QueueLimit", UintegerValue (300 *1024 * 1024/1500));
    Config::SetDefault ("ns3::RedQueue::LinkBandwidth", DataRateValue (DataRate ("2000Mbps")));
    Config::SetDefault ("ns3::RedQueue::MinTh", DoubleValue (1 *1024 * 1024/1500));
    Config::SetDefault ("ns3::RedQueue::MaxTh", DoubleValue (240 *1024 * 1024/1500));
    Config::SetDefault ("ns3::RedQueue::MeanPktSize", UintegerValue (1500));
*/
     Config::SetDefault ("ns3::Queue::MaxPackets", UintegerValue (1000));
     Config::SetDefault ("ns3::Ipv4L3Protocol::FragmentExpirationTimeout", TimeValue (Seconds (1)));
	 Config::SetDefault ("ns3::CoDelQueueDisc::Mode", StringValue ("QUEUE_MODE_PACKETS"));
     Config::SetDefault ("ns3::CoDelQueueDisc::MaxPackets", UintegerValue (50000));

	//Config::SetDefault ("ns3::TcpL4Protocol::SocketType", TypeIdValue (TcpCubic::GetTypeId ()));
	 Config::SetDefault ("ns3::TcpL4Protocol::SocketType", TypeIdValue (TcpNewReno::GetTypeId ()));

	Ptr<LteHelper> lteHelper = CreateObject<LteHelper> ();

	//lteHelper->SetAttribute ("PathlossModelAtSenb", StringValue ("ns3::LogDistancePropagationLossModel"));
	//lteHelper->SetAttribute ("PathlossModelAtMenb", StringValue ("ns3::LogDistancePropagationLossModel"));

	//lteHelper->SetHarqEnabled(true);
	 lteHelper->SetEnbDeviceAttribute ("DlBandwidth", UintegerValue (downlinkRb));
	  lteHelper->SetEnbDeviceAttribute ("UlBandwidth", UintegerValue (uplinkRb));

	Ptr<PointToPointEpcHelper>  epcHelper = CreateObject<PointToPointEpcHelper> ();
	lteHelper->SetEpcHelper (epcHelper);

	Ptr<Node> pgw = epcHelper->GetPgwNode ();
	 pgw->GetApplication (0) -> GetObject<EpcSgwPgwApplication> () -> SetSplitAlgorithm(splitAlgorithm); // woody


	// Create a single RemoteHost
	NodeContainer remoteHostContainer;
	remoteHostContainer.Create (nodeNum);
	InternetStackHelper internet;
	internet.Install (remoteHostContainer);
	Ipv4StaticRoutingHelper ipv4RoutingHelper;
	Ipv4InterfaceContainer internetIpIfaces;

	for (uint16_t i = 0; i < nodeNum; i++)
	{
		Ptr<Node> remoteHost = remoteHostContainer.Get (i);
		// Create the Internet
		PointToPointHelper p2ph;
		p2ph.SetDeviceAttribute ("DataRate", DataRateValue (DataRate ("100Gb/s")));
		p2ph.SetDeviceAttribute ("Mtu", UintegerValue (1500));
		p2ph.SetChannelAttribute ("Delay", TimeValue (Seconds (0.010)));

		//p2ph.SetChannelAttribute ("Delay", TimeValue (Seconds (0.010+i*0.0025)));

		NetDeviceContainer internetDevices = p2ph.Install (pgw, remoteHost);

		Ipv4AddressHelper ipv4h;
	    std::ostringstream subnet;
	    subnet<<i<<".1.0.0";
		ipv4h.SetBase (subnet.str ().c_str (), "255.255.0.0");
		internetIpIfaces = ipv4h.Assign (internetDevices);
		// interface 0 is localhost, 1 is the p2p device
		Ptr<Ipv4StaticRouting> remoteHostStaticRouting = ipv4RoutingHelper.GetStaticRouting (remoteHost->GetObject<Ipv4> ());
		remoteHostStaticRouting->AddNetworkRouteTo (Ipv4Address ("7.0.0.0"), Ipv4Mask ("255.255.0.0"), 1);

	}


/*	Ptr < Building > building1;
	building1 = Create<Building> ();
	building1->SetBoundaries (Box (148.0,149.0,
								2, 4,
								0.0, 1.5));*/



/*    for (int index = 0; index < 10 ;index++)
    {
    Ptr < Building > building;
    building = Create<Building> ();
    building->SetBoundaries (Box (149.8,149.9,
                                                            index*4+2, index*4+4,
                                                            0.0, 15.0));
    }
*/

	NodeContainer ueNodes;
	NodeContainer enbNodes;
	NodeContainer senbNodes;
	enbNodes.Create(1);
	ueNodes.Create(nodeNum);
	senbNodes.Create(1);

	Ptr<ListPositionAllocator> enbPositionAlloc = CreateObject<ListPositionAllocator> ();
	enbPositionAlloc->Add (Vector (0.0, 0.0, 3.0));
	enbPositionAlloc->Add(Vector(1.0,-3.0,0.0));
	MobilityHelper enbmobility;
	enbmobility.SetMobilityModel ("ns3::ConstantPositionMobilityModel");
	enbmobility.SetPositionAllocator(enbPositionAlloc);
	enbmobility.Install (enbNodes);
	enbmobility.Install(senbNodes);

	//BuildingsHelper::Install (enbNodes);
	//BuildingsHelper::Install (senbNodes);

	MobilityHelper uemobility;
	Ptr<ListPositionAllocator> uePositionAlloc = CreateObject<ListPositionAllocator> ();
    for (uint16_t i=0 ; i< ueNodes.GetN(); i++){
    	uePositionAlloc ->Add(Vector(i*2,i*3,1));
    }
    uemobility.SetPositionAllocator(uePositionAlloc);
	uemobility.SetMobilityModel ("ns3::ConstantVelocityMobilityModel");
	uemobility.Install (ueNodes);

	//BuildingsHelper::Install (ueNodes);

	// Install LTE Devices to the nodes
	NetDeviceContainer enbDevs = lteHelper->InstallEnbDevice (enbNodes);
	NetDeviceContainer senbDevs = lteHelper->InstallSenbDevice(senbNodes);
	NetDeviceContainer ueDevs = lteHelper->InstallDcUeDevice (ueNodes);
	 lteHelper->NotifyEnbNeighbor (enbNodes.Get(0), senbNodes.Get(0)); // woody3C
     for (uint16_t i=0 ; i<nodeNum ; i++)
		  lteHelper->ConnectAssistInfo (enbNodes.Get(0), senbNodes.Get(0), ueNodes.Get(i), dcType); // woody

	// Install the IP stack on the UEs
	// Assign IP address to UEs, and install applications
	internet.Install (ueNodes);
	Ipv4InterfaceContainer ueIpIface;
	ueIpIface = epcHelper->AssignUeIpv4Address (NetDeviceContainer (ueDevs));


	uint16_t sinkPort = 20000;
	Ptr<EpcTft> tftDc = Create<EpcTft> ();
	  EpcTft::PacketFilter tftPacketFilter;
	  tftPacketFilter.localPortStart = sinkPort;
	  tftPacketFilter.localPortEnd = sinkPort;
	  tftDc->Add (tftPacketFilter);

	  for (uint8_t i = 0; i < ueNodes.GetN (); i++){
	  lteHelper->Attach (ueDevs.Get(i), enbDevs.Get(0));

	//Simulator::Schedule (MilliSeconds(10.0),&Attach,
//	lteHelper, ueDevs.Get(i),senbDevs.Get(0),enbDevs.Get(0),tftDc, dcType,i);
	  }
    for (uint8_t i = 0 ; i<ueNodes.GetN(); i++)
    	 lteHelper->AttachDc (ueDevs.Get(i), senbDevs.Get(0), tftDc, dcType);

	lteHelper->EnableTraces ();

	ApplicationContainer sinkApps;
if (isTcp){

	for (uint16_t i = 0; i < ueNodes.GetN (); i++)
	{

		// Set the default gateway for the UE
		Ptr<Node> ueNode = ueNodes.Get (i);
		Ptr<Ipv4StaticRouting> ueStaticRouting = ipv4RoutingHelper.GetStaticRouting (ueNode->GetObject<Ipv4> ());
		ueStaticRouting->SetDefaultRoute (epcHelper->GetUeDefaultGatewayAddress (), 1);

		// Install and start applications on UEs and remote host
		PacketSinkHelper packetSinkHelper ("ns3::TcpSocketFactory", InetSocketAddress (Ipv4Address::GetAny (), sinkPort));
		sinkApps.Add (packetSinkHelper.Install (ueNodes.Get (i)));


		 Ptr<Socket> ns3TcpSocket = Socket::CreateSocket (remoteHostContainer.Get (i), TcpSocketFactory::GetTypeId ());
		 Ptr<MyApp> app = CreateObject<MyApp> ();
		 Address sinkAddress (InetSocketAddress (ueIpIface.GetAddress (i), sinkPort));
		  app->Setup (ns3TcpSocket, sinkAddress, 1400, 5000000, DataRate ("100Mb/s"));//sychoi, tcp data rate config

		 std::ostringstream fileName;
	    fileName<<"UE-"<<i+1<<"-TCP-DATA.txt";
		AsciiTraceHelper asciiTraceHelper;
		Ptr<OutputStreamWrapper> stream = asciiTraceHelper.CreateFileStream (fileName.str ().c_str ());
		sinkApps.Get(i)->TraceConnectWithoutContext("Rx",MakeBoundCallback (&Rx, stream,i));

		std::ostringstream fileName_2;
		fileName_2<<"UE-" << i+1 <<"-TCP-Throughput.txt";
		AsciiTraceHelper asciiTraceHelper_2;
		Ptr<OutputStreamWrapper> stream_2 = asciiTraceHelper_2.CreateFileStream(fileName_2.str().c_str());
		  Simulator::Schedule (Seconds (0.1), &CalculateThroughput,stream_2,sinkApps.Get(i)->GetObject<PacketSink>(),i);


		app->SetStartTime(Seconds (i*0.1+simStartTime));
	    Simulator::Schedule (Seconds (i*0.1+simStartTime), &Traces, i);
	    app->SetStopTime (Seconds (simStopTime));
   //     sinkApps.Start(Seconds((double)i));
	    remoteHostContainer.Get(i)->AddApplication(app);

	}
}
else
{
	for(uint16_t i=0 ; i<ueNodes.GetN() ; i++)
  {
	 PacketSinkHelper packetSinkHelper ("ns3::UdpSocketFactory", InetSocketAddress (Ipv4Address::GetAny (), sinkPort));
	 sinkApps.Add (packetSinkHelper.Install (ueNodes.Get (i)));

	 Address sinkAddress (InetSocketAddress (ueIpIface.GetAddress (i), sinkPort));
	Ptr<Socket> ns3UdpSocket = Socket::CreateSocket (remoteHostContainer.Get (i), UdpSocketFactory::GetTypeId ());
	  Ptr<MyApp> app = CreateObject<MyApp> ();
	  app->Setup (ns3UdpSocket, sinkAddress, 1400, 5000000, DataRate ("100Mb/s"));

      std::ostringstream fileName_3;
      fileName_3<<"UE-" << i+1 <<"-UDP-DATA.txt";
       AsciiTraceHelper asciiTraceHelper_3;
       Ptr<OutputStreamWrapper> stream = asciiTraceHelper_3.CreateFileStream (fileName_3.str().c_str());
       sinkApps.Get(i)->TraceConnectWithoutContext("Rx",MakeBoundCallback (&Rx, stream,i));

       std::ostringstream fileName_4;
       fileName_4<<"UE-" << i+1 <<"-UDP-DATALOSS.txt";
       AsciiTraceHelper asciiTraceHelper_4;
       Ptr<OutputStreamWrapper> stream_2 = asciiTraceHelper_4.CreateFileStream (fileName_4.str().c_str());
       *stream_2->GetStream() << "time  " << "  \t " << "number of received packets" <<"   \t  "
    		   << "number of Loss packet " << " \t  "<< " amount of Loss  " <<std::endl;
       sinkApps.Get(i)->TraceConnectWithoutContext("Loss",MakeBoundCallback (&Loss, stream_2,i));

       app->SetStartTime(Seconds(0.01*i + 0.1));
       app->SetStopTime(Seconds(simStopTime));
       remoteHostContainer.Get (i)->AddApplication (app);


  }
}



	////if you want to change RB_SIZE at Both Senb and Menb
	///it means decreasing 50RB so 100-50 =50 Rb , possible value is 6, 25, 50 75, 100 RB
	//	  Simulator::Schedule (Seconds(3), &changRBSize, 50,enbDevs,senbDevs); //sjkang
	//	  Simulator::Schedule (Seconds(6), &changRBSize, -25,enbDevs,senbDevs); //sjkang it means increasing 25RB


	/// if you want to change loss value during running time in propagation loss model at Menb and Senb
	//Simulator::Schedule (Seconds (2.0), &changePathLossFromMenbInDownlink, lteHelper, 1.0, 60); //change path loss
	//Simulator::Schedule (Seconds (2.0), &changePathLossFromSenbInDownlink, lteHelper, 1.0, 70.0); //change path loss
	//Simulator::Schedule (Seconds (3.0), &changePathLossFromSenbInDownlink, lteHelper, 1.0, 47.0); //change path loss

	// if you want to change path loss model during running time,
	 //Simulator::Schedule (Seconds (5.0), &changePathLossModelAtSenb, lteHelper, "ns3::RandomPropagationLossModel"); //change path lossmodel
	 //Simulator::Schedule (Seconds (7.0), &changePathLossModelAtMenb, lteHelper, "ns3::LogDistancePropagationLossModel"); //change path lossmodel

	 sinkApps.Start (Seconds (simStartTime));
	sinkApps.Stop (Seconds (simStopTime));
    //sourceAppsUL.Start (Seconds (0.1));
    //sourceApps.Stop (Seconds (simStopTime));
	//p2ph.EnablePcapAll("muti-ue-capture");

	//BuildingsHelper::MakeMobilityModelConsistent ();
	//Config::Set ("/NodeList/*/DeviceList/*/TxQueue/MaxPackets", UintegerValue (1000*1000));
	//Config::Set ("/NodeList/*/DeviceList/*/TxQueue/MaxBytes", UintegerValue (1500*1000*1000));


	Simulator::Stop (Seconds (simStopTime+0.5));
	Simulator::Run ();

	//getting average throughputs for all ue nodes
			for (uint16_t i=0 ; i<ueNodes.GetN() ; i++){
			 double lteThroughput = sinkApps.Get(i)->GetObject<PacketSink>()->GetTotalRx () * 8.0 / (1000000.0*(simStopTime - (0.1*i+simStartTime)));
			    //NS_LOG_UNCOND ("LastPacket " << packetRxTime << " TotalFlow " << sumPacketSize << "Mb");
			   NS_LOG_UNCOND ("UE(" << ueIpIface.GetAddress(i) <<") AverageLteThroughput: " << lteThroughput << "Mbps");
			}
	Simulator::Destroy ();

	return 0;

}
