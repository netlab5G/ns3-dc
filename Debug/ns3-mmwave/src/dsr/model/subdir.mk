################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/dsr/model/dsr-errorbuff.cc \
../ns3-mmwave/src/dsr/model/dsr-fs-header.cc \
../ns3-mmwave/src/dsr/model/dsr-gratuitous-reply-table.cc \
../ns3-mmwave/src/dsr/model/dsr-maintain-buff.cc \
../ns3-mmwave/src/dsr/model/dsr-network-queue.cc \
../ns3-mmwave/src/dsr/model/dsr-option-header.cc \
../ns3-mmwave/src/dsr/model/dsr-options.cc \
../ns3-mmwave/src/dsr/model/dsr-passive-buff.cc \
../ns3-mmwave/src/dsr/model/dsr-rcache.cc \
../ns3-mmwave/src/dsr/model/dsr-routing.cc \
../ns3-mmwave/src/dsr/model/dsr-rreq-table.cc \
../ns3-mmwave/src/dsr/model/dsr-rsendbuff.cc 

CC_DEPS += \
./ns3-mmwave/src/dsr/model/dsr-errorbuff.d \
./ns3-mmwave/src/dsr/model/dsr-fs-header.d \
./ns3-mmwave/src/dsr/model/dsr-gratuitous-reply-table.d \
./ns3-mmwave/src/dsr/model/dsr-maintain-buff.d \
./ns3-mmwave/src/dsr/model/dsr-network-queue.d \
./ns3-mmwave/src/dsr/model/dsr-option-header.d \
./ns3-mmwave/src/dsr/model/dsr-options.d \
./ns3-mmwave/src/dsr/model/dsr-passive-buff.d \
./ns3-mmwave/src/dsr/model/dsr-rcache.d \
./ns3-mmwave/src/dsr/model/dsr-routing.d \
./ns3-mmwave/src/dsr/model/dsr-rreq-table.d \
./ns3-mmwave/src/dsr/model/dsr-rsendbuff.d 

OBJS += \
./ns3-mmwave/src/dsr/model/dsr-errorbuff.o \
./ns3-mmwave/src/dsr/model/dsr-fs-header.o \
./ns3-mmwave/src/dsr/model/dsr-gratuitous-reply-table.o \
./ns3-mmwave/src/dsr/model/dsr-maintain-buff.o \
./ns3-mmwave/src/dsr/model/dsr-network-queue.o \
./ns3-mmwave/src/dsr/model/dsr-option-header.o \
./ns3-mmwave/src/dsr/model/dsr-options.o \
./ns3-mmwave/src/dsr/model/dsr-passive-buff.o \
./ns3-mmwave/src/dsr/model/dsr-rcache.o \
./ns3-mmwave/src/dsr/model/dsr-routing.o \
./ns3-mmwave/src/dsr/model/dsr-rreq-table.o \
./ns3-mmwave/src/dsr/model/dsr-rsendbuff.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/dsr/model/%.o: ../ns3-mmwave/src/dsr/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


