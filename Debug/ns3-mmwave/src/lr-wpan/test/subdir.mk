################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/lr-wpan/test/lr-wpan-ack-test.cc \
../ns3-mmwave/src/lr-wpan/test/lr-wpan-cca-test.cc \
../ns3-mmwave/src/lr-wpan/test/lr-wpan-collision-test.cc \
../ns3-mmwave/src/lr-wpan/test/lr-wpan-ed-test.cc \
../ns3-mmwave/src/lr-wpan/test/lr-wpan-error-model-test.cc \
../ns3-mmwave/src/lr-wpan/test/lr-wpan-packet-test.cc \
../ns3-mmwave/src/lr-wpan/test/lr-wpan-pd-plme-sap-test.cc \
../ns3-mmwave/src/lr-wpan/test/lr-wpan-spectrum-value-helper-test.cc 

CC_DEPS += \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-ack-test.d \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-cca-test.d \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-collision-test.d \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-ed-test.d \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-error-model-test.d \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-packet-test.d \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-pd-plme-sap-test.d \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-spectrum-value-helper-test.d 

OBJS += \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-ack-test.o \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-cca-test.o \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-collision-test.o \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-ed-test.o \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-error-model-test.o \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-packet-test.o \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-pd-plme-sap-test.o \
./ns3-mmwave/src/lr-wpan/test/lr-wpan-spectrum-value-helper-test.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/lr-wpan/test/%.o: ../ns3-mmwave/src/lr-wpan/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


