################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/wave/model/bsm-application.cc \
../ns3-mmwave/src/wave/model/channel-coordinator.cc \
../ns3-mmwave/src/wave/model/channel-manager.cc \
../ns3-mmwave/src/wave/model/channel-scheduler.cc \
../ns3-mmwave/src/wave/model/default-channel-scheduler.cc \
../ns3-mmwave/src/wave/model/higher-tx-tag.cc \
../ns3-mmwave/src/wave/model/ocb-wifi-mac.cc \
../ns3-mmwave/src/wave/model/vendor-specific-action.cc \
../ns3-mmwave/src/wave/model/vsa-manager.cc \
../ns3-mmwave/src/wave/model/wave-mac-low.cc \
../ns3-mmwave/src/wave/model/wave-net-device.cc 

CC_DEPS += \
./ns3-mmwave/src/wave/model/bsm-application.d \
./ns3-mmwave/src/wave/model/channel-coordinator.d \
./ns3-mmwave/src/wave/model/channel-manager.d \
./ns3-mmwave/src/wave/model/channel-scheduler.d \
./ns3-mmwave/src/wave/model/default-channel-scheduler.d \
./ns3-mmwave/src/wave/model/higher-tx-tag.d \
./ns3-mmwave/src/wave/model/ocb-wifi-mac.d \
./ns3-mmwave/src/wave/model/vendor-specific-action.d \
./ns3-mmwave/src/wave/model/vsa-manager.d \
./ns3-mmwave/src/wave/model/wave-mac-low.d \
./ns3-mmwave/src/wave/model/wave-net-device.d 

OBJS += \
./ns3-mmwave/src/wave/model/bsm-application.o \
./ns3-mmwave/src/wave/model/channel-coordinator.o \
./ns3-mmwave/src/wave/model/channel-manager.o \
./ns3-mmwave/src/wave/model/channel-scheduler.o \
./ns3-mmwave/src/wave/model/default-channel-scheduler.o \
./ns3-mmwave/src/wave/model/higher-tx-tag.o \
./ns3-mmwave/src/wave/model/ocb-wifi-mac.o \
./ns3-mmwave/src/wave/model/vendor-specific-action.o \
./ns3-mmwave/src/wave/model/vsa-manager.o \
./ns3-mmwave/src/wave/model/wave-mac-low.o \
./ns3-mmwave/src/wave/model/wave-net-device.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/wave/model/%.o: ../ns3-mmwave/src/wave/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


