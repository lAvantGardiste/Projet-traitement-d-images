	.file	"kdtree.c"
	.text
	.p2align 4
	.globl	variance
	.type	variance, @function
variance:
.LFB53:
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
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	call	color_table_give_nb_color@PLT
	movslq	%eax, %r13
	leaq	0(,%r13,4), %rax
	movl	%r13d, 4(%rsp)
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	malloc@PLT
	movq	%rax, %rbx
	testl	%r13d, %r13d
	jle	.L2
	xorl	%r15d, %r15d
	pxor	%xmm2, %xmm2
	leaq	28(%rsp), %r14
	.p2align 4,,10
	.p2align 3
.L3:
	movq	%r14, %rdx
	movl	%r15d, %esi
	movq	%rbp, %rdi
	movss	%xmm2, (%rsp)
	call	color_table_get_color@PLT
	movl	28(%rsp,%r12,4), %edx
	pxor	%xmm1, %xmm1
	movss	(%rsp), %xmm2
	cvtsi2ssl	%edx, %xmm1
	movl	%edx, (%rbx,%r15,4)
	addq	$1, %r15
	addss	%xmm1, %xmm2
	cmpq	%r15, %r13
	jne	.L3
	pxor	%xmm3, %xmm3
	movq	8(%rsp), %r12
	movq	%rbx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2ssl	4(%rsp), %xmm3
	addq	%rbx, %r12
	divss	%xmm3, %xmm2
	.p2align 4,,10
	.p2align 3
.L6:
	pxor	%xmm1, %xmm1
	cvtss2sd	%xmm0, %xmm0
	addq	$4, %rax
	cvtsi2ssl	-4(%rax), %xmm1
	subss	%xmm2, %xmm1
	cvtss2sd	%xmm1, %xmm1
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	cmpq	%rax, %r12
	jne	.L6
.L5:
	movq	%rbx, %rdi
	movss	%xmm0, 4(%rsp)
	movss	%xmm3, (%rsp)
	call	free@PLT
	movss	(%rsp), %xmm3
	movss	4(%rsp), %xmm0
	divss	%xmm3, %xmm0
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L13
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	.p2align 4,,10
	.p2align 3
.L2:
	.cfi_restore_state
	pxor	%xmm3, %xmm3
	pxor	%xmm0, %xmm0
	cvtsi2ssl	4(%rsp), %xmm3
	jmp	.L5
.L13:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE53:
	.size	variance, .-variance
	.p2align 4
	.globl	create_kdtree
	.type	create_kdtree, @function
create_kdtree:
.LFB54:
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
	movl	%esi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movl	$40, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	malloc@PLT
	movq	%rbx, %rdi
	movq	%rbx, (%rax)
	movq	%rax, %rbp
	call	color_table_get_nb_color@PLT
	movl	%eax, %r12d
	movl	depth.4(%rip), %eax
	leal	1(%rax), %edx
	movslq	%edx, %rax
	movl	%edx, %ecx
	imulq	$1431655766, %rax, %rax
	sarl	$31, %ecx
	shrq	$32, %rax
	subl	%ecx, %eax
	leal	(%rax,%rax,2), %ecx
	movl	%edx, %eax
	subl	%ecx, %eax
	cmpl	$-1, value.3(%rip)
	movl	%eax, depth.4(%rip)
	je	.L27
	cltq
	leaq	axes.1(%rip), %rdx
	movq	%rbx, %rdi
	movl	(%rdx,%rax,4), %r14d
	movl	%r14d, %esi
	call	color_table_sort@PLT
	movl	%r14d, 24(%rbp)
