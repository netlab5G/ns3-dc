################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/propagation/model/cost231-propagation-loss-model.cc \
../ns3-mmwave/src/propagation/model/itu-r-1411-los-propagation-loss-model.cc \
../ns3-mmwave/src/propagation/model/itu-r-1411-nlos-over-rooftop-propagation-loss-model.cc \
../ns3-mmwave/src/propagation/model/jakes-process.cc \
../ns3-mmwave/src/propagation/model/jakes-propagation-loss-model.cc \
../ns3-mmwave/src/propagation/model/kun-2600-mhz-propagation-loss-model.cc \
../ns3-mmwave/src/propagation/model/okumura-hata-propagation-loss-model.cc \
../ns3-mmwave/src/propagation/model/propagation-delay-model.cc \
../ns3-mmwave/src/propagation/model/propagation-loss-model.cc 

CC_DEPS += \
./ns3-mmwave/src/propagation/model/cost231-propagation-loss-model.d \
./ns3-mmwave/src/propagation/model/itu-r-1411-los-propagation-loss-model.d \
./ns3-mmwave/src/propagation/model/itu-r-1411-nlos-over-rooftop-propagation-loss-model.d \
./ns3-mmwave/src/propagation/model/jakes-process.d \
./ns3-mmwave/src/propagation/model/jakes-propagation-loss-model.d \
./ns3-mmwave/src/propagation/model/kun-2600-mhz-propagation-loss-model.d \
./ns3-mmwave/src/propagation/model/okumura-hata-propagation-loss-model.d \
./ns3-mmwave/src/propagation/model/propagation-delay-model.d \
./ns3-mmwave/src/propagation/model/propagation-loss-model.d 

OBJS += \
./ns3-mmwave/src/propagation/model/cost231-propagation-loss-model.o \
./ns3-mmwave/src/propagation/model/itu-r-1411-los-propagation-loss-model.o \
./ns3-mmwave/src/propagation/model/itu-r-1411-nlos-over-rooftop-propagation-loss-model.o \
./ns3-mmwave/src/propagation/model/jakes-process.o \
./ns3-mmwave/src/propagation/model/jakes-propagation-loss-model.o \
./ns3-mmwave/src/propagation/model/kun-2600-mhz-propagation-loss-model.o \
./ns3-mmwave/src/propagation/model/okumura-hata-propagation-loss-model.o \
./ns3-mmwave/src/propagation/model/propagation-delay-model.o \
./ns3-mmwave/src/propagation/model/propagation-loss-model.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/propagation/model/%.o: ../ns3-mmwave/src/propagation/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


