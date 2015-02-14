.equ STACK_TOP, 0x20000800

.equ LEDIO_REG_BASE, 0x40050000
.equ RDEC_REG_BASE, 0x40050100
.equ SWIO_REG_BASE, 0x40050200
.equ WDEC_REG_BASE, 0x40050300

     .section .int_vector,"a",%progbits @ First linker code section
     .global _start @ Linker entry point
_start:
	.word STACK_TOP, main
	@ End of int_vector section

	@ Standard text section
	.text
	.syntax unified
	.thumb

	.type main, %function
main:
	@ Load led register base address
	movw r0, #:lower16:LEDIO_REG_BASE
	movt r0, #:upper16:LEDIO_REG_BASE
	@ Load switch register base address
	movw r1, #:lower16:SWIO_REG_BASE
	movt r1, #:upper16:SWIO_REG_BASE
	@ Load write-only to decoder register base address
	movw r2, #:lower16:WDEC_REG_BASE
	movt r2, #:upper16:WDEC_REG_BASE
	@ Load read-only registers from decoder
	movw r3, #:lower16:RDEC_REG_BASE
	movt r3, #:upper16:RDEC_REG_BASE

loop:
	@ Read switch register
	ldr r4, [r1, #0]
	@ Write switch values to decoder register
	str r4, [r2, #0]
	@ Read decoder registers
	ldr r5, [r3, #0]
	@ write decoder values to led registers
	str r5, [r0, #0]
b loop
.end
