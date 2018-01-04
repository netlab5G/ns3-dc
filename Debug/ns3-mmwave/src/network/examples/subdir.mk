################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/network/examples/main-packet-header.cc \
../ns3-mmwave/src/network/examples/main-packet-tag.cc \
../ns3-mmwave/src/network/examples/packet-socket-apps.cc 

CC_DEPS += \
./ns3-mmwave/src/network/examples/main-packet-header.d \
./ns3-mmwave/src/network/examples/main-packet-tag.d \
./ns3-mmwave/src/network/examples/packet-socket-apps.d 

OBJS += \
./ns3-mmwave/src/network/examples/main-packet-header.o \
./ns3-mmwave/src/network/examples/main-packet-tag.o \
./ns3-mmwave/src/network/examples/packet-socket-apps.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/network/examples/%.o: ../ns3-mmwave/src/network/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


