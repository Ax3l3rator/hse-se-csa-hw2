	.intel_syntax noprefix
	.text
	.globl	generateString
	.type	generateString, @function
generateString:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	rbx, rdi
	mov	r12, rsi
	mov	r13, 0
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
	mov	rdx, rbx
	mov	rax, r13
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl
	add	r13, 1
.L10:
	mov	rax, r13
	cmp	rax, r12
	jb	.L11
	nop
	nop
	leave
	ret
	.size	generateString, .-generateString