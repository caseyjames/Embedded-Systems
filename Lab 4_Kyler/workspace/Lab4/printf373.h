/*printf373.h

 - Provides printf function call capability for barebones assembly code.

**************************************************************************
- Modified by Lohit Yerva and Prof. Mark Brehob, 2/22/2011
  EECS 373 Labs, College of Engineering, University of Michigan
  Note: There no support for floating point numbers yet
*/

#ifndef _PRINTF373_H_
#define _PRINTF373_H_

#include "drivers/mss_uart/mss_uart.h"

inline void putchar373(unsigned char c){
	MSS_UART_polled_tx(&g_mss_uart0, &c, 1);
}

int printf373(const char *format, ...);

int sprintf373(char *out, const char *format, ...);

#endif
