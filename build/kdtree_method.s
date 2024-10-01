	.file	"kdtree_method.c"
	.text
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
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	FAIRE_image@PLT
	movq	16(%r14), %rsi
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	image_charger@PLT
	movq	%rbx, %rdi
	call	create_color_table@PLT
	movq	%rbx, %rdi
	movq	%rax, %rbp
	call	DEFAIRE_image@PLT
	movl	$20, %esi
	movq	%rbp, %rdi
	call	create_kdtree@PLT
	movq	%rax, %r13
	xorl	%eax, %eax
	call	FAIRE_image@PLT
	movq	8(%r14), %rsi
	movq	%rax, %rbx
	movq	%rax, %rdi
	call	image_charger@PLT
	movq	%rbx, %rdi
	call	image_give_hauteur@PLT
	movq	%rbx, %rdi
	movl	%eax, %r12d
	call	image_give_largeur@PLT
	movq	%rbx, %rdi
	imull	%eax, %r12d
	call	image_debut@PLT
	testl	%r12d, %r12d
	jle	.L2
	xorl	%r15d, %r15d
	leaq	12(%rsp), %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%rbx, %rdi
	addl	$1, %r15d
	call	image_lire_pixel@PLT
	movq	%rbp, %rdx
	movq	%r13, %rdi
	movq	%rax, %rsi
	call	kd_get_nearest_color@PLT
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	image_ecrire_pixel@PLT
	movq	%rbx, %rdi
	call	image_pixel_suivant@PLT
	cmpl	%r15d, %r12d
	jne	.L3
.L2:
	movq	8(%r14), %rsi
	movq	%rbx, %rdi
	call	image_sauvegarder@PLT
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L8
	addq	$40, %rsp
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
.L8:
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
