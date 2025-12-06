################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/FSBL/Core/Src/extmem_manager.c \
E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/FSBL/Core/Src/main.c \
E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/FSBL/Core/Src/stm32n6xx_hal_msp.c \
E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/FSBL/Core/Src/stm32n6xx_it.c \
../Application/User/Core/syscalls.c \
../Application/User/Core/sysmem.c 

OBJS += \
./Application/User/Core/extmem_manager.o \
./Application/User/Core/main.o \
./Application/User/Core/stm32n6xx_hal_msp.o \
./Application/User/Core/stm32n6xx_it.o \
./Application/User/Core/syscalls.o \
./Application/User/Core/sysmem.o 

C_DEPS += \
./Application/User/Core/extmem_manager.d \
./Application/User/Core/main.d \
./Application/User/Core/stm32n6xx_hal_msp.d \
./Application/User/Core/stm32n6xx_it.d \
./Application/User/Core/syscalls.d \
./Application/User/Core/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/Core/extmem_manager.o: E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/FSBL/Core/Src/extmem_manager.c Application/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N647xx -c -I../../../FSBL/Core/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/boot -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/sal -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/psram -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/sdcard -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/user -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Include -I"E:/Software_Package/Drivers/BSP/NORFlash" -I"E:/Software_Package/Drivers/BSP/HyperRAM" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/Core/main.o: E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/FSBL/Core/Src/main.c Application/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N647xx -c -I../../../FSBL/Core/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/boot -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/sal -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/psram -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/sdcard -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/user -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Include -I"E:/Software_Package/Drivers/BSP/NORFlash" -I"E:/Software_Package/Drivers/BSP/HyperRAM" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/Core/stm32n6xx_hal_msp.o: E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/FSBL/Core/Src/stm32n6xx_hal_msp.c Application/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N647xx -c -I../../../FSBL/Core/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/boot -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/sal -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/psram -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/sdcard -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/user -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Include -I"E:/Software_Package/Drivers/BSP/NORFlash" -I"E:/Software_Package/Drivers/BSP/HyperRAM" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/Core/stm32n6xx_it.o: E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/FSBL/Core/Src/stm32n6xx_it.c Application/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N647xx -c -I../../../FSBL/Core/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/boot -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/sal -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/psram -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/sdcard -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/user -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Include -I"E:/Software_Package/Drivers/BSP/NORFlash" -I"E:/Software_Package/Drivers/BSP/HyperRAM" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Application/User/Core/%.o Application/User/Core/%.su Application/User/Core/%.cyclo: ../Application/User/Core/%.c Application/User/Core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N647xx -c -I../../../FSBL/Core/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/boot -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/sal -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/nor_sfdp -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/psram -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/sdcard -I../../../../../../STM32Cube_FW_N6_V1.0.0/Middlewares/ST/STM32_ExtMem_Manager/user -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Include -I"E:/Software_Package/Drivers/BSP/NORFlash" -I"E:/Software_Package/Drivers/BSP/HyperRAM" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-User-2f-Core

clean-Application-2f-User-2f-Core:
	-$(RM) ./Application/User/Core/extmem_manager.cyclo ./Application/User/Core/extmem_manager.d ./Application/User/Core/extmem_manager.o ./Application/User/Core/extmem_manager.su ./Application/User/Core/main.cyclo ./Application/User/Core/main.d ./Application/User/Core/main.o ./Application/User/Core/main.su ./Application/User/Core/stm32n6xx_hal_msp.cyclo ./Application/User/Core/stm32n6xx_hal_msp.d ./Application/User/Core/stm32n6xx_hal_msp.o ./Application/User/Core/stm32n6xx_hal_msp.su ./Application/User/Core/stm32n6xx_it.cyclo ./Application/User/Core/stm32n6xx_it.d ./Application/User/Core/stm32n6xx_it.o ./Application/User/Core/stm32n6xx_it.su ./Application/User/Core/syscalls.cyclo ./Application/User/Core/syscalls.d ./Application/User/Core/syscalls.o ./Application/User/Core/syscalls.su ./Application/User/Core/sysmem.cyclo ./Application/User/Core/sysmem.d ./Application/User/Core/sysmem.o ./Application/User/Core/sysmem.su

.PHONY: clean-Application-2f-User-2f-Core

