################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/fd-net-device/examples/dummy-network.cc \
../ns3-mmwave/src/fd-net-device/examples/fd-emu-onoff.cc \
../ns3-mmwave/src/fd-net-device/examples/fd-emu-ping.cc \
../ns3-mmwave/src/fd-net-device/examples/fd-emu-udp-echo.cc \
../ns3-mmwave/src/fd-net-device/examples/fd-planetlab-ping.cc \
../ns3-mmwave/src/fd-net-device/examples/fd-tap-ping.cc \
../ns3-mmwave/src/fd-net-device/examples/fd-tap-ping6.cc \
../ns3-mmwave/src/fd-net-device/examples/fd2fd-onoff.cc \
../ns3-mmwave/src/fd-net-device/examples/realtime-dummy-network.cc \
../ns3-mmwave/src/fd-net-device/examples/realtime-fd2fd-onoff.cc 

CC_DEPS += \
./ns3-mmwave/src/fd-net-device/examples/dummy-network.d \
./ns3-mmwave/src/fd-net-device/examples/fd-emu-onoff.d \
./ns3-mmwave/src/fd-net-device/examples/fd-emu-ping.d \
./ns3-mmwave/src/fd-net-device/examples/fd-emu-udp-echo.d \
./ns3-mmwave/src/fd-net-device/examples/fd-planetlab-ping.d \
./ns3-mmwave/src/fd-net-device/examples/fd-tap-ping.d \
./ns3-mmwave/src/fd-net-device/examples/fd-tap-ping6.d \
./ns3-mmwave/src/fd-net-device/examples/fd2fd-onoff.d \
./ns3-mmwave/src/fd-net-device/examples/realtime-dummy-network.d \
./ns3-mmwave/src/fd-net-device/examples/realtime-fd2fd-onoff.d 

OBJS += \
./ns3-mmwave/src/fd-net-device/examples/dummy-network.o \
./ns3-mmwave/src/fd-net-device/examples/fd-emu-onoff.o \
./ns3-mmwave/src/fd-net-device/examples/fd-emu-ping.o \
./ns3-mmwave/src/fd-net-device/examples/fd-emu-udp-echo.o \
./ns3-mmwave/src/fd-net-device/examples/fd-planetlab-ping.o \
./ns3-mmwave/src/fd-net-device/examples/fd-tap-ping.o \
./ns3-mmwave/src/fd-net-device/examples/fd-tap-ping6.o \
./ns3-mmwave/src/fd-net-device/examples/fd2fd-onoff.o \
./ns3-mmwave/src/fd-net-device/examples/realtime-dummy-network.o \
./ns3-mmwave/src/fd-net-device/examples/realtime-fd2fd-onoff.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/fd-net-device/examples/%.o: ../ns3-mmwave/src/fd-net-device/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


