################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/tap-bridge/examples/tap-csma-virtual-machine.cc \
../ns3-mmwave/src/tap-bridge/examples/tap-csma.cc \
../ns3-mmwave/src/tap-bridge/examples/tap-wifi-dumbbell.cc \
../ns3-mmwave/src/tap-bridge/examples/tap-wifi-virtual-machine.cc 

CC_DEPS += \
./ns3-mmwave/src/tap-bridge/examples/tap-csma-virtual-machine.d \
./ns3-mmwave/src/tap-bridge/examples/tap-csma.d \
./ns3-mmwave/src/tap-bridge/examples/tap-wifi-dumbbell.d \
./ns3-mmwave/src/tap-bridge/examples/tap-wifi-virtual-machine.d 

OBJS += \
./ns3-mmwave/src/tap-bridge/examples/tap-csma-virtual-machine.o \
./ns3-mmwave/src/tap-bridge/examples/tap-csma.o \
./ns3-mmwave/src/tap-bridge/examples/tap-wifi-dumbbell.o \
./ns3-mmwave/src/tap-bridge/examples/tap-wifi-virtual-machine.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/tap-bridge/examples/%.o: ../ns3-mmwave/src/tap-bridge/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


