################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/traffic-control/examples/adaptive-red-tests.cc \
../ns3-mmwave/src/traffic-control/examples/codel-vs-pfifo-asymmetric.cc \
../ns3-mmwave/src/traffic-control/examples/codel-vs-pfifo-basic-test.cc \
../ns3-mmwave/src/traffic-control/examples/pfifo-vs-red.cc \
../ns3-mmwave/src/traffic-control/examples/pie-example.cc \
../ns3-mmwave/src/traffic-control/examples/red-tests.cc \
../ns3-mmwave/src/traffic-control/examples/red-vs-ared.cc 

CC_DEPS += \
./ns3-mmwave/src/traffic-control/examples/adaptive-red-tests.d \
./ns3-mmwave/src/traffic-control/examples/codel-vs-pfifo-asymmetric.d \
./ns3-mmwave/src/traffic-control/examples/codel-vs-pfifo-basic-test.d \
./ns3-mmwave/src/traffic-control/examples/pfifo-vs-red.d \
./ns3-mmwave/src/traffic-control/examples/pie-example.d \
./ns3-mmwave/src/traffic-control/examples/red-tests.d \
./ns3-mmwave/src/traffic-control/examples/red-vs-ared.d 

OBJS += \
./ns3-mmwave/src/traffic-control/examples/adaptive-red-tests.o \
./ns3-mmwave/src/traffic-control/examples/codel-vs-pfifo-asymmetric.o \
./ns3-mmwave/src/traffic-control/examples/codel-vs-pfifo-basic-test.o \
./ns3-mmwave/src/traffic-control/examples/pfifo-vs-red.o \
./ns3-mmwave/src/traffic-control/examples/pie-example.o \
./ns3-mmwave/src/traffic-control/examples/red-tests.o \
./ns3-mmwave/src/traffic-control/examples/red-vs-ared.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/traffic-control/examples/%.o: ../ns3-mmwave/src/traffic-control/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


