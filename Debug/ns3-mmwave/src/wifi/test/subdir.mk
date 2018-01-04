################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/wifi/test/block-ack-test-suite.cc \
../ns3-mmwave/src/wifi/test/dcf-manager-test.cc \
../ns3-mmwave/src/wifi/test/power-rate-adaptation-test.cc \
../ns3-mmwave/src/wifi/test/spectrum-wifi-phy-test.cc \
../ns3-mmwave/src/wifi/test/tx-duration-test.cc \
../ns3-mmwave/src/wifi/test/wifi-aggregation-test.cc \
../ns3-mmwave/src/wifi/test/wifi-error-rate-models-test.cc \
../ns3-mmwave/src/wifi/test/wifi-test.cc 

C_SRCS += \
../ns3-mmwave/src/wifi/test/80211b.c 

CC_DEPS += \
./ns3-mmwave/src/wifi/test/block-ack-test-suite.d \
./ns3-mmwave/src/wifi/test/dcf-manager-test.d \
./ns3-mmwave/src/wifi/test/power-rate-adaptation-test.d \
./ns3-mmwave/src/wifi/test/spectrum-wifi-phy-test.d \
./ns3-mmwave/src/wifi/test/tx-duration-test.d \
./ns3-mmwave/src/wifi/test/wifi-aggregation-test.d \
./ns3-mmwave/src/wifi/test/wifi-error-rate-models-test.d \
./ns3-mmwave/src/wifi/test/wifi-test.d 

OBJS += \
./ns3-mmwave/src/wifi/test/80211b.o \
./ns3-mmwave/src/wifi/test/block-ack-test-suite.o \
./ns3-mmwave/src/wifi/test/dcf-manager-test.o \
./ns3-mmwave/src/wifi/test/power-rate-adaptation-test.o \
./ns3-mmwave/src/wifi/test/spectrum-wifi-phy-test.o \
./ns3-mmwave/src/wifi/test/tx-duration-test.o \
./ns3-mmwave/src/wifi/test/wifi-aggregation-test.o \
./ns3-mmwave/src/wifi/test/wifi-error-rate-models-test.o \
./ns3-mmwave/src/wifi/test/wifi-test.o 

C_DEPS += \
./ns3-mmwave/src/wifi/test/80211b.d 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/wifi/test/%.o: ../ns3-mmwave/src/wifi/test/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross GCC Compiler'
	gcc -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

ns3-mmwave/src/wifi/test/%.o: ../ns3-mmwave/src/wifi/test/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


