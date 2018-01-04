################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/brite/examples/brite-MPI-example.cc \
../ns3-mmwave/src/brite/examples/brite-generic-example.cc 

CC_DEPS += \
./ns3-mmwave/src/brite/examples/brite-MPI-example.d \
./ns3-mmwave/src/brite/examples/brite-generic-example.d 

OBJS += \
./ns3-mmwave/src/brite/examples/brite-MPI-example.o \
./ns3-mmwave/src/brite/examples/brite-generic-example.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/brite/examples/%.o: ../ns3-mmwave/src/brite/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


