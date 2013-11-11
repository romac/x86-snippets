
global _foo
extern _bar

_foo:

    ; Read the memory address of <bar> into rcx
    ; lea rcx, qword [ _bar wrt rip ] ; this would work too
    mov     rcx,    qword _bar

    ; Override the function's return address by the one of <bar>
    push    rcx

    ; Return to <bar>
    ret
