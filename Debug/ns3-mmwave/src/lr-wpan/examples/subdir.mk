################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/lr-wpan/examples/lr-wpan-data.cc \
../ns3-mmwave/src/lr-wpan/examples/lr-wpan-error-distance-plot.cc \
../ns3-mmwave/src/lr-wpan/examples/lr-wpan-error-model-plot.cc \
../ns3-mmwave/src/lr-wpan/examples/lr-wpan-packet-print.cc \
../ns3-mmwave/src/lr-wpan/examples/lr-wpan-phy-test.cc 

CC_DEPS += \
./ns3-mmwave/src/lr-wpan/examples/lr-wpan-data.d \
./ns3-mmwave/src/lr-wpan/examples/lr-wpan-error-distance-plot.d \
./ns3-mmwave/src/lr-wpan/examples/lr-wpan-error-model-plot.d \
./ns3-mmwave/src/lr-wpan/examples/lr-wpan-packet-print.d \
./ns3-mmwave/src/lr-wpan/examples/lr-wpan-phy-test.d 

OBJS += \
./ns3-mmwave/src/lr-wpan/examples/lr-wpan-data.o \
./ns3-mmwave/src/lr-wpan/examples/lr-wpan-error-distance-plot.o \
./ns3-mmwave/src/lr-wpan/examples/lr-wpan-error-model-plot.o \
./ns3-mmwave/src/lr-wpan/examples/lr-wpan-packet-print.o \
./ns3-mmwave/src/lr-wpan/examples/lr-wpan-phy-test.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/lr-wpan/examples/%.o: ../ns3-mmwave/src/lr-wpan/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


