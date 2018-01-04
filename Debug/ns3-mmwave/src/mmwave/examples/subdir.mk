################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/mmwave/examples/dce-example-mptcp-mmwave.cc \
../ns3-mmwave/src/mmwave/examples/mc-twoenbs.cc \
../ns3-mmwave/src/mmwave/examples/mmwave-amc-test.cc \
../ns3-mmwave/src/mmwave/examples/mmwave-amc-test2.cc \
../ns3-mmwave/src/mmwave/examples/mmwave-epc-amc-test.cc \
../ns3-mmwave/src/mmwave/examples/mmwave-epc-tdma.cc \
../ns3-mmwave/src/mmwave/examples/mmwave-example.cc \
../ns3-mmwave/src/mmwave/examples/mmwave-simple-building-obstacle.cc \
../ns3-mmwave/src/mmwave/examples/mmwave-simple-epc.cc \
../ns3-mmwave/src/mmwave/examples/mmwave-tcp-building-example.cc \
../ns3-mmwave/src/mmwave/examples/mmwave-tcp-example.cc \
../ns3-mmwave/src/mmwave/examples/mmwave-tcp-raytracing-example.cc \
../ns3-mmwave/src/mmwave/examples/mmwave-tdma.cc 

CC_DEPS += \
./ns3-mmwave/src/mmwave/examples/dce-example-mptcp-mmwave.d \
./ns3-mmwave/src/mmwave/examples/mc-twoenbs.d \
./ns3-mmwave/src/mmwave/examples/mmwave-amc-test.d \
./ns3-mmwave/src/mmwave/examples/mmwave-amc-test2.d \
./ns3-mmwave/src/mmwave/examples/mmwave-epc-amc-test.d \
./ns3-mmwave/src/mmwave/examples/mmwave-epc-tdma.d \
./ns3-mmwave/src/mmwave/examples/mmwave-example.d \
./ns3-mmwave/src/mmwave/examples/mmwave-simple-building-obstacle.d \
./ns3-mmwave/src/mmwave/examples/mmwave-simple-epc.d \
./ns3-mmwave/src/mmwave/examples/mmwave-tcp-building-example.d \
./ns3-mmwave/src/mmwave/examples/mmwave-tcp-example.d \
./ns3-mmwave/src/mmwave/examples/mmwave-tcp-raytracing-example.d \
./ns3-mmwave/src/mmwave/examples/mmwave-tdma.d 

OBJS += \
./ns3-mmwave/src/mmwave/examples/dce-example-mptcp-mmwave.o \
./ns3-mmwave/src/mmwave/examples/mc-twoenbs.o \
./ns3-mmwave/src/mmwave/examples/mmwave-amc-test.o \
./ns3-mmwave/src/mmwave/examples/mmwave-amc-test2.o \
./ns3-mmwave/src/mmwave/examples/mmwave-epc-amc-test.o \
./ns3-mmwave/src/mmwave/examples/mmwave-epc-tdma.o \
./ns3-mmwave/src/mmwave/examples/mmwave-example.o \
./ns3-mmwave/src/mmwave/examples/mmwave-simple-building-obstacle.o \
./ns3-mmwave/src/mmwave/examples/mmwave-simple-epc.o \
./ns3-mmwave/src/mmwave/examples/mmwave-tcp-building-example.o \
./ns3-mmwave/src/mmwave/examples/mmwave-tcp-example.o \
./ns3-mmwave/src/mmwave/examples/mmwave-tcp-raytracing-example.o \
./ns3-mmwave/src/mmwave/examples/mmwave-tdma.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/mmwave/examples/%.o: ../ns3-mmwave/src/mmwave/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


