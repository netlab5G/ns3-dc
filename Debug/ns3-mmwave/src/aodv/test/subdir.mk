################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/aodv/test/aodv-id-cache-test-suite.cc \
../ns3-mmwave/src/aodv/test/aodv-regression.cc \
../ns3-mmwave/src/aodv/test/aodv-test-suite.cc \
../ns3-mmwave/src/aodv/test/bug-772.cc \
../ns3-mmwave/src/aodv/test/loopback.cc 

CC_DEPS += \
./ns3-mmwave/src/aodv/test/aodv-id-cache-test-suite.d \
./ns3-mmwave/src/aodv/test/aodv-regression.d \
./ns3-mmwave/src/aodv/test/aodv-test-suite.d \
./ns3-mmwave/src/aodv/test/bug-772.d \
./ns3-mmwave/src/aodv/test/loopback.d 

OBJS += \
./ns3-mmwave/src/aodv/test/aodv-id-cache-test-suite.o \
./ns3-mmwave/src/aodv/test/aodv-regression.o \
./ns3-mmwave/src/aodv/test/aodv-test-suite.o \
./ns3-mmwave/src/aodv/test/bug-772.o \
./ns3-mmwave/src/aodv/test/loopback.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/aodv/test/%.o: ../ns3-mmwave/src/aodv/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


