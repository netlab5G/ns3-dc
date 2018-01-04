################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/examples/socket/socket-bound-static-routing.cc \
../ns3-mmwave/examples/socket/socket-bound-tcp-static-routing.cc \
../ns3-mmwave/examples/socket/socket-options-ipv4.cc \
../ns3-mmwave/examples/socket/socket-options-ipv6.cc 

CC_DEPS += \
./ns3-mmwave/examples/socket/socket-bound-static-routing.d \
./ns3-mmwave/examples/socket/socket-bound-tcp-static-routing.d \
./ns3-mmwave/examples/socket/socket-options-ipv4.d \
./ns3-mmwave/examples/socket/socket-options-ipv6.d 

OBJS += \
./ns3-mmwave/examples/socket/socket-bound-static-routing.o \
./ns3-mmwave/examples/socket/socket-bound-tcp-static-routing.o \
./ns3-mmwave/examples/socket/socket-options-ipv4.o \
./ns3-mmwave/examples/socket/socket-options-ipv6.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/examples/socket/%.o: ../ns3-mmwave/examples/socket/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


