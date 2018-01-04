################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/spectrum/model/aloha-noack-mac-header.cc \
../ns3-mmwave/src/spectrum/model/aloha-noack-net-device.cc \
../ns3-mmwave/src/spectrum/model/constant-spectrum-propagation-loss.cc \
../ns3-mmwave/src/spectrum/model/friis-spectrum-propagation-loss.cc \
../ns3-mmwave/src/spectrum/model/half-duplex-ideal-phy-signal-parameters.cc \
../ns3-mmwave/src/spectrum/model/half-duplex-ideal-phy.cc \
../ns3-mmwave/src/spectrum/model/microwave-oven-spectrum-value-helper.cc \
../ns3-mmwave/src/spectrum/model/multi-model-spectrum-channel.cc \
../ns3-mmwave/src/spectrum/model/non-communicating-net-device.cc \
../ns3-mmwave/src/spectrum/model/single-model-spectrum-channel.cc \
../ns3-mmwave/src/spectrum/model/spectrum-analyzer.cc \
../ns3-mmwave/src/spectrum/model/spectrum-channel.cc \
../ns3-mmwave/src/spectrum/model/spectrum-converter.cc \
../ns3-mmwave/src/spectrum/model/spectrum-error-model.cc \
../ns3-mmwave/src/spectrum/model/spectrum-interference.cc \
../ns3-mmwave/src/spectrum/model/spectrum-model-300kHz-300GHz-log.cc \
../ns3-mmwave/src/spectrum/model/spectrum-model-ism2400MHz-res1MHz.cc \
../ns3-mmwave/src/spectrum/model/spectrum-model.cc \
../ns3-mmwave/src/spectrum/model/spectrum-phy.cc \
../ns3-mmwave/src/spectrum/model/spectrum-propagation-loss-model.cc \
../ns3-mmwave/src/spectrum/model/spectrum-signal-parameters.cc \
../ns3-mmwave/src/spectrum/model/spectrum-value.cc \
../ns3-mmwave/src/spectrum/model/tv-spectrum-transmitter.cc \
../ns3-mmwave/src/spectrum/model/waveform-generator.cc \
../ns3-mmwave/src/spectrum/model/wifi-spectrum-value-helper.cc 

CC_DEPS += \
./ns3-mmwave/src/spectrum/model/aloha-noack-mac-header.d \
./ns3-mmwave/src/spectrum/model/aloha-noack-net-device.d \
./ns3-mmwave/src/spectrum/model/constant-spectrum-propagation-loss.d \
./ns3-mmwave/src/spectrum/model/friis-spectrum-propagation-loss.d \
./ns3-mmwave/src/spectrum/model/half-duplex-ideal-phy-signal-parameters.d \
./ns3-mmwave/src/spectrum/model/half-duplex-ideal-phy.d \
./ns3-mmwave/src/spectrum/model/microwave-oven-spectrum-value-helper.d \
./ns3-mmwave/src/spectrum/model/multi-model-spectrum-channel.d \
./ns3-mmwave/src/spectrum/model/non-communicating-net-device.d \
./ns3-mmwave/src/spectrum/model/single-model-spectrum-channel.d \
./ns3-mmwave/src/spectrum/model/spectrum-analyzer.d \
./ns3-mmwave/src/spectrum/model/spectrum-channel.d \
./ns3-mmwave/src/spectrum/model/spectrum-converter.d \
./ns3-mmwave/src/spectrum/model/spectrum-error-model.d \
./ns3-mmwave/src/spectrum/model/spectrum-interference.d \
./ns3-mmwave/src/spectrum/model/spectrum-model-300kHz-300GHz-log.d \
./ns3-mmwave/src/spectrum/model/spectrum-model-ism2400MHz-res1MHz.d \
./ns3-mmwave/src/spectrum/model/spectrum-model.d \
./ns3-mmwave/src/spectrum/model/spectrum-phy.d \
./ns3-mmwave/src/spectrum/model/spectrum-propagation-loss-model.d \
./ns3-mmwave/src/spectrum/model/spectrum-signal-parameters.d \
./ns3-mmwave/src/spectrum/model/spectrum-value.d \
./ns3-mmwave/src/spectrum/model/tv-spectrum-transmitter.d \
./ns3-mmwave/src/spectrum/model/waveform-generator.d \
./ns3-mmwave/src/spectrum/model/wifi-spectrum-value-helper.d 

OBJS += \
./ns3-mmwave/src/spectrum/model/aloha-noack-mac-header.o \
./ns3-mmwave/src/spectrum/model/aloha-noack-net-device.o \
./ns3-mmwave/src/spectrum/model/constant-spectrum-propagation-loss.o \
./ns3-mmwave/src/spectrum/model/friis-spectrum-propagation-loss.o \
./ns3-mmwave/src/spectrum/model/half-duplex-ideal-phy-signal-parameters.o \
./ns3-mmwave/src/spectrum/model/half-duplex-ideal-phy.o \
./ns3-mmwave/src/spectrum/model/microwave-oven-spectrum-value-helper.o \
./ns3-mmwave/src/spectrum/model/multi-model-spectrum-channel.o \
./ns3-mmwave/src/spectrum/model/non-communicating-net-device.o \
./ns3-mmwave/src/spectrum/model/single-model-spectrum-channel.o \
./ns3-mmwave/src/spectrum/model/spectrum-analyzer.o \
./ns3-mmwave/src/spectrum/model/spectrum-channel.o \
./ns3-mmwave/src/spectrum/model/spectrum-converter.o \
./ns3-mmwave/src/spectrum/model/spectrum-error-model.o \
./ns3-mmwave/src/spectrum/model/spectrum-interference.o \
./ns3-mmwave/src/spectrum/model/spectrum-model-300kHz-300GHz-log.o \
./ns3-mmwave/src/spectrum/model/spectrum-model-ism2400MHz-res1MHz.o \
./ns3-mmwave/src/spectrum/model/spectrum-model.o \
./ns3-mmwave/src/spectrum/model/spectrum-phy.o \
./ns3-mmwave/src/spectrum/model/spectrum-propagation-loss-model.o \
./ns3-mmwave/src/spectrum/model/spectrum-signal-parameters.o \
./ns3-mmwave/src/spectrum/model/spectrum-value.o \
./ns3-mmwave/src/spectrum/model/tv-spectrum-transmitter.o \
./ns3-mmwave/src/spectrum/model/waveform-generator.o \
./ns3-mmwave/src/spectrum/model/wifi-spectrum-value-helper.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/spectrum/model/%.o: ../ns3-mmwave/src/spectrum/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


