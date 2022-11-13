.intel_syntax noprefix
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"./tests/in.txt"
.LC2:
	.string	"w"
.LC3:
	.string	"./tests/part_out.txt"
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
