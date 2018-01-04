################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/internet/helper/internet-stack-helper.cc \
../ns3-mmwave/src/internet/helper/internet-trace-helper.cc \
../ns3-mmwave/src/internet/helper/ipv4-address-helper.cc \
../ns3-mmwave/src/internet/helper/ipv4-global-routing-helper.cc \
../ns3-mmwave/src/internet/helper/ipv4-interface-container.cc \
../ns3-mmwave/src/internet/helper/ipv4-list-routing-helper.cc \
../ns3-mmwave/src/internet/helper/ipv4-routing-helper.cc \
../ns3-mmwave/src/internet/helper/ipv4-static-routing-helper.cc \
../ns3-mmwave/src/internet/helper/ipv6-address-helper.cc \
../ns3-mmwave/src/internet/helper/ipv6-interface-container.cc \
../ns3-mmwave/src/internet/helper/ipv6-list-routing-helper.cc \
../ns3-mmwave/src/internet/helper/ipv6-routing-helper.cc \
../ns3-mmwave/src/internet/helper/ipv6-static-routing-helper.cc \
../ns3-mmwave/src/internet/helper/rip-helper.cc \
../ns3-mmwave/src/internet/helper/ripng-helper.cc 

CC_DEPS += \
./ns3-mmwave/src/internet/helper/internet-stack-helper.d \
./ns3-mmwave/src/internet/helper/internet-trace-helper.d \
./ns3-mmwave/src/internet/helper/ipv4-address-helper.d \
./ns3-mmwave/src/internet/helper/ipv4-global-routing-helper.d \
./ns3-mmwave/src/internet/helper/ipv4-interface-container.d \
./ns3-mmwave/src/internet/helper/ipv4-list-routing-helper.d \
./ns3-mmwave/src/internet/helper/ipv4-routing-helper.d \
./ns3-mmwave/src/internet/helper/ipv4-static-routing-helper.d \
./ns3-mmwave/src/internet/helper/ipv6-address-helper.d \
./ns3-mmwave/src/internet/helper/ipv6-interface-container.d \
./ns3-mmwave/src/internet/helper/ipv6-list-routing-helper.d \
./ns3-mmwave/src/internet/helper/ipv6-routing-helper.d \
./ns3-mmwave/src/internet/helper/ipv6-static-routing-helper.d \
./ns3-mmwave/src/internet/helper/rip-helper.d \
./ns3-mmwave/src/internet/helper/ripng-helper.d 

OBJS += \
./ns3-mmwave/src/internet/helper/internet-stack-helper.o \
./ns3-mmwave/src/internet/helper/internet-trace-helper.o \
./ns3-mmwave/src/internet/helper/ipv4-address-helper.o \
./ns3-mmwave/src/internet/helper/ipv4-global-routing-helper.o \
./ns3-mmwave/src/internet/helper/ipv4-interface-container.o \
./ns3-mmwave/src/internet/helper/ipv4-list-routing-helper.o \
./ns3-mmwave/src/internet/helper/ipv4-routing-helper.o \
./ns3-mmwave/src/internet/helper/ipv4-static-routing-helper.o \
./ns3-mmwave/src/internet/helper/ipv6-address-helper.o \
./ns3-mmwave/src/internet/helper/ipv6-interface-container.o \
./ns3-mmwave/src/internet/helper/ipv6-list-routing-helper.o \
./ns3-mmwave/src/internet/helper/ipv6-routing-helper.o \
./ns3-mmwave/src/internet/helper/ipv6-static-routing-helper.o \
./ns3-mmwave/src/internet/helper/rip-helper.o \
./ns3-mmwave/src/internet/helper/ripng-helper.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/internet/helper/%.o: ../ns3-mmwave/src/internet/helper/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


