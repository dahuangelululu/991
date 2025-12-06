################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_secure_stack.c \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/txe_thread_secure_stack_allocate.c \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/txe_thread_secure_stack_free.c 

S_UPPER_SRCS += \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_misra.S \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_context_restore.S \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_context_save.S \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_interrupt_control.S \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_interrupt_disable.S \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_interrupt_restore.S \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_schedule.S \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_secure_stack_allocate.S \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_secure_stack_free.S \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_secure_stack_initialize.S \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_stack_build.S \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_system_return.S \
E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_timer_interrupt.S 

OBJS += \
./Middlewares/ThreadX/Ports/tx_misra.o \
./Middlewares/ThreadX/Ports/tx_thread_context_restore.o \
./Middlewares/ThreadX/Ports/tx_thread_context_save.o \
./Middlewares/ThreadX/Ports/tx_thread_interrupt_control.o \
./Middlewares/ThreadX/Ports/tx_thread_interrupt_disable.o \
./Middlewares/ThreadX/Ports/tx_thread_interrupt_restore.o \
./Middlewares/ThreadX/Ports/tx_thread_schedule.o \
./Middlewares/ThreadX/Ports/tx_thread_secure_stack.o \
./Middlewares/ThreadX/Ports/tx_thread_secure_stack_allocate.o \
./Middlewares/ThreadX/Ports/tx_thread_secure_stack_free.o \
./Middlewares/ThreadX/Ports/tx_thread_secure_stack_initialize.o \
./Middlewares/ThreadX/Ports/tx_thread_stack_build.o \
./Middlewares/ThreadX/Ports/tx_thread_system_return.o \
./Middlewares/ThreadX/Ports/tx_timer_interrupt.o \
./Middlewares/ThreadX/Ports/txe_thread_secure_stack_allocate.o \
./Middlewares/ThreadX/Ports/txe_thread_secure_stack_free.o 

S_UPPER_DEPS += \
./Middlewares/ThreadX/Ports/tx_misra.d \
./Middlewares/ThreadX/Ports/tx_thread_context_restore.d \
./Middlewares/ThreadX/Ports/tx_thread_context_save.d \
./Middlewares/ThreadX/Ports/tx_thread_interrupt_control.d \
./Middlewares/ThreadX/Ports/tx_thread_interrupt_disable.d \
./Middlewares/ThreadX/Ports/tx_thread_interrupt_restore.d \
./Middlewares/ThreadX/Ports/tx_thread_schedule.d \
./Middlewares/ThreadX/Ports/tx_thread_secure_stack_allocate.d \
./Middlewares/ThreadX/Ports/tx_thread_secure_stack_free.d \
./Middlewares/ThreadX/Ports/tx_thread_secure_stack_initialize.d \
./Middlewares/ThreadX/Ports/tx_thread_stack_build.d \
./Middlewares/ThreadX/Ports/tx_thread_system_return.d \
./Middlewares/ThreadX/Ports/tx_timer_interrupt.d 

