	.file	"index.c"
	.intel_syntax noprefix
	.text
	.globl	countNums
	.type	countNums, @function
countNums:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -16[rbp], 0
	mov	QWORD PTR -8[rbp], 0
	jmp	.L2
.L7:
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 47
	jle	.L3
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 57
	jg	.L3
	jmp	.L4
.L6:
	add	QWORD PTR -8[rbp], 1
.L4:
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 47
	jle	.L5
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 57
	jle	.L6
.L5:
	add	QWORD PTR -16[rbp], 1
.L3:
	add	QWORD PTR -8[rbp], 1
.L2:
	mov	rax, QWORD PTR -8[rbp]
	cmp	rax, QWORD PTR -32[rbp]
	jb	.L7
	mov	rax, QWORD PTR -16[rbp]
	pop	rbp
	ret
	.size	countNums, .-countNums
	.globl	generateString
	.type	generateString, @function
generateString:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -8[rbp], 0
	jmp	.L10
.L11:
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, -2130574327
	shr	rdx, 32
	add	edx, eax
	mov	ecx, edx
	sar	ecx, 6
	cdq
	sub	ecx, edx
	mov	edx, ecx
	sal	edx, 7
	sub	edx, ecx
	sub	eax, edx
	mov	ecx, eax
	mov	eax, ecx
	lea	ecx, 1[rax]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	add	QWORD PTR -8[rbp], 1
.L10:
	mov	rax, QWORD PTR -8[rbp]
	cmp	rax, QWORD PTR -32[rbp]
	jb	.L11
	nop
	nop
	leave
	ret
	.size	generateString, .-generateString
	.section	.rodata
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
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi
	mov	QWORD PTR -80[rbp], rsi
	cmp	DWORD PTR -68[rbp], 1
	jg	.L13
	mov	eax, 1
	jmp	.L14
.L13:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC0[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L15
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1441151867
	shr	rdx, 32
	mov	ecx, edx
	sar	ecx, 25
	cdq
	sub	ecx, edx
	mov	edx, ecx
	imul	edx, edx, 100000001
	sub	eax, edx
	mov	edx, eax
	movsx	rax, edx
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rax
	lea	rdi, str.3144[rip]
	call	generateString
	call	clock@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rax
	lea	rdi, str.3144[rip]
	call	countNums
	mov	QWORD PTR -24[rbp], rax
	call	clock@PLT
	sub	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	cvtsi2sd	xmm0, QWORD PTR -8[rbp]
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	lea	rdi, .LC3[rip]
	mov	eax, 1
	call	printf@PLT
	jmp	.L16
.L15:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L17
	mov	rax, QWORD PTR stdin[rip]
	mov	rcx, rax
	mov	edx, 100000000
	mov	esi, 1
	lea	rdi, str.3144[rip]
	call	fread@PLT
	mov	QWORD PTR -48[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rax
	lea	rdi, str.3144[rip]
	call	countNums
	mov	QWORD PTR -24[rbp], rax
	call	clock@PLT
	sub	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	printf@PLT
	cvtsi2sd	xmm0, QWORD PTR -16[rbp]
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	lea	rdi, .LC3[rip]
	mov	eax, 1
	call	printf@PLT
	jmp	.L16
.L17:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -56[rbp], rax
	cmp	QWORD PTR -56[rbp], 0
	jne	.L18
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	eax, 1
	jmp	.L14
.L18:
	mov	rax, QWORD PTR -56[rbp]
	mov	rcx, rax
	mov	edx, 100000000
	mov	esi, 1
	lea	rdi, str.3144[rip]
	call	fread@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rsi, .LC7[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -40[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	rsi, rax
	lea	rdi, str.3144[rip]
	call	countNums
	mov	QWORD PTR -24[rbp], rax
	call	clock@PLT
	sub	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR -32[rbp], rax
	cvtsi2sd	xmm0, QWORD PTR -32[rbp]
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	lea	rdi, .LC3[rip]
	mov	eax, 1
	call	printf@PLT
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -40[rbp]
	lea	rsi, .LC8[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L16:
	mov	eax, 0
.L14:
	leave
	ret
	.size	main, .-main
	.local	str.3144
	.comm	str.3144,100000000,32
	.section	.rodata
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
