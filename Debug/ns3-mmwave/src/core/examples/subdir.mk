################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/core/examples/command-line-example.cc \
../ns3-mmwave/src/core/examples/hash-example.cc \
../ns3-mmwave/src/core/examples/main-callback.cc \
../ns3-mmwave/src/core/examples/main-ptr.cc \
../ns3-mmwave/src/core/examples/main-random-variable-stream.cc \
../ns3-mmwave/src/core/examples/main-random-variable.cc \
../ns3-mmwave/src/core/examples/main-test-sync.cc \
../ns3-mmwave/src/core/examples/sample-log-time-format.cc \
../ns3-mmwave/src/core/examples/sample-random-variable-stream.cc \
../ns3-mmwave/src/core/examples/sample-random-variable.cc \
../ns3-mmwave/src/core/examples/sample-simulator.cc \
../ns3-mmwave/src/core/examples/test-string-value-formatting.cc 

CC_DEPS += \
./ns3-mmwave/src/core/examples/command-line-example.d \
./ns3-mmwave/src/core/examples/hash-example.d \
./ns3-mmwave/src/core/examples/main-callback.d \
./ns3-mmwave/src/core/examples/main-ptr.d \
./ns3-mmwave/src/core/examples/main-random-variable-stream.d \
./ns3-mmwave/src/core/examples/main-random-variable.d \
./ns3-mmwave/src/core/examples/main-test-sync.d \
./ns3-mmwave/src/core/examples/sample-log-time-format.d \
./ns3-mmwave/src/core/examples/sample-random-variable-stream.d \
./ns3-mmwave/src/core/examples/sample-random-variable.d \
./ns3-mmwave/src/core/examples/sample-simulator.d \
./ns3-mmwave/src/core/examples/test-string-value-formatting.d 

OBJS += \
./ns3-mmwave/src/core/examples/command-line-example.o \
./ns3-mmwave/src/core/examples/hash-example.o \
./ns3-mmwave/src/core/examples/main-callback.o \
./ns3-mmwave/src/core/examples/main-ptr.o \
./ns3-mmwave/src/core/examples/main-random-variable-stream.o \
./ns3-mmwave/src/core/examples/main-random-variable.o \
./ns3-mmwave/src/core/examples/main-test-sync.o \
./ns3-mmwave/src/core/examples/sample-log-time-format.o \
./ns3-mmwave/src/core/examples/sample-random-variable-stream.o \
./ns3-mmwave/src/core/examples/sample-random-variable.o \
./ns3-mmwave/src/core/examples/sample-simulator.o \
./ns3-mmwave/src/core/examples/test-string-value-formatting.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/core/examples/%.o: ../ns3-mmwave/src/core/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


