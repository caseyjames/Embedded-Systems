 .equ GPIO_OUT_BASE, 0x40013000
        .equ GPIO_OUT, 0x40013088

        .text
        .syntax unified
        .thumb

@ Configure the GPIOx to output
@ Inputs: GPIO number is provided in r0
@ Output:
        .global initGPIO
        .type   initGPIO, %function
initGPIO:
        @ Load GPIO_OUT_BASE address
		movw r1, #:lower16:GPIO_OUT_BASE @load lower 16 of base adr
		movt r1, #:upper16:GPIO_OUT_BASE @load upper 16 of base adr
		
        @ Calculate the GPIOx register address
        lsl r0, #2  @ left shift by 2 => i*4
        add r0, r1  @ GPIO_OUT_BASE + i*4

        @ Write 1 to config register to set GPIO as output	
		mov r2, #1    @add one into r2 to enable the gpio at the address in r0
		str r2, [r0, #0]   @put 1 into r0, enable the gpio output
        bx  lr @ Return

@ Set the value of all 32 GPIO output bits based on the input bits
@ Inputs: 32bit value is provided in r0
@ Output:
        .global setGPIO
        .type   setGPIO, %function
setGPIO:
        
		@ Load GPIO_OUT register address
		movw r1, #:lower16:GPIO_OUT @load lower 16 of output reg
		movt r1, #:upper16:GPIO_OUT @load upper 16 of output reg
		
        @ Write 32bit value to GPIO output register
		str r0, [r1, #0] @write the value in r0 to the GPIO output reg
        bx      lr @ Return