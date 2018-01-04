################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/test/traced/traced-callback-typedef-test-suite.cc \
../ns3-mmwave/src/test/traced/traced-value-callback-typedef-test-suite.cc 

CC_DEPS += \
./ns3-mmwave/src/test/traced/traced-callback-typedef-test-suite.d \
./ns3-mmwave/src/test/traced/traced-value-callback-typedef-test-suite.d 

OBJS += \
./ns3-mmwave/src/test/traced/traced-callback-typedef-test-suite.o \
./ns3-mmwave/src/test/traced/traced-value-callback-typedef-test-suite.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/test/traced/%.o: ../ns3-mmwave/src/test/traced/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


