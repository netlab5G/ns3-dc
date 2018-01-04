################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/olsr/model/olsr-header.cc \
../ns3-mmwave/src/olsr/model/olsr-routing-protocol.cc \
../ns3-mmwave/src/olsr/model/olsr-state.cc 

CC_DEPS += \
./ns3-mmwave/src/olsr/model/olsr-header.d \
./ns3-mmwave/src/olsr/model/olsr-routing-protocol.d \
./ns3-mmwave/src/olsr/model/olsr-state.d 

OBJS += \
./ns3-mmwave/src/olsr/model/olsr-header.o \
./ns3-mmwave/src/olsr/model/olsr-routing-protocol.o \
./ns3-mmwave/src/olsr/model/olsr-state.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/olsr/model/%.o: ../ns3-mmwave/src/olsr/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


