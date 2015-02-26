waitStr: 	.asciz "Handling IRQ FABINT %d\n\r"
	.align 2

@ Global variables (must be in the .data section)
	.data
count:	.word	0

	.text
	.syntax	unified
	.thumb



@Fabric_IRQHandler

    .global   Fabric_IRQHandler
    .type   Fabric_IRQHandler, %function

Fabric_IRQHandler:
	push 	{r0,r1,r2,r3,r4,r5,r6, lr}
	movw	r0,	#:lower16:waitStr
	movt	r0,	#:upper16:waitStr

	ldr 	r6, =count
	ldr 	r4,[r6,#0]
	add		r4, #1
	mov 	r1, r4
	str 	r1, [r6, #0]

    bl printf373

	mov r0, #31
    bl ClearPendingIRQ

@@@@@@@@@@@@@
	@ Load LEDs memory map address into r0
	mov    r6, #0
	movt   r6, #:upper16:0x40050000
	@ Load Switches memory map address into r1
	movw   r1, #:lower16:0x40050004
	movt   r1, #:upper16:0x40050004

	ldr    r2, [r6, #0]	@ int counter = 0
	mov    r3, #0	@ int switches = 0

	mov    r5, #0
	@str    r5, [r0, #0]	@ LEDs = 0
	ldr    r3, [r1, #0]	@ Read mem map Switches into switches
	@mvn    r3, r3		@ Active low switches



	@ else - something changed in the switches
check_SW1:
	ands	r5, r3, #1	@ switches & 0x1
	cbnz	r5, check_SW2	@ if( switches & 0x1 == 0 ) goto check_SW2
	@ands	r6, r4, #1	@ tmpSw & 0x1
	@cbnz	r6, check_SW2	@ if( tmpSw & 0x1 == 1 ) goto check_SW2
	sub	r2, #1		@ counter--

check_SW2:
	ands	r5, r3, #2		@ switches & 0x2
	cbnz	r5, saveSWs_setLEDs	@ if( switches & 0x2 == 0)goto saveSWs_setLEDs
	@ands r6, r4, #2		@ tmpSw & 0x2
	@cbnz r6, saveSWs_setLEDs  @ if( tmpSw & 0x2 == 1) goto saveSWs_setLEDs
	add	r2, #1			@ counter++

saveSWs_setLEDs:
	@mov	r3, r4		@ switches = tmpSw
	str	r2, [r6, #0]	@ LEDs = counter
@@@@@@@@@

    pop		{r0,r1,r2,r3,r4,r5,r6, lr}
    @B .
    bx lr

@ Enable the IRQ
@ Inputs: IRQ number in r0
@ Output:
	.equ 	Enable, 0xe000e100
	.global	EnableIRQ,
	.type	EnableIRQ, %function
EnableIRQ:
	push	{r0, r1, r2, r3, r4,r5,r6,r7} @ Callee Save

	@ Load NVIC_ISER (Set-Enable Registers) start address
		@ldr		r4, =0xe000e100

		movw	r4, #:lower16:Enable
		movt	r4, #:upper16:Enable
	@ Select register to modify
		@ store 32 into r6 and divide reg r0 by

		mov		r6, #32
		udiv	r5, r0, r6
		lsl		r5, #2
		add 	r4, r5
		lsl		r5, #3
		sub		r0, r0, r5
	@ Select bit to set in the register
		mov		r7, 0x1
		lsl		r7, r0
		str r7, [r4]
	@ Set bit
		str		r7, [r4]
	pop	{r0, r1, r2, r3,r4,r5,r6,r7}
	bx	lr


	@ Clear the pending the IRQ
@ Inputs: IRQ number in r0
@ Output:
	.equ 	ClearPending, 0xe000e280
	.global	ClearPendingIRQ
	.type	ClearPendingIRQ, %function
ClearPendingIRQ:
	push	{r4,r5,r6,r7,lr} @ Callee Save

	@ Load NVIC_ICPR (Clear-Pending Registers) start address
		movw	r4, #:lower16:ClearPending
		movt	r4, #:upper16:ClearPending
	@ Select register to modify
		@ store 32 into r6 and divide reg r0 by

		mov		r6, #32
		udiv	r5, r0, r6
		lsl		r5, #2
		add 	r4, r5
		lsl		r5, #3
		sub		r0, r0, r5
	@ Select bit to set in the register
		mov		r7, 0x1
		lsl		r7, r0
		str r7, [r4]
	@ Set bit
		str		r0, [r4]
	pop	{r4,r5,r6,r7,lr}
	bx 	lr
