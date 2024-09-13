################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
Clock.o: /Users/jerinandrews/Desktop/MSPM0_ValvanoWare/inc/Clock.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1240/ccs/tools/compiler/ti-cgt-armllvm_2.1.3.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Dump.o: /Users/jerinandrews/Desktop/MSPM0_ValvanoWare/inc/Dump.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1240/ccs/tools/compiler/ti-cgt-armllvm_2.1.3.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

%.o: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1240/ccs/tools/compiler/ti-cgt-armllvm_2.1.3.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

FIFO.o: /Users/jerinandrews/Desktop/MSPM0_ValvanoWare/inc/FIFO.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1240/ccs/tools/compiler/ti-cgt-armllvm_2.1.3.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

LaunchPad.o: /Users/jerinandrews/Desktop/MSPM0_ValvanoWare/inc/LaunchPad.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1240/ccs/tools/compiler/ti-cgt-armllvm_2.1.3.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

Timer.o: /Users/jerinandrews/Desktop/MSPM0_ValvanoWare/inc/Timer.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1240/ccs/tools/compiler/ti-cgt-armllvm_2.1.3.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

UART.o: /Users/jerinandrews/Desktop/MSPM0_ValvanoWare/inc/UART.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1240/ccs/tools/compiler/ti-cgt-armllvm_2.1.3.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

UARTints.o: /Users/jerinandrews/Desktop/MSPM0_ValvanoWare/inc/UARTints.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/Applications/ti/ccs1240/ccs/tools/compiler/ti-cgt-armllvm_2.1.3.LTS/bin/tiarmclang" -c -march=thumbv6m -mcpu=cortex-m0plus -mfloat-abi=soft -mlittle-endian -mthumb -O0 -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source/third_party/CMSIS/Core/Include" -I"/Applications/ti/mspm0_sdk_1_20_01_06/source" -D__MSPM0G3507__ -gdwarf-3 -MMD -MP -MF"$(basename $(<F)).d_raw" -MT"$(@)" -I"/Users/jerinandrews/Desktop/MSPM0_ValvanoWare/ECE319K_Lab4/Debug/syscfg"  $(GEN_OPTS__FLAG) -o"$@" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


