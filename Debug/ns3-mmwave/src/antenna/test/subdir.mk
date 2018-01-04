################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/antenna/test/test-angles.cc \
../ns3-mmwave/src/antenna/test/test-cosine-antenna.cc \
../ns3-mmwave/src/antenna/test/test-degrees-radians.cc \
../ns3-mmwave/src/antenna/test/test-isotropic-antenna.cc \
../ns3-mmwave/src/antenna/test/test-parabolic-antenna.cc 

CC_DEPS += \
./ns3-mmwave/src/antenna/test/test-angles.d \
./ns3-mmwave/src/antenna/test/test-cosine-antenna.d \
./ns3-mmwave/src/antenna/test/test-degrees-radians.d \
./ns3-mmwave/src/antenna/test/test-isotropic-antenna.d \
./ns3-mmwave/src/antenna/test/test-parabolic-antenna.d 

OBJS += \
./ns3-mmwave/src/antenna/test/test-angles.o \
./ns3-mmwave/src/antenna/test/test-cosine-antenna.o \
./ns3-mmwave/src/antenna/test/test-degrees-radians.o \
./ns3-mmwave/src/antenna/test/test-isotropic-antenna.o \
./ns3-mmwave/src/antenna/test/test-parabolic-antenna.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/antenna/test/%.o: ../ns3-mmwave/src/antenna/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


