################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/spectrum/examples/adhoc-aloha-ideal-phy-matrix-propagation-loss-model.cc \
../ns3-mmwave/src/spectrum/examples/adhoc-aloha-ideal-phy-with-microwave-oven.cc \
../ns3-mmwave/src/spectrum/examples/adhoc-aloha-ideal-phy.cc \
../ns3-mmwave/src/spectrum/examples/tv-trans-example.cc \
../ns3-mmwave/src/spectrum/examples/tv-trans-regional-example.cc 

CC_DEPS += \
./ns3-mmwave/src/spectrum/examples/adhoc-aloha-ideal-phy-matrix-propagation-loss-model.d \
./ns3-mmwave/src/spectrum/examples/adhoc-aloha-ideal-phy-with-microwave-oven.d \
./ns3-mmwave/src/spectrum/examples/adhoc-aloha-ideal-phy.d \
./ns3-mmwave/src/spectrum/examples/tv-trans-example.d \
./ns3-mmwave/src/spectrum/examples/tv-trans-regional-example.d 

OBJS += \
./ns3-mmwave/src/spectrum/examples/adhoc-aloha-ideal-phy-matrix-propagation-loss-model.o \
./ns3-mmwave/src/spectrum/examples/adhoc-aloha-ideal-phy-with-microwave-oven.o \
./ns3-mmwave/src/spectrum/examples/adhoc-aloha-ideal-phy.o \
./ns3-mmwave/src/spectrum/examples/tv-trans-example.o \
./ns3-mmwave/src/spectrum/examples/tv-trans-regional-example.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/spectrum/examples/%.o: ../ns3-mmwave/src/spectrum/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


