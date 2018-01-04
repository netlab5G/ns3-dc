################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/mesh/model/flame/flame-header.cc \
../ns3-mmwave/src/mesh/model/flame/flame-protocol-mac.cc \
../ns3-mmwave/src/mesh/model/flame/flame-protocol.cc \
../ns3-mmwave/src/mesh/model/flame/flame-rtable.cc 

CC_DEPS += \
./ns3-mmwave/src/mesh/model/flame/flame-header.d \
./ns3-mmwave/src/mesh/model/flame/flame-protocol-mac.d \
./ns3-mmwave/src/mesh/model/flame/flame-protocol.d \
./ns3-mmwave/src/mesh/model/flame/flame-rtable.d 

OBJS += \
./ns3-mmwave/src/mesh/model/flame/flame-header.o \
./ns3-mmwave/src/mesh/model/flame/flame-protocol-mac.o \
./ns3-mmwave/src/mesh/model/flame/flame-protocol.o \
./ns3-mmwave/src/mesh/model/flame/flame-rtable.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/mesh/model/flame/%.o: ../ns3-mmwave/src/mesh/model/flame/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