C_DEPS += \
./Middlewares/ThreadX/Ports/tx_thread_secure_stack.d \
./Middlewares/ThreadX/Ports/txe_thread_secure_stack_allocate.d \
./Middlewares/ThreadX/Ports/txe_thread_secure_stack_free.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/ThreadX/Ports/tx_misra.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_misra.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/tx_thread_context_restore.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_context_restore.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/tx_thread_context_save.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_context_save.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/tx_thread_interrupt_control.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_interrupt_control.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/tx_thread_interrupt_disable.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_interrupt_disable.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/tx_thread_interrupt_restore.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_interrupt_restore.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/tx_thread_schedule.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_schedule.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/tx_thread_secure_stack.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_secure_stack.c Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N647xx -DBSP_UART_RX_DISABLE -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_HAS_PARALLEL_NETWORKS=0 -DTX_EXECUTION_PROFILE_ENABLE -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_THREADX -DLL_ATON_SW_FALLBACK -c -I../../../Appli/Core/Inc -I../../../Secure_nsclib -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Include -I"E:/Software_Package/Drivers/BSP/NORFlash" -I"E:/Software_Package/Drivers/BSP/HyperRAM" -I"E:/Software_Package/Drivers/BSP/LED" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Drivers/BSP/LCD" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Drivers/BSP/BUS" -I"E:/Software_Package/Drivers/BSP/UART" -I"E:/Software_Package/STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/DSP/Include" -I"E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/inc" -I"E:/Software_Package/Middlewares/THREADX/common/inc" -I"E:/Software_Package/Middlewares/THREADX/utility/execution_profile_kit" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -I"E:/Software_Package/Middlewares/STM32_MW_ISP/isp/Inc" -I"E:/Software_Package/Middlewares/STM32_MW_ISP/evision/Inc" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/STM32_MW_ISP" -I"E:/Software_Package/Middlewares/STM32_MW_CAMERA" -I"E:/Software_Package/Middlewares/STM32_MW_CAMERA/sensors" -I"E:/Software_Package/Middlewares/STM32_MW_CAMERA/sensors/imx335" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/STM32_MW_CAMERA" -I"E:/Software_Package/Middlewares/AI/Inc" -I"E:/Software_Package/Middlewares/AI/Npu/ll_aton" -I"E:/Software_Package/Middlewares/AI/Npu/Devices/STM32N6XX" -I"E:/Software_Package/Middlewares/STM32_VISION_MODELS_PP/Inc" -I"E:/Software_Package/STM32Cube_FW_N6_V1.0.0/Utilities/lcd" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Model" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/ThreadX/Ports/tx_thread_secure_stack_allocate.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_secure_stack_allocate.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/tx_thread_secure_stack_free.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_secure_stack_free.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/tx_thread_secure_stack_initialize.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_secure_stack_initialize.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/tx_thread_stack_build.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_stack_build.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/tx_thread_system_return.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_thread_system_return.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/tx_timer_interrupt.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/tx_timer_interrupt.S Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m55 -g3 -DDEBUG -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_EXECUTION_PROFILE_ENABLE -c -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Middlewares/ThreadX/Ports/txe_thread_secure_stack_allocate.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/txe_thread_secure_stack_allocate.c Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N647xx -DBSP_UART_RX_DISABLE -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_HAS_PARALLEL_NETWORKS=0 -DTX_EXECUTION_PROFILE_ENABLE -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_THREADX -DLL_ATON_SW_FALLBACK -c -I../../../Appli/Core/Inc -I../../../Secure_nsclib -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Include -I"E:/Software_Package/Drivers/BSP/NORFlash" -I"E:/Software_Package/Drivers/BSP/HyperRAM" -I"E:/Software_Package/Drivers/BSP/LED" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Drivers/BSP/LCD" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Drivers/BSP/BUS" -I"E:/Software_Package/Drivers/BSP/UART" -I"E:/Software_Package/STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/DSP/Include" -I"E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/inc" -I"E:/Software_Package/Middlewares/THREADX/common/inc" -I"E:/Software_Package/Middlewares/THREADX/utility/execution_profile_kit" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -I"E:/Software_Package/Middlewares/STM32_MW_ISP/isp/Inc" -I"E:/Software_Package/Middlewares/STM32_MW_ISP/evision/Inc" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/STM32_MW_ISP" -I"E:/Software_Package/Middlewares/STM32_MW_CAMERA" -I"E:/Software_Package/Middlewares/STM32_MW_CAMERA/sensors" -I"E:/Software_Package/Middlewares/STM32_MW_CAMERA/sensors/imx335" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/STM32_MW_CAMERA" -I"E:/Software_Package/Middlewares/AI/Inc" -I"E:/Software_Package/Middlewares/AI/Npu/ll_aton" -I"E:/Software_Package/Middlewares/AI/Npu/Devices/STM32N6XX" -I"E:/Software_Package/Middlewares/STM32_VISION_MODELS_PP/Inc" -I"E:/Software_Package/STM32Cube_FW_N6_V1.0.0/Utilities/lcd" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Model" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/ThreadX/Ports/txe_thread_secure_stack_free.o: E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/src/txe_thread_secure_stack_free.c Middlewares/ThreadX/Ports/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m55 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32N647xx -DBSP_UART_RX_DISABLE -DTX_SINGLE_MODE_SECURE -DTX_INCLUDE_USER_DEFINE_FILE -DTX_HAS_PARALLEL_NETWORKS=0 -DTX_EXECUTION_PROFILE_ENABLE -DLL_ATON_PLATFORM=LL_ATON_PLAT_STM32N6 -DLL_ATON_OSAL=LL_ATON_OSAL_THREADX -DLL_ATON_SW_FALLBACK -c -I../../../Appli/Core/Inc -I../../../Secure_nsclib -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Device/ST/STM32N6xx/Include -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/STM32N6xx_HAL_Driver/Inc/Legacy -I../../../../../../STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/Include -I"E:/Software_Package/Drivers/BSP/NORFlash" -I"E:/Software_Package/Drivers/BSP/HyperRAM" -I"E:/Software_Package/Drivers/BSP/LED" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Drivers/BSP/LCD" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Drivers/BSP/BUS" -I"E:/Software_Package/Drivers/BSP/UART" -I"E:/Software_Package/STM32Cube_FW_N6_V1.0.0/Drivers/CMSIS/DSP/Include" -I"E:/Software_Package/Middlewares/THREADX/ports/cortex_m55/gnu/inc" -I"E:/Software_Package/Middlewares/THREADX/common/inc" -I"E:/Software_Package/Middlewares/THREADX/utility/execution_profile_kit" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/ThreadX/App" -I"E:/Software_Package/Middlewares/STM32_MW_ISP/isp/Inc" -I"E:/Software_Package/Middlewares/STM32_MW_ISP/evision/Inc" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/STM32_MW_ISP" -I"E:/Software_Package/Middlewares/STM32_MW_CAMERA" -I"E:/Software_Package/Middlewares/STM32_MW_CAMERA/sensors" -I"E:/Software_Package/Middlewares/STM32_MW_CAMERA/sensors/imx335" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Appli/STM32_MW_CAMERA" -I"E:/Software_Package/Middlewares/AI/Inc" -I"E:/Software_Package/Middlewares/AI/Npu/ll_aton" -I"E:/Software_Package/Middlewares/AI/Npu/Devices/STM32N6XX" -I"E:/Software_Package/Middlewares/STM32_VISION_MODELS_PP/Inc" -I"E:/Software_Package/STM32Cube_FW_N6_V1.0.0/Utilities/lcd" -I"E:/Software_Package/Projects/99_Applications/991_AI_People_Detection/Model" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -mcmse -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-ThreadX-2f-Ports

