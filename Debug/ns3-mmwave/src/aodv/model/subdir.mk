################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/aodv/model/aodv-dpd.cc \
../ns3-mmwave/src/aodv/model/aodv-id-cache.cc \
../ns3-mmwave/src/aodv/model/aodv-neighbor.cc \
../ns3-mmwave/src/aodv/model/aodv-packet.cc \
../ns3-mmwave/src/aodv/model/aodv-routing-protocol.cc \
../ns3-mmwave/src/aodv/model/aodv-rqueue.cc \
../ns3-mmwave/src/aodv/model/aodv-rtable.cc 

CC_DEPS += \
./ns3-mmwave/src/aodv/model/aodv-dpd.d \
./ns3-mmwave/src/aodv/model/aodv-id-cache.d \
./ns3-mmwave/src/aodv/model/aodv-neighbor.d \
./ns3-mmwave/src/aodv/model/aodv-packet.d \
./ns3-mmwave/src/aodv/model/aodv-routing-protocol.d \
./ns3-mmwave/src/aodv/model/aodv-rqueue.d \
./ns3-mmwave/src/aodv/model/aodv-rtable.d 

OBJS += \
./ns3-mmwave/src/aodv/model/aodv-dpd.o \
./ns3-mmwave/src/aodv/model/aodv-id-cache.o \
./ns3-mmwave/src/aodv/model/aodv-neighbor.o \
./ns3-mmwave/src/aodv/model/aodv-packet.o \
./ns3-mmwave/src/aodv/model/aodv-routing-protocol.o \
./ns3-mmwave/src/aodv/model/aodv-rqueue.o \
./ns3-mmwave/src/aodv/model/aodv-rtable.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/aodv/model/%.o: ../ns3-mmwave/src/aodv/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


