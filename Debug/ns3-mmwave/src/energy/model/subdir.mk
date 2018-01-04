################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/energy/model/basic-energy-harvester.cc \
../ns3-mmwave/src/energy/model/basic-energy-source.cc \
../ns3-mmwave/src/energy/model/device-energy-model-container.cc \
../ns3-mmwave/src/energy/model/device-energy-model.cc \
../ns3-mmwave/src/energy/model/energy-harvester.cc \
../ns3-mmwave/src/energy/model/energy-source.cc \
../ns3-mmwave/src/energy/model/li-ion-energy-source.cc \
../ns3-mmwave/src/energy/model/rv-battery-model.cc \
../ns3-mmwave/src/energy/model/simple-device-energy-model.cc 

CC_DEPS += \
./ns3-mmwave/src/energy/model/basic-energy-harvester.d \
./ns3-mmwave/src/energy/model/basic-energy-source.d \
./ns3-mmwave/src/energy/model/device-energy-model-container.d \
./ns3-mmwave/src/energy/model/device-energy-model.d \
./ns3-mmwave/src/energy/model/energy-harvester.d \
./ns3-mmwave/src/energy/model/energy-source.d \
./ns3-mmwave/src/energy/model/li-ion-energy-source.d \
./ns3-mmwave/src/energy/model/rv-battery-model.d \
./ns3-mmwave/src/energy/model/simple-device-energy-model.d 

OBJS += \
./ns3-mmwave/src/energy/model/basic-energy-harvester.o \
./ns3-mmwave/src/energy/model/basic-energy-source.o \
./ns3-mmwave/src/energy/model/device-energy-model-container.o \
./ns3-mmwave/src/energy/model/device-energy-model.o \
./ns3-mmwave/src/energy/model/energy-harvester.o \
./ns3-mmwave/src/energy/model/energy-source.o \
./ns3-mmwave/src/energy/model/li-ion-energy-source.o \
./ns3-mmwave/src/energy/model/rv-battery-model.o \
./ns3-mmwave/src/energy/model/simple-device-energy-model.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/energy/model/%.o: ../ns3-mmwave/src/energy/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


