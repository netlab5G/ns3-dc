################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/examples/routing/dynamic-global-routing.cc \
../ns3-mmwave/examples/routing/global-injection-slash32.cc \
../ns3-mmwave/examples/routing/global-routing-multi-switch-plus-router.cc \
../ns3-mmwave/examples/routing/global-routing-slash32.cc \
../ns3-mmwave/examples/routing/manet-routing-compare.cc \
../ns3-mmwave/examples/routing/mixed-global-routing.cc \
../ns3-mmwave/examples/routing/rip-simple-network.cc \
../ns3-mmwave/examples/routing/ripng-simple-network.cc \
../ns3-mmwave/examples/routing/simple-alternate-routing.cc \
../ns3-mmwave/examples/routing/simple-global-routing.cc \
../ns3-mmwave/examples/routing/simple-routing-ping6.cc \
../ns3-mmwave/examples/routing/static-routing-slash32.cc 

CC_DEPS += \
./ns3-mmwave/examples/routing/dynamic-global-routing.d \
./ns3-mmwave/examples/routing/global-injection-slash32.d \
./ns3-mmwave/examples/routing/global-routing-multi-switch-plus-router.d \
./ns3-mmwave/examples/routing/global-routing-slash32.d \
./ns3-mmwave/examples/routing/manet-routing-compare.d \
./ns3-mmwave/examples/routing/mixed-global-routing.d \
./ns3-mmwave/examples/routing/rip-simple-network.d \
./ns3-mmwave/examples/routing/ripng-simple-network.d \
./ns3-mmwave/examples/routing/simple-alternate-routing.d \
./ns3-mmwave/examples/routing/simple-global-routing.d \
./ns3-mmwave/examples/routing/simple-routing-ping6.d \
./ns3-mmwave/examples/routing/static-routing-slash32.d 

OBJS += \
./ns3-mmwave/examples/routing/dynamic-global-routing.o \
./ns3-mmwave/examples/routing/global-injection-slash32.o \
./ns3-mmwave/examples/routing/global-routing-multi-switch-plus-router.o \
./ns3-mmwave/examples/routing/global-routing-slash32.o \
./ns3-mmwave/examples/routing/manet-routing-compare.o \
./ns3-mmwave/examples/routing/mixed-global-routing.o \
./ns3-mmwave/examples/routing/rip-simple-network.o \
./ns3-mmwave/examples/routing/ripng-simple-network.o \
./ns3-mmwave/examples/routing/simple-alternate-routing.o \
./ns3-mmwave/examples/routing/simple-global-routing.o \
./ns3-mmwave/examples/routing/simple-routing-ping6.o \
./ns3-mmwave/examples/routing/static-routing-slash32.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/examples/routing/%.o: ../ns3-mmwave/examples/routing/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


