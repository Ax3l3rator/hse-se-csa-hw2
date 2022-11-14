	.file	"index.c"
	.intel_syntax noprefix
	.text
	.globl	countNums
	.type	countNums, @function
countNums:
.LFB35:
	.cfi_startproc
	endbr64
	xor	eax, eax
	xor	r8d, r8d
.L2:
	cmp	rax, rsi
	jnb	.L8
	mov	cl, BYTE PTR [rdi+rax]
	lea	edx, -48[rcx]
	cmp	dl, 9
	ja	.L3
.L4:
	inc	rax
	mov	cl, BYTE PTR [rdi+rax]
	lea	edx, -48[rcx]
	cmp	dl, 9
	jbe	.L4
	inc	r8
.L3:
	inc	rax
	jmp	.L2
.L8:
	mov	rax, r8
	ret
	.cfi_endproc
.LFE35:
	.size	countNums, .-countNums
	.globl	generateString
	.type	generateString, @function
generateString:
.LFB36:
	.cfi_startproc
	endbr64
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	r12d, 127
	push	rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	lea	rbp, [rdi+rsi]
	push	rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	mov	rbx, rdi
.L10:
	cmp	rbx, rbp
	je	.L13
	call	rand@PLT
	inc	rbx
	cdq
	idiv	r12d
	inc	edx
	mov	BYTE PTR -1[rbx], dl
	jmp	.L10
.L13:
	pop	rbx
	.cfi_def_cfa_offset 24
	pop	rbp
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE36:
	.size	generateString, .-generateString
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"-r"
.LC1:
	.string	"%lu\n"
.LC3:
	.string	"Execution time:%lf\n"
.LC4:
	.string	"-c"
.LC5:
	.string	"r"
.LC6:
	.string	"No such file"
.LC7:
	.string	"w"
.LC8:
	.string	"%lu"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB37:
	.cfi_startproc
	endbr64
	dec	edi
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	mov	r12d, 1
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	jle	.L14
	mov	rbp, QWORD PTR 8[rsi]
	mov	rbx, rsi
	lea	rsi, .LC0[rip]
	mov	rdi, rbp
	call	strcmp@PLT
	mov	r12d, eax
	test	eax, eax
	jne	.L16
	xor	edi, edi
	call	time@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 100000001
	lea	rdi, str.3454[rip]
	cdq
	idiv	ecx
	movsx	rbp, edx
	mov	rsi, rbp
	call	generateString
	call	clock@PLT
	mov	rsi, rbp
	lea	rdi, str.3454[rip]
	mov	r13, rax
	call	countNums
	mov	r14, rax
	call	clock@PLT
	mov	rdx, r14
	mov	edi, 1
	lea	rsi, .LC1[rip]
	mov	rbx, rax
	xor	eax, eax
	call	__printf_chk@PLT
	sub	rbx, r13
	jmp	.L21
.L16:
	lea	rsi, .LC4[rip]
	mov	rdi, rbp
	call	strcmp@PLT
	mov	r12d, eax
	test	eax, eax
	jne	.L17
	mov	rcx, QWORD PTR stdin[rip]
	mov	edx, 100000000
	mov	esi, 1
	lea	rdi, str.3454[rip]
	call	fread@PLT
	mov	r13, rax
	call	clock@PLT
	mov	rsi, r13
	lea	rdi, str.3454[rip]
	mov	rbp, rax
	call	countNums
	mov	r13, rax
	call	clock@PLT
	mov	rdx, r13
	mov	edi, 1
	lea	rsi, .LC1[rip]
	mov	rbx, rax
	xor	eax, eax
	call	__printf_chk@PLT
	sub	rbx, rbp
.L21:
	lea	rsi, .LC3[rip]
	mov	edi, 1
	mov	al, 1
	cvtsi2sd	xmm0, rbx
	divsd	xmm0, QWORD PTR .LC2[rip]
	call	__printf_chk@PLT
	jmp	.L14
.L17:
	lea	rsi, .LC5[rip]
	mov	rdi, rbp
	call	fopen@PLT
	mov	r12, rax
	test	rax, rax
	jne	.L18
	lea	rdi, .LC6[rip]
	mov	r12d, 1
	call	puts@PLT
	jmp	.L14
.L18:
	mov	rcx, rax
	mov	edx, 100000000
	mov	esi, 1
	lea	rdi, str.3454[rip]
	call	fread@PLT
	mov	rdi, r12
	mov	rbp, rax
	call	fclose@PLT
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC7[rip]
	call	fopen@PLT
	mov	r12, rax
	call	clock@PLT
	mov	rsi, rbp
	lea	rdi, str.3454[rip]
	mov	rbx, rax
	call	countNums
	mov	r13, rax
	call	clock@PLT
	lea	rsi, .LC3[rip]
	mov	edi, 1
	sub	rax, rbx
	cvtsi2sd	xmm0, rax
	mov	al, 1
	divsd	xmm0, QWORD PTR .LC2[rip]
	call	__printf_chk@PLT
	mov	rdi, r12
	mov	rcx, r13
	mov	esi, 1
	lea	rdx, .LC8[rip]
	xor	eax, eax
	call	__fprintf_chk@PLT
	mov	rdi, r12
	xor	r12d, r12d
	call	fclose@PLT
.L14:
	pop	rbx
	.cfi_def_cfa_offset 40
	mov	eax, r12d
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE37:
	.size	main, .-main
	.local	str.3454
	.comm	str.3454,100000000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC2:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
