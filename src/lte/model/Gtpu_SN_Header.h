/*
 * Gtpu_SN_Header.h
 *
 *  Created on: May 3, 2017
 *      Author: root
 */

#ifndef SRC_LTE_MODEL_GTPU_SN_HEADER_H_
#define SRC_LTE_MODEL_GTPU_SN_HEADER_H_
#include "ns3/header.h"
namespace ns3 {

class Gtpu_SN_Header: public Header
{
	public:
	static TypeId GetTypeId (void);
	virtual TypeId GetInstanceTypeId (void) const;
	Gtpu_SN_Header();
     ~Gtpu_SN_Header();
	virtual void Print (std::ostream &os) const;
	virtual uint32_t GetSerializedSize (void) const;
	virtual void Serialize (Buffer::Iterator start) const;
	virtual uint32_t Deserialize (Buffer::Iterator start);


	 public:
	 uint16_t GetGtpuSN () const;
	 void SetGtpuSN(uint16_t);

	private :
	uint16_t Gtpu_SN;
};

}

#endif /* SRC_LTE_MODEL_GTPU_SN_HEADER_H_ */
