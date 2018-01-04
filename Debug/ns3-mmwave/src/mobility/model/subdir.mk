################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/mobility/model/box.cc \
../ns3-mmwave/src/mobility/model/constant-acceleration-mobility-model.cc \
../ns3-mmwave/src/mobility/model/constant-position-mobility-model.cc \
../ns3-mmwave/src/mobility/model/constant-velocity-helper.cc \
../ns3-mmwave/src/mobility/model/constant-velocity-mobility-model.cc \
../ns3-mmwave/src/mobility/model/gauss-markov-mobility-model.cc \
../ns3-mmwave/src/mobility/model/geographic-positions.cc \
../ns3-mmwave/src/mobility/model/hierarchical-mobility-model.cc \
../ns3-mmwave/src/mobility/model/mobility-model.cc \
../ns3-mmwave/src/mobility/model/position-allocator.cc \
../ns3-mmwave/src/mobility/model/random-direction-2d-mobility-model.cc \
../ns3-mmwave/src/mobility/model/random-walk-2d-mobility-model.cc \
../ns3-mmwave/src/mobility/model/random-waypoint-mobility-model.cc \
../ns3-mmwave/src/mobility/model/rectangle.cc \
../ns3-mmwave/src/mobility/model/steady-state-random-waypoint-mobility-model.cc \
../ns3-mmwave/src/mobility/model/waypoint-mobility-model.cc \
../ns3-mmwave/src/mobility/model/waypoint.cc 

CC_DEPS += \
./ns3-mmwave/src/mobility/model/box.d \
./ns3-mmwave/src/mobility/model/constant-acceleration-mobility-model.d \
./ns3-mmwave/src/mobility/model/constant-position-mobility-model.d \
./ns3-mmwave/src/mobility/model/constant-velocity-helper.d \
./ns3-mmwave/src/mobility/model/constant-velocity-mobility-model.d \
./ns3-mmwave/src/mobility/model/gauss-markov-mobility-model.d \
./ns3-mmwave/src/mobility/model/geographic-positions.d \
./ns3-mmwave/src/mobility/model/hierarchical-mobility-model.d \
./ns3-mmwave/src/mobility/model/mobility-model.d \
./ns3-mmwave/src/mobility/model/position-allocator.d \
./ns3-mmwave/src/mobility/model/random-direction-2d-mobility-model.d \
./ns3-mmwave/src/mobility/model/random-walk-2d-mobility-model.d \
./ns3-mmwave/src/mobility/model/random-waypoint-mobility-model.d \
./ns3-mmwave/src/mobility/model/rectangle.d \
./ns3-mmwave/src/mobility/model/steady-state-random-waypoint-mobility-model.d \
./ns3-mmwave/src/mobility/model/waypoint-mobility-model.d \
./ns3-mmwave/src/mobility/model/waypoint.d 

OBJS += \
./ns3-mmwave/src/mobility/model/box.o \
./ns3-mmwave/src/mobility/model/constant-acceleration-mobility-model.o \
./ns3-mmwave/src/mobility/model/constant-position-mobility-model.o \
./ns3-mmwave/src/mobility/model/constant-velocity-helper.o \
./ns3-mmwave/src/mobility/model/constant-velocity-mobility-model.o \
./ns3-mmwave/src/mobility/model/gauss-markov-mobility-model.o \
./ns3-mmwave/src/mobility/model/geographic-positions.o \
./ns3-mmwave/src/mobility/model/hierarchical-mobility-model.o \
./ns3-mmwave/src/mobility/model/mobility-model.o \
./ns3-mmwave/src/mobility/model/position-allocator.o \
./ns3-mmwave/src/mobility/model/random-direction-2d-mobility-model.o \
./ns3-mmwave/src/mobility/model/random-walk-2d-mobility-model.o \
./ns3-mmwave/src/mobility/model/random-waypoint-mobility-model.o \
./ns3-mmwave/src/mobility/model/rectangle.o \
./ns3-mmwave/src/mobility/model/steady-state-random-waypoint-mobility-model.o \
./ns3-mmwave/src/mobility/model/waypoint-mobility-model.o \
./ns3-mmwave/src/mobility/model/waypoint.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/mobility/model/%.o: ../ns3-mmwave/src/mobility/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


