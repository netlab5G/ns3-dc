################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/spectrum/helper/adhoc-aloha-noack-ideal-phy-helper.cc \
../ns3-mmwave/src/spectrum/helper/spectrum-analyzer-helper.cc \
../ns3-mmwave/src/spectrum/helper/spectrum-helper.cc \
../ns3-mmwave/src/spectrum/helper/tv-spectrum-transmitter-helper.cc \
../ns3-mmwave/src/spectrum/helper/waveform-generator-helper.cc 

CC_DEPS += \
./ns3-mmwave/src/spectrum/helper/adhoc-aloha-noack-ideal-phy-helper.d \
./ns3-mmwave/src/spectrum/helper/spectrum-analyzer-helper.d \
./ns3-mmwave/src/spectrum/helper/spectrum-helper.d \
./ns3-mmwave/src/spectrum/helper/tv-spectrum-transmitter-helper.d \
./ns3-mmwave/src/spectrum/helper/waveform-generator-helper.d 

OBJS += \
./ns3-mmwave/src/spectrum/helper/adhoc-aloha-noack-ideal-phy-helper.o \
./ns3-mmwave/src/spectrum/helper/spectrum-analyzer-helper.o \
./ns3-mmwave/src/spectrum/helper/spectrum-helper.o \
./ns3-mmwave/src/spectrum/helper/tv-spectrum-transmitter-helper.o \
./ns3-mmwave/src/spectrum/helper/waveform-generator-helper.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/spectrum/helper/%.o: ../ns3-mmwave/src/spectrum/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


