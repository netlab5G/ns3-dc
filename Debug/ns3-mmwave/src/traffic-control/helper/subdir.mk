################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/traffic-control/helper/queue-disc-container.cc \
../ns3-mmwave/src/traffic-control/helper/traffic-control-helper.cc 

CC_DEPS += \
./ns3-mmwave/src/traffic-control/helper/queue-disc-container.d \
./ns3-mmwave/src/traffic-control/helper/traffic-control-helper.d 

OBJS += \
./ns3-mmwave/src/traffic-control/helper/queue-disc-container.o \
./ns3-mmwave/src/traffic-control/helper/traffic-control-helper.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/traffic-control/helper/%.o: ../ns3-mmwave/src/traffic-control/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


