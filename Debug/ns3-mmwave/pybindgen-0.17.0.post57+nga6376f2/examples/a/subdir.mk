################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/examples/a/a.cc 

CC_DEPS += \
./ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/examples/a/a.d 

OBJS += \
./ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/examples/a/a.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/examples/a/%.o: ../ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/examples/a/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


