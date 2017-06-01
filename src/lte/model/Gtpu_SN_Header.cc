#include "Gtpu_SN_Header.h"
#include "ns3/simulator.h"
#include "ns3/log.h"
namespace ns3 {
TypeId Gtpu_SN_Header::GetTypeId (void) {
	static TypeId tid = TypeId ("ns3::Gtpu_SN_Header")
			.SetParent<Header> ()
			.AddConstructor<Gtpu_SN_Header> () ;
	return tid;
}
TypeId Gtpu_SN_Header::GetInstanceTypeId (void) const {
	return GetTypeId();
}

Gtpu_SN_Header::Gtpu_SN_Header() {
	Gtpu_SN =0;

}
Gtpu_SN_Header::~Gtpu_SN_Header() {
	Gtpu_SN =0;

}


void Gtpu_SN_Header::Serialize (Buffer::Iterator start) const {
	Buffer::Iterator i = start;
	i.WriteU16(Gtpu_SN);
}

uint32_t Gtpu_SN_Header::GetSerializedSize (void) const {
	return 2;
}

uint32_t Gtpu_SN_Header::Deserialize (Buffer::Iterator start) {
	Buffer::Iterator i = start;
	Gtpu_SN = i.ReadU16();
	return GetSerializedSize();

}
void Gtpu_SN_Header::Print (std::ostream &os) const {
	os << "GTPU_SN = " << Gtpu_SN << "\n";

}




uint16_t
Gtpu_SN_Header::GetGtpuSN() const
{
	return Gtpu_SN;
}
void
Gtpu_SN_Header::SetGtpuSN(uint16_t SN)
{
	Gtpu_SN = SN & 0x7fff;
}

}


