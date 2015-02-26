@	startup.s
@	Startup code for SmartFusion ARM Cortex-M3
@	By Lohit Yerva

	.syntax unified
    .thumb

    .global     intVectors
    .section    .int_vector,"a",%progbits
    .type       intVectors, %object
    .size       intVectors, .-intVectors

intVectors:
	.word  STACK_TOP
    .word  Reset_Handler @ More formal setup
    .word  NMI_Handler
    .word  HardFault_Handler
	@Rest of the vector Interrupt Service Routines (ISR) are truncated for now
    
/*==============================================================================
 * Reset_Handler
 */   
    .global Reset_Handler
    .type   Reset_Handler, %function
Reset_Handler:
	b main  @ Branch to main

/*==============================================================================
 * NMI_Handler
 */
    .weak   NMI_Handler
    .type   NMI_Handler, %function
NMI_Handler:
    B .

/*==============================================================================
 * HardFault_Handler
 */
    .weak   HardFault_Handler
    .type   HardFault_Handler, %function
HardFault_Handler:
    B .
