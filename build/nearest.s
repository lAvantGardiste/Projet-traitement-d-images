	.file	"nearest.c"
	.text
	.p2align 4
	.globl	distance
	.type	distance, @function
distance:
.LFB39:
	.cfi_startproc
	endbr64
	movl	(%rdi), %eax
	pxor	%xmm0, %xmm0
	subl	(%rsi), %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm0
	movl	4(%rdi), %eax
	subl	4(%rsi), %eax
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movl	8(%rdi), %eax
	subl	8(%rsi), %eax
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE39:
	.size	distance, .-distance
	.p2align 4
	.globl	min_dist
	.type	min_dist, @function
min_dist:
.LFB40:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$48, %rsp
	.cfi_def_cfa_offset 96
	movq	(%rdi), %rdi
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	leaq	28(%rsp), %r12
	call	color_table_get_nb_color@PLT
	movq	(%r14), %rdi
	movq	%r12, %rdx
	xorl	%esi, %esi
	movl	%eax, %ebp
	call	color_table_get_color@PLT
	movl	28(%rsp), %eax
	pxor	%xmm0, %xmm0
	subl	0(%r13), %eax
	cvtsi2sdl	%eax, %xmm0
	movl	32(%rsp), %eax
	subl	4(%r13), %eax
	mulsd	%xmm0, %xmm0
	addsd	.LC0(%rip), %xmm0
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movl	36(%rsp), %eax
	subl	8(%r13), %eax
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	mulsd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	cmpl	$1, %ebp
	jle	.L3
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L6:
	movq	(%r14), %rdi
	movl	%ebx, %esi
	movq	%r12, %rdx
	movsd	%xmm0, 8(%rsp)
	addl	$1, %ebx
	call	color_table_get_color@PLT
	movl	28(%rsp), %eax
	pxor	%xmm1, %xmm1
	subl	0(%r13), %eax
	cvtsi2sdl	%eax, %xmm1
	pxor	%xmm2, %xmm2
	movl	32(%rsp), %eax
	subl	4(%r13), %eax
	movsd	8(%rsp), %xmm0
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm2
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	movl	36(%rsp), %eax
	subl	8(%r13), %eax
	mulsd	%xmm1, %xmm1
	addsd	%xmm1, %xmm2
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	mulsd	%xmm1, %xmm1
	addsd	%xmm2, %xmm1
	minsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	cmpl	%ebx, %ebp
	jne	.L6
.L3:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L11
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE40:
	.size	min_dist, .-min_dist
	.p2align 4
	.globl	kd_get_nearest_color
	.type	kd_get_nearest_color, @function
kd_get_nearest_color:
.LFB41:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	(%rdi), %rdi
	call	color_table_get_nb_color@PLT
	movq	32(%rbx), %rax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movq	16(%rbx), %rdi
	movl	(%rax), %edx
	subl	0(%rbp), %edx
	cvtsi2sdl	%edx, %xmm0
	movl	4(%rax), %edx
	subl	4(%rbp), %edx
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edx, %xmm0
	movl	8(%rax), %edx
	subl	8(%rbp), %edx
	mulsd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%edx, %xmm0
	movslq	24(%rbx), %rdx
	movl	(%rax,%rdx,4), %eax
	movl	0(%rbp,%rdx,4), %edx
	mulsd	%xmm0, %xmm0
	addsd	%xmm1, %xmm0
	testq	%rdi, %rdi
	je	.L28
.L13:
	cmpq	$0, best.1(%rip)
	je	.L14
	movsd	best_dist.0(%rip), %xmm1
	comisd	%xmm0, %xmm1
	ja	.L14
.L15:
	pxor	%xmm0, %xmm0
	ucomisd	%xmm0, %xmm1
	jp	.L17
	je	.L12
.L17:
	subl	%edx, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	mulsd	%xmm0, %xmm0
	movsd	%xmm0, 8(%rsp)
	testl	%eax, %eax
	jle	.L20
	movq	8(%rbx), %rdi
	movq	%r12, %rdx
	movq	%rbp, %rsi
	call	kd_get_nearest_color
	movsd	8(%rsp), %xmm0
	comisd	best_dist.0(%rip), %xmm0
	jnb	.L12
	movq	16(%rbx), %rdi
.L23:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	call	kd_get_nearest_color
	movq	best.1(%rip), %rax
	movq	$0x000000000, best_dist.0(%rip)
	movq	$0, best.1(%rip)
	movq	32(%rax), %rax
	movl	(%rax), %edx
	movl	%edx, (%r12)
	movl	4(%rax), %edx
	movl	%edx, 4(%r12)
	movl	8(%rax), %eax
	movl	%eax, 8(%r12)
.L12:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L14:
	.cfi_restore_state
	movq	%rbx, best.1(%rip)
	movapd	%xmm0, %xmm1
	movsd	%xmm0, best_dist.0(%rip)
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L20:
	movq	%r12, %rdx
	movq	%rbp, %rsi
	call	kd_get_nearest_color
	movsd	8(%rsp), %xmm0
	comisd	best_dist.0(%rip), %xmm0
	jnb	.L12
	movq	8(%rbx), %rdi
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L28:
	cmpq	$0, 8(%rbx)
	jne	.L13
	addq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	min_dist
	.cfi_endproc
.LFE41:
	.size	kd_get_nearest_color, .-kd_get_nearest_color
	.local	best_dist.0
	.comm	best_dist.0,8,8
	.local	best.1
	.comm	best.1,8,8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	0
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
