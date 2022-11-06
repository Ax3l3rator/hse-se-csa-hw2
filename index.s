	.file	"index.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"r"
	.text
	.globl	fsize
	.type	fsize, @function
fsize:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi # кладем первый параметр(file) на стек
	mov	rax, QWORD PTR -24[rbp] # rax = file
	lea	rdx, .LC0[rip] # rdx -> "r"
	mov	rsi, rdx # rsi -> "r" - передаем как параметр
	mov	rdi, rax # rdi = file передаем как 1 параметр
	call	fopen@PLT # вызываем fopen
	mov	QWORD PTR -16[rbp], rax # сохраняем в f возврат fopen
	mov	rax, QWORD PTR -16[rbp] # rax = f
	mov	edx, 2 # 3 параметр
	mov	esi, 0 # 2 параметр
	mov	rdi, rax # rdi = file передаем как 1 параметр
	call	fseek@PLT # вызываем fseek
	mov	rax, QWORD PTR -16[rbp] # rax = f
	mov	rdi, rax # rdi = f передаем как 1 параметр
	call	ftell@PLT # вызываем ftelll
	mov	QWORD PTR -8[rbp], rax # len = ftell
	mov	rax, QWORD PTR -16[rbp] # rax = f
	mov	rdi, rax # rdi = f передаем как 1 параметр
	call	fclose@PLT # вызываем fclose
	mov	rax, QWORD PTR -8[rbp] # rax = len
	leave
	.cfi_def_cfa 7, 8
	ret # return len
	.cfi_endproc
.LFE6:
	.size	fsize, .-fsize
	.globl	countNums
	.type	countNums, @function
countNums:
.LFB7:
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
.LFE7:
	.size	countNums, .-countNums
	.section	.rodata
.LC1:
	.string	"./tests/in.txt"
.LC2:
	.string	"%c"
.LC3:
	.string	"w"
.LC4:
	.string	"./tests/asm_out.txt"
.LC5:
	.string	"%ld"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	lea	rax, .LC1[rip] # "in.txt"
	mov	rdi, rax # rdi -> "int.txt" передаем как 1 аргумент
	call	fsize # вызываем fsize
	mov	QWORD PTR -32[rbp], rax # на стеке n
	lea	rax, .LC0[rip] # "r"
	mov	rsi, rax # esi -> "r" передаем как 2 аргумент
	lea	rax, .LC1[rip] # "in.txt"
	mov	rdi, rax # rdi -> "in.txt" передаем как 1 аргумент
	call	fopen@PLT # вызывай fopen
	mov	QWORD PTR -24[rbp], rax # на стек кладем readf
	mov	rax, QWORD PTR -32[rbp] # передаем n в rax
	mov	rdi, rax # rdi = n передаем как 1 аргумент
	call	malloc@PLT # вызываем malloc
	mov	QWORD PTR -16[rbp], rax # char* str теперь на стеке
	mov	QWORD PTR -40[rbp], 0 # i = 0
	jmp	.L12
.L13:
	mov	rdx, QWORD PTR -16[rbp] # rdx = str
	mov	rax, QWORD PTR -40[rbp] # rax = i
	add	rdx, rax # rdx -> str[i]
	mov	rax, QWORD PTR -24[rbp] # rax -> readf
	lea	rcx, .LC2[rip] # "%c"
	mov	rsi, rcx # rsi -> "%c" передаем как 2 аргумент
	mov	rdi, rax # rdi -> readf передаем как 1 аргумент
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	QWORD PTR -40[rbp], 1 # ++i
.L12:
	mov	rax, QWORD PTR -40[rbp] # rax = i 
	cmp	rax, QWORD PTR -32[rbp] # cmp(rax, n)
	jb	.L13 # если меньше, то не выходим из цикла
	mov	rax, QWORD PTR -24[rbp] # rax -> readf
	mov	rdi, rax # rdi -> rax передаем как 1 аргумент
	call	fclose@PLT # вызываем fclose
	lea	rax, .LC3[rip] # rax -> "w"
	mov	rsi, rax # rsi -> "w" передаем как 2 аргумент
	lea	rax, .LC4[rip] # rax -> "out.txt"
	mov	rdi, rax # rdi -> "out.txt" передаем как 1 аргумент
	call	fopen@PLT # вызываем fopen
	mov	QWORD PTR -8[rbp], rax # writef = fopen
	mov	rdx, QWORD PTR -32[rbp] # rdx = n
	mov	rax, QWORD PTR -16[rbp] # rax = str 
	mov	rsi, rdx # rsi = n передаем как 2 аргумент
	mov	rdi, rax # rdi = str передаем как 1 аргумент
	call	countNums # вызываем countNums
	mov	rdx, rax # rdx = countNums передаем как 3 аргумент
	mov	rax, QWORD PTR -8[rbp] # rax = writef
	lea	rcx, .LC5[rip] # rcx -> "%ld"
	mov	rsi, rcx # rsi -> "%ld" передаем как 2 аргумент
	mov	rdi, rax # rdi = writef передаем как 1 аргумент
	mov	eax, 0
	call	fprintf@PLT # вызываем fpritnf
	mov	rax, QWORD PTR -8[rbp] # rax = writef
	mov	rdi, rax # rdi = writef передаем как 1 аргумент
	call	fclose@PLT # вызываем fclose
	mov	eax, 0 # 185-189: retrun 0;
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
