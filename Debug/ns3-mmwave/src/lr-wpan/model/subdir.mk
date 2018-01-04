################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/lr-wpan/model/lr-wpan-csmaca.cc \
../ns3-mmwave/src/lr-wpan/model/lr-wpan-error-model.cc \
../ns3-mmwave/src/lr-wpan/model/lr-wpan-interference-helper.cc \
../ns3-mmwave/src/lr-wpan/model/lr-wpan-lqi-tag.cc \
../ns3-mmwave/src/lr-wpan/model/lr-wpan-mac-header.cc \
../ns3-mmwave/src/lr-wpan/model/lr-wpan-mac-trailer.cc \
../ns3-mmwave/src/lr-wpan/model/lr-wpan-mac.cc \
../ns3-mmwave/src/lr-wpan/model/lr-wpan-net-device.cc \
../ns3-mmwave/src/lr-wpan/model/lr-wpan-phy.cc \
../ns3-mmwave/src/lr-wpan/model/lr-wpan-spectrum-signal-parameters.cc \
../ns3-mmwave/src/lr-wpan/model/lr-wpan-spectrum-value-helper.cc 

CC_DEPS += \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-csmaca.d \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-error-model.d \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-interference-helper.d \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-lqi-tag.d \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-mac-header.d \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-mac-trailer.d \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-mac.d \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-net-device.d \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-phy.d \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-spectrum-signal-parameters.d \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-spectrum-value-helper.d 

OBJS += \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-csmaca.o \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-error-model.o \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-interference-helper.o \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-lqi-tag.o \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-mac-header.o \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-mac-trailer.o \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-mac.o \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-net-device.o \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-phy.o \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-spectrum-signal-parameters.o \
./ns3-mmwave/src/lr-wpan/model/lr-wpan-spectrum-value-helper.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/lr-wpan/model/%.o: ../ns3-mmwave/src/lr-wpan/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


