################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/uan/model/acoustic-modem-energy-model.cc \
../ns3-mmwave/src/uan/model/uan-address.cc \
../ns3-mmwave/src/uan/model/uan-channel.cc \
../ns3-mmwave/src/uan/model/uan-header-common.cc \
../ns3-mmwave/src/uan/model/uan-header-rc.cc \
../ns3-mmwave/src/uan/model/uan-mac-aloha.cc \
../ns3-mmwave/src/uan/model/uan-mac-cw.cc \
../ns3-mmwave/src/uan/model/uan-mac-rc-gw.cc \
../ns3-mmwave/src/uan/model/uan-mac-rc.cc \
../ns3-mmwave/src/uan/model/uan-mac.cc \
../ns3-mmwave/src/uan/model/uan-net-device.cc \
../ns3-mmwave/src/uan/model/uan-noise-model-default.cc \
../ns3-mmwave/src/uan/model/uan-noise-model.cc \
../ns3-mmwave/src/uan/model/uan-phy-dual.cc \
../ns3-mmwave/src/uan/model/uan-phy-gen.cc \
../ns3-mmwave/src/uan/model/uan-phy.cc \
../ns3-mmwave/src/uan/model/uan-prop-model-ideal.cc \
../ns3-mmwave/src/uan/model/uan-prop-model-thorp.cc \
../ns3-mmwave/src/uan/model/uan-prop-model.cc \
../ns3-mmwave/src/uan/model/uan-transducer-hd.cc \
../ns3-mmwave/src/uan/model/uan-transducer.cc \
../ns3-mmwave/src/uan/model/uan-tx-mode.cc 

CC_DEPS += \
./ns3-mmwave/src/uan/model/acoustic-modem-energy-model.d \
./ns3-mmwave/src/uan/model/uan-address.d \
./ns3-mmwave/src/uan/model/uan-channel.d \
./ns3-mmwave/src/uan/model/uan-header-common.d \
./ns3-mmwave/src/uan/model/uan-header-rc.d \
./ns3-mmwave/src/uan/model/uan-mac-aloha.d \
./ns3-mmwave/src/uan/model/uan-mac-cw.d \
./ns3-mmwave/src/uan/model/uan-mac-rc-gw.d \
./ns3-mmwave/src/uan/model/uan-mac-rc.d \
./ns3-mmwave/src/uan/model/uan-mac.d \
./ns3-mmwave/src/uan/model/uan-net-device.d \
./ns3-mmwave/src/uan/model/uan-noise-model-default.d \
./ns3-mmwave/src/uan/model/uan-noise-model.d \
./ns3-mmwave/src/uan/model/uan-phy-dual.d \
./ns3-mmwave/src/uan/model/uan-phy-gen.d \
./ns3-mmwave/src/uan/model/uan-phy.d \
./ns3-mmwave/src/uan/model/uan-prop-model-ideal.d \
./ns3-mmwave/src/uan/model/uan-prop-model-thorp.d \
./ns3-mmwave/src/uan/model/uan-prop-model.d \
./ns3-mmwave/src/uan/model/uan-transducer-hd.d \
./ns3-mmwave/src/uan/model/uan-transducer.d \
./ns3-mmwave/src/uan/model/uan-tx-mode.d 

OBJS += \
./ns3-mmwave/src/uan/model/acoustic-modem-energy-model.o \
./ns3-mmwave/src/uan/model/uan-address.o \
./ns3-mmwave/src/uan/model/uan-channel.o \
./ns3-mmwave/src/uan/model/uan-header-common.o \
./ns3-mmwave/src/uan/model/uan-header-rc.o \
./ns3-mmwave/src/uan/model/uan-mac-aloha.o \
./ns3-mmwave/src/uan/model/uan-mac-cw.o \
./ns3-mmwave/src/uan/model/uan-mac-rc-gw.o \
./ns3-mmwave/src/uan/model/uan-mac-rc.o \
./ns3-mmwave/src/uan/model/uan-mac.o \
./ns3-mmwave/src/uan/model/uan-net-device.o \
./ns3-mmwave/src/uan/model/uan-noise-model-default.o \
./ns3-mmwave/src/uan/model/uan-noise-model.o \
./ns3-mmwave/src/uan/model/uan-phy-dual.o \
./ns3-mmwave/src/uan/model/uan-phy-gen.o \
./ns3-mmwave/src/uan/model/uan-phy.o \
./ns3-mmwave/src/uan/model/uan-prop-model-ideal.o \
./ns3-mmwave/src/uan/model/uan-prop-model-thorp.o \
./ns3-mmwave/src/uan/model/uan-prop-model.o \
./ns3-mmwave/src/uan/model/uan-transducer-hd.o \
./ns3-mmwave/src/uan/model/uan-transducer.o \
./ns3-mmwave/src/uan/model/uan-tx-mode.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/uan/model/%.o: ../ns3-mmwave/src/uan/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


