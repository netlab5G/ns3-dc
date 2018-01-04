################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/tap-bridge/model/tap-bridge.cc \
../ns3-mmwave/src/tap-bridge/model/tap-creator.cc \
../ns3-mmwave/src/tap-bridge/model/tap-encode-decode.cc 

CC_DEPS += \
./ns3-mmwave/src/tap-bridge/model/tap-bridge.d \
./ns3-mmwave/src/tap-bridge/model/tap-creator.d \
./ns3-mmwave/src/tap-bridge/model/tap-encode-decode.d 

OBJS += \
./ns3-mmwave/src/tap-bridge/model/tap-bridge.o \
./ns3-mmwave/src/tap-bridge/model/tap-creator.o \
./ns3-mmwave/src/tap-bridge/model/tap-encode-decode.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/tap-bridge/model/%.o: ../ns3-mmwave/src/tap-bridge/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


