# 1 "/home/ignacio/Documents/ECSS/OBC/upsat-obc-software-master/cubeMX/disco/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xc.s"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/home/ignacio/Documents/ECSS/OBC/upsat-obc-software-master/cubeMX/disco/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xc.s"
# 46 "/home/ignacio/Documents/ECSS/OBC/upsat-obc-software-master/cubeMX/disco/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xc.s"
  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb

.global g_pfnVectors
.global Default_Handler



.word _sidata

.word _sdata

.word _edata

.word _sbss

.word _ebss
# 76 "/home/ignacio/Documents/ECSS/OBC/upsat-obc-software-master/cubeMX/disco/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xc.s"
    .section .text.Reset_Handler
  .weak Reset_Handler
  .type Reset_Handler, %function
Reset_Handler:
  ldr sp, =_estack


  movs r1, #0
  b LoopCopyDataInit

CopyDataInit:
  ldr r3, =_sidata
  ldr r3, [r3, r1]
  str r3, [r0, r1]
  adds r1, r1, #4

LoopCopyDataInit:
  ldr r0, =_sdata
  ldr r3, =_edata
  adds r2, r0, r1
  cmp r2, r3
  bcc CopyDataInit
  ldr r2, =_sbss
  b LoopFillZerobss

FillZerobss:
  movs r3, #0
  str r3, [r2], #4

LoopFillZerobss:
  ldr r3, = _ebss
  cmp r2, r3
  bcc FillZerobss


  bl SystemInit

    bl __libc_init_array

  bl main
  bx lr
.size Reset_Handler, .-Reset_Handler
# 126 "/home/ignacio/Documents/ECSS/OBC/upsat-obc-software-master/cubeMX/disco/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xc.s"
    .section .text.Default_Handler,"ax",%progbits
Default_Handler:
Infinite_Loop:
  b Infinite_Loop
  .size Default_Handler, .-Default_Handler







   .section .isr_vector,"a",%progbits
  .type g_pfnVectors, %object
  .size g_pfnVectors, .-g_pfnVectors

g_pfnVectors:
  .word _estack
  .word Reset_Handler
  .word NMI_Handler
  .word HardFault_Handler
  .word MemManage_Handler
  .word BusFault_Handler
  .word UsageFault_Handler
  .word 0
  .word 0
  .word 0
  .word 0
  .word SVC_Handler
  .word DebugMon_Handler
  .word 0
  .word PendSV_Handler
  .word SysTick_Handler


  .word WWDG_IRQHandler
  .word PVD_IRQHandler
  .word TAMP_STAMP_IRQHandler
  .word RTC_WKUP_IRQHandler
  .word FLASH_IRQHandler
  .word RCC_IRQHandler
  .word EXTI0_IRQHandler
  .word EXTI1_IRQHandler
  .word EXTI2_IRQHandler
  .word EXTI3_IRQHandler
  .word EXTI4_IRQHandler
  .word DMA1_Stream0_IRQHandler
  .word DMA1_Stream1_IRQHandler
  .word DMA1_Stream2_IRQHandler
  .word DMA1_Stream3_IRQHandler
  .word DMA1_Stream4_IRQHandler
  .word DMA1_Stream5_IRQHandler
  .word DMA1_Stream6_IRQHandler
  .word ADC_IRQHandler
  .word 0
  .word 0
  .word 0
  .word 0
  .word EXTI9_5_IRQHandler
  .word TIM1_BRK_TIM9_IRQHandler
  .word TIM1_UP_TIM10_IRQHandler
  .word TIM1_TRG_COM_TIM11_IRQHandler
  .word TIM1_CC_IRQHandler
  .word TIM2_IRQHandler
  .word TIM3_IRQHandler
  .word TIM4_IRQHandler
  .word I2C1_EV_IRQHandler
  .word I2C1_ER_IRQHandler
  .word I2C2_EV_IRQHandler
  .word I2C2_ER_IRQHandler
  .word SPI1_IRQHandler
  .word SPI2_IRQHandler
  .word USART1_IRQHandler
  .word USART2_IRQHandler
  .word 0
  .word EXTI15_10_IRQHandler
  .word RTC_Alarm_IRQHandler
  .word OTG_FS_WKUP_IRQHandler
  .word 0
  .word 0
  .word 0
  .word 0
  .word DMA1_Stream7_IRQHandler
  .word 0
  .word SDIO_IRQHandler
  .word TIM5_IRQHandler
  .word SPI3_IRQHandler
  .word 0
  .word 0
  .word 0
  .word 0
  .word DMA2_Stream0_IRQHandler
  .word DMA2_Stream1_IRQHandler
  .word DMA2_Stream2_IRQHandler
  .word DMA2_Stream3_IRQHandler
  .word DMA2_Stream4_IRQHandler
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word OTG_FS_IRQHandler
  .word DMA2_Stream5_IRQHandler
  .word DMA2_Stream6_IRQHandler
  .word DMA2_Stream7_IRQHandler
  .word USART6_IRQHandler
  .word I2C3_EV_IRQHandler
  .word I2C3_ER_IRQHandler
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word FPU_IRQHandler
  .word 0
  .word 0
  .word SPI4_IRQHandler
