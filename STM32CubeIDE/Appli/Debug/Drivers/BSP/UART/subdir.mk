################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/Software_Package/Drivers/BSP/UART/uart.c 

OBJS += \
./Drivers/BSP/UART/uart.o 

C_DEPS += \
./Drivers/BSP/UART/uart.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/UART/uart.o: E:/Software_Package/Drivers/BSP/UART/uart.c Drivers/BSP/UART/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N647xx -DBSP_UART_RX_DISABLE -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_HAS_PARALLEL_NETWORKS=0 -DTX_EXECUTION_PROFILE_ENABLE -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_THREADX -DLL_ATON_SW_FALLBACK -c -I../../../Appli/Core/Inc -I../../../Secure_nsclib -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Include -I"E:/Software_Package/Drivers/BSP/NORFlash" -I"E:/Software_Package/Drivers/BSP/HyperRAM" -I"E:/Software_Package/Drivers/BSP/LED" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Drivers/BSP/LCD" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Drivers/BSP/BUS" -I"E:/Software_Package/Drivers/BSP/UART" -I"E:/Software_Package/STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/DSP/Include" -I"E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/inc" -I"E:/Software_Package/Middlewares/THREADX/common/inc" -I"E:/Software_Package/Middlewares/THREADX/utility/execution_profile_kit" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -I"E:/Software_Package/Middlewares/STM32_MW_ISP/isp/Inc" -I"E:/Software_Package/Middlewares/STM32_MW_ISP/evision/Inc" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/STM32_MW_ISP" -I"E:/Software_Package/Middlewares/STM32_MW_CAMERA" -I"E:/Software_Package/Middlewares/STM32_MW_CAMERA/sensors" -I"E:/Software_Package/Middlewares/STM32_MW_CAMERA/sensors/imx335" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/STM32_MW_CAMERA" -I"E:/Software_Package/Middlewares/AI/Inc" -I"E:/Software_Package/Middlewares/AI/Npu/ll_aton" -I"E:/Software_Package/Middlewares/AI/Npu/Devices/STM32N6XX" -I"E:/Software_Package/Middlewares/STM32_VISION_MODELS_PP/Inc" -I"E:/Software_Package/STM32Cube_FW_N6_V1.0.0/Utilities/lcd" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Model" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-UART

clean-Drivers-2f-BSP-2f-UART:
	-$(RM) ./Drivers/BSP/UART/uart.cyclo ./Drivers/BSP/UART/uart.d ./Drivers/BSP/UART/uart.o ./Drivers/BSP/UART/uart.su

.PHONY: clean-Drivers-2f-BSP-2f-UART

