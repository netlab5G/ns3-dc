################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/mobility/test/geo-to-cartesian-test.cc \
../ns3-mmwave/src/mobility/test/mobility-test-suite.cc \
../ns3-mmwave/src/mobility/test/mobility-trace-test-suite.cc \
../ns3-mmwave/src/mobility/test/ns2-mobility-helper-test-suite.cc \
../ns3-mmwave/src/mobility/test/rand-cart-around-geo-test.cc \
../ns3-mmwave/src/mobility/test/steady-state-random-waypoint-mobility-model-test.cc \
../ns3-mmwave/src/mobility/test/waypoint-mobility-model-test.cc 

CC_DEPS += \
./ns3-mmwave/src/mobility/test/geo-to-cartesian-test.d \
./ns3-mmwave/src/mobility/test/mobility-test-suite.d \
./ns3-mmwave/src/mobility/test/mobility-trace-test-suite.d \
./ns3-mmwave/src/mobility/test/ns2-mobility-helper-test-suite.d \
./ns3-mmwave/src/mobility/test/rand-cart-around-geo-test.d \
./ns3-mmwave/src/mobility/test/steady-state-random-waypoint-mobility-model-test.d \
./ns3-mmwave/src/mobility/test/waypoint-mobility-model-test.d 

OBJS += \
./ns3-mmwave/src/mobility/test/geo-to-cartesian-test.o \
./ns3-mmwave/src/mobility/test/mobility-test-suite.o \
./ns3-mmwave/src/mobility/test/mobility-trace-test-suite.o \
./ns3-mmwave/src/mobility/test/ns2-mobility-helper-test-suite.o \
./ns3-mmwave/src/mobility/test/rand-cart-around-geo-test.o \
./ns3-mmwave/src/mobility/test/steady-state-random-waypoint-mobility-model-test.o \
./ns3-mmwave/src/mobility/test/waypoint-mobility-model-test.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/mobility/test/%.o: ../ns3-mmwave/src/mobility/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


