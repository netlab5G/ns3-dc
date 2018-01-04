################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/energy/examples/basic-energy-model-test.cc \
../ns3-mmwave/src/energy/examples/li-ion-energy-source.cc \
../ns3-mmwave/src/energy/examples/rv-battery-model-test.cc 

CC_DEPS += \
./ns3-mmwave/src/energy/examples/basic-energy-model-test.d \
./ns3-mmwave/src/energy/examples/li-ion-energy-source.d \
./ns3-mmwave/src/energy/examples/rv-battery-model-test.d 

OBJS += \
./ns3-mmwave/src/energy/examples/basic-energy-model-test.o \
./ns3-mmwave/src/energy/examples/li-ion-energy-source.o \
./ns3-mmwave/src/energy/examples/rv-battery-model-test.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/energy/examples/%.o: ../ns3-mmwave/src/energy/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


