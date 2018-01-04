################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/utils/bench-packets.cc \
../ns3-mmwave/utils/bench-simulator.cc \
../ns3-mmwave/utils/print-introspected-doxygen.cc \
../ns3-mmwave/utils/test-runner.cc 

CC_DEPS += \
./ns3-mmwave/utils/bench-packets.d \
./ns3-mmwave/utils/bench-simulator.d \
./ns3-mmwave/utils/print-introspected-doxygen.d \
./ns3-mmwave/utils/test-runner.d 

OBJS += \
./ns3-mmwave/utils/bench-packets.o \
./ns3-mmwave/utils/bench-simulator.o \
./ns3-mmwave/utils/print-introspected-doxygen.o \
./ns3-mmwave/utils/test-runner.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/utils/%.o: ../ns3-mmwave/utils/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


