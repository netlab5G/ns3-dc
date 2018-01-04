################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/examples/tutorial/fifth.cc \
../ns3-mmwave/examples/tutorial/first.cc \
../ns3-mmwave/examples/tutorial/fourth.cc \
../ns3-mmwave/examples/tutorial/hello-simulator.cc \
../ns3-mmwave/examples/tutorial/second.cc \
../ns3-mmwave/examples/tutorial/seventh.cc \
../ns3-mmwave/examples/tutorial/sixth.cc \
../ns3-mmwave/examples/tutorial/third.cc 

CC_DEPS += \
./ns3-mmwave/examples/tutorial/fifth.d \
./ns3-mmwave/examples/tutorial/first.d \
./ns3-mmwave/examples/tutorial/fourth.d \
./ns3-mmwave/examples/tutorial/hello-simulator.d \
./ns3-mmwave/examples/tutorial/second.d \
./ns3-mmwave/examples/tutorial/seventh.d \
./ns3-mmwave/examples/tutorial/sixth.d \
./ns3-mmwave/examples/tutorial/third.d 

OBJS += \
./ns3-mmwave/examples/tutorial/fifth.o \
./ns3-mmwave/examples/tutorial/first.o \
./ns3-mmwave/examples/tutorial/fourth.o \
./ns3-mmwave/examples/tutorial/hello-simulator.o \
./ns3-mmwave/examples/tutorial/second.o \
./ns3-mmwave/examples/tutorial/seventh.o \
./ns3-mmwave/examples/tutorial/sixth.o \
./ns3-mmwave/examples/tutorial/third.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/examples/tutorial/%.o: ../ns3-mmwave/examples/tutorial/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


