################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../._main.c \
../GroveTemperature\ Sensor.c \
../adc-api.c \
../cloud-api.c \
../command.c \
../wifi-auto.c 

OBJS += \
./._main.o \
./GroveTemperature\ Sensor.o \
./adc-api.o \
./cloud-api.o \
./command.o \
./wifi-auto.o 

C_DEPS += \
./._main.d \
./GroveTemperature\ Sensor.d \
./adc-api.d \
./cloud-api.d \
./command.d \
./wifi-auto.d 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARTIK GCC C Compiler'
	arm-none-eabi-gcc  -D__TINYARA__ -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/include" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/include/apps" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/framework_include" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/apps_include" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/apps_include/netutils" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include/base" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include/connectivity" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include/systemio" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include/wifi" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include/lwm2m" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include/mqtt" -O0 -ffunction-sections -fdata-sections -fno-builtin -fno-strict-aliasing -fno-strength-reduce -fomit-frame-pointer -Wstrict-prototypes -Wshadow -Wno-implicit-function-declaration -Wno-unused-function -Wno-unused-but-set-variable -DAPP_STACKSIZE=18432 -DAPP_PRIORITY=100 -mcpu=cortex-r4 -mfpu=vfpv3 -g -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

GroveTemperature\ Sensor.o: ../GroveTemperature\ Sensor.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARTIK GCC C Compiler'
	arm-none-eabi-gcc  -D__TINYARA__ -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/include" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/include/apps" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/framework_include" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/apps_include" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/apps_include/netutils" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include/base" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include/connectivity" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include/systemio" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include/wifi" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include/lwm2m" -I"/home/maliyu/artik_ide_lin/SDK/A053/v1.7/libsdk/extra/artik-sdk_include/mqtt" -O0 -ffunction-sections -fdata-sections -fno-builtin -fno-strict-aliasing -fno-strength-reduce -fomit-frame-pointer -Wstrict-prototypes -Wshadow -Wno-implicit-function-declaration -Wno-unused-function -Wno-unused-but-set-variable -DAPP_STACKSIZE=18432 -DAPP_PRIORITY=100 -mcpu=cortex-r4 -mfpu=vfpv3 -g -MMD -MP -MF"GroveTemperature Sensor.d" -MT"GroveTemperature\ Sensor.d" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


