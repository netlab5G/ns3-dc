################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/examples/tcp/star.cc \
../ns3-mmwave/examples/tcp/tcp-bulk-send.cc \
../ns3-mmwave/examples/tcp/tcp-large-transfer.cc \
../ns3-mmwave/examples/tcp/tcp-nsc-comparison.cc \
../ns3-mmwave/examples/tcp/tcp-nsc-lfn.cc \
../ns3-mmwave/examples/tcp/tcp-nsc-zoo.cc \
../ns3-mmwave/examples/tcp/tcp-pcap-nanosec-example.cc \
../ns3-mmwave/examples/tcp/tcp-star-server.cc \
../ns3-mmwave/examples/tcp/tcp-variants-comparison.cc 

CC_DEPS += \
./ns3-mmwave/examples/tcp/star.d \
./ns3-mmwave/examples/tcp/tcp-bulk-send.d \
./ns3-mmwave/examples/tcp/tcp-large-transfer.d \
./ns3-mmwave/examples/tcp/tcp-nsc-comparison.d \
./ns3-mmwave/examples/tcp/tcp-nsc-lfn.d \
./ns3-mmwave/examples/tcp/tcp-nsc-zoo.d \
./ns3-mmwave/examples/tcp/tcp-pcap-nanosec-example.d \
./ns3-mmwave/examples/tcp/tcp-star-server.d \
./ns3-mmwave/examples/tcp/tcp-variants-comparison.d 

OBJS += \
./ns3-mmwave/examples/tcp/star.o \
./ns3-mmwave/examples/tcp/tcp-bulk-send.o \
./ns3-mmwave/examples/tcp/tcp-large-transfer.o \
./ns3-mmwave/examples/tcp/tcp-nsc-comparison.o \
./ns3-mmwave/examples/tcp/tcp-nsc-lfn.o \
./ns3-mmwave/examples/tcp/tcp-nsc-zoo.o \
./ns3-mmwave/examples/tcp/tcp-pcap-nanosec-example.o \
./ns3-mmwave/examples/tcp/tcp-star-server.o \
./ns3-mmwave/examples/tcp/tcp-variants-comparison.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/examples/tcp/%.o: ../ns3-mmwave/examples/tcp/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


