
[bits 64]

global _xs_memcpy

;-------------------------------------------------------------------------------
; Copies n characters from memory area src to memory area dist.
;
; void *xs_memcpy( void * dist, const void * src, size_t n );
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
;-------------------------------------------------------------------------------
_xs_memcpy:
    push    rbp
    mov     rbp, rsp

    ; Don't attempt to copy anything if either:

    ; dest == NULL
    test    rdi, rdi
    jz      .done

    ; src == NULL
    test    rsi, rsi
    jz      .done

    ; n == 0
    test    rdx, rdx
    jz      .done

    ; Copy RSI into the return register RAX since we'll need to return it.
    mov     rax, rsi

    ; Copy the number of bytes to copy into R11
    mov     r11, rdx

    ; TODO: Align the source and destination on 16 bits

    ; Compute the number of bytes to copy before the rest will be a multiple of 32
    ; R11 = RCX % 32
    and     r11, 31
    test    r11, r11
    je      .size_is_mul_of_32

    .size_is_not_mul_of_32:

        mov     cl,             byte [ rsi ]
        mov     byte [ rdi ],   cl
        inc     rdi
        inc     rsi

        dec     rdx
        test    rdx,    rdx
        je      .done

        dec     r11
        test    r11,    r11
        jne     .size_is_not_mul_of_32

    .size_is_mul_of_32:

        ; Copy 32 bytes at a time

        mov     r8,             [ rsi ]
        mov     [ rdi ],        r8

        mov     r9,             [ rsi + 8 ]
        mov     [ rdi + 8 ],    r9

        mov     r10,            [ rsi + 16 ]
        mov     [ rdi + 16 ],   r10

        mov     r11,            [ rsi + 24 ]
        mov     [ rdi + 24 ],   r11

        add     rdi, 32
        add     rsi, 32
        sub     rdx, 32

        ; Run the loop again if n > 0
        test    rdx, rdx
        jne     .size_is_mul_of_32

    .done:

        pop     rbp
        ret
