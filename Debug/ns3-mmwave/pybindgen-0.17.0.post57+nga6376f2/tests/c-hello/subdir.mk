################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/tests/c-hello/hello.c 

OBJS += \
./ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/tests/c-hello/hello.o 

C_DEPS += \
./ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/tests/c-hello/hello.d 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/tests/c-hello/%.o: ../ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/tests/c-hello/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


