################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/mmwave/helper/core-network-stats-calculator.cc \
../ns3-mmwave/src/mmwave/helper/mc-stats-calculator.cc \
../ns3-mmwave/src/mmwave/helper/mmwave-bearer-stats-calculator.cc \
../ns3-mmwave/src/mmwave/helper/mmwave-bearer-stats-connector.cc \
../ns3-mmwave/src/mmwave/helper/mmwave-helper.cc \
../ns3-mmwave/src/mmwave/helper/mmwave-phy-rx-trace.cc \
../ns3-mmwave/src/mmwave/helper/mmwave-point-to-point-epc-helper.cc 

CPP_SRCS += \
../ns3-mmwave/src/mmwave/helper/core-network-stats-calculator.cpp 

CC_DEPS += \
./ns3-mmwave/src/mmwave/helper/core-network-stats-calculator.d \
./ns3-mmwave/src/mmwave/helper/mc-stats-calculator.d \
./ns3-mmwave/src/mmwave/helper/mmwave-bearer-stats-calculator.d \
./ns3-mmwave/src/mmwave/helper/mmwave-bearer-stats-connector.d \
./ns3-mmwave/src/mmwave/helper/mmwave-helper.d \
./ns3-mmwave/src/mmwave/helper/mmwave-phy-rx-trace.d \
./ns3-mmwave/src/mmwave/helper/mmwave-point-to-point-epc-helper.d 

OBJS += \
./ns3-mmwave/src/mmwave/helper/core-network-stats-calculator.o \
./ns3-mmwave/src/mmwave/helper/mc-stats-calculator.o \
./ns3-mmwave/src/mmwave/helper/mmwave-bearer-stats-calculator.o \
./ns3-mmwave/src/mmwave/helper/mmwave-bearer-stats-connector.o \
./ns3-mmwave/src/mmwave/helper/mmwave-helper.o \
./ns3-mmwave/src/mmwave/helper/mmwave-phy-rx-trace.o \
./ns3-mmwave/src/mmwave/helper/mmwave-point-to-point-epc-helper.o 

CPP_DEPS += \
./ns3-mmwave/src/mmwave/helper/core-network-stats-calculator.d 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/mmwave/helper/%.o: ../ns3-mmwave/src/mmwave/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

ns3-mmwave/src/mmwave/helper/%.o: ../ns3-mmwave/src/mmwave/helper/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