.L19:
	movl	%r12d, %r14d
	movl	$12, %edi
	call	malloc@PLT
	shrl	$31, %r14d
	movq	%rbx, %rdi
	addl	%r12d, %r14d
	movq	%rax, %r15
	movq	%rax, %rdx
	sarl	%r14d
	movl	%r14d, %esi
	call	color_table_get_color@PLT
	movq	%r15, 32(%rbp)
	cmpl	%r13d, %r12d
	jle	.L28
	cmpl	$3, %r12d
	movl	$1, %eax
	leal	-1(%r14), %edx
	movq	%rbx, %rdi
	cmovle	%eax, %edx
	xorl	%esi, %esi
	call	color_table_duplicate@PLT
	movl	%r13d, %esi
	movq	%rax, %rdi
	call	create_kdtree
	movl	%r12d, %edx
	movl	%r14d, %esi
	movq	%rbx, %rdi
	movq	%rax, 8(%rbp)
	subl	%r14d, %edx
	call	color_table_duplicate@PLT
	movl	%r13d, %esi
	movq	%rax, %rdi
	call	create_kdtree
	movq	%rax, 16(%rbp)
	movl	depth.4(%rip), %eax
	leal	2(%rax), %edx
	movslq	%edx, %rax
	movl	%edx, %ecx
	imulq	$1431655766, %rax, %rax
	sarl	$31, %ecx
	shrq	$32, %rax
	subl	%ecx, %eax
	leal	(%rax,%rax,2), %eax
	subl	%eax, %edx
	movl	%edx, depth.4(%rip)
.L14:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax
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
	.p2align 4,,10
	.p2align 3
.L27:
	.cfi_restore_state
	xorl	%esi, %esi
	movq	%rbx, %rdi
	leaq	var.2(%rip), %r14
	call	variance
	movl	$1, %esi
	movq	%rbx, %rdi
	movss	%xmm0, var.2(%rip)
	call	variance
	movl	$2, %esi
	movq	%rbx, %rdi
	movss	%xmm0, 4+var.2(%rip)
	call	variance
	movss	4+var.2(%rip), %xmm1
	pxor	%xmm2, %xmm2
	xorl	%edx, %edx
	movl	$0, value.3(%rip)
	comiss	%xmm2, %xmm1
	pxor	%xmm2, %xmm2
	movss	%xmm0, 8+var.2(%rip)
	seta	%dl
	cvtsi2ssl	%edx, %xmm2
	comiss	%xmm2, %xmm0
	ja	.L23
	leal	2(%rdx), %eax
	movl	$2863311531, %edi
	leal	1(%rdx), %ecx
	movq	%rax, %rsi
	imulq	%rdi, %rax
	shrq	$33, %rax
	leal	(%rax,%rax,2), %edi
	movl	%esi, %eax
	subl	%edi, %eax
	movl	%edx, %edi
	movslq	%eax, %rsi
	movss	(%r14,%rsi,4), %xmm1
.L16:
	movslq	%ecx, %rsi
	movl	%edx, axes.1(%rip)
	movss	(%r14,%rsi,4), %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L17
	movl	%eax, %esi
	movl	%ecx, %eax
	movl	%esi, %ecx
.L17:
	movl	%edx, 24(%rbp)
	movl	%edi, %esi
	movq	%rbx, %rdi
	movl	%ecx, 8+axes.1(%rip)
	movl	%eax, 4+axes.1(%rip)
	call	color_table_sort@PLT
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L28:
	movl	depth.4(%rip), %eax
	pxor	%xmm0, %xmm0
	movups	%xmm0, 8(%rbp)
	leal	2(%rax), %edx
	movslq	%edx, %rax
	movl	%edx, %ecx
	imulq	$1431655766, %rax, %rax
	sarl	$31, %ecx
	shrq	$32, %rax
	subl	%ecx, %eax
	leal	(%rax,%rax,2), %eax
	subl	%eax, %edx
	movl	%edx, depth.4(%rip)
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L23:
	movl	$2, %edi
	movl	$1, %eax
	xorl	%ecx, %ecx
	movl	$2, %edx
	jmp	.L16
	.cfi_endproc
.LFE54:
	.size	create_kdtree, .-create_kdtree
	.local	axes.1
	.comm	axes.1,12,8
	.local	var.2
	.comm	var.2,12,8
	.data
	.align 4
	.type	value.3, @object
	.size	value.3, 4
value.3:
	.long	-1
	.align 4
	.type	depth.4, @object
	.size	depth.4, 4
depth.4:
	.long	-1
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
