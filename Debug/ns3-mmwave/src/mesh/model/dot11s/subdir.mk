################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/mesh/model/dot11s/airtime-metric.cc \
../ns3-mmwave/src/mesh/model/dot11s/dot11s-mac-header.cc \
../ns3-mmwave/src/mesh/model/dot11s/hwmp-protocol-mac.cc \
../ns3-mmwave/src/mesh/model/dot11s/hwmp-protocol.cc \
../ns3-mmwave/src/mesh/model/dot11s/hwmp-rtable.cc \
../ns3-mmwave/src/mesh/model/dot11s/hwmp-tag.cc \
../ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-beacon-timing.cc \
../ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-configuration.cc \
../ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-id.cc \
../ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-metric-report.cc \
../ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-peer-management.cc \
../ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-peering-protocol.cc \
../ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-perr.cc \
../ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-prep.cc \
../ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-preq.cc \
../ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-rann.cc \
../ns3-mmwave/src/mesh/model/dot11s/peer-link-frame.cc \
../ns3-mmwave/src/mesh/model/dot11s/peer-link.cc \
../ns3-mmwave/src/mesh/model/dot11s/peer-management-protocol-mac.cc \
../ns3-mmwave/src/mesh/model/dot11s/peer-management-protocol.cc 

CC_DEPS += \
./ns3-mmwave/src/mesh/model/dot11s/airtime-metric.d \
./ns3-mmwave/src/mesh/model/dot11s/dot11s-mac-header.d \
./ns3-mmwave/src/mesh/model/dot11s/hwmp-protocol-mac.d \
./ns3-mmwave/src/mesh/model/dot11s/hwmp-protocol.d \
./ns3-mmwave/src/mesh/model/dot11s/hwmp-rtable.d \
./ns3-mmwave/src/mesh/model/dot11s/hwmp-tag.d \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-beacon-timing.d \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-configuration.d \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-id.d \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-metric-report.d \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-peer-management.d \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-peering-protocol.d \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-perr.d \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-prep.d \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-preq.d \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-rann.d \
./ns3-mmwave/src/mesh/model/dot11s/peer-link-frame.d \
./ns3-mmwave/src/mesh/model/dot11s/peer-link.d \
./ns3-mmwave/src/mesh/model/dot11s/peer-management-protocol-mac.d \
./ns3-mmwave/src/mesh/model/dot11s/peer-management-protocol.d 

OBJS += \
./ns3-mmwave/src/mesh/model/dot11s/airtime-metric.o \
./ns3-mmwave/src/mesh/model/dot11s/dot11s-mac-header.o \
./ns3-mmwave/src/mesh/model/dot11s/hwmp-protocol-mac.o \
./ns3-mmwave/src/mesh/model/dot11s/hwmp-protocol.o \
./ns3-mmwave/src/mesh/model/dot11s/hwmp-rtable.o \
./ns3-mmwave/src/mesh/model/dot11s/hwmp-tag.o \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-beacon-timing.o \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-configuration.o \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-id.o \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-metric-report.o \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-peer-management.o \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-peering-protocol.o \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-perr.o \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-prep.o \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-preq.o \
./ns3-mmwave/src/mesh/model/dot11s/ie-dot11s-rann.o \
./ns3-mmwave/src/mesh/model/dot11s/peer-link-frame.o \
./ns3-mmwave/src/mesh/model/dot11s/peer-link.o \
./ns3-mmwave/src/mesh/model/dot11s/peer-management-protocol-mac.o \
./ns3-mmwave/src/mesh/model/dot11s/peer-management-protocol.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/mesh/model/dot11s/%.o: ../ns3-mmwave/src/mesh/model/dot11s/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


