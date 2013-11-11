	.section	__TEXT,__text,regular,pure_instructions
	.globl	_add
	.align	4, 0x90
_add:                                   ## @add
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
	fld	XWORD PTR [RBP + 32]
	fld	XWORD PTR [RBP + 16]
	faddp	ST(1)
	pop	RBP
	ret
	.cfi_endproc

	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI1_0:
	.long	1095069860              ## float 1.234000e+01
                                        ##  (0x414570a4)
LCPI1_1:
	.long	1081669059              ## float 3.890000e+00
                                        ##  (0x4078f5c3)
	.section	__TEXT,__text,regular,pure_instructions
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
	sub	RSP, 32
	fld	DWORD PTR [RIP + LCPI1_0]
	fstp	XWORD PTR [RSP + 16]
	fld	DWORD PTR [RIP + LCPI1_1]
	fstp	XWORD PTR [RSP]
	call	_add
	fstp	XWORD PTR [RSP]
	lea	RDI, QWORD PTR [RIP + L_.str]
	xor	AL, AL
	call	_printf
	xor	EAX, EAX
	add	RSP, 32
	pop	RBP
	ret
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	 "%Lf\n"


.subsections_via_symbols
