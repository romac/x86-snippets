	.section	__TEXT,__text,regular,pure_instructions
	.globl	_a
	.align	4, 0x90
_a:                                     ## @a
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
	mov	EAX, 42
	pop	RBP
	ret
	.cfi_endproc

	.globl	_b
	.align	4, 0x90
_b:                                     ## @b
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
	mov	DWORD PTR [RBP - 4], EDI
	mov	EDI, DWORD PTR [RBP - 4]
	add	EDI, 42
	mov	EAX, EDI
	pop	RBP
	ret
	.cfi_endproc

	.globl	_c
	.align	4, 0x90
_c:                                     ## @c
	.cfi_startproc
## BB#0:
	push	RBP
Ltmp12:
	.cfi_def_cfa_offset 16
Ltmp13:
	.cfi_offset rbp, -16
	mov	RBP, RSP
Ltmp14:
	.cfi_def_cfa_register rbp
	mov	DWORD PTR [RBP - 4], EDI
	mov	DWORD PTR [RBP - 8], ESI
	mov	ESI, DWORD PTR [RBP - 4]
	add	ESI, DWORD PTR [RBP - 8]
	mov	EAX, ESI
	pop	RBP
	ret
	.cfi_endproc

	.globl	_f
	.align	4, 0x90
_f:                                     ## @f
	.cfi_startproc
## BB#0:
	push	RBP
Ltmp17:
	.cfi_def_cfa_offset 16
Ltmp18:
	.cfi_offset rbp, -16
	mov	RBP, RSP
Ltmp19:
	.cfi_def_cfa_register rbp
	movabs	RAX, 42
	cvtsi2ss	XMM1, RAX
	movss	DWORD PTR [RBP - 4], XMM0
	movss	XMM0, DWORD PTR [RBP - 4]
	addss	XMM0, XMM1
	pop	RBP
	ret
	.cfi_endproc

	.globl	_p
	.align	4, 0x90
_p:                                     ## @p
	.cfi_startproc
## BB#0:
	push	RBP
Ltmp22:
	.cfi_def_cfa_offset 16
Ltmp23:
	.cfi_offset rbp, -16
	mov	RBP, RSP
Ltmp24:
	.cfi_def_cfa_register rbp
	mov	QWORD PTR [RBP - 16], RDI
	mov	EAX, DWORD PTR [RBP - 16]
	add	EAX, 42
	mov	DWORD PTR [RBP - 24], EAX
	mov	EAX, DWORD PTR [RBP - 12]
	add	EAX, 42
	mov	DWORD PTR [RBP - 20], EAX
	mov	RDI, QWORD PTR [RBP - 24]
	mov	QWORD PTR [RBP - 8], RDI
	mov	RAX, QWORD PTR [RBP - 8]
	pop	RBP
	ret
	.cfi_endproc

	.section	__TEXT,__literal4,4byte_literals
	.align	2
LCPI5_0:
	.long	1090519040              ## float 8.000000e+00
                                        ##  (0x41000000)
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	push	RBP
Ltmp27:
	.cfi_def_cfa_offset 16
Ltmp28:
	.cfi_offset rbp, -16
	mov	RBP, RSP
Ltmp29:
	.cfi_def_cfa_register rbp
	sub	RSP, 48
	mov	EAX, 0
	mov	DWORD PTR [RBP - 4], 0
	mov	DWORD PTR [RBP - 28], EAX ## 4-byte Spill
	call	_a
	mov	ECX, 13
	mov	EDI, ECX
	mov	DWORD PTR [RBP - 32], EAX ## 4-byte Spill
	mov	DWORD PTR [RBP - 36], ECX ## 4-byte Spill
	call	_b
	mov	ESI, 14
	mov	EDI, DWORD PTR [RBP - 36] ## 4-byte Reload
	mov	DWORD PTR [RBP - 40], EAX ## 4-byte Spill
	call	_c
	movss	XMM0, DWORD PTR [RIP + LCPI5_0]
	mov	DWORD PTR [RBP - 44], EAX ## 4-byte Spill
	call	_f
	mov	RDX, QWORD PTR [RIP + L_main.point]
	mov	QWORD PTR [RBP - 16], RDX
	mov	RDI, RDX
	movss	DWORD PTR [RBP - 48], XMM0 ## 4-byte Spill
	call	_p
	mov	QWORD PTR [RBP - 24], RAX
	mov	EAX, DWORD PTR [RBP - 28] ## 4-byte Reload
	add	RSP, 48
	pop	RBP
	ret
	.cfi_endproc

	.section	__TEXT,__literal8,8byte_literals
	.align	2                       ## @main.point
L_main.point:
	.long	2                       ## 0x2
	.long	3                       ## 0x3


.subsections_via_symbols
