################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/bridge/examples/csma-bridge-one-hop.cc \
../ns3-mmwave/src/bridge/examples/csma-bridge.cc 

CC_DEPS += \
./ns3-mmwave/src/bridge/examples/csma-bridge-one-hop.d \
./ns3-mmwave/src/bridge/examples/csma-bridge.d 

OBJS += \
./ns3-mmwave/src/bridge/examples/csma-bridge-one-hop.o \
./ns3-mmwave/src/bridge/examples/csma-bridge.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/bridge/examples/%.o: ../ns3-mmwave/src/bridge/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


