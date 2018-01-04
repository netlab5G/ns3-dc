################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/propagation/examples/jakes-propagation-model-example.cc \
../ns3-mmwave/src/propagation/examples/main-propagation-loss.cc 

CC_DEPS += \
./ns3-mmwave/src/propagation/examples/jakes-propagation-model-example.d \
./ns3-mmwave/src/propagation/examples/main-propagation-loss.d 

OBJS += \
./ns3-mmwave/src/propagation/examples/jakes-propagation-model-example.o \
./ns3-mmwave/src/propagation/examples/main-propagation-loss.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/propagation/examples/%.o: ../ns3-mmwave/src/propagation/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


