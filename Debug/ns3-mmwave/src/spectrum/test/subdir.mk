################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/spectrum/test/spectrum-ideal-phy-test.cc \
../ns3-mmwave/src/spectrum/test/spectrum-interference-test.cc \
../ns3-mmwave/src/spectrum/test/spectrum-value-test.cc \
../ns3-mmwave/src/spectrum/test/spectrum-waveform-generator-test.cc \
../ns3-mmwave/src/spectrum/test/tv-helper-distribution-test.cc \
../ns3-mmwave/src/spectrum/test/tv-spectrum-transmitter-test.cc 

CC_DEPS += \
./ns3-mmwave/src/spectrum/test/spectrum-ideal-phy-test.d \
./ns3-mmwave/src/spectrum/test/spectrum-interference-test.d \
./ns3-mmwave/src/spectrum/test/spectrum-value-test.d \
./ns3-mmwave/src/spectrum/test/spectrum-waveform-generator-test.d \
./ns3-mmwave/src/spectrum/test/tv-helper-distribution-test.d \
./ns3-mmwave/src/spectrum/test/tv-spectrum-transmitter-test.d 

OBJS += \
./ns3-mmwave/src/spectrum/test/spectrum-ideal-phy-test.o \
./ns3-mmwave/src/spectrum/test/spectrum-interference-test.o \
./ns3-mmwave/src/spectrum/test/spectrum-value-test.o \
./ns3-mmwave/src/spectrum/test/spectrum-waveform-generator-test.o \
./ns3-mmwave/src/spectrum/test/tv-helper-distribution-test.o \
./ns3-mmwave/src/spectrum/test/tv-spectrum-transmitter-test.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/spectrum/test/%.o: ../ns3-mmwave/src/spectrum/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


