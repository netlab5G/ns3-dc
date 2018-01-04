################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/mesh/test/dot11s/dot11s-test-suite.cc \
../ns3-mmwave/src/mesh/test/dot11s/hwmp-proactive-regression.cc \
../ns3-mmwave/src/mesh/test/dot11s/hwmp-reactive-regression.cc \
../ns3-mmwave/src/mesh/test/dot11s/hwmp-simplest-regression.cc \
../ns3-mmwave/src/mesh/test/dot11s/hwmp-target-flags-regression.cc \
../ns3-mmwave/src/mesh/test/dot11s/pmp-regression.cc \
../ns3-mmwave/src/mesh/test/dot11s/regression.cc 

CC_DEPS += \
./ns3-mmwave/src/mesh/test/dot11s/dot11s-test-suite.d \
./ns3-mmwave/src/mesh/test/dot11s/hwmp-proactive-regression.d \
./ns3-mmwave/src/mesh/test/dot11s/hwmp-reactive-regression.d \
./ns3-mmwave/src/mesh/test/dot11s/hwmp-simplest-regression.d \
./ns3-mmwave/src/mesh/test/dot11s/hwmp-target-flags-regression.d \
./ns3-mmwave/src/mesh/test/dot11s/pmp-regression.d \
./ns3-mmwave/src/mesh/test/dot11s/regression.d 

OBJS += \
./ns3-mmwave/src/mesh/test/dot11s/dot11s-test-suite.o \
./ns3-mmwave/src/mesh/test/dot11s/hwmp-proactive-regression.o \
./ns3-mmwave/src/mesh/test/dot11s/hwmp-reactive-regression.o \
./ns3-mmwave/src/mesh/test/dot11s/hwmp-simplest-regression.o \
./ns3-mmwave/src/mesh/test/dot11s/hwmp-target-flags-regression.o \
./ns3-mmwave/src/mesh/test/dot11s/pmp-regression.o \
./ns3-mmwave/src/mesh/test/dot11s/regression.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/mesh/test/dot11s/%.o: ../ns3-mmwave/src/mesh/test/dot11s/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


