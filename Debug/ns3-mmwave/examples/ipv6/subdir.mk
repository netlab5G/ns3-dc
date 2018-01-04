################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/examples/ipv6/fragmentation-ipv6-two-MTU.cc \
../ns3-mmwave/examples/ipv6/fragmentation-ipv6.cc \
../ns3-mmwave/examples/ipv6/icmpv6-redirect.cc \
../ns3-mmwave/examples/ipv6/loose-routing-ipv6.cc \
../ns3-mmwave/examples/ipv6/ping6.cc \
../ns3-mmwave/examples/ipv6/radvd-two-prefix.cc \
../ns3-mmwave/examples/ipv6/radvd.cc \
../ns3-mmwave/examples/ipv6/test-ipv6.cc \
../ns3-mmwave/examples/ipv6/wsn-ping6.cc 

CC_DEPS += \
./ns3-mmwave/examples/ipv6/fragmentation-ipv6-two-MTU.d \
./ns3-mmwave/examples/ipv6/fragmentation-ipv6.d \
./ns3-mmwave/examples/ipv6/icmpv6-redirect.d \
./ns3-mmwave/examples/ipv6/loose-routing-ipv6.d \
./ns3-mmwave/examples/ipv6/ping6.d \
./ns3-mmwave/examples/ipv6/radvd-two-prefix.d \
./ns3-mmwave/examples/ipv6/radvd.d \
./ns3-mmwave/examples/ipv6/test-ipv6.d \
./ns3-mmwave/examples/ipv6/wsn-ping6.d 

OBJS += \
./ns3-mmwave/examples/ipv6/fragmentation-ipv6-two-MTU.o \
./ns3-mmwave/examples/ipv6/fragmentation-ipv6.o \
./ns3-mmwave/examples/ipv6/icmpv6-redirect.o \
./ns3-mmwave/examples/ipv6/loose-routing-ipv6.o \
./ns3-mmwave/examples/ipv6/ping6.o \
./ns3-mmwave/examples/ipv6/radvd-two-prefix.o \
./ns3-mmwave/examples/ipv6/radvd.o \
./ns3-mmwave/examples/ipv6/test-ipv6.o \
./ns3-mmwave/examples/ipv6/wsn-ping6.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/examples/ipv6/%.o: ../ns3-mmwave/examples/ipv6/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


