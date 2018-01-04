################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/applications/test/udp-client-server-test.cc 

CC_DEPS += \
./ns3-mmwave/src/applications/test/udp-client-server-test.d 

OBJS += \
./ns3-mmwave/src/applications/test/udp-client-server-test.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/applications/test/%.o: ../ns3-mmwave/src/applications/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


