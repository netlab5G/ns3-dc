################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/scratch/fifth.cc \
../ns3-mmwave/scratch/lena-simple-epc.cc \
../ns3-mmwave/scratch/mc-dowlink.cc \
../ns3-mmwave/scratch/mc-example-crossing.cc \
../ns3-mmwave/scratch/mc-example-udp.cc \
../ns3-mmwave/scratch/mc-example.cc \
../ns3-mmwave/scratch/mc-onebs.cc \
../ns3-mmwave/scratch/mmwave-tcp-high-speed.cc \
../ns3-mmwave/scratch/mmwave-tcp-indoor.cc \
../ns3-mmwave/scratch/scratch-simulator.cc 

CC_DEPS += \
./ns3-mmwave/scratch/fifth.d \
./ns3-mmwave/scratch/lena-simple-epc.d \
./ns3-mmwave/scratch/mc-dowlink.d \
./ns3-mmwave/scratch/mc-example-crossing.d \
./ns3-mmwave/scratch/mc-example-udp.d \
./ns3-mmwave/scratch/mc-example.d \
./ns3-mmwave/scratch/mc-onebs.d \
./ns3-mmwave/scratch/mmwave-tcp-high-speed.d \
./ns3-mmwave/scratch/mmwave-tcp-indoor.d \
./ns3-mmwave/scratch/scratch-simulator.d 

OBJS += \
./ns3-mmwave/scratch/fifth.o \
./ns3-mmwave/scratch/lena-simple-epc.o \
./ns3-mmwave/scratch/mc-dowlink.o \
./ns3-mmwave/scratch/mc-example-crossing.o \
./ns3-mmwave/scratch/mc-example-udp.o \
./ns3-mmwave/scratch/mc-example.o \
./ns3-mmwave/scratch/mc-onebs.o \
./ns3-mmwave/scratch/mmwave-tcp-high-speed.o \
./ns3-mmwave/scratch/mmwave-tcp-indoor.o \
./ns3-mmwave/scratch/scratch-simulator.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/scratch/%.o: ../ns3-mmwave/scratch/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


