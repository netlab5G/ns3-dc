################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/mesh/model/mesh-information-element-vector.cc \
../ns3-mmwave/src/mesh/model/mesh-l2-routing-protocol.cc \
../ns3-mmwave/src/mesh/model/mesh-point-device.cc \
../ns3-mmwave/src/mesh/model/mesh-wifi-beacon.cc \
../ns3-mmwave/src/mesh/model/mesh-wifi-interface-mac.cc 

CC_DEPS += \
./ns3-mmwave/src/mesh/model/mesh-information-element-vector.d \
./ns3-mmwave/src/mesh/model/mesh-l2-routing-protocol.d \
./ns3-mmwave/src/mesh/model/mesh-point-device.d \
./ns3-mmwave/src/mesh/model/mesh-wifi-beacon.d \
./ns3-mmwave/src/mesh/model/mesh-wifi-interface-mac.d 

OBJS += \
./ns3-mmwave/src/mesh/model/mesh-information-element-vector.o \
./ns3-mmwave/src/mesh/model/mesh-l2-routing-protocol.o \
./ns3-mmwave/src/mesh/model/mesh-point-device.o \
./ns3-mmwave/src/mesh/model/mesh-wifi-beacon.o \
./ns3-mmwave/src/mesh/model/mesh-wifi-interface-mac.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/mesh/model/%.o: ../ns3-mmwave/src/mesh/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


