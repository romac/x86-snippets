	.section	__TEXT,__text,regular,pure_instructions
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI0_0:
	.quad	4517329193108106637     ## double 1.000000e-06
                                        ##  (0x3eb0c6f7a0b5ed8d)
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_get_time
	.align	4, 0x90
_get_time:                              ## @get_time
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
	sub	RSP, 32
	lea	RDI, QWORD PTR [RBP - 16]
	lea	RAX, QWORD PTR [RBP - 24]
	mov	RSI, RAX
	call	_gettimeofday
	movsd	XMM0, QWORD PTR [RIP + LCPI0_0]
	cvtsi2sd	XMM1, QWORD PTR [RBP - 16]
	cvtsi2sd	XMM2, DWORD PTR [RBP - 8]
	mulsd	XMM2, XMM0
	addsd	XMM1, XMM2
	movaps	XMM0, XMM1
	mov	DWORD PTR [RBP - 28], EAX ## 4-byte Spill
	add	RSP, 32
	pop	RBP
	ret
	.cfi_endproc

	.globl	_xs_memcpy_c
	.align	4, 0x90
_xs_memcpy_c:                           ## @xs_memcpy_c
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
	mov	QWORD PTR [RBP - 16], RDI
	mov	QWORD PTR [RBP - 24], RSI
	mov	QWORD PTR [RBP - 32], RDX
	cmp	QWORD PTR [RBP - 16], 0
	je	LBB1_3
## BB#1:
	cmp	QWORD PTR [RBP - 24], 0
	je	LBB1_3
## BB#2:
	cmp	QWORD PTR [RBP - 32], 0
	jne	LBB1_4
LBB1_3:
	mov	RAX, QWORD PTR [RBP - 16]
	mov	QWORD PTR [RBP - 8], RAX
	jmp	LBB1_8
LBB1_4:
	mov	RAX, QWORD PTR [RBP - 16]
	mov	QWORD PTR [RBP - 40], RAX
	mov	RAX, QWORD PTR [RBP - 24]
	mov	QWORD PTR [RBP - 48], RAX
LBB1_5:                                 ## =>This Inner Loop Header: Depth=1
	mov	RAX, QWORD PTR [RBP - 32]
	mov	RCX, RAX
	add	RCX, -1
	mov	QWORD PTR [RBP - 32], RCX
	cmp	RAX, 0
	je	LBB1_7
## BB#6:                                ##   in Loop: Header=BB1_5 Depth=1
	mov	RAX, QWORD PTR [RBP - 48]
	mov	RCX, RAX
	add	RCX, 1
	mov	QWORD PTR [RBP - 48], RCX
	mov	DL, BYTE PTR [RAX]
	mov	RAX, QWORD PTR [RBP - 40]
	mov	RCX, RAX
	add	RCX, 1
	mov	QWORD PTR [RBP - 40], RCX
	mov	BYTE PTR [RAX], DL
	jmp	LBB1_5
LBB1_7:
	mov	RAX, QWORD PTR [RBP - 16]
	mov	QWORD PTR [RBP - 8], RAX
LBB1_8:
	mov	RAX, QWORD PTR [RBP - 8]
	pop	RBP
	ret
	.cfi_endproc

	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
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
	sub	RSP, 16
	mov	DWORD PTR [RBP - 4], 0
	mov	DWORD PTR [RBP - 8], EDI
	mov	QWORD PTR [RBP - 16], RSI
	call	_benchmark
	mov	EAX, 0
	add	RSP, 16
	pop	RBP
	ret
	.cfi_endproc

	.globl	_benchmark
	.align	4, 0x90
_benchmark:                             ## @benchmark
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
	sub	RSP, 48
	movabs	RDI, 1024
	call	_malloc
	movabs	RDI, 1024
	mov	QWORD PTR [RBP - 8], RAX
	call	_malloc
	mov	QWORD PTR [RBP - 16], RAX
	call	_get_time
	movsd	QWORD PTR [RBP - 24], XMM0
	mov	DWORD PTR [RBP - 28], 0
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	cmp	DWORD PTR [RBP - 28], 1971520
	jae	LBB3_4
## BB#2:                                ##   in Loop: Header=BB3_1 Depth=1
	movabs	RDX, 1024
	mov	RDI, QWORD PTR [RBP - 16]
	mov	RSI, QWORD PTR [RBP - 8]
	call	_xs_memcpy
	mov	QWORD PTR [RBP - 40], RAX ## 8-byte Spill
## BB#3:                                ##   in Loop: Header=BB3_1 Depth=1
	mov	EAX, DWORD PTR [RBP - 28]
	add	EAX, 1
	mov	DWORD PTR [RBP - 28], EAX
	jmp	LBB3_1
LBB3_4:
	call	_get_time
	lea	RDI, QWORD PTR [RIP + L_.str]
	subsd	XMM0, QWORD PTR [RBP - 24]
	movsd	QWORD PTR [RBP - 24], XMM0
	movsd	XMM0, QWORD PTR [RBP - 24]
	mov	AL, 1
	call	_printf
	mov	DWORD PTR [RBP - 44], EAX ## 4-byte Spill
	add	RSP, 48
	pop	RBP
	ret
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	 "xs_memcpy   : %f\n"


.subsections_via_symbols
