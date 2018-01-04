################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/point-to-point-layout/model/point-to-point-dumbbell.cc \
../ns3-mmwave/src/point-to-point-layout/model/point-to-point-grid.cc \
../ns3-mmwave/src/point-to-point-layout/model/point-to-point-star.cc 

CC_DEPS += \
./ns3-mmwave/src/point-to-point-layout/model/point-to-point-dumbbell.d \
./ns3-mmwave/src/point-to-point-layout/model/point-to-point-grid.d \
./ns3-mmwave/src/point-to-point-layout/model/point-to-point-star.d 

OBJS += \
./ns3-mmwave/src/point-to-point-layout/model/point-to-point-dumbbell.o \
./ns3-mmwave/src/point-to-point-layout/model/point-to-point-grid.o \
./ns3-mmwave/src/point-to-point-layout/model/point-to-point-star.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/point-to-point-layout/model/%.o: ../ns3-mmwave/src/point-to-point-layout/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


