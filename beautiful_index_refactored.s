	.file	"index.c"
	.intel_syntax noprefix
	.text
	.globl	countNums
	.type	countNums, @function
countNums:
	endbr64
	push	rbp
	mov	rbp, rsp
    push rbx
    push r12
    push r13
    push r14
    mov rbx, rdi # rbx = str
    mov r12, rsi # r12 = n
	// mov	QWORD PTR -24[rbp], rdi
	// mov	QWORD PTR -32[rbp], rsi
    // mov	QWORD PTR -16[rbp], 0
	// mov	QWORD PTR -8[rbp], 0
	mov	r13, 0 # r13 = counter
	mov	r14, 0 # r14 = i
	jmp	.L2
.L7:
	// mov	rdx, QWORD PTR -24[rbp]
	mov	rax, r14
	add	rax, rbx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 47
	jle	.L3
	// mov	rdx, QWORD PTR -24[rbp]
	mov	rax, r14
	add	rax, rbx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 57
	jg	.L3
	jmp	.L4
.L6:
	add	r14, 1
.L4:
	mov	rax, r14
	add	rax, rbx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 47
	jle	.L5
	mov	rax, r14
	add	rax, rbx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 57
	jle	.L6
.L5:
	add	r14, 1
.L3:
	add	r14, 1
.L2:
	mov	rax, r14
	cmp	rax, rsi
	jb	.L7
	mov	rax, r14
	pop	rbp
	ret
	.size	countNums, .-countNums
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"./tests/in.txt"
.LC2:
	.string	"w"
.LC3:
	.string	"./tests/refactored_out.txt"
.LC4:
	.string	"%lu"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rcx, rax
	mov	edx, 100000000
	mov	esi, 1
	lea	rdi, str.3026[rip]
	call	fread@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fclose@PLT
	lea	rsi, .LC2[rip]
	lea	rdi, .LC3[rip]
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rax
	lea	rdi, str.3026[rip]
	call	countNums
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.local	str.3026
	.comm	str.3026,100000000,32
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
