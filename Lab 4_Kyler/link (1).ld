OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(main)


MEMORY
{
 /* SmartFusion internal eSRAM */
 ram (rwx) : ORIGIN = 0x20000000, LENGTH = 64k
}

RAM_START_ADDRESS = 0x20000000;	/* Must be the same value MEMORY region ram ORIGIN above. */
RAM_SIZE = 64k;					/* Must be the same value MEMORY region ram LENGTH above. */
MAIN_STACK_SIZE = 8k;			/* Cortex main stack size. */
__main_stack_start = RAM_START_ADDRESS + RAM_SIZE;
STACK_TOP = __main_stack_start;

SECTIONS
{
 .text :
 {
 	*(.int_vector)
    *(.text*)
 } >ram
 
 .stack :
 {
 	. = ALIGN(4);
    . += MAIN_STACK_SIZE;
 } >ram

}
end = .;
