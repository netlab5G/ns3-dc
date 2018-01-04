################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/buildings/helper/building-allocator.cc \
../ns3-mmwave/src/buildings/helper/building-container.cc \
../ns3-mmwave/src/buildings/helper/building-position-allocator.cc \
../ns3-mmwave/src/buildings/helper/buildings-helper.cc 

CC_DEPS += \
./ns3-mmwave/src/buildings/helper/building-allocator.d \
./ns3-mmwave/src/buildings/helper/building-container.d \
./ns3-mmwave/src/buildings/helper/building-position-allocator.d \
./ns3-mmwave/src/buildings/helper/buildings-helper.d 

OBJS += \
./ns3-mmwave/src/buildings/helper/building-allocator.o \
./ns3-mmwave/src/buildings/helper/building-container.o \
./ns3-mmwave/src/buildings/helper/building-position-allocator.o \
./ns3-mmwave/src/buildings/helper/buildings-helper.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/buildings/helper/%.o: ../ns3-mmwave/src/buildings/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