# 254 "/home/ignacio/Documents/ECSS/OBC/upsat-obc-software-master/cubeMX/disco/Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/gcc/startup_stm32f401xc.s"
   .weak NMI_Handler
   .thumb_set NMI_Handler,Default_Handler

   .weak HardFault_Handler
   .thumb_set HardFault_Handler,Default_Handler

   .weak MemManage_Handler
   .thumb_set MemManage_Handler,Default_Handler

   .weak BusFault_Handler
   .thumb_set BusFault_Handler,Default_Handler

   .weak UsageFault_Handler
   .thumb_set UsageFault_Handler,Default_Handler

   .weak SVC_Handler
   .thumb_set SVC_Handler,Default_Handler

   .weak DebugMon_Handler
   .thumb_set DebugMon_Handler,Default_Handler

   .weak PendSV_Handler
   .thumb_set PendSV_Handler,Default_Handler

   .weak SysTick_Handler
   .thumb_set SysTick_Handler,Default_Handler

   .weak WWDG_IRQHandler
   .thumb_set WWDG_IRQHandler,Default_Handler

   .weak PVD_IRQHandler
   .thumb_set PVD_IRQHandler,Default_Handler

   .weak TAMP_STAMP_IRQHandler
   .thumb_set TAMP_STAMP_IRQHandler,Default_Handler

   .weak RTC_WKUP_IRQHandler
   .thumb_set RTC_WKUP_IRQHandler,Default_Handler

   .weak FLASH_IRQHandler
   .thumb_set FLASH_IRQHandler,Default_Handler

   .weak RCC_IRQHandler
   .thumb_set RCC_IRQHandler,Default_Handler

   .weak EXTI0_IRQHandler
   .thumb_set EXTI0_IRQHandler,Default_Handler

   .weak EXTI1_IRQHandler
   .thumb_set EXTI1_IRQHandler,Default_Handler

   .weak EXTI2_IRQHandler
   .thumb_set EXTI2_IRQHandler,Default_Handler

   .weak EXTI3_IRQHandler
   .thumb_set EXTI3_IRQHandler,Default_Handler

   .weak EXTI4_IRQHandler
   .thumb_set EXTI4_IRQHandler,Default_Handler

   .weak DMA1_Stream0_IRQHandler
   .thumb_set DMA1_Stream0_IRQHandler,Default_Handler

   .weak DMA1_Stream1_IRQHandler
   .thumb_set DMA1_Stream1_IRQHandler,Default_Handler

   .weak DMA1_Stream2_IRQHandler
   .thumb_set DMA1_Stream2_IRQHandler,Default_Handler

   .weak DMA1_Stream3_IRQHandler
   .thumb_set DMA1_Stream3_IRQHandler,Default_Handler

   .weak DMA1_Stream4_IRQHandler
   .thumb_set DMA1_Stream4_IRQHandler,Default_Handler

   .weak DMA1_Stream5_IRQHandler
   .thumb_set DMA1_Stream5_IRQHandler,Default_Handler

   .weak DMA1_Stream6_IRQHandler
   .thumb_set DMA1_Stream6_IRQHandler,Default_Handler

   .weak ADC_IRQHandler
   .thumb_set ADC_IRQHandler,Default_Handler

   .weak EXTI9_5_IRQHandler
   .thumb_set EXTI9_5_IRQHandler,Default_Handler

   .weak TIM1_BRK_TIM9_IRQHandler
   .thumb_set TIM1_BRK_TIM9_IRQHandler,Default_Handler

   .weak TIM1_UP_TIM10_IRQHandler
   .thumb_set TIM1_UP_TIM10_IRQHandler,Default_Handler

   .weak TIM1_TRG_COM_TIM11_IRQHandler
   .thumb_set TIM1_TRG_COM_TIM11_IRQHandler,Default_Handler

   .weak TIM1_CC_IRQHandler
   .thumb_set TIM1_CC_IRQHandler,Default_Handler

   .weak TIM2_IRQHandler
   .thumb_set TIM2_IRQHandler,Default_Handler

   .weak TIM3_IRQHandler
   .thumb_set TIM3_IRQHandler,Default_Handler

   .weak TIM4_IRQHandler
   .thumb_set TIM4_IRQHandler,Default_Handler

   .weak I2C1_EV_IRQHandler
   .thumb_set I2C1_EV_IRQHandler,Default_Handler

   .weak I2C1_ER_IRQHandler
   .thumb_set I2C1_ER_IRQHandler,Default_Handler

   .weak I2C2_EV_IRQHandler
   .thumb_set I2C2_EV_IRQHandler,Default_Handler

   .weak I2C2_ER_IRQHandler
   .thumb_set I2C2_ER_IRQHandler,Default_Handler

   .weak SPI1_IRQHandler
   .thumb_set SPI1_IRQHandler,Default_Handler

   .weak SPI2_IRQHandler
   .thumb_set SPI2_IRQHandler,Default_Handler

   .weak USART1_IRQHandler
   .thumb_set USART1_IRQHandler,Default_Handler

   .weak USART2_IRQHandler
   .thumb_set USART2_IRQHandler,Default_Handler

   .weak EXTI15_10_IRQHandler
   .thumb_set EXTI15_10_IRQHandler,Default_Handler

   .weak RTC_Alarm_IRQHandler
   .thumb_set RTC_Alarm_IRQHandler,Default_Handler

   .weak OTG_FS_WKUP_IRQHandler
   .thumb_set OTG_FS_WKUP_IRQHandler,Default_Handler

   .weak DMA1_Stream7_IRQHandler
   .thumb_set DMA1_Stream7_IRQHandler,Default_Handler

   .weak SDIO_IRQHandler
   .thumb_set SDIO_IRQHandler,Default_Handler

   .weak TIM5_IRQHandler
   .thumb_set TIM5_IRQHandler,Default_Handler

   .weak SPI3_IRQHandler
   .thumb_set SPI3_IRQHandler,Default_Handler

   .weak DMA2_Stream0_IRQHandler
   .thumb_set DMA2_Stream0_IRQHandler,Default_Handler

   .weak DMA2_Stream1_IRQHandler
   .thumb_set DMA2_Stream1_IRQHandler,Default_Handler

   .weak DMA2_Stream2_IRQHandler
   .thumb_set DMA2_Stream2_IRQHandler,Default_Handler

   .weak DMA2_Stream3_IRQHandler
   .thumb_set DMA2_Stream3_IRQHandler,Default_Handler

   .weak DMA2_Stream4_IRQHandler
   .thumb_set DMA2_Stream4_IRQHandler,Default_Handler

   .weak OTG_FS_IRQHandler
   .thumb_set OTG_FS_IRQHandler,Default_Handler

   .weak DMA2_Stream5_IRQHandler
   .thumb_set DMA2_Stream5_IRQHandler,Default_Handler

   .weak DMA2_Stream6_IRQHandler
   .thumb_set DMA2_Stream6_IRQHandler,Default_Handler

   .weak DMA2_Stream7_IRQHandler
   .thumb_set DMA2_Stream7_IRQHandler,Default_Handler

   .weak USART6_IRQHandler
   .thumb_set USART6_IRQHandler,Default_Handler

   .weak I2C3_EV_IRQHandler
   .thumb_set I2C3_EV_IRQHandler,Default_Handler

   .weak I2C3_ER_IRQHandler
   .thumb_set I2C3_ER_IRQHandler,Default_Handler

   .weak FPU_IRQHandler
   .thumb_set FPU_IRQHandler,Default_Handler

   .weak SPI4_IRQHandler
   .thumb_set SPI4_IRQHandler,Default_Handler
