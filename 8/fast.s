	.file	"index.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	countNums
	.type	countNums, @function
countNums:
.LFB50:
	.cfi_startproc
	endbr64
	test	rsi, rsi
	je	.L6
	xor	eax, eax
	xor	r8d, r8d
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L3:
	add	rax, 1
	cmp	rsi, rax
	jbe	.L1
.L5:
	movzx	ecx, BYTE PTR [rdi+rax]
	lea	edx, -48[rcx]
	cmp	dl, 9
	ja	.L3
	.p2align 4,,10
	.p2align 3
.L4:
	add	rax, 1
	movzx	ecx, BYTE PTR [rdi+rax]
	lea	edx, -48[rcx]
	cmp	dl, 9
	jbe	.L4
	add	rax, 1
	add	r8, 1
	cmp	rsi, rax
	ja	.L5
.L1:
	mov	rax, r8
	ret
.L6:
	xor	r8d, r8d
	mov	rax, r8
	ret
	.cfi_endproc
.LFE50:
	.size	countNums, .-countNums
	.p2align 4
	.globl	generateString
	.type	generateString, @function
generateString:
.LFB51:
	.cfi_startproc
	endbr64
	test	rsi, rsi
	je	.L18
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rdi
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	lea	rbx, [rdi+rsi]
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L12:
	call	rand@PLT
	add	rbp, 1
	movsx	rdx, eax
	mov	ecx, eax
	imul	rdx, rdx, -2130574327
	sar	ecx, 31
	shr	rdx, 32
	add	edx, eax
	sar	edx, 6
	sub	edx, ecx
	mov	ecx, edx
	sal	ecx, 7
	sub	ecx, edx
	sub	eax, ecx
	add	eax, 1
	mov	BYTE PTR -1[rbp], al
	cmp	rbp, rbx
	jne	.L12
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE51:
	.size	generateString, .-generateString
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%lu\n"
.LC2:
	.string	"Execution time:%lf\n"
.LC3:
	.string	"-c"
.LC4:
	.string	"r"
.LC5:
	.string	"No such file"
.LC6:
	.string	"w"
.LC7:
	.string	"%lu"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB52:
	.cfi_startproc
	endbr64
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
	cmp	edi, 1
	jle	.L21
	mov	rbp, QWORD PTR 8[rsi]
	mov	rbx, rsi
	cmp	BYTE PTR 0[rbp], 45
	je	.L55
.L24:
	lea	rsi, .LC3[rip]
	mov	rdi, rbp
	call	strcmp@PLT
	mov	r12d, eax
	test	eax, eax
	jne	.L31
	mov	rcx, QWORD PTR stdin[rip]
	mov	edx, 100000000
	mov	esi, 1
	xor	r14d, r14d
	lea	rdi, str.3519[rip]
	call	fread@PLT
	mov	rbp, rax
	call	clock@PLT
	mov	rbx, rax
	test	rbp, rbp
	je	.L32
	xor	eax, eax
	lea	r13, str.3519[rip]
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L33:
	add	rax, 1
	cmp	rbp, rax
	jbe	.L32
.L35:
	movzx	edi, BYTE PTR 0[r13+rax]
	lea	edx, -48[rdi]
	cmp	dl, 9
	ja	.L33
	.p2align 4,,10
	.p2align 3
.L34:
	add	rax, 1
	movzx	esi, BYTE PTR 0[r13+rax]
	lea	edx, -48[rsi]
	cmp	dl, 9
	jbe	.L34
	add	r14, 1
	jmp	.L33
.L32:
	call	clock@PLT
	mov	rdx, r14
	mov	edi, 1
	lea	rsi, .LC0[rip]
	mov	rbp, rax
	xor	eax, eax
	call	__printf_chk@PLT
	sub	rbp, rbx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rbp
.L54:
	mulsd	xmm0, QWORD PTR .LC1[rip]
	mov	edi, 1
	mov	eax, 1
	lea	rsi, .LC2[rip]
	call	__printf_chk@PLT
