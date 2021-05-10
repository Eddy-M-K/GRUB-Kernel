/* Links the object file of kernel.asm and the object file of kernel.c
 * to create an executable bootable kernel
 */

OUTPUT_FORMAT(elf32-i386)
ENTRY(_start)
SECTIONS
    {
        . = 0x100000;
        .text : { *(.text) }
        .data : { *(.data) }
        .bss : { *(.bss) }
    }