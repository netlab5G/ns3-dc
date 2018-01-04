################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/lte/examples/lena-cqi-threshold.cc \
../ns3-mmwave/src/lte/examples/lena-deactivate-bearer.cc \
../ns3-mmwave/src/lte/examples/lena-distributed-ffr.cc \
../ns3-mmwave/src/lte/examples/lena-dual-stripe.cc \
../ns3-mmwave/src/lte/examples/lena-fading.cc \
../ns3-mmwave/src/lte/examples/lena-frequency-reuse.cc \
../ns3-mmwave/src/lte/examples/lena-intercell-interference.cc \
../ns3-mmwave/src/lte/examples/lena-pathloss-traces.cc \
../ns3-mmwave/src/lte/examples/lena-profiling.cc \
../ns3-mmwave/src/lte/examples/lena-rem-sector-antenna.cc \
../ns3-mmwave/src/lte/examples/lena-rem.cc \
../ns3-mmwave/src/lte/examples/lena-rlc-traces.cc \
../ns3-mmwave/src/lte/examples/lena-simple-epc-emu.cc \
../ns3-mmwave/src/lte/examples/lena-simple-epc.cc \
../ns3-mmwave/src/lte/examples/lena-simple.cc \
../ns3-mmwave/src/lte/examples/lena-uplink-power-control.cc \
../ns3-mmwave/src/lte/examples/lena-x2-handover-measures.cc \
../ns3-mmwave/src/lte/examples/lena-x2-handover.cc 

CC_DEPS += \
./ns3-mmwave/src/lte/examples/lena-cqi-threshold.d \
./ns3-mmwave/src/lte/examples/lena-deactivate-bearer.d \
./ns3-mmwave/src/lte/examples/lena-distributed-ffr.d \
./ns3-mmwave/src/lte/examples/lena-dual-stripe.d \
./ns3-mmwave/src/lte/examples/lena-fading.d \
./ns3-mmwave/src/lte/examples/lena-frequency-reuse.d \
./ns3-mmwave/src/lte/examples/lena-intercell-interference.d \
./ns3-mmwave/src/lte/examples/lena-pathloss-traces.d \
./ns3-mmwave/src/lte/examples/lena-profiling.d \
./ns3-mmwave/src/lte/examples/lena-rem-sector-antenna.d \
./ns3-mmwave/src/lte/examples/lena-rem.d \
./ns3-mmwave/src/lte/examples/lena-rlc-traces.d \
./ns3-mmwave/src/lte/examples/lena-simple-epc-emu.d \
./ns3-mmwave/src/lte/examples/lena-simple-epc.d \
./ns3-mmwave/src/lte/examples/lena-simple.d \
./ns3-mmwave/src/lte/examples/lena-uplink-power-control.d \
./ns3-mmwave/src/lte/examples/lena-x2-handover-measures.d \
./ns3-mmwave/src/lte/examples/lena-x2-handover.d 

OBJS += \
./ns3-mmwave/src/lte/examples/lena-cqi-threshold.o \
./ns3-mmwave/src/lte/examples/lena-deactivate-bearer.o \
./ns3-mmwave/src/lte/examples/lena-distributed-ffr.o \
./ns3-mmwave/src/lte/examples/lena-dual-stripe.o \
./ns3-mmwave/src/lte/examples/lena-fading.o \
./ns3-mmwave/src/lte/examples/lena-frequency-reuse.o \
./ns3-mmwave/src/lte/examples/lena-intercell-interference.o \
./ns3-mmwave/src/lte/examples/lena-pathloss-traces.o \
./ns3-mmwave/src/lte/examples/lena-profiling.o \
./ns3-mmwave/src/lte/examples/lena-rem-sector-antenna.o \
./ns3-mmwave/src/lte/examples/lena-rem.o \
./ns3-mmwave/src/lte/examples/lena-rlc-traces.o \
./ns3-mmwave/src/lte/examples/lena-simple-epc-emu.o \
./ns3-mmwave/src/lte/examples/lena-simple-epc.o \
./ns3-mmwave/src/lte/examples/lena-simple.o \
./ns3-mmwave/src/lte/examples/lena-uplink-power-control.o \
./ns3-mmwave/src/lte/examples/lena-x2-handover-measures.o \
./ns3-mmwave/src/lte/examples/lena-x2-handover.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/lte/examples/%.o: ../ns3-mmwave/src/lte/examples/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


