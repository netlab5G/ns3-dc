################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/core/helper/event-garbage-collector.cc \
../ns3-mmwave/src/core/helper/random-variable-stream-helper.cc 

CC_DEPS += \
./ns3-mmwave/src/core/helper/event-garbage-collector.d \
./ns3-mmwave/src/core/helper/random-variable-stream-helper.d 

OBJS += \
./ns3-mmwave/src/core/helper/event-garbage-collector.o \
./ns3-mmwave/src/core/helper/random-variable-stream-helper.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/core/helper/%.o: ../ns3-mmwave/src/core/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


