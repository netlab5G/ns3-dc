################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/sixlowpan/test/sixlowpan-fragmentation-test.cc \
../ns3-mmwave/src/sixlowpan/test/sixlowpan-hc1-test.cc \
../ns3-mmwave/src/sixlowpan/test/sixlowpan-iphc-test.cc 

CC_DEPS += \
./ns3-mmwave/src/sixlowpan/test/sixlowpan-fragmentation-test.d \
./ns3-mmwave/src/sixlowpan/test/sixlowpan-hc1-test.d \
./ns3-mmwave/src/sixlowpan/test/sixlowpan-iphc-test.d 

OBJS += \
./ns3-mmwave/src/sixlowpan/test/sixlowpan-fragmentation-test.o \
./ns3-mmwave/src/sixlowpan/test/sixlowpan-hc1-test.o \
./ns3-mmwave/src/sixlowpan/test/sixlowpan-iphc-test.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/sixlowpan/test/%.o: ../ns3-mmwave/src/sixlowpan/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


