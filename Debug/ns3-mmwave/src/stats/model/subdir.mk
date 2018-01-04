################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../ns3-mmwave/src/stats/model/boolean-probe.cc \
../ns3-mmwave/src/stats/model/data-calculator.cc \
../ns3-mmwave/src/stats/model/data-collection-object.cc \
../ns3-mmwave/src/stats/model/data-collector.cc \
../ns3-mmwave/src/stats/model/data-output-interface.cc \
../ns3-mmwave/src/stats/model/double-probe.cc \
../ns3-mmwave/src/stats/model/file-aggregator.cc \
../ns3-mmwave/src/stats/model/get-wildcard-matches.cc \
../ns3-mmwave/src/stats/model/gnuplot-aggregator.cc \
../ns3-mmwave/src/stats/model/gnuplot.cc \
../ns3-mmwave/src/stats/model/omnet-data-output.cc \
../ns3-mmwave/src/stats/model/probe.cc \
../ns3-mmwave/src/stats/model/sqlite-data-output.cc \
../ns3-mmwave/src/stats/model/time-data-calculators.cc \
../ns3-mmwave/src/stats/model/time-probe.cc \
../ns3-mmwave/src/stats/model/time-series-adaptor.cc \
../ns3-mmwave/src/stats/model/uinteger-16-probe.cc \
../ns3-mmwave/src/stats/model/uinteger-32-probe.cc \
../ns3-mmwave/src/stats/model/uinteger-8-probe.cc 

CC_DEPS += \
./ns3-mmwave/src/stats/model/boolean-probe.d \
./ns3-mmwave/src/stats/model/data-calculator.d \
./ns3-mmwave/src/stats/model/data-collection-object.d \
./ns3-mmwave/src/stats/model/data-collector.d \
./ns3-mmwave/src/stats/model/data-output-interface.d \
./ns3-mmwave/src/stats/model/double-probe.d \
./ns3-mmwave/src/stats/model/file-aggregator.d \
./ns3-mmwave/src/stats/model/get-wildcard-matches.d \
./ns3-mmwave/src/stats/model/gnuplot-aggregator.d \
./ns3-mmwave/src/stats/model/gnuplot.d \
./ns3-mmwave/src/stats/model/omnet-data-output.d \
./ns3-mmwave/src/stats/model/probe.d \
./ns3-mmwave/src/stats/model/sqlite-data-output.d \
./ns3-mmwave/src/stats/model/time-data-calculators.d \
./ns3-mmwave/src/stats/model/time-probe.d \
./ns3-mmwave/src/stats/model/time-series-adaptor.d \
./ns3-mmwave/src/stats/model/uinteger-16-probe.d \
./ns3-mmwave/src/stats/model/uinteger-32-probe.d \
./ns3-mmwave/src/stats/model/uinteger-8-probe.d 

OBJS += \
./ns3-mmwave/src/stats/model/boolean-probe.o \
./ns3-mmwave/src/stats/model/data-calculator.o \
./ns3-mmwave/src/stats/model/data-collection-object.o \
./ns3-mmwave/src/stats/model/data-collector.o \
./ns3-mmwave/src/stats/model/data-output-interface.o \
./ns3-mmwave/src/stats/model/double-probe.o \
./ns3-mmwave/src/stats/model/file-aggregator.o \
./ns3-mmwave/src/stats/model/get-wildcard-matches.o \
./ns3-mmwave/src/stats/model/gnuplot-aggregator.o \
./ns3-mmwave/src/stats/model/gnuplot.o \
./ns3-mmwave/src/stats/model/omnet-data-output.o \
./ns3-mmwave/src/stats/model/probe.o \
./ns3-mmwave/src/stats/model/sqlite-data-output.o \
./ns3-mmwave/src/stats/model/time-data-calculators.o \
./ns3-mmwave/src/stats/model/time-probe.o \
./ns3-mmwave/src/stats/model/time-series-adaptor.o \
./ns3-mmwave/src/stats/model/uinteger-16-probe.o \
./ns3-mmwave/src/stats/model/uinteger-32-probe.o \
./ns3-mmwave/src/stats/model/uinteger-8-probe.o 


# Each subdirectory must supply rules for building sources it contributes
ns3-mmwave/src/stats/model/%.o: ../ns3-mmwave/src/stats/model/%.cc
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


