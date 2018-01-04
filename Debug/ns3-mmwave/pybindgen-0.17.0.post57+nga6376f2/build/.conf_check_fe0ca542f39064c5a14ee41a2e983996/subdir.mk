################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/build/.conf_check_fe0ca542f39064c5a14ee41a2e983996/test.cc 

CC_DEPS += \
./ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/build/.conf_check_fe0ca542f39064c5a14ee41a2e983996/test.d 

OBJS += \
./ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/build/.conf_check_fe0ca542f39064c5a14ee41a2e983996/test.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/build/.conf_check_fe0ca542f39064c5a14ee41a2e983996/%.o: ../ns3-mmwave/pybindgen-0.17.0.post57+nga6376f2/build/.conf_check_fe0ca542f39064c5a14ee41a2e983996/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


