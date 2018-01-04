################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/build/.conf_check_f3cbea3d49a46bf16c8e1d8029b9164d/test.cpp 

OBJS += \
./ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/build/.conf_check_f3cbea3d49a46bf16c8e1d8029b9164d/test.o 

CPP_DEPS += \
./ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/build/.conf_check_f3cbea3d49a46bf16c8e1d8029b9164d/test.d 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/build/.conf_check_f3cbea3d49a46bf16c8e1d8029b9164d/%.o: ../ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/build/.conf_check_f3cbea3d49a46bf16c8e1d8029b9164d/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


