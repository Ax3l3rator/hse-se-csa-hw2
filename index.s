	.file	"index.c"
	.intel_syntax noprefix
	.text
	.globl	countNums
	.type	countNums, @function
countNums:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi # Кладем на стек указатель на string
	mov	QWORD PTR -32[rbp], rsi # Кладем на стек length
	mov	QWORD PTR -16[rbp], 0 # Кладем на стек 0(counter = 0)
	mov	QWORD PTR -8[rbp], 0 # Кладем на стек 0(i = 0)
	jmp	.L4
.L9:
	mov	rdx, QWORD PTR -24[rbp] # 63-66: eax = string[i]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 47 # string[i] сравнивается с 47, который является передыдущим перед '0' символом, поэтому далее используется не jl, а jle
	jle	.L5 # Если string[i] < '0' выходим из if
	mov	rdx, QWORD PTR -24[rbp] # 69-72: eax = string[i]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx 
	movzx	eax, BYTE PTR [rax]
	cmp	al, 57 # string[i] сравнивается с 57, ACII-код символа '9', так что используется jg
	jg	.L5 # Если string[i] > '9' выходим из if
	jmp	.L6 # Входим в while
.L8:
	add	QWORD PTR -8[rbp], 1 # ++i  внутри while
.L6:
	mov	rdx, QWORD PTR -24[rbp] # Условие while такое же, как и условие в if, поэтому код на 79-90 строках практически идентичен коду на 63-75 строках, различия я прокомментирую дополнительно
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 47 
	jle	.L7 # выходим из while
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 57
	jle	.L8 # если к этому моменту не вышли из while, то либо выходим (когда jle = false), либо вовзращаемся в тело цикла и проверку условия
.L7:
	add	QWORD PTR -16[rbp], 1 # ++counter
.L5:
	add	QWORD PTR -8[rbp], 1 # ++i в for
.L4:
	mov	rax, QWORD PTR -8[rbp] # rax = i 
	cmp	rax, QWORD PTR -32[rbp] # cmp(i, length)
	jb	.L9 # если i < length, возвращаемся в начало for
	mov	rax, QWORD PTR -16[rbp] # Иначе записываем в rax counter и возвращаем его
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	countNums, .-countNums
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"./tests/in.txt"
.LC2:
	.string	"w"
.LC3:
	.string	"./tests/asm_out.txt"
.LC4:
	.string	"%lu"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	lea	rsi, .LC0[rip] # передаем "r" как 2 аргумент
	lea	rdi, .LC1[rip] # передаем "./tests/in.txt" как 1 аргумент
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax # Записали результат на стек
	mov	rax, QWORD PTR -24[rbp] 
	mov	rcx, rax # передали поток ввода как 4 аргумент
	mov	edx, 100000000 # передали константу как 3 аргумент
	mov	esi, 1 # передали константу как 2 аргумент
	lea	rdi, str.3026[rip] # передали строку как 1 аргумент
	call	fread@PLT 
	mov	QWORD PTR -16[rbp], rax 
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax # передали поток ввода как 1 аргумент
	call	fclose@PLT
	lea	rsi, .LC2[rip] # передали 'w' как 2 аргумент
	lea	rdi, .LC3[rip] # передали './tests/out.txt' как 3 аргумент
	call	fopen@PLT 
	mov	QWORD PTR -8[rbp], rax # сохранили поток вывода на стеке
	mov	rax, QWORD PTR -16[rbp] 
	mov	rsi, rax # передали n как 2 аргумент
	lea	rdi, str.3026[rip] # передали строку как 1 аргумент
	call	countNums
	mov	rdx, rax # сохранили в rdx результат и передаем его как 3 аргумент
	mov	rax, QWORD PTR -8[rbp] # достаем из стека поток вывода
	lea	rsi, .LC4[rip] # передаем "%lu" как 2 аргумент
	mov	rdi, rax # передаем поток ввода как 1 аргумент
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -8[rbp] # достаем из стека поток вывода
	mov	rdi, rax # и передаем его как 1 аргумент
	call	fclose@PLT
	mov	eax, 0 # возвращаем 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
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
