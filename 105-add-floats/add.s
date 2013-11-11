
[bits 64]

global _add

_add:
    push    rbp
    mov     rbp, rsp
    movss   dword [ rbp - 4 ], xmm0
    movss   dword [ rbp - 8 ], xmm1
    addss   xmm0, xmm1
    pop     rbp
    ret
