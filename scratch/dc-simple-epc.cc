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
//#include "ns3/gtk-config-store.h"

using namespace ns3;

/**
 * Sample simulation script for LTE+EPC. It instantiates several eNodeB,
 * attaches one UE per eNodeB starts a flow for each UE to  and from a remote host.
 * It also  starts yet another flow between each UE pair.
 */

NS_LOG_COMPONENT_DEFINE ("EpcDcExample");

int
main (int argc, char *argv[])
{
  double simTime = 1.1;
  double distance = 60.0;
  double interPacketInterval = 100;
  int log_packetflow = 1;

  uint8_t dcType = 2; // woody (0: Single Connection, 1: 1A, 2: 3C)

  // Command line arguments
  CommandLine cmd;
  cmd.AddValue("simTime", "Total duration of the simulation [s])", simTime);
  cmd.AddValue("distance", "Distance between eNBs [m]", distance);
  cmd.AddValue("interPacketInterval", "Inter packet interval [ms])", interPacketInterval);
  cmd.Parse(argc, argv);

  LogComponentEnable ("LteHelper", LOG_FUNCTION);
  LogComponentEnable ("PointToPointEpcHelper", LOG_FUNCTION);
//  LogComponentEnable ("EpcEnbApplication", LOG_FUNCTION);
//  LogComponentEnable ("EpcSgwPgwApplication", LOG_FUNCTION);

//  LogComponentEnable ("LteUeRrc", LOG_FUNCTION);
//  LogComponentEnable ("LteRlc", LOG_FUNCTION);
//  LogComponentEnable ("LteRlcAm", LOG_FUNCTION);
//  LogComponentEnable ("LteRlcUm", LOG_FUNCTION);
//  LogComponentEnable ("LtePdcp", LOG_FUNCTION);
//  LogComponentEnable ("EpcMme", LOG_FUNCTION);
//  LogComponentEnable ("EpcUeNas", LOG_FUNCTION);
//  LogComponentEnable ("LteEnbRrc", LOG_FUNCTION);
//  LogComponentEnable ("LteEnbMac", LOG_FUNCTION);
//  LogComponentEnable ("LteEnbPhy", LOG_FUNCTION);
//  LogComponentEnable ("LteRrcProtocolIdeal", LOG_FUNCTION);
//  LogComponentEnable ("LteEnbNetDevice", LOG_FUNCTION);
//  LogComponentEnable ("LteUeMac", LOG_FUNCTION);
//  LogComponentEnable ("LteUePhy", LOG_FUNCTION);
//  LogComponentEnable ("EpcTftClassifier", LOG_FUNCTION);
//  LogComponentEnable ("EpcTft", LOG_FUNCTION);
//  LogComponentEnable ("FfMacScheduler", LOG_FUNCTION);
//  LogComponentEnable ("LteEnbMac", LOG_DEBUG);
//  LogComponentEnable ("LteRlcUm", LOG_LOGIC);
//  LogComponentEnable ("EpcX2", LOG_FUNCTION);
 
  if (log_packetflow){
    LogComponentEnable ("LtePdcp", LOG_INFO);
    LogComponentEnable ("EpcEnbApplication", LOG_INFO);
    LogComponentEnable ("EpcSgwPgwApplication", LOG_INFO);
    LogComponentEnable ("LteEnbRrc", LOG_INFO);
    LogComponentEnable ("PacketSink", LOG_INFO);
    LogComponentEnable ("UdpClient", LOG_INFO);
  }

  NS_LOG_UNCOND("# Set lteHelper, PointToPointEpcHelper");
  Ptr<LteHelper> lteHelper = CreateObject<LteHelper> ();
  Ptr<PointToPointEpcHelper>  epcHelper = CreateObject<PointToPointEpcHelper> ();
  lteHelper->SetEpcHelper (epcHelper);

  ConfigStore inputConfig;
  inputConfig.ConfigureDefaults();

  // parse again so you can override default values from the command line
  cmd.Parse(argc, argv);

  Ptr<Node> pgw = epcHelper->GetPgwNode ();

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
  MobilityHelper mobility;
  mobility.SetMobilityModel("ns3::ConstantPositionMobilityModel");
  Ptr<ListPositionAllocator> positionAlloc = CreateObject<ListPositionAllocator> ();

  positionAlloc->Add (Vector(0, 0, 0));
  mobility.SetPositionAllocator(positionAlloc);
  mobility.Install(ueNodes);

  positionAlloc->Add (Vector(0, 0, 0));
  mobility.SetPositionAllocator(positionAlloc);
  mobility.Install(enbNodes);

  positionAlloc->Add (Vector(0, 0, 0));
  mobility.SetPositionAllocator(positionAlloc);
  mobility.Install(senbNodes); // woody

  // Install LTE Devices to the nodes
  NS_LOG_UNCOND("# Install LTE device to the nodes");
  NetDeviceContainer enbLteDevs = lteHelper->InstallEnbDevice (enbNodes);
  NetDeviceContainer senbLteDevs = lteHelper->InstallSenbDevice (senbNodes); // woody
  NetDeviceContainer ueLteDevs = lteHelper->InstallDcUeDevice (ueNodes); // woody

  lteHelper->NotifyEnbNeighbor (enbNodes.Get(0), senbNodes.Get(0)); // woody3C

  lteHelper->ConnectAssistInfo (enbNodes.Get(0), senbNodes.Get(0), ueNodes.Get(0)); // woody, for splitting algm.

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
  // woody, DL only
  NS_LOG_UNCOND("# Install applications");
  ApplicationContainer serverApps;
  PacketSinkHelper dlPacketSinkHelperDc ("ns3::UdpSocketFactory", InetSocketAddress (Ipv4Address::GetAny (), dlPortDc));
  serverApps.Add (dlPacketSinkHelperDc.Install (ueNodes.Get(0)));

  ApplicationContainer clientApps;
  UdpClientHelper dlClientDc (ueIpIface.GetAddress (0), dlPortDc);
  dlClientDc.SetAttribute ("Interval", TimeValue (MilliSeconds(interPacketInterval)));
  dlClientDc.SetAttribute ("MaxPackets", UintegerValue(1000000));
  clientApps.Add (dlClientDc.Install (remoteHost));

  serverApps.Start (Seconds (0.11));
  clientApps.Start (Seconds (0.11));
//  lteHelper->EnableTraces ();
  // Uncomment to enable PCAP tracing
  //p2ph.EnablePcapAll("lena-epc-first");

  Simulator::Stop(Seconds(simTime));
  NS_LOG_UNCOND("# Run simulation");
  Simulator::Run();

  /*GtkConfigStore config;
  config.ConfigureAttributes();*/

  Simulator::Destroy();
  return 0;

}