.L21:
	pop	rbx
	.cfi_remember_state
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
.L55:
	.cfi_restore_state
	cmp	BYTE PTR 1[rbp], 114
	jne	.L24
	movzx	r12d, BYTE PTR 2[rbp]
	test	r12d, r12d
	jne	.L24
	xor	edi, edi
	call	time@PLT
	mov	rdi, rax
	call	srand@PLT
	call	rand@PLT
	mov	ecx, 100000001
	cdq
	idiv	ecx
	movsx	rbx, edx
	test	rbx, rbx
	je	.L25
	lea	r13, str.3519[rip]
	mov	r14, r13
	lea	rbp, 0[r13+rbx]
	.p2align 4,,10
	.p2align 3
.L26:
	call	rand@PLT
	add	r14, 1
	movsx	rcx, eax
	cdq
	imul	rcx, rcx, -2130574327
	shr	rcx, 32
	add	ecx, eax
	sar	ecx, 6
	sub	ecx, edx
	mov	edx, ecx
	sal	edx, 7
	sub	edx, ecx
	sub	eax, edx
	add	eax, 1
	mov	BYTE PTR -1[r14], al
	cmp	rbp, r14
	jne	.L26
	call	clock@PLT
	xor	r14d, r14d
	mov	rbp, rax
	xor	eax, eax
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L28:
	add	rax, 1
	cmp	rbx, rax
	jbe	.L41
.L30:
	movzx	edi, BYTE PTR 0[r13+rax]
	lea	edx, -48[rdi]
	cmp	dl, 9
	ja	.L28
	.p2align 4,,10
	.p2align 3
.L29:
	add	rax, 1
	movzx	edi, BYTE PTR 0[r13+rax]
	lea	edx, -48[rdi]
	cmp	dl, 9
	jbe	.L29
	add	r14, 1
	jmp	.L28
.L31:
	mov	rdi, rbp
	lea	rsi, .LC4[rip]
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	je	.L56
	mov	rcx, rax
	mov	edx, 100000000
	mov	esi, 1
	xor	r14d, r14d
	lea	rdi, str.3519[rip]
	call	fread@PLT
	mov	rdi, rbp
	mov	r12, rax
	call	fclose@PLT
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC6[rip]
	call	fopen@PLT
	mov	rbp, rax
	call	clock@PLT
	mov	rbx, rax
	test	r12, r12
	je	.L37
	xor	eax, eax
	lea	r13, str.3519[rip]
	jmp	.L40
	.p2align 4,,10
	.p2align 3
.L38:
	add	rax, 1
	cmp	r12, rax
	jbe	.L37
.L40:
	movzx	esi, BYTE PTR 0[r13+rax]
	lea	edx, -48[rsi]
	cmp	dl, 9
	ja	.L38
	.p2align 4,,10
	.p2align 3
.L39:
	add	rax, 1
	movzx	esi, BYTE PTR 0[r13+rax]
	lea	edx, -48[rsi]
	cmp	dl, 9
	jbe	.L39
	add	r14, 1
	jmp	.L38
.L37:
	call	clock@PLT
	pxor	xmm0, xmm0
	mov	edi, 1
	xor	r12d, r12d
	sub	rax, rbx
	lea	rsi, .LC2[rip]
	cvtsi2sd	xmm0, rax
	mulsd	xmm0, QWORD PTR .LC1[rip]
	mov	eax, 1
	call	__printf_chk@PLT
	mov	rcx, r14
	mov	esi, 1
	mov	rdi, rbp
	lea	rdx, .LC7[rip]
	xor	eax, eax
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	jmp	.L21
.L25:
	call	clock@PLT
	xor	r14d, r14d
	mov	rbp, rax
.L41:
	call	clock@PLT
	mov	rdx, r14
	mov	edi, 1
	lea	rsi, .LC0[rip]
	mov	rbx, rax
	xor	eax, eax
	call	__printf_chk@PLT
	sub	rbx, rbp
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rbx
	jmp	.L54
.L56:
	lea	rdi, .LC5[rip]
	mov	r12d, 1
	call	puts@PLT
	jmp	.L21
	.cfi_endproc
.LFE52:
	.size	main, .-main
	.local	str.3519
	.comm	str.3519,100000000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	2696277389
	.long	1051772663
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
