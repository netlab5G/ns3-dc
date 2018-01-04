################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/network/model/address.cc \
../ns3-mmwave/src/network/model/application.cc \
../ns3-mmwave/src/network/model/buffer.cc \
../ns3-mmwave/src/network/model/byte-tag-list.cc \
../ns3-mmwave/src/network/model/channel-list.cc \
../ns3-mmwave/src/network/model/channel.cc \
../ns3-mmwave/src/network/model/chunk.cc \
../ns3-mmwave/src/network/model/header.cc \
../ns3-mmwave/src/network/model/net-device.cc \
../ns3-mmwave/src/network/model/nix-vector.cc \
../ns3-mmwave/src/network/model/node-list.cc \
../ns3-mmwave/src/network/model/node.cc \
../ns3-mmwave/src/network/model/packet-metadata.cc \
../ns3-mmwave/src/network/model/packet-tag-list.cc \
../ns3-mmwave/src/network/model/packet.cc \
../ns3-mmwave/src/network/model/socket-factory.cc \
../ns3-mmwave/src/network/model/socket.cc \
../ns3-mmwave/src/network/model/tag-buffer.cc \
../ns3-mmwave/src/network/model/tag.cc \
../ns3-mmwave/src/network/model/trailer.cc 

CC_DEPS += \
./ns3-mmwave/src/network/model/address.d \
./ns3-mmwave/src/network/model/application.d \
./ns3-mmwave/src/network/model/buffer.d \
./ns3-mmwave/src/network/model/byte-tag-list.d \
./ns3-mmwave/src/network/model/channel-list.d \
./ns3-mmwave/src/network/model/channel.d \
./ns3-mmwave/src/network/model/chunk.d \
./ns3-mmwave/src/network/model/header.d \
./ns3-mmwave/src/network/model/net-device.d \
./ns3-mmwave/src/network/model/nix-vector.d \
./ns3-mmwave/src/network/model/node-list.d \
./ns3-mmwave/src/network/model/node.d \
./ns3-mmwave/src/network/model/packet-metadata.d \
./ns3-mmwave/src/network/model/packet-tag-list.d \
./ns3-mmwave/src/network/model/packet.d \
./ns3-mmwave/src/network/model/socket-factory.d \
./ns3-mmwave/src/network/model/socket.d \
./ns3-mmwave/src/network/model/tag-buffer.d \
./ns3-mmwave/src/network/model/tag.d \
./ns3-mmwave/src/network/model/trailer.d 

OBJS += \
./ns3-mmwave/src/network/model/address.o \
./ns3-mmwave/src/network/model/application.o \
./ns3-mmwave/src/network/model/buffer.o \
./ns3-mmwave/src/network/model/byte-tag-list.o \
./ns3-mmwave/src/network/model/channel-list.o \
./ns3-mmwave/src/network/model/channel.o \
./ns3-mmwave/src/network/model/chunk.o \
./ns3-mmwave/src/network/model/header.o \
./ns3-mmwave/src/network/model/net-device.o \
./ns3-mmwave/src/network/model/nix-vector.o \
./ns3-mmwave/src/network/model/node-list.o \
./ns3-mmwave/src/network/model/node.o \
./ns3-mmwave/src/network/model/packet-metadata.o \
./ns3-mmwave/src/network/model/packet-tag-list.o \
./ns3-mmwave/src/network/model/packet.o \
./ns3-mmwave/src/network/model/socket-factory.o \
./ns3-mmwave/src/network/model/socket.o \
./ns3-mmwave/src/network/model/tag-buffer.o \
./ns3-mmwave/src/network/model/tag.o \
./ns3-mmwave/src/network/model/trailer.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/network/model/%.o: ../ns3-mmwave/src/network/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


