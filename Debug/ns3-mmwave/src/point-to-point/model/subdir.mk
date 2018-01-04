################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/point-to-point/model/point-to-point-channel.cc \
../ns3-mmwave/src/point-to-point/model/point-to-point-net-device.cc \
../ns3-mmwave/src/point-to-point/model/point-to-point-remote-channel.cc \
../ns3-mmwave/src/point-to-point/model/ppp-header.cc 

CC_DEPS += \
./ns3-mmwave/src/point-to-point/model/point-to-point-channel.d \
./ns3-mmwave/src/point-to-point/model/point-to-point-net-device.d \
./ns3-mmwave/src/point-to-point/model/point-to-point-remote-channel.d \
./ns3-mmwave/src/point-to-point/model/ppp-header.d 

OBJS += \
./ns3-mmwave/src/point-to-point/model/point-to-point-channel.o \
./ns3-mmwave/src/point-to-point/model/point-to-point-net-device.o \
./ns3-mmwave/src/point-to-point/model/point-to-point-remote-channel.o \
./ns3-mmwave/src/point-to-point/model/ppp-header.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/point-to-point/model/%.o: ../ns3-mmwave/src/point-to-point/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


