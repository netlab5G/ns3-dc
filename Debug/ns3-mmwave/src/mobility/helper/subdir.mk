################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/mobility/helper/mobility-helper.cc \
../ns3-mmwave/src/mobility/helper/ns2-mobility-helper.cc 

CC_DEPS += \
./ns3-mmwave/src/mobility/helper/mobility-helper.d \
./ns3-mmwave/src/mobility/helper/ns2-mobility-helper.d 

OBJS += \
./ns3-mmwave/src/mobility/helper/mobility-helper.o \
./ns3-mmwave/src/mobility/helper/ns2-mobility-helper.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/mobility/helper/%.o: ../ns3-mmwave/src/mobility/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


