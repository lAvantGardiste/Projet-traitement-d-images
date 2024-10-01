	.file	"trivial_method.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%d %d %d\n"
.LC1:
	.string	"%d %d %d \n\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	leaq	60(%rsp), %rbp
	call	FAIRE_image@PLT
	movq	16(%r13), %rsi
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	image_charger@PLT
	movq	%rbx, %rdi
	call	create_color_table@PLT
	movq	%rbx, %rdi
	movq	%rax, %r12
	call	DEFAIRE_image@PLT
	xorl	%eax, %eax
	call	FAIRE_image@PLT
	movq	8(%r13), %rsi
	movq	%rax, %rbx
	movq	%rax, %rdi
	movq	%rax, (%rsp)
	call	image_charger@PLT
	movq	%rbx, %rdi
	call	image_give_hauteur@PLT
	movq	%rbx, %rdi
	call	image_give_largeur@PLT
	movq	%r12, %rdi
	call	color_table_get_nb_color@PLT
	movq	%rbx, %rdi
	movl	%eax, %r15d
	movl	%eax, 12(%rsp)
	call	image_debut@PLT
	movslq	%r15d, %rax
	movl	%r14d, %r15d
	movq	%rax, %rbx
	leaq	0(,%rax,4), %rdi
	movq	%rax, 24(%rsp)
	call	malloc@PLT
	movl	%ebx, %r9d
	movq	%r13, 40(%rsp)
	movl	$50, 20(%rsp)
	movq	%rax, %r14
	movq	%r9, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L8:
	movq	(%rsp), %rdi
	call	image_lire_pixel@PLT
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	movl	4(%rax), %ecx
	movl	(%rax), %edx
	movq	%rax, %rbx
	movl	8(%rax), %r8d
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L5
	movl	%r15d, 16(%rsp)
	movq	%rbx, %r15
	movq	24(%rsp), %rbx
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbp, %rdx
	movl	%r13d, %esi
	movq	%r12, %rdi
	call	color_table_get_color@PLT
	movl	60(%rsp), %edx
	pxor	%xmm0, %xmm0
	subl	(%r15), %edx
	cvtsi2sdl	%edx, %xmm0
	pxor	%xmm2, %xmm2
	movl	64(%rsp), %edx
	subl	4(%r15), %edx
	cvtsi2sdl	%edx, %xmm2
	pxor	%xmm1, %xmm1
	movl	68(%rsp), %edx
	subl	8(%r15), %edx
	cvtsi2sdl	%edx, %xmm1
	mulsd	%xmm0, %xmm0
	mulsd	%xmm2, %xmm2
	mulsd	%xmm1, %xmm1
	addsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %edx
	movl	%edx, (%r14,%r13,4)
	addq	$1, %r13
	cmpq	%r13, %rbx
	jne	.L3
	cmpl	$1, 12(%rsp)
	movl	16(%rsp), %r15d
	movl	$1, %eax
	movl	(%r14), %edx
	je	.L5
	movq	32(%rsp), %r9
	.p2align 4,,10
	.p2align 3
.L7:
	movl	(%r14,%rax,4), %ecx
	cmpl	%ecx, %edx
	cmovg	%eax, %r15d
	cmovg	%ecx, %edx
	addq	$1, %rax
	cmpq	%rax, %r9
	jne	.L7
.L5:
	movq	%rbp, %rdx
	movl	%r15d, %esi
	movq	%r12, %rdi
	call	color_table_get_color@PLT
	movq	%rbp, %rdx
	movl	%r15d, %esi
	movq	%r12, %rdi
	call	color_table_get_color@PLT
	movl	68(%rsp), %r8d
	movl	64(%rsp), %ecx
	xorl	%eax, %eax
	movl	60(%rsp), %edx
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	call	__printf_chk@PLT
	movq	(%rsp), %rbx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	image_ecrire_pixel@PLT
	movq	%rbx, %rdi
	call	image_pixel_suivant@PLT
	subl	$1, 20(%rsp)
	jne	.L8
	movq	40(%rsp), %r13
	movq	(%rsp), %rdi
	movq	8(%r13), %rsi
	call	image_sauvegarder@PLT
	movq	72(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L16
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.2.0-4ubuntu3) 13.2.0"
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
