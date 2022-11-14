	.intel_syntax noprefix
	.text
	.globl	countNums
	.type	countNums, @function
countNums:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	rbx, rdi
	mov	r12, rsi
	mov	r13, 0
	mov	r14, 0
	jmp	.L2
.L7:
	mov	rdx, rbx
	mov	rax, r14
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 47
	jle	.L3
	mov	rdx, rbx
	mov	rax, r14
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 57
	jg	.L3
	jmp	.L4
.L6:
	add	r14, 1
.L4:
	mov	rdx, rbx
	mov	rax, r14
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 47
	jle	.L5
	mov	rdx, rbx
	mov	rax, r14
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 57
	jle	.L6
.L5:
	add	r13, 1
.L3:
	add	r14, 1
.L2:
	mov	rax, r14
	cmp	rax, r12
	jb	.L7
	mov	rax, r13
	pop	rbp
	ret
	.size	countNums, .-countNums