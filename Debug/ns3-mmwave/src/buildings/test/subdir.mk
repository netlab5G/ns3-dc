################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/buildings/test/building-position-allocator-test.cc \
../ns3-mmwave/src/buildings/test/buildings-helper-test.cc \
../ns3-mmwave/src/buildings/test/buildings-pathloss-test.cc \
../ns3-mmwave/src/buildings/test/buildings-shadowing-test.cc 

CC_DEPS += \
./ns3-mmwave/src/buildings/test/building-position-allocator-test.d \
./ns3-mmwave/src/buildings/test/buildings-helper-test.d \
./ns3-mmwave/src/buildings/test/buildings-pathloss-test.d \
./ns3-mmwave/src/buildings/test/buildings-shadowing-test.d 

OBJS += \
./ns3-mmwave/src/buildings/test/building-position-allocator-test.o \
./ns3-mmwave/src/buildings/test/buildings-helper-test.o \
./ns3-mmwave/src/buildings/test/buildings-pathloss-test.o \
./ns3-mmwave/src/buildings/test/buildings-shadowing-test.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/buildings/test/%.o: ../ns3-mmwave/src/buildings/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


