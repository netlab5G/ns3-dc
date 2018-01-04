################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/network/test/buffer-test.cc \
../ns3-mmwave/src/network/test/drop-tail-queue-test-suite.cc \
../ns3-mmwave/src/network/test/error-model-test-suite.cc \
../ns3-mmwave/src/network/test/ipv6-address-test-suite.cc \
../ns3-mmwave/src/network/test/packet-metadata-test.cc \
../ns3-mmwave/src/network/test/packet-socket-apps-test-suite.cc \
../ns3-mmwave/src/network/test/packet-test-suite.cc \
../ns3-mmwave/src/network/test/packetbb-test-suite.cc \
../ns3-mmwave/src/network/test/pcap-file-test-suite.cc \
../ns3-mmwave/src/network/test/sequence-number-test-suite.cc 

CC_DEPS += \
./ns3-mmwave/src/network/test/buffer-test.d \
./ns3-mmwave/src/network/test/drop-tail-queue-test-suite.d \
./ns3-mmwave/src/network/test/error-model-test-suite.d \
./ns3-mmwave/src/network/test/ipv6-address-test-suite.d \
./ns3-mmwave/src/network/test/packet-metadata-test.d \
./ns3-mmwave/src/network/test/packet-socket-apps-test-suite.d \
./ns3-mmwave/src/network/test/packet-test-suite.d \
./ns3-mmwave/src/network/test/packetbb-test-suite.d \
./ns3-mmwave/src/network/test/pcap-file-test-suite.d \
./ns3-mmwave/src/network/test/sequence-number-test-suite.d 

OBJS += \
./ns3-mmwave/src/network/test/buffer-test.o \
./ns3-mmwave/src/network/test/drop-tail-queue-test-suite.o \
./ns3-mmwave/src/network/test/error-model-test-suite.o \
./ns3-mmwave/src/network/test/ipv6-address-test-suite.o \
./ns3-mmwave/src/network/test/packet-metadata-test.o \
./ns3-mmwave/src/network/test/packet-socket-apps-test-suite.o \
./ns3-mmwave/src/network/test/packet-test-suite.o \
./ns3-mmwave/src/network/test/packetbb-test-suite.o \
./ns3-mmwave/src/network/test/pcap-file-test-suite.o \
./ns3-mmwave/src/network/test/sequence-number-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/network/test/%.o: ../ns3-mmwave/src/network/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


