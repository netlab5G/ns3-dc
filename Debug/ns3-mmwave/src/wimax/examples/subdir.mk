################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/wimax/examples/wimax-ipv4.cc \
../ns3-mmwave/src/wimax/examples/wimax-multicast.cc \
../ns3-mmwave/src/wimax/examples/wimax-simple.cc 

CC_DEPS += \
./ns3-mmwave/src/wimax/examples/wimax-ipv4.d \
./ns3-mmwave/src/wimax/examples/wimax-multicast.d \
./ns3-mmwave/src/wimax/examples/wimax-simple.d 

OBJS += \
./ns3-mmwave/src/wimax/examples/wimax-ipv4.o \
./ns3-mmwave/src/wimax/examples/wimax-multicast.o \
./ns3-mmwave/src/wimax/examples/wimax-simple.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/wimax/examples/%.o: ../ns3-mmwave/src/wimax/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


