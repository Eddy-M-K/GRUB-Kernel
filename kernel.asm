bits 32                         ; nasm directive for 32 bit

section .text                   ; .text section of assembly is used for keeping the actual code
    global _start               ; must start with the declaration of global _start
                                ; global is a NASM directive to set symbols from source code as global
                                ; linker knows where the symbol start is, which is our entry point
    align 4
    dd 0x1BADB002
    dd 0x00
    dd - (0x1BADB002 + 0x00)

extern kmain                    ; external k(ernel) main function in c file

_start: 
    cli                         ; block (clears) interrupts and prevents them from waking the CPU up from hlt
    mov esp, stack_space        ; set stack pointer
    call kmain
    hlt                         ; halts the CPU

section .bss                    ; .bss section is used for declaring variables
    resb 8192                   ; 8KB for stack
    stack_space:
