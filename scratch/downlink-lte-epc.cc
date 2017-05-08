#include "ns3/core-module.h"
#include "ns3/network-module.h"
#include "ns3/mobility-module.h"
#include "ns3/config-store-module.h"
#include "ns3/internet-module.h"
#include "ns3/propagation-module.h"
#include <iostream>
#include <vector>
#include <string>
#include "ns3/point-to-point-module.h"
#include "ns3/applications-module.h"
#include "ns3/athstats-helper.h"
#include "ns3/lte-module.h"
#include <ns3/multi-model-spectrum-channel.h>
#include <limits.h>
#include <vector>
#include "ns3/propagation-module.h"

NS_LOG_COMPONENT_DEFINE ("TestLteEpc");

using namespace ns3;

int main (int argc, char *argv[])

{
	double ltePktInv = 1;
	double lteStartTimeSec = 1;
	double lteStopTimeSec = 2;
	double downlinkRb = 100;

	Ipv4GlobalRoutingHelper::PopulateRoutingTables ();

	//                           1Gbps, 5ms              10Gbps, 1ms
	// Nodes: [remotesForUes]  ------p2p------  [PGW]  ------p2p------  [eNB]  - - wireless - -  [UEs]

	NodeContainer remoteHostNode, enbNode, ueNode;
	remoteHostNode.Create (1);
	enbNode.Create (1);
	ueNode.Create (1);

	Ptr<ListPositionAllocator> positionAlloc = CreateObject<ListPositionAllocator> ();
	positionAlloc->Add (Vector(0, 0, 0)); // for LTE eNB
	positionAlloc->Add (Vector(10, 0, 0)); // for LTE UE

	MobilityHelper mobility;
	mobility.SetPositionAllocator (positionAlloc);
	mobility.SetMobilityModel ("ns3::ConstantPositionMobilityModel");
	mobility.Install (enbNode);
	mobility.Install (ueNode);

	Ptr<LteHelper> lteHelper = CreateObject<LteHelper> ();
	lteHelper->SetAttribute ("PathlossModel", StringValue ("ns3::LogDistancePropagationLossModel"));
	lteHelper->SetEnbDeviceAttribute ("DlBandwidth", UintegerValue (downlinkRb));
	lteHelper->SetEnbDeviceAttribute ("UlBandwidth", UintegerValue (downlinkRb));

	Ptr<PointToPointEpcHelper> epcHelper = CreateObject<PointToPointEpcHelper> ();
	lteHelper->SetEpcHelper (epcHelper);
	Ptr<Node> pgw = epcHelper->GetPgwNode ();

	//Wired configuration
	PointToPointHelper pointToPoint;
	pointToPoint.SetDeviceAttribute ("DataRate", StringValue ("1Gbps"));
	pointToPoint.SetDeviceAttribute ("Mtu", UintegerValue (1500));
	pointToPoint.SetChannelAttribute ("Delay", StringValue ("0.00001ms"));

	//Temporal containers
	NetDeviceContainer p2pDevs, enbDev, ueDevs;

	//remotesForUes - pgw
	p2pDevs = pointToPoint.Install (remoteHostNode.Get(0), pgw);
	enbDev = lteHelper->InstallEnbDevice (enbNode);
	ueDevs = lteHelper->InstallUeDevice (ueNode);

	//Internet
	InternetStackHelper internet;
	internet.Install (remoteHostNode);

	Ipv4AddressHelper ipv4;
	ipv4.SetBase ("1.1.1.0", "255.255.255.0");
	Ipv4InterfaceContainer internetIpIfaces = ipv4.Assign (p2pDevs);

	Ipv4StaticRoutingHelper ipv4RoutingHelper;
	Ptr<Ipv4StaticRouting> remoteHostStaticRouting = ipv4RoutingHelper.GetStaticRouting (remoteHostNode.Get(0)->GetObject<Ipv4> ());
	remoteHostStaticRouting->AddNetworkRouteTo (Ipv4Address ("7.0.0.0"), Ipv4Mask ("255.0.0.0"), 1);


	internet.Install (ueNode);

	Ipv4InterfaceContainer ueIfs = epcHelper->AssignUeIpv4Address (NetDeviceContainer (ueDevs));
	Ptr<Ipv4StaticRouting> ueStaticRouting = ipv4RoutingHelper.GetStaticRouting (ueNode.Get(0)->GetObject<Ipv4> ());
	ueStaticRouting->SetDefaultRoute (epcHelper->GetUeDefaultGatewayAddress (), 1);

	lteHelper->Attach (ueDevs.Get (0), enbDev.Get(0));

	uint16_t dlPort = 10000;

	ApplicationContainer clientApps;
	ApplicationContainer serverApps;

	UdpClientHelper dlClientHelper (ueIfs.GetAddress (0), dlPort);

	dlClientHelper.SetAttribute ("MaxPackets", UintegerValue (64707202));
	dlClientHelper.SetAttribute ("Interval", TimeValue (Seconds (ltePktInv)));
	dlClientHelper.SetAttribute ("PacketSize", UintegerValue (1460));

	clientApps.Add (dlClientHelper.Install (remoteHostNode.Get(0)));
	PacketSinkHelper dlPacketSinkHelper ("ns3::UdpSocketFactory",
			InetSocketAddress (Ipv4Address::GetAny (), dlPort));
	serverApps.Add (dlPacketSinkHelper.Install (ueNode.Get(0)));

/*	
	Ptr<EpcTft> tft = Create<EpcTft> ();
	EpcTft::PacketFilter dlpf;
	dlpf.localPortStart = dlPort;
	dlpf.localPortEnd = dlPort;
	tft->Add (dlpf);
	EpsBearer bearer (EpsBearer::NGBR_VIDEO_TCP_DEFAULT);
	lteHelper->ActivateDedicatedEpsBearer (ueDevs.Get (0), bearer, tft);
*/	

	serverApps.Start (Seconds (lteStartTimeSec));
	clientApps.Start (Seconds (lteStartTimeSec));
	Simulator::Stop (Seconds(lteStopTimeSec));
	Simulator::Run ();

	//Tracing
	Ptr<PacketSink> sink = serverApps.Get (0)->GetObject<PacketSink> ();
	double lteThroughput = sink->GetTotalRx () * 8.0 / (1000000.0*(lteStopTimeSec - lteStartTimeSec));

	NS_LOG_UNCOND ("UE(" << ueIfs.GetAddress(0) <<") lte throughput: " << lteThroughput << " Mbps");

	Simulator::Destroy ();

	return 0;
}

