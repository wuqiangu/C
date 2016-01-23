	.file	"max.c"
	.section	.rodata
.LC1:
	.string	"4*max_1(2,3) = %d\n"
.LC2:
	.string	"4*max(2,3) = %d\n"
	.align 8
.LC3:
	.string	"max_2(++a, ++b)= %d\na=%d, b=%d\n"
.LC4:
	.string	"max(++a,++b) = %d\na=%d, b=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	movss	.LC0(%rip), %xmm0
	movss	%xmm0, -12(%rbp)
	movl	$0, -16(%rbp)
	movl	$2, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movl	$2, -20(%rbp)
	movl	$3, -24(%rbp)
	movl	-24(%rbp), %edx
	movl	-20(%rbp), %eax
	cmpl	%eax, %edx
	cmovge	%edx, %eax
	sall	$2, %eax
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$3, -4(%rbp)
	movl	$3, -8(%rbp)
	addl	$1, -4(%rbp)
	addl	$1, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jle	.L2
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	jmp	.L3
.L2:
	addl	$1, -8(%rbp)
	movl	-8(%rbp), %eax
.L3:
	movl	%eax, -16(%rbp)
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %edx
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$3, -4(%rbp)
	movl	$3, -8(%rbp)
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -28(%rbp)
	addl	$1, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, -32(%rbp)
	movl	-32(%rbp), %edx
	movl	-28(%rbp), %eax
	cmpl	%eax, %edx
	cmovge	%edx, %eax
	movl	%eax, -16(%rbp)
	movl	-8(%rbp), %ecx
	movl	-4(%rbp), %edx
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1056964608
	.ident	"GCC: (GNU) 5.3.1 20151207 (Red Hat 5.3.1-2)"
	.section	.note.GNU-stack,"",@progbits
