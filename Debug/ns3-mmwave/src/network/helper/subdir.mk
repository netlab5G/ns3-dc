################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/network/helper/application-container.cc \
../ns3-mmwave/src/network/helper/delay-jitter-estimation.cc \
../ns3-mmwave/src/network/helper/net-device-container.cc \
../ns3-mmwave/src/network/helper/node-container.cc \
../ns3-mmwave/src/network/helper/packet-socket-helper.cc \
../ns3-mmwave/src/network/helper/simple-net-device-helper.cc \
../ns3-mmwave/src/network/helper/trace-helper.cc 

CC_DEPS += \
./ns3-mmwave/src/network/helper/application-container.d \
./ns3-mmwave/src/network/helper/delay-jitter-estimation.d \
./ns3-mmwave/src/network/helper/net-device-container.d \
./ns3-mmwave/src/network/helper/node-container.d \
./ns3-mmwave/src/network/helper/packet-socket-helper.d \
./ns3-mmwave/src/network/helper/simple-net-device-helper.d \
./ns3-mmwave/src/network/helper/trace-helper.d 

OBJS += \
./ns3-mmwave/src/network/helper/application-container.o \
./ns3-mmwave/src/network/helper/delay-jitter-estimation.o \
./ns3-mmwave/src/network/helper/net-device-container.o \
./ns3-mmwave/src/network/helper/node-container.o \
./ns3-mmwave/src/network/helper/packet-socket-helper.o \
./ns3-mmwave/src/network/helper/simple-net-device-helper.o \
./ns3-mmwave/src/network/helper/trace-helper.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/network/helper/%.o: ../ns3-mmwave/src/network/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


