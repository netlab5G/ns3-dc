################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/energy/test/basic-energy-harvester-test.cc \
../ns3-mmwave/src/energy/test/li-ion-energy-source-test.cc 

CC_DEPS += \
./ns3-mmwave/src/energy/test/basic-energy-harvester-test.d \
./ns3-mmwave/src/energy/test/li-ion-energy-source-test.d 

OBJS += \
./ns3-mmwave/src/energy/test/basic-energy-harvester-test.o \
./ns3-mmwave/src/energy/test/li-ion-energy-source-test.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/energy/test/%.o: ../ns3-mmwave/src/energy/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


