################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/config-store/model/attribute-default-iterator.cc \
../ns3-mmwave/src/config-store/model/attribute-iterator.cc \
../ns3-mmwave/src/config-store/model/config-store.cc \
../ns3-mmwave/src/config-store/model/display-functions.cc \
../ns3-mmwave/src/config-store/model/file-config.cc \
../ns3-mmwave/src/config-store/model/gtk-config-store.cc \
../ns3-mmwave/src/config-store/model/model-node-creator.cc \
../ns3-mmwave/src/config-store/model/model-typeid-creator.cc \
../ns3-mmwave/src/config-store/model/raw-text-config.cc \
../ns3-mmwave/src/config-store/model/xml-config.cc 

CC_DEPS += \
./ns3-mmwave/src/config-store/model/attribute-default-iterator.d \
./ns3-mmwave/src/config-store/model/attribute-iterator.d \
./ns3-mmwave/src/config-store/model/config-store.d \
./ns3-mmwave/src/config-store/model/display-functions.d \
./ns3-mmwave/src/config-store/model/file-config.d \
./ns3-mmwave/src/config-store/model/gtk-config-store.d \
./ns3-mmwave/src/config-store/model/model-node-creator.d \
./ns3-mmwave/src/config-store/model/model-typeid-creator.d \
./ns3-mmwave/src/config-store/model/raw-text-config.d \
./ns3-mmwave/src/config-store/model/xml-config.d 

OBJS += \
./ns3-mmwave/src/config-store/model/attribute-default-iterator.o \
./ns3-mmwave/src/config-store/model/attribute-iterator.o \
./ns3-mmwave/src/config-store/model/config-store.o \
./ns3-mmwave/src/config-store/model/display-functions.o \
./ns3-mmwave/src/config-store/model/file-config.o \
./ns3-mmwave/src/config-store/model/gtk-config-store.o \
./ns3-mmwave/src/config-store/model/model-node-creator.o \
./ns3-mmwave/src/config-store/model/model-typeid-creator.o \
./ns3-mmwave/src/config-store/model/raw-text-config.o \
./ns3-mmwave/src/config-store/model/xml-config.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/config-store/model/%.o: ../ns3-mmwave/src/config-store/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


