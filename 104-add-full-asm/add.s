
[bits 32]

global _add

_add:
    mov eax, edi
    mov ebx, 42
    call do_add

do_add:
    add eax, ebx
    ret
