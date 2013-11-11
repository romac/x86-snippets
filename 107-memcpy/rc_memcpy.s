
[bits 64]

global _rc_memcpy

;-------------------------------------------------------------------------------
; Copies n characters from memory area src to memory area dist.
;
; void *rc_memcpy( void * dist, const void * src, size_t n );
;
; Input registers:
;
;       - RDI:      dest : The pointer to the destination array where the content is to be copied.
;       - RSI:      src  : The pointer to the source of data to be copied.
;       - RDX:      n    : The number of bytes to be copied.
;
; Return registers:
;
;       - RAX:     The pointer to destination, which is dest.
;
; Killed registers:
;
;       None
;-------------------------------------------------------------------------------
_rc_memcpy:
    push    rbp
    mov     rbp,    rsp

    ; Don't attempt to copy anything if either:

    ; dest == NULL
    test    rax,    rax
    jz      .done

    ; src == NULL
    test    rax,    rax
    jz      .done

    ; n == 0
    test    rdx,    rdx
    jz      .done

    ; Copy RSI into the return register RAX since we'll need to return it.
    mov rax, rsi

    .loop:

            ; Copy one byte at a time
            mov     cl,             byte [ rsi ]
            mov     byte [ rdi ],   cl
            inc     rdi
            inc     rsi
            dec     rdx

            ; Run the loop again if n > 0
            ; Next line is useless since `dec rdx` updates the ZF flag.
            ; test    rdx, rdx
            jne     .loop

    .done:
            pop     rbp
            ret
