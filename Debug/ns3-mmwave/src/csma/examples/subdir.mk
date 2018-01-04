################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/csma/examples/csma-broadcast.cc \
../ns3-mmwave/src/csma/examples/csma-multicast.cc \
../ns3-mmwave/src/csma/examples/csma-one-subnet.cc \
../ns3-mmwave/src/csma/examples/csma-packet-socket.cc \
../ns3-mmwave/src/csma/examples/csma-ping.cc \
../ns3-mmwave/src/csma/examples/csma-raw-ip-socket.cc 

CC_DEPS += \
./ns3-mmwave/src/csma/examples/csma-broadcast.d \
./ns3-mmwave/src/csma/examples/csma-multicast.d \
./ns3-mmwave/src/csma/examples/csma-one-subnet.d \
./ns3-mmwave/src/csma/examples/csma-packet-socket.d \
./ns3-mmwave/src/csma/examples/csma-ping.d \
./ns3-mmwave/src/csma/examples/csma-raw-ip-socket.d 

OBJS += \
./ns3-mmwave/src/csma/examples/csma-broadcast.o \
./ns3-mmwave/src/csma/examples/csma-multicast.o \
./ns3-mmwave/src/csma/examples/csma-one-subnet.o \
./ns3-mmwave/src/csma/examples/csma-packet-socket.o \
./ns3-mmwave/src/csma/examples/csma-ping.o \
./ns3-mmwave/src/csma/examples/csma-raw-ip-socket.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/csma/examples/%.o: ../ns3-mmwave/src/csma/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


