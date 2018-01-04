################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/mpi/model/distributed-simulator-impl.cc \
../ns3-mmwave/src/mpi/model/granted-time-window-mpi-interface.cc \
../ns3-mmwave/src/mpi/model/mpi-interface.cc \
../ns3-mmwave/src/mpi/model/mpi-receiver.cc \
../ns3-mmwave/src/mpi/model/null-message-mpi-interface.cc \
../ns3-mmwave/src/mpi/model/null-message-simulator-impl.cc \
../ns3-mmwave/src/mpi/model/remote-channel-bundle-manager.cc \
../ns3-mmwave/src/mpi/model/remote-channel-bundle.cc 

CC_DEPS += \
./ns3-mmwave/src/mpi/model/distributed-simulator-impl.d \
./ns3-mmwave/src/mpi/model/granted-time-window-mpi-interface.d \
./ns3-mmwave/src/mpi/model/mpi-interface.d \
./ns3-mmwave/src/mpi/model/mpi-receiver.d \
./ns3-mmwave/src/mpi/model/null-message-mpi-interface.d \
./ns3-mmwave/src/mpi/model/null-message-simulator-impl.d \
./ns3-mmwave/src/mpi/model/remote-channel-bundle-manager.d \
./ns3-mmwave/src/mpi/model/remote-channel-bundle.d 

OBJS += \
./ns3-mmwave/src/mpi/model/distributed-simulator-impl.o \
./ns3-mmwave/src/mpi/model/granted-time-window-mpi-interface.o \
./ns3-mmwave/src/mpi/model/mpi-interface.o \
./ns3-mmwave/src/mpi/model/mpi-receiver.o \
./ns3-mmwave/src/mpi/model/null-message-mpi-interface.o \
./ns3-mmwave/src/mpi/model/null-message-simulator-impl.o \
./ns3-mmwave/src/mpi/model/remote-channel-bundle-manager.o \
./ns3-mmwave/src/mpi/model/remote-channel-bundle.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/mpi/model/%.o: ../ns3-mmwave/src/mpi/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


