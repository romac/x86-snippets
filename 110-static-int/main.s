	.section	__TEXT,__text,regular,pure_instructions
	.globl	_bar
	.align	4, 0x90
_bar:                                   ## @bar
	.cfi_startproc
## BB#0:
	push	RBP
Ltmp2:
	.cfi_def_cfa_offset 16
Ltmp3:
	.cfi_offset rbp, -16
	mov	RBP, RSP
Ltmp4:
	.cfi_def_cfa_register rbp
	mov	ESI, DWORD PTR [RIP + _bar.i]
	lea	RDI, QWORD PTR [RIP + L_.str]
	xor	AL, AL
	call	_printf
	inc	DWORD PTR [RIP + _bar.i]
	pop	RBP
	ret
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	push	RBP
Ltmp7:
	.cfi_def_cfa_offset 16
Ltmp8:
	.cfi_offset rbp, -16
	mov	RBP, RSP
Ltmp9:
	.cfi_def_cfa_register rbp
	call	_bar
	call	_bar
	call	_bar
	xor	EAX, EAX
	pop	RBP
	ret
	.cfi_endproc

	.section	__DATA,__data
	.align	2                       ## @bar.i
_bar.i:
	.long	1                       ## 0x1

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	 "%d\n"


.subsections_via_symbols
