	.file	"table.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"probleme"
	.text
	.p2align 4
	.globl	create_color_table
	.type	create_color_table, @function
create_color_table:
.LFB20:
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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	image_give_hauteur@PLT
	movq	%rbp, %rdi
	movl	%eax, %r14d
	call	image_give_largeur@PLT
	movq	%rbp, %rdi
	movl	%eax, %r12d
	call	image_give_largeur@PLT
	movq	%rbp, %rdi
	movl	%eax, %ebx
	call	image_give_dim@PLT
	imull	%eax, %ebx
	testq	%rbp, %rbp
	je	.L2
	imull	$-1431655765, %ebx, %ebx
	addl	$715827882, %ebx
	cmpl	$1431655764, %ebx
	ja	.L2
	movq	%rbp, %rdi
	imull	%r12d, %r14d
	movl	$1, %r15d
	call	image_debut@PLT
	movq	%rbp, %rdi
	call	image_lire_pixel@PLT
	movl	$16, %edi
	movq	%rax, %rbx
	call	malloc@PLT
	movl	$4, %edi
	movq	%rax, %r13
	call	malloc@PLT
	movl	4(%rbx), %edx
	movl	8(%rbx), %ecx
	movq	%rax, 0(%r13)
	sarl	$8, %edx
	sall	$16, %ecx
	orl	%ecx, %edx
	orl	(%rbx), %edx
	movl	%edx, (%rax)
	cmpl	$1, %r14d
	jle	.L5
	movl	$1, %r12d
	.p2align 4,,10
	.p2align 3
.L10:
	movq	%rbp, %rdi
	call	image_pixel_suivant@PLT
	movq	%rbp, %rdi
	call	image_lire_pixel@PLT
	movq	0(%r13), %rdi
	movl	4(%rax), %ebx
	movl	8(%rax), %edx
	sall	$8, %ebx
	sall	$16, %edx
	orl	%edx, %ebx
	orl	(%rax), %ebx
	testl	%r15d, %r15d
	jle	.L9
	movslq	%r15d, %rdx
	movq	%rdi, %rax
	leaq	(%rdi,%rdx,4), %rdx
	jmp	.L8
	.p2align 4,,10
	.p2align 3
.L19:
	addq	$4, %rax
	cmpq	%rdx, %rax
	je	.L9
.L8:
	cmpl	%ebx, (%rax)
	jne	.L19
	addl	$1, %r12d
	cmpl	%r12d, %r14d
	jne	.L10
.L5:
	movl	%r15d, 8(%r13)
	movq	%rbp, %rdi
	movl	$1, 12(%r13)
	call	image_debut@PLT
.L1:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rax
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
.L9:
	.cfi_restore_state
	addl	$1, %r15d
	addl	$1, %r12d
	movslq	%r15d, %rdx
	salq	$2, %rdx
	movq	%rdx, %rsi
	movq	%rdx, 8(%rsp)
	call	realloc@PLT
	movq	8(%rsp), %rdx
	movq	%rax, 0(%r13)
	movl	%ebx, -4(%rax,%rdx)
	cmpl	%r12d, %r14d
	jne	.L10
	jmp	.L5
