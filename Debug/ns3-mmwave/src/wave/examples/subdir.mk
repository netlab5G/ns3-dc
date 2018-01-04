################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/wave/examples/vanet-routing-compare.cc \
../ns3-mmwave/src/wave/examples/wave-simple-80211p.cc \
../ns3-mmwave/src/wave/examples/wave-simple-device.cc 

CC_DEPS += \
./ns3-mmwave/src/wave/examples/vanet-routing-compare.d \
./ns3-mmwave/src/wave/examples/wave-simple-80211p.d \
./ns3-mmwave/src/wave/examples/wave-simple-device.d 

OBJS += \
./ns3-mmwave/src/wave/examples/vanet-routing-compare.o \
./ns3-mmwave/src/wave/examples/wave-simple-80211p.o \
./ns3-mmwave/src/wave/examples/wave-simple-device.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/wave/examples/%.o: ../ns3-mmwave/src/wave/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


