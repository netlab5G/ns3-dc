################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/applications/model/application-packet-probe.cc \
../ns3-mmwave/src/applications/model/bulk-send-application.cc \
../ns3-mmwave/src/applications/model/onoff-application.cc \
../ns3-mmwave/src/applications/model/packet-loss-counter.cc \
../ns3-mmwave/src/applications/model/packet-sink.cc \
../ns3-mmwave/src/applications/model/seq-ts-header.cc \
../ns3-mmwave/src/applications/model/udp-client.cc \
../ns3-mmwave/src/applications/model/udp-echo-client.cc \
../ns3-mmwave/src/applications/model/udp-echo-server.cc \
../ns3-mmwave/src/applications/model/udp-server.cc \
../ns3-mmwave/src/applications/model/udp-trace-client.cc 

CC_DEPS += \
./ns3-mmwave/src/applications/model/application-packet-probe.d \
./ns3-mmwave/src/applications/model/bulk-send-application.d \
./ns3-mmwave/src/applications/model/onoff-application.d \
./ns3-mmwave/src/applications/model/packet-loss-counter.d \
./ns3-mmwave/src/applications/model/packet-sink.d \
./ns3-mmwave/src/applications/model/seq-ts-header.d \
./ns3-mmwave/src/applications/model/udp-client.d \
./ns3-mmwave/src/applications/model/udp-echo-client.d \
./ns3-mmwave/src/applications/model/udp-echo-server.d \
./ns3-mmwave/src/applications/model/udp-server.d \
./ns3-mmwave/src/applications/model/udp-trace-client.d 

OBJS += \
./ns3-mmwave/src/applications/model/application-packet-probe.o \
./ns3-mmwave/src/applications/model/bulk-send-application.o \
./ns3-mmwave/src/applications/model/onoff-application.o \
./ns3-mmwave/src/applications/model/packet-loss-counter.o \
./ns3-mmwave/src/applications/model/packet-sink.o \
./ns3-mmwave/src/applications/model/seq-ts-header.o \
./ns3-mmwave/src/applications/model/udp-client.o \
./ns3-mmwave/src/applications/model/udp-echo-client.o \
./ns3-mmwave/src/applications/model/udp-echo-server.o \
./ns3-mmwave/src/applications/model/udp-server.o \
./ns3-mmwave/src/applications/model/udp-trace-client.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/applications/model/%.o: ../ns3-mmwave/src/applications/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


