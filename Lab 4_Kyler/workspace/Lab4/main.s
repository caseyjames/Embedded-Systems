.text
	.syntax	unified
	.thumb
	strName: 	.asciz "print the number: %d\n\r"
	strName2:	.asciz "Kyler \n\r"
	strName3:	.asciz "so on...\n\r"
	waitStr: 	.asciz "Wait for Interrupt\n\r"
	.align 2
	.global main
	.type	main, %function
main:

	@ Initalize MSS UART 0
	movw	r0,	#:lower16:g_mss_uart0
	movt	r0,	#:upper16:g_mss_uart0
	movw	r1,	#:lower16:57600			@ UART Baudrate
	movt	r1,	#:upper16:57600
	mov 	r2,	#3
	bl		MSS_UART_init

	movw	r0,	#:lower16:strName2
	movt	r0,	#:upper16:strName2

	bl	printf373
	mov r0, #31
	bl ClearPendingIRQ

	bl EnableIRQ

 	bl Fabric_IRQHandler



while1:
	movw	r0,	#:lower16:waitStr	@ "Wait For Interrupt\n\r"
	movt	r0,	#:upper16:waitStr
	bl	printf373
	wfi		@Wait For Interrupt; Stop execution until an interrupt fires

	b	while1

	.size	main, .-main

