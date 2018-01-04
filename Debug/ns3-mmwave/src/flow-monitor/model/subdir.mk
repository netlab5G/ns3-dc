################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/flow-monitor/model/flow-classifier.cc \
../ns3-mmwave/src/flow-monitor/model/flow-monitor.cc \
../ns3-mmwave/src/flow-monitor/model/flow-probe.cc \
../ns3-mmwave/src/flow-monitor/model/histogram.cc \
../ns3-mmwave/src/flow-monitor/model/ipv4-flow-classifier.cc \
../ns3-mmwave/src/flow-monitor/model/ipv4-flow-probe.cc \
../ns3-mmwave/src/flow-monitor/model/ipv6-flow-classifier.cc \
../ns3-mmwave/src/flow-monitor/model/ipv6-flow-probe.cc 

CC_DEPS += \
./ns3-mmwave/src/flow-monitor/model/flow-classifier.d \
./ns3-mmwave/src/flow-monitor/model/flow-monitor.d \
./ns3-mmwave/src/flow-monitor/model/flow-probe.d \
./ns3-mmwave/src/flow-monitor/model/histogram.d \
./ns3-mmwave/src/flow-monitor/model/ipv4-flow-classifier.d \
./ns3-mmwave/src/flow-monitor/model/ipv4-flow-probe.d \
./ns3-mmwave/src/flow-monitor/model/ipv6-flow-classifier.d \
./ns3-mmwave/src/flow-monitor/model/ipv6-flow-probe.d 

OBJS += \
./ns3-mmwave/src/flow-monitor/model/flow-classifier.o \
./ns3-mmwave/src/flow-monitor/model/flow-monitor.o \
./ns3-mmwave/src/flow-monitor/model/flow-probe.o \
./ns3-mmwave/src/flow-monitor/model/histogram.o \
./ns3-mmwave/src/flow-monitor/model/ipv4-flow-classifier.o \
./ns3-mmwave/src/flow-monitor/model/ipv4-flow-probe.o \
./ns3-mmwave/src/flow-monitor/model/ipv6-flow-classifier.o \
./ns3-mmwave/src/flow-monitor/model/ipv6-flow-probe.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/flow-monitor/model/%.o: ../ns3-mmwave/src/flow-monitor/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


