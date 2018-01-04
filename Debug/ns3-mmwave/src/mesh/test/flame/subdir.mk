################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/mesh/test/flame/flame-regression.cc \
../ns3-mmwave/src/mesh/test/flame/flame-test-suite.cc \
../ns3-mmwave/src/mesh/test/flame/regression.cc 

CC_DEPS += \
./ns3-mmwave/src/mesh/test/flame/flame-regression.d \
./ns3-mmwave/src/mesh/test/flame/flame-test-suite.d \
./ns3-mmwave/src/mesh/test/flame/regression.d 

OBJS += \
./ns3-mmwave/src/mesh/test/flame/flame-regression.o \
./ns3-mmwave/src/mesh/test/flame/flame-test-suite.o \
./ns3-mmwave/src/mesh/test/flame/regression.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/mesh/test/flame/%.o: ../ns3-mmwave/src/mesh/test/flame/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


