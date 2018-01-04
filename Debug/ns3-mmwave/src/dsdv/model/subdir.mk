################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/dsdv/model/dsdv-packet-queue.cc \
../ns3-mmwave/src/dsdv/model/dsdv-packet.cc \
../ns3-mmwave/src/dsdv/model/dsdv-routing-protocol.cc \
../ns3-mmwave/src/dsdv/model/dsdv-rtable.cc 

CC_DEPS += \
./ns3-mmwave/src/dsdv/model/dsdv-packet-queue.d \
./ns3-mmwave/src/dsdv/model/dsdv-packet.d \
./ns3-mmwave/src/dsdv/model/dsdv-routing-protocol.d \
./ns3-mmwave/src/dsdv/model/dsdv-rtable.d 

OBJS += \
./ns3-mmwave/src/dsdv/model/dsdv-packet-queue.o \
./ns3-mmwave/src/dsdv/model/dsdv-packet.o \
./ns3-mmwave/src/dsdv/model/dsdv-routing-protocol.o \
./ns3-mmwave/src/dsdv/model/dsdv-rtable.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/dsdv/model/%.o: ../ns3-mmwave/src/dsdv/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