clean-Middlewares-2f-ThreadX-2f-Ports:
	-$(RM) ./Middlewares/ThreadX/Ports/tx_misra.d ./Middlewares/ThreadX/Ports/tx_misra.o ./Middlewares/ThreadX/Ports/tx_thread_context_restore.d ./Middlewares/ThreadX/Ports/tx_thread_context_restore.o ./Middlewares/ThreadX/Ports/tx_thread_context_save.d ./Middlewares/ThreadX/Ports/tx_thread_context_save.o ./Middlewares/ThreadX/Ports/tx_thread_interrupt_control.d ./Middlewares/ThreadX/Ports/tx_thread_interrupt_control.o ./Middlewares/ThreadX/Ports/tx_thread_interrupt_disable.d ./Middlewares/ThreadX/Ports/tx_thread_interrupt_disable.o ./Middlewares/ThreadX/Ports/tx_thread_interrupt_restore.d ./Middlewares/ThreadX/Ports/tx_thread_interrupt_restore.o ./Middlewares/ThreadX/Ports/tx_thread_schedule.d ./Middlewares/ThreadX/Ports/tx_thread_schedule.o ./Middlewares/ThreadX/Ports/tx_thread_secure_stack.cyclo ./Middlewares/ThreadX/Ports/tx_thread_secure_stack.d ./Middlewares/ThreadX/Ports/tx_thread_secure_stack.o ./Middlewares/ThreadX/Ports/tx_thread_secure_stack.su ./Middlewares/ThreadX/Ports/tx_thread_secure_stack_allocate.d ./Middlewares/ThreadX/Ports/tx_thread_secure_stack_allocate.o ./Middlewares/ThreadX/Ports/tx_thread_secure_stack_free.d ./Middlewares/ThreadX/Ports/tx_thread_secure_stack_free.o ./Middlewares/ThreadX/Ports/tx_thread_secure_stack_initialize.d ./Middlewares/ThreadX/Ports/tx_thread_secure_stack_initialize.o ./Middlewares/ThreadX/Ports/tx_thread_stack_build.d ./Middlewares/ThreadX/Ports/tx_thread_stack_build.o ./Middlewares/ThreadX/Ports/tx_thread_system_return.d ./Middlewares/ThreadX/Ports/tx_thread_system_return.o ./Middlewares/ThreadX/Ports/tx_timer_interrupt.d ./Middlewares/ThreadX/Ports/tx_timer_interrupt.o ./Middlewares/ThreadX/Ports/txe_thread_secure_stack_allocate.cyclo ./Middlewares/ThreadX/Ports/txe_thread_secure_stack_allocate.d ./Middlewares/ThreadX/Ports/txe_thread_secure_stack_allocate.o ./Middlewares/ThreadX/Ports/txe_thread_secure_stack_allocate.su ./Middlewares/ThreadX/Ports/txe_thread_secure_stack_free.cyclo ./Middlewares/ThreadX/Ports/txe_thread_secure_stack_free.d ./Middlewares/ThreadX/Ports/txe_thread_secure_stack_free.o ./Middlewares/ThreadX/Ports/txe_thread_secure_stack_free.su

.PHONY: clean-Middlewares-2f-ThreadX-2f-Ports

