OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm",
"elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)

MEMORY
{
	/* SmartFusion internal eSRAM */
	ram (rwx) : ORIGIN = 0x20000000, LENGTH = 64k
}

SECTIONS
{
 .text : /* Within the .text section: */
 {
    *(.int_vector) /* Interrupt Vector Table is always first */
    *(.text*)      /* All other text sections follow */
 } >ram
}
end = .;