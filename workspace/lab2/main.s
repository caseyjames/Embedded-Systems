 .equ    STACK_TOP, 0x20000800
        .equ    SYSREG_SOFT_RST_CR, 0xE0042030

        .section .int_vector,"a",%progbits @ First linker code section
        .global  _start                    @ Linker entry point
_start:
        .word    STACK_TOP, main
        @ End of int_vector section

        @ Standard text section
        .text
        .syntax  unified
        .thumb

        .type    main, %function
main:
        @ Load   SYSREG_SOFT_RST_CR address
        movw     r0, #:lower16:SYSREG_SOFT_RST_CR
        movt     r0, #:upper16:SYSREG_SOFT_RST_CR
        @ Reset  GPIO hardware
        ldr      r1, [r0, #0]
        orr      r1, #0x4000
        str      r1, [r0, #0]
        @ Take GPIO hardware out of reset
        ldr      r1, [r0, #0]
        mvn      r2, #0x4000 @ move bitwise negation of 0x4000 into r2
        and      r1, r2
        str      r1, [r0, #0]

        mov      r0, #24
        bl       initGPIO @ Call initGPIO in gpio.s to initialize GPIO 24

        @ Enbable gpio regiesters  24 - 31 by setting them to 1 and then to 0
        @ Set them to 1:

		mov      r0, #25
		bl       initGPIO @ Call initGPIO in gpio.s to initialize GPIO 25
		mov      r0, #26
		bl       initGPIO @ Call initGPIO in gpio.s to initialize GPIO 26
		mov      r0, #27
		bl       initGPIO @ Call initGPIO in gpio.s to initialize GPIO 27
		mov      r0, #28
		bl       initGPIO @ Call initGPIO in gpio.s to initialize GPIO 28
		mov      r0, #29
		bl       initGPIO @ Call initGPIO in gpio.s to initialize GPIO 29
		mov      r0, #30
		bl       initGPIO @ Call initGPIO in gpio.s to initialize GPIO 30
		mov      r0, #31
		bl       initGPIO @ Call initGPIO in gpio.s to initialize GPIO 31

        @ Set them to 0:
        mov   r0, #0
        bl    setGPIO    @ Call setGPIO in gpio.s to write 0 to GPIO output register

        @ Round robin the LEDS
loop:
		mov r0, #0x8000
        @mov      r1, #1
        @lsl      r1, #24
        @eor      r0, r1 @ Exclusive-OR (XOR)
        bl       setGPIO

        mov      r1, #0 @ setup counter reg for the wait loop

wait:
		add r1, #1
		cmp r1, #10
		bne wait
		b loop
.end
