################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/fd-net-device/helper/creator-utils.cc \
../ns3-mmwave/src/fd-net-device/helper/emu-fd-net-device-helper.cc \
../ns3-mmwave/src/fd-net-device/helper/encode-decode.cc \
../ns3-mmwave/src/fd-net-device/helper/fd-net-device-helper.cc \
../ns3-mmwave/src/fd-net-device/helper/planetlab-fd-net-device-helper.cc \
../ns3-mmwave/src/fd-net-device/helper/planetlab-tap-creator.cc \
../ns3-mmwave/src/fd-net-device/helper/raw-sock-creator.cc \
../ns3-mmwave/src/fd-net-device/helper/tap-device-creator.cc \
../ns3-mmwave/src/fd-net-device/helper/tap-fd-net-device-helper.cc 

CC_DEPS += \
./ns3-mmwave/src/fd-net-device/helper/creator-utils.d \
./ns3-mmwave/src/fd-net-device/helper/emu-fd-net-device-helper.d \
./ns3-mmwave/src/fd-net-device/helper/encode-decode.d \
./ns3-mmwave/src/fd-net-device/helper/fd-net-device-helper.d \
./ns3-mmwave/src/fd-net-device/helper/planetlab-fd-net-device-helper.d \
./ns3-mmwave/src/fd-net-device/helper/planetlab-tap-creator.d \
./ns3-mmwave/src/fd-net-device/helper/raw-sock-creator.d \
./ns3-mmwave/src/fd-net-device/helper/tap-device-creator.d \
./ns3-mmwave/src/fd-net-device/helper/tap-fd-net-device-helper.d 

OBJS += \
./ns3-mmwave/src/fd-net-device/helper/creator-utils.o \
./ns3-mmwave/src/fd-net-device/helper/emu-fd-net-device-helper.o \
./ns3-mmwave/src/fd-net-device/helper/encode-decode.o \
./ns3-mmwave/src/fd-net-device/helper/fd-net-device-helper.o \
./ns3-mmwave/src/fd-net-device/helper/planetlab-fd-net-device-helper.o \
./ns3-mmwave/src/fd-net-device/helper/planetlab-tap-creator.o \
./ns3-mmwave/src/fd-net-device/helper/raw-sock-creator.o \
./ns3-mmwave/src/fd-net-device/helper/tap-device-creator.o \
./ns3-mmwave/src/fd-net-device/helper/tap-fd-net-device-helper.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/fd-net-device/helper/%.o: ../ns3-mmwave/src/fd-net-device/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


