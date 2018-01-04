################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/examples/stats/wifi-example-apps.cc \
../ns3-mmwave/examples/stats/wifi-example-sim.cc 

CC_DEPS += \
./ns3-mmwave/examples/stats/wifi-example-apps.d \
./ns3-mmwave/examples/stats/wifi-example-sim.d 

OBJS += \
./ns3-mmwave/examples/stats/wifi-example-apps.o \
./ns3-mmwave/examples/stats/wifi-example-sim.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/examples/stats/%.o: ../ns3-mmwave/examples/stats/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


