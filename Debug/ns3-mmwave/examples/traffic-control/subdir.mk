################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/examples/traffic-control/queue-discs-benchmark.cc \
../ns3-mmwave/examples/traffic-control/traffic-control.cc 

CC_DEPS += \
./ns3-mmwave/examples/traffic-control/queue-discs-benchmark.d \
./ns3-mmwave/examples/traffic-control/traffic-control.d 

OBJS += \
./ns3-mmwave/examples/traffic-control/queue-discs-benchmark.o \
./ns3-mmwave/examples/traffic-control/traffic-control.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/examples/traffic-control/%.o: ../ns3-mmwave/examples/traffic-control/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

