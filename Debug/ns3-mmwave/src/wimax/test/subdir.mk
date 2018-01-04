################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/wimax/test/mac-messages-test.cc \
../ns3-mmwave/src/wimax/test/phy-test.cc \
../ns3-mmwave/src/wimax/test/qos-test.cc \
../ns3-mmwave/src/wimax/test/ss-mac-test.cc \
../ns3-mmwave/src/wimax/test/wimax-fragmentation-test.cc \
../ns3-mmwave/src/wimax/test/wimax-service-flow-test.cc \
../ns3-mmwave/src/wimax/test/wimax-tlv-test.cc 

CC_DEPS += \
./ns3-mmwave/src/wimax/test/mac-messages-test.d \
./ns3-mmwave/src/wimax/test/phy-test.d \
./ns3-mmwave/src/wimax/test/qos-test.d \
./ns3-mmwave/src/wimax/test/ss-mac-test.d \
./ns3-mmwave/src/wimax/test/wimax-fragmentation-test.d \
./ns3-mmwave/src/wimax/test/wimax-service-flow-test.d \
./ns3-mmwave/src/wimax/test/wimax-tlv-test.d 

OBJS += \
./ns3-mmwave/src/wimax/test/mac-messages-test.o \
./ns3-mmwave/src/wimax/test/phy-test.o \
./ns3-mmwave/src/wimax/test/qos-test.o \
./ns3-mmwave/src/wimax/test/ss-mac-test.o \
./ns3-mmwave/src/wimax/test/wimax-fragmentation-test.o \
./ns3-mmwave/src/wimax/test/wimax-service-flow-test.o \
./ns3-mmwave/src/wimax/test/wimax-tlv-test.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/wimax/test/%.o: ../ns3-mmwave/src/wimax/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


