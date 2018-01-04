################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/olsr/test/bug780-test.cc \
../ns3-mmwave/src/olsr/test/hello-regression-test.cc \
../ns3-mmwave/src/olsr/test/olsr-header-test-suite.cc \
../ns3-mmwave/src/olsr/test/olsr-routing-protocol-test-suite.cc \
../ns3-mmwave/src/olsr/test/regression-test-suite.cc \
../ns3-mmwave/src/olsr/test/tc-regression-test.cc 

CC_DEPS += \
./ns3-mmwave/src/olsr/test/bug780-test.d \
./ns3-mmwave/src/olsr/test/hello-regression-test.d \
./ns3-mmwave/src/olsr/test/olsr-header-test-suite.d \
./ns3-mmwave/src/olsr/test/olsr-routing-protocol-test-suite.d \
./ns3-mmwave/src/olsr/test/regression-test-suite.d \
./ns3-mmwave/src/olsr/test/tc-regression-test.d 

OBJS += \
./ns3-mmwave/src/olsr/test/bug780-test.o \
./ns3-mmwave/src/olsr/test/hello-regression-test.o \
./ns3-mmwave/src/olsr/test/olsr-header-test-suite.o \
./ns3-mmwave/src/olsr/test/olsr-routing-protocol-test-suite.o \
./ns3-mmwave/src/olsr/test/regression-test-suite.o \
./ns3-mmwave/src/olsr/test/tc-regression-test.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/olsr/test/%.o: ../ns3-mmwave/src/olsr/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