.L2:
	leaq	.LC0(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	xorl	%r13d, %r13d
	call	__printf_chk@PLT
	jmp	.L1
	.cfi_endproc
.LFE20:
	.size	create_color_table, .-create_color_table
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"lib\303\251ration de la suite de couleur ainsi que la table tout enti\303\250re"
	.text
	.p2align 4
	.globl	destroy_color_table
	.type	destroy_color_table, @function
destroy_color_table:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	cmpl	$1, 12(%rdi)
	movq	%rdi, %rbx
	je	.L23
	movq	%rbx, %rdi
	call	free@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	.cfi_restore_state
	movq	(%rdi), %rdi
	call	free@PLT
	leaq	.LC1(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rbx, %rdi
	call	free@PLT
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE21:
	.size	destroy_color_table, .-destroy_color_table
	.section	.rodata.str1.1
.LC2:
	.string	"src/table.c"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"offset< table->nb_color && size<=table->nb_color"
	.align 8
.LC4:
	.string	"offset+size <= table->nb_color"
	.text
	.p2align 4
	.globl	color_table_duplicate
	.type	color_table_duplicate, @function
color_table_duplicate:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	8(%rdi), %eax
	cmpl	%edx, %eax
	jl	.L28
	movslq	%esi, %rbx
	cmpl	%ebx, %eax
	jle	.L28
	movl	%edx, %ebp
	leal	(%rbx,%rdx), %edx
	cmpl	%edx, %eax
	jl	.L30
	movq	%rdi, %r12
	movl	$16, %edi
	call	malloc@PLT
	movq	(%r12), %rdx
	movl	%ebp, 8(%rax)
	leaq	(%rdx,%rbx,4), %rdx
	movl	$0, 12(%rax)
	movq	%rdx, (%rax)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L28:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.2(%rip), %rcx
	movl	$90, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC3(%rip), %rdi
	call	__assert_fail@PLT
.L30:
	leaq	__PRETTY_FUNCTION__.2(%rip), %rcx
	movl	$91, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE22:
	.size	color_table_duplicate, .-color_table_duplicate
	.p2align 4
	.globl	color_table_get_nb_color
	.type	color_table_get_nb_color, @function
color_table_get_nb_color:
.LFB23:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L33
	movl	8(%rdi), %eax
	ret
.L33:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	color_table_get_nb_color, .-color_table_get_nb_color
	.section	.rodata.str1.1
.LC5:
	.string	"table !=NULL"
.LC6:
	.string	"indice<table->nb_color"
	.text
	.p2align 4
	.globl	color_table_get_color
	.type	color_table_get_color, @function
color_table_get_color:
.LFB24:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testq	%rdi, %rdi
	je	.L38
	cmpl	%esi, 8(%rdi)
	jle	.L39
	movq	(%rdi), %rax
	movslq	%esi, %rsi
	leaq	(%rax,%rsi,4), %rax
	movzbl	(%rax), %ecx
	movl	%ecx, (%rdx)
	movl	(%rax), %ecx
	movzbl	%ch, %ecx
	movl	%ecx, 4(%rdx)
	movzbl	2(%rax), %eax
	movl	%eax, 8(%rdx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L38:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.1(%rip), %rcx
	movl	$113, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	__assert_fail@PLT
.L39:
	leaq	__PRETTY_FUNCTION__.1(%rip), %rcx
	movl	$114, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC6(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE24:
	.size	color_table_get_color, .-color_table_get_color
	.section	.rodata.str1.1
.LC7:
	.string	"couleur>=0 && couleur <= 2"
	.text
	.p2align 4
	.globl	color_table_sort
	.type	color_table_sort, @function
color_table_sort:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	cmpl	$2, %esi
	ja	.L41
	cmpl	$1, 8(%rdi)
	movq	%rdi, %rbp
	jle	.L40
	movq	(%rdi), %r9
	leal	0(,%rsi,8), %ecx
	movl	$255, %edi
	movl	$1, %r11d
	sall	%cl, %edi
	leaq	4(%r9), %r10
	.p2align 4,,10
	.p2align 3
.L46:
	movl	(%r10), %ebx
	movl	%edi, %r8d
	movq	%r10, %rax
	andl	%ebx, %r8d
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L45:
	movl	%edx, (%rax)
	leaq	-4(%rcx), %rax
	cmpq	%rax, %r9
	je	.L48
.L43:
	movl	-4(%rax), %edx
	movq	%rax, %rcx
	movl	%edx, %esi
	andl	%edi, %esi
	cmpl	%r8d, %esi
	jg	.L45
	movl	%ebx, (%rcx)
	addl	$1, %r11d
	addq	$4, %r10
	cmpl	%r11d, 8(%rbp)
	jg	.L46
.L40:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	.cfi_restore_state
	movq	%r9, %rcx
	addl	$1, %r11d
	addq	$4, %r10
	movl	%ebx, (%rcx)
	cmpl	%r11d, 8(%rbp)
	jg	.L46
	jmp	.L40
.L41:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$123, %edx
	leaq	.LC2(%rip), %rsi
	leaq	.LC7(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE25:
	.size	color_table_sort, .-color_table_sort
	.p2align 4
	.globl	color_table_give_nb_color
	.type	color_table_give_nb_color, @function
color_table_give_nb_color:
.LFB29:
	.cfi_startproc
	endbr64
	testq	%rdi, %rdi
	je	.L53
	movl	8(%rdi), %eax
	ret
.L53:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE29:
	.size	color_table_give_nb_color, .-color_table_give_nb_color
	.p2align 4
	.globl	color_table_give_owner
	.type	color_table_give_owner, @function
color_table_give_owner:
.LFB27:
	.cfi_startproc
	endbr64
	movl	12(%rdi), %eax
	ret
	.cfi_endproc
.LFE27:
	.size	color_table_give_owner, .-color_table_give_owner
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 17
__PRETTY_FUNCTION__.0:
	.string	"color_table_sort"
	.align 16
	.type	__PRETTY_FUNCTION__.1, @object
	.size	__PRETTY_FUNCTION__.1, 22
__PRETTY_FUNCTION__.1:
	.string	"color_table_get_color"
	.align 16
	.type	__PRETTY_FUNCTION__.2, @object
	.size	__PRETTY_FUNCTION__.2, 22
__PRETTY_FUNCTION__.2:
	.string	"color_table_duplicate"
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
