################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/click/model/ipv4-click-routing.cc \
../ns3-mmwave/src/click/model/ipv4-l3-click-protocol.cc 

CC_DEPS += \
./ns3-mmwave/src/click/model/ipv4-click-routing.d \
./ns3-mmwave/src/click/model/ipv4-l3-click-protocol.d 

OBJS += \
./ns3-mmwave/src/click/model/ipv4-click-routing.o \
./ns3-mmwave/src/click/model/ipv4-l3-click-protocol.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/click/model/%.o: ../ns3-mmwave/src/click/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


