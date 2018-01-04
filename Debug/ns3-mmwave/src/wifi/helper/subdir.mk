################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/wifi/helper/athstats-helper.cc \
../ns3-mmwave/src/wifi/helper/ht-wifi-mac-helper.cc \
../ns3-mmwave/src/wifi/helper/nqos-wifi-mac-helper.cc \
../ns3-mmwave/src/wifi/helper/qos-wifi-mac-helper.cc \
../ns3-mmwave/src/wifi/helper/spectrum-wifi-helper.cc \
../ns3-mmwave/src/wifi/helper/vht-wifi-mac-helper.cc \
../ns3-mmwave/src/wifi/helper/wifi-helper.cc \
../ns3-mmwave/src/wifi/helper/wifi-mac-helper.cc \
../ns3-mmwave/src/wifi/helper/wifi-radio-energy-model-helper.cc \
../ns3-mmwave/src/wifi/helper/yans-wifi-helper.cc 

CC_DEPS += \
./ns3-mmwave/src/wifi/helper/athstats-helper.d \
./ns3-mmwave/src/wifi/helper/ht-wifi-mac-helper.d \
./ns3-mmwave/src/wifi/helper/nqos-wifi-mac-helper.d \
./ns3-mmwave/src/wifi/helper/qos-wifi-mac-helper.d \
./ns3-mmwave/src/wifi/helper/spectrum-wifi-helper.d \
./ns3-mmwave/src/wifi/helper/vht-wifi-mac-helper.d \
./ns3-mmwave/src/wifi/helper/wifi-helper.d \
./ns3-mmwave/src/wifi/helper/wifi-mac-helper.d \
./ns3-mmwave/src/wifi/helper/wifi-radio-energy-model-helper.d \
./ns3-mmwave/src/wifi/helper/yans-wifi-helper.d 

OBJS += \
./ns3-mmwave/src/wifi/helper/athstats-helper.o \
./ns3-mmwave/src/wifi/helper/ht-wifi-mac-helper.o \
./ns3-mmwave/src/wifi/helper/nqos-wifi-mac-helper.o \
./ns3-mmwave/src/wifi/helper/qos-wifi-mac-helper.o \
./ns3-mmwave/src/wifi/helper/spectrum-wifi-helper.o \
./ns3-mmwave/src/wifi/helper/vht-wifi-mac-helper.o \
./ns3-mmwave/src/wifi/helper/wifi-helper.o \
./ns3-mmwave/src/wifi/helper/wifi-mac-helper.o \
./ns3-mmwave/src/wifi/helper/wifi-radio-energy-model-helper.o \
./ns3-mmwave/src/wifi/helper/yans-wifi-helper.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/wifi/helper/%.o: ../ns3-mmwave/src/wifi/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


