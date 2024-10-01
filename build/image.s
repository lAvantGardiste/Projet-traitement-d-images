	.file	"image.c"
	.text
	.p2align 4
	.type	private_default_distance_dim1, @function
private_default_distance_dim1:
.LFB45:
	.cfi_startproc
	endbr64
	movl	(%rdi), %eax
	testl	%edx, %edx
	je	.L2
	subl	(%rsi), %eax
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm0
	comisd	%xmm0, %xmm1
	ja	.L8
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L2:
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm0
	comisd	%xmm0, %xmm1
	jbe	.L1
.L8:
	xorpd	.LC1(%rip), %xmm0
	ret
	.cfi_endproc
.LFE45:
	.size	private_default_distance_dim1, .-private_default_distance_dim1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%x %X"
.LC3:
	.string	"P6\n"
.LC4:
	.string	"# Derniere  sauvegarde : %s\n"
.LC5:
	.string	"%d %d\n"
.LC6:
	.string	"%d\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"ERREUR SYSTEME : Plus de place sur disque"
	.text
	.p2align 4
	.type	image_dim_3_to_stream_priv, @function
image_dim_3_to_stream_priv:
.LFB48:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	xorl	%edi, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	subq	$288, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rax
	movq	%rax, 280(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %r12
	call	time@PLT
	leaq	8(%rsp), %rdi
	movq	%rax, 8(%rsp)
	call	localtime@PLT
	leaq	.LC2(%rip), %rdx
	movl	$256, %esi
	movq	%r12, %rdi
	movq	%rax, %rcx
	call	strftime@PLT
	movl	$1, %esi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rdx
	call	__fprintf_chk@PLT
	movq	%r12, %rcx
	movl	$1, %esi
	movq	%rbx, %rdi
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	16(%rbp), %r8d
	movl	20(%rbp), %ecx
	movq	%rbx, %rdi
	leaq	.LC5(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$255, %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	leaq	.LC6(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	32(%rbp), %rdx
	movq	0(%rbp), %rdi
	movq	%rbx, %rcx
	movl	$1, %esi
	call	fwrite@PLT
	cltq
	cmpq	32(%rbp), %rax
	jl	.L13
.L10:
	movq	%rbx, %rdi
	call	fclose@PLT
	movq	280(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L14
	addq	$288, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L13:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	leaq	.LC7(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L10
.L14:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE48:
	.size	image_dim_3_to_stream_priv, .-image_dim_3_to_stream_priv
	.section	.rodata.str1.1
.LC8:
	.string	"P5\n"
	.text
	.p2align 4
	.type	image_dim_1_to_stream_priv, @function
image_dim_1_to_stream_priv:
.LFB47:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	xorl	%edi, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	subq	$288, %rsp
	.cfi_def_cfa_offset 320
	movq	%fs:40, %rax
	movq	%rax, 280(%rsp)
	xorl	%eax, %eax
	leaq	16(%rsp), %r12
	call	time@PLT
	leaq	8(%rsp), %rdi
	movq	%rax, 8(%rsp)
	call	localtime@PLT
	leaq	.LC2(%rip), %rdx
	movl	$256, %esi
	movq	%r12, %rdi
	movq	%rax, %rcx
	call	strftime@PLT
	movl	$1, %esi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	leaq	.LC8(%rip), %rdx
	call	__fprintf_chk@PLT
	movq	%r12, %rcx
	movl	$1, %esi
	movq	%rbx, %rdi
	leaq	.LC4(%rip), %rdx
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	16(%rbp), %r8d
	movl	20(%rbp), %ecx
	movq	%rbx, %rdi
	leaq	.LC5(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$255, %ecx
	movq	%rbx, %rdi
	xorl	%eax, %eax
	leaq	.LC6(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	movq	32(%rbp), %rdx
	movq	0(%rbp), %rdi
	movq	%rbx, %rcx
	movl	$1, %esi
	call	fwrite@PLT
	cltq
	cmpq	32(%rbp), %rax
	jl	.L19
.L16:
	movq	%rbx, %rdi
	call	fclose@PLT
	movq	280(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L20
	addq	$288, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L19:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	leaq	.LC7(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	jmp	.L16
.L20:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE47:
	.size	image_dim_1_to_stream_priv, .-image_dim_1_to_stream_priv
	.p2align 4
	.type	private_default_distance_dim3, @function
private_default_distance_dim3:
.LFB46:
	.cfi_startproc
	endbr64
	testl	%edx, %edx
	movl	(%rdi), %edx
	je	.L22
	subl	(%rsi), %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movl	8(%rdi), %eax
	imull	%edx, %edx
	subl	8(%rsi), %eax
	imull	%eax, %eax
	cvtsi2sdl	%edx, %xmm0
	movl	4(%rdi), %edx
	subl	4(%rsi), %edx
	imull	%edx, %edx
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%edx, %xmm1
	addsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	addsd	%xmm1, %xmm0
	ret
	.p2align 4,,10
	.p2align 3
.L22:
	imull	%edx, %edx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movl	8(%rdi), %eax
	imull	%eax, %eax
	cvtsi2sdl	%edx, %xmm0
	movl	4(%rdi), %edx
	imull	%edx, %edx
	addsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%edx, %xmm1
	addsd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	addsd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE46:
	.size	private_default_distance_dim3, .-private_default_distance_dim3
	.section	.rodata.str1.1
.LC9:
	.string	"src/image.c"
.LC10:
	.string	"self"
	.text
	.p2align 4
	.globl	FAIRE_image
	.type	FAIRE_image, @function
FAIRE_image:
.LFB20:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$56, %edi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L27
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L27:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.7(%rip), %rcx
	movl	$60, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC10(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE20:
	.size	FAIRE_image, .-FAIRE_image
	.p2align 4
	.globl	DEFAIRE_image
	.type	DEFAIRE_image, @function
DEFAIRE_image:
.LFB21:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rdi
	jmp	free@PLT
	.cfi_endproc
.LFE21:
	.size	DEFAIRE_image, .-DEFAIRE_image
	.section	.rodata.str1.1
.LC11:
	.string	"dim >0 && dim <=3"
	.text
	.p2align 4
	.globl	image_initialize
	.type	image_initialize, @function
image_initialize:
.LFB22:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%esi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leal	-1(%rbp), %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	cmpl	$2, %eax
	ja	.L32
	movl	%edx, 20(%rdi)
	imull	%ebp, %edx
	movq	%rdi, %rbx
	movl	$1, %esi
	movl	%ebp, 40(%rdi)
	movl	%ecx, 16(%rdi)
	movl	%edx, 24(%rdi)
	imull	%ecx, %edx
	movslq	%edx, %rdi
	movq	%rdi, 32(%rbx)
	call	calloc@PLT
	movq	%rax, %xmm0
	leaq	default_distance(%rip), %rax
	movq	(%rax,%rbp,8), %rax
	punpcklqdq	%xmm0, %xmm0
	movups	%xmm0, (%rbx)
	movq	%rax, 48(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L32:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.6(%rip), %rcx
	movl	$74, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE22:
	.size	image_initialize, .-image_initialize
	.section	.rodata.str1.1
.LC12:
	.string	"r"
.LC13:
	.string	"%3s"
	.section	.rodata.str1.8
	.align 8
.LC14:
	.string	"le fichier semble ne pas etre un fichier pnm\n"
	.section	.rodata.str1.1
.LC15:
	.string	"%c%c"
.LC16:
	.string	"%s"
.LC17:
	.string	"%s "
.LC18:
	.string	"%c"
.LC19:
	.string	"\n"
.LC20:
	.string	"%d"
.LC21:
	.string	"%d%c"
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	" Image non lue :  Contient des valeurs aberrantes\n"
	.text
	.p2align 4
	.globl	image_charger
	.type	image_charger, @function
image_charger:
.LFB23:
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
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movq	%rdi, 8(%rsp)
	movq	%rsi, %rdi
	leaq	.LC12(%rip), %rsi
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	call	fopen@PLT
	testq	%rax, %rax
	je	.L50
	movq	%rax, %rdi
	movq	%rax, %rbx
	xorl	%eax, %eax
	leaq	29(%rsp), %rdx
	leaq	.LC13(%rip), %rsi
	call	__isoc99_fscanf@PLT
	cmpb	$80, 29(%rsp)
	jne	.L35
	movzbl	30(%rsp), %eax
	leal	-53(%rax), %edx
	cmpb	$1, %dl
	jbe	.L36
	cmpb	$50, %al
	jne	.L35
.L36:
	cmpb	$54, %al
	movq	8(%rsp), %rcx
	leaq	20(%rsp), %r13
	movq	%rbx, %rdi
	sete	%al
	movq	%r13, %rdx
	leaq	.LC15(%rip), %rsi
	movzbl	%al, %eax
	leal	1(%rax,%rax), %eax
	movl	%eax, 40(%rcx)
	leaq	24(%rsp), %rax
	movq	%rax, (%rsp)
	movq	%rax, %rcx
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	cmpb	$35, 24(%rsp)
	jne	.L38
	leaq	32(%rsp), %rbp
	leaq	.LC16(%rip), %r15
	leaq	.LC17(%rip), %r14
	leaq	.LC18(%rip), %r12
	.p2align 4,,10
	.p2align 3
.L39:
	movq	%rbp, %rdx
	movq	%r15, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	movq	%rbp, %rcx
	movq	%r14, %rdx
	movl	$1, %esi
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	xorl	%eax, %eax
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	__isoc99_fscanf@PLT
	cmpb	$10, 20(%rsp)
	jne	.L39
	movq	(%rsp), %rdx
	movq	%r12, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	leaq	.LC19(%rip), %rdx
	movl	$1, %esi
	call	__fprintf_chk@PLT
	cmpb	$35, 24(%rsp)
	je	.L39
.L38:
	movl	$1, %edx
	movq	$-1, %rsi
	movq	%rbx, %rdi
	call	fseek@PLT
	movq	8(%rsp), %r14
	movq	%rbx, %rdi
	xorl	%eax, %eax
	leaq	.LC20(%rip), %rbp
	leaq	20(%r14), %rdx
	movq	%rbp, %rsi
	call	__isoc99_fscanf@PLT
	leaq	16(%r14), %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	movl	40(%r14), %eax
	movq	%r13, %rdx
	movq	%rbx, %rdi
	imull	20(%r14), %eax
	leaq	19(%rsp), %rcx
	leaq	.LC21(%rip), %rsi
	movl	%eax, 24(%r14)
	imull	16(%r14), %eax
	cltq
	movq	%rax, 32(%r14)
	xorl	%eax, %eax
	call	__isoc99_fscanf@PLT
	movl	20(%r14), %edx
	testl	%edx, %edx
	jle	.L41
	movl	16(%r14), %eax
	testl	%eax, %eax
	jle	.L41
	cmpl	$1, 20(%rsp)
	jle	.L41
	movq	8(%rsp), %r15
	movq	32(%r15), %r13
	movq	%r13, %rdi
	call	malloc@PLT
	cmpb	$50, 30(%rsp)
	movq	%rax, (%r15)
	movq	%rax, %rdi
	movq	%rax, %r12
	je	.L43
	movq	%rbx, %rcx
	movq	%r13, %rdx
	movl	$1, %esi
	call	fread@PLT
.L46:
	movq	%rbx, %rdi
	call	fclose@PLT
	movq	8(%rsp), %rax
	movslq	40(%rax), %rax
	cmpl	$3, %eax
	jbe	.L47
.L48:
	xorl	%eax, %eax
.L33:
	movq	136(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L63
	addq	$152, %rsp
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
.L45:
	.cfi_restore_state
	movl	24(%rsp), %eax
	addq	$1, %r12
	movb	%al, -1(%r12)
.L43:
	movq	(%rsp), %rdx
	xorl	%eax, %eax
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	call	__isoc99_fscanf@PLT
	cmpl	$-1, %eax
	jne	.L45
	jmp	.L46
.L47:
	leaq	default_distance(%rip), %rdx
	movq	8(%rsp), %rcx
	movq	(%rdx,%rax,8), %rax
	movq	%rax, 48(%rcx)
	jmp	.L48
.L35:
	movq	stderr(%rip), %rdi
	leaq	.LC14(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
	movl	$-2, %eax
	jmp	.L33
.L41:
	movq	stderr(%rip), %rdi
	leaq	.LC22(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movl	$-3, %eax
	jmp	.L33
.L50:
	orl	$-1, %eax
	jmp	.L33
.L63:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE23:
	.size	image_charger, .-image_charger
	.section	.rodata.str1.1
.LC23:
	.string	"Image Non sauvegardable\n"
.LC24:
	.string	"w"
	.text
	.p2align 4
	.globl	image_sauvegarder
	.type	image_sauvegarder, @function
image_sauvegarder:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	40(%rdi), %eax
	movq	%rdi, %rbx
	andl	$-3, %eax
	cmpl	$1, %eax
	jne	.L70
	movq	%rsi, %rdi
	leaq	.LC24(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %rsi
	testq	%rax, %rax
	je	.L68
	movslq	40(%rbx), %rdx
	leaq	sauvegarde.5(%rip), %rax
	movq	%rbx, %rdi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movq	(%rax,%rdx,8), %rax
	jmp	*%rax
	.p2align 4,,10
	.p2align 3
.L70:
	.cfi_restore_state
	movq	stderr(%rip), %rdi
	leaq	.LC23(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L68:
	movl	$-1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	image_sauvegarder, .-image_sauvegarder
	.p2align 4
	.globl	image_to_stream
	.type	image_to_stream, @function
image_to_stream:
.LFB25:
	.cfi_startproc
	endbr64
	movslq	40(%rdi), %rax
	movl	%eax, %edx
	andl	$-3, %edx
	cmpl	$1, %edx
	jne	.L75
	leaq	sauvegarde.4(%rip), %rdx
	jmp	*(%rdx,%rax,8)
.L75:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	stderr(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	leaq	.LC23(%rip), %rdx
	call	__fprintf_chk@PLT
	movl	$-1, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	image_to_stream, .-image_to_stream
	.p2align 4
	.globl	image_lire_pixel
	.type	image_lire_pixel, @function
image_lire_pixel:
.LFB26:
	.cfi_startproc
	endbr64
	movl	40(%rdi), %eax
	testl	%eax, %eax
	jle	.L79
	movq	8(%rdi), %rdx
	movzbl	(%rdx), %ecx
	movl	%ecx, tab.3(%rip)
	cmpl	$1, %eax
	je	.L79
	movzbl	1(%rdx), %ecx
	movl	%ecx, 4+tab.3(%rip)
	cmpl	$2, %eax
	je	.L79
	movzbl	2(%rdx), %eax
	movl	%eax, 8+tab.3(%rip)
.L79:
	leaq	tab.3(%rip), %rax
	ret
	.cfi_endproc
.LFE26:
	.size	image_lire_pixel, .-image_lire_pixel
	.section	.rodata.str1.1
.LC25:
	.string	"private_valide(self,i,j)"
.LC26:
	.string	"comp>=0&& comp<3"
	.text
	.p2align 4
	.globl	image_get_comp
	.type	image_get_comp, @function
image_get_comp:
.LFB27:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	4(%rsi), %eax
	movl	(%rsi), %ecx
	movl	%eax, %esi
	orl	%ecx, %esi
	js	.L88
	cmpl	16(%rdi), %eax
	jge	.L88
	movl	20(%rdi), %esi
	cmpl	%esi, %ecx
	jge	.L88
	cmpl	$2, %edx
	ja	.L93
	imull	%esi, %eax
	movslq	%edx, %rdx
	addl	%ecx, %eax
	imull	40(%rdi), %eax
	cltq
	addq	(%rdi), %rax
	movzbl	(%rax,%rdx), %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L88:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.2(%rip), %rcx
	movl	$212, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L93:
	leaq	__PRETTY_FUNCTION__.2(%rip), %rcx
	movl	$213, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC26(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE27:
	.size	image_get_comp, .-image_get_comp
	.p2align 4
	.globl	image_ecrire_pixel
	.type	image_ecrire_pixel, @function
image_ecrire_pixel:
.LFB28:
	.cfi_startproc
	endbr64
	movl	40(%rdi), %eax
	testl	%eax, %eax
	jle	.L94
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L96:
	movl	(%rsi,%rax,4), %ecx
	movq	8(%rdi), %rdx
	movb	%cl, (%rdx,%rax)
	addq	$1, %rax
	cmpl	%eax, 40(%rdi)
	jg	.L96
.L94:
	ret
	.cfi_endproc
.LFE28:
	.size	image_ecrire_pixel, .-image_ecrire_pixel
	.p2align 4
	.globl	image_pixel_suivant
	.type	image_pixel_suivant, @function
image_pixel_suivant:
.LFB29:
	.cfi_startproc
	endbr64
	movslq	40(%rdi), %rax
	addq	8(%rdi), %rax
	xorl	%edx, %edx
	movq	%rax, %rcx
	subq	(%rdi), %rcx
	cmpq	32(%rdi), %rcx
	jge	.L98
	movq	%rax, 8(%rdi)
	movl	$1, %edx
.L98:
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE29:
	.size	image_pixel_suivant, .-image_pixel_suivant
	.p2align 4
	.globl	image_debut
	.type	image_debut, @function
image_debut:
.LFB30:
	.cfi_startproc
	endbr64
	movq	(%rdi), %rax
	movq	%rax, 8(%rdi)
	ret
	.cfi_endproc
.LFE30:
	.size	image_debut, .-image_debut
	.p2align 4
	.globl	image_move_to
	.type	image_move_to, @function
image_move_to:
.LFB31:
	.cfi_startproc
	endbr64
	movl	4(%rsi), %eax
	movl	(%rsi), %edx
	xorl	%ecx, %ecx
	movl	%eax, %esi
	orl	%edx, %esi
	js	.L102
	cmpl	16(%rdi), %eax
	jge	.L102
	movl	20(%rdi), %esi
	cmpl	%esi, %edx
	jge	.L102
	imull	%esi, %eax
	movl	$1, %ecx
	addl	%edx, %eax
	imull	40(%rdi), %eax
	cltq
	addq	(%rdi), %rax
	movq	%rax, 8(%rdi)
.L102:
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE31:
	.size	image_move_to, .-image_move_to
	.section	.rodata.str1.1
.LC27:
	.string	"buf"
	.text
	.p2align 4
	.globl	image_read_pixel
	.type	image_read_pixel, @function
image_read_pixel:
.LFB32:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testq	%rdi, %rdi
	je	.L117
	testq	%rcx, %rcx
	je	.L118
	movl	%esi, %eax
	orl	%edx, %eax
	js	.L110
	cmpl	16(%rdi), %esi
	jge	.L110
	movl	20(%rdi), %eax
	cmpl	%eax, %edx
	jge	.L110
	imull	%eax, %esi
	movl	40(%rdi), %r8d
	leal	(%rsi,%rdx), %eax
	xorl	%edx, %edx
	imull	%r8d, %eax
	cltq
	addq	(%rdi), %rax
	testl	%r8d, %r8d
	jle	.L107
	.p2align 4,,10
	.p2align 3
.L111:
	movzbl	(%rax,%rdx), %esi
	movb	%sil, (%rcx,%rdx)
	addq	$1, %rdx
	cmpl	%edx, 40(%rdi)
	jg	.L111
.L107:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L110:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.1(%rip), %rcx
	movl	$259, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L117:
	leaq	__PRETTY_FUNCTION__.1(%rip), %rcx
	movl	$257, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC10(%rip), %rdi
	call	__assert_fail@PLT
.L118:
	leaq	__PRETTY_FUNCTION__.1(%rip), %rcx
	movl	$258, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC27(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE32:
	.size	image_read_pixel, .-image_read_pixel
	.p2align 4
	.globl	image_write_pixel
	.type	image_write_pixel, @function
image_write_pixel:
.LFB33:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testq	%rdi, %rdi
	je	.L129
	testq	%rcx, %rcx
	je	.L130
	movl	%esi, %eax
	orl	%edx, %eax
	js	.L122
	cmpl	16(%rdi), %esi
	jge	.L122
	movl	20(%rdi), %eax
	cmpl	%eax, %edx
	jge	.L122
	imull	%eax, %esi
	movl	40(%rdi), %r8d
	leal	(%rsi,%rdx), %eax
	xorl	%edx, %edx
	imull	%r8d, %eax
	cltq
	addq	(%rdi), %rax
	testl	%r8d, %r8d
	jle	.L119
	.p2align 4,,10
	.p2align 3
.L123:
	movzbl	(%rcx,%rdx), %esi
	movb	%sil, (%rax,%rdx)
	addq	$1, %rdx
	cmpl	%edx, 40(%rdi)
	jg	.L123
.L119:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L122:
	.cfi_restore_state
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$272, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L129:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$270, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC10(%rip), %rdi
	call	__assert_fail@PLT
.L130:
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx
	movl	$271, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC27(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE33:
	.size	image_write_pixel, .-image_write_pixel
	.p2align 4
	.globl	image_pixel_dessus
	.type	image_pixel_dessus, @function
image_pixel_dessus:
.LFB34:
	.cfi_startproc
	endbr64
	movslq	24(%rdi), %rdx
	movq	8(%rdi), %rax
	subq	%rdx, %rax
	xorl	%edx, %edx
	cmpq	(%rdi), %rax
	js	.L131
	movq	%rax, 8(%rdi)
	movl	$1, %edx
.L131:
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE34:
	.size	image_pixel_dessus, .-image_pixel_dessus
	.p2align 4
	.globl	image_pixel_dessous
	.type	image_pixel_dessous, @function
image_pixel_dessous:
.LFB35:
	.cfi_startproc
	endbr64
	movslq	24(%rdi), %rax
	addq	8(%rdi), %rax
	xorl	%edx, %edx
	movq	%rax, %rcx
	subq	(%rdi), %rcx
	cmpq	32(%rdi), %rcx
	jge	.L134
	movq	%rax, 8(%rdi)
	movl	$1, %edx
.L134:
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE35:
	.size	image_pixel_dessous, .-image_pixel_dessous
	.p2align 4
	.globl	image_pixel_gauche
	.type	image_pixel_gauche, @function
image_pixel_gauche:
.LFB36:
	.cfi_startproc
	endbr64
	movq	8(%rdi), %rcx
	movl	%ecx, %eax
	subl	(%rdi), %eax
	cltd
	idivl	24(%rdi)
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L137
	movslq	40(%rdi), %rax
	subq	%rax, %rcx
	movl	$1, %eax
	movq	%rcx, 8(%rdi)
.L137:
	ret
	.cfi_endproc
.LFE36:
	.size	image_pixel_gauche, .-image_pixel_gauche
	.p2align 4
	.globl	image_pixel_droite
	.type	image_pixel_droite, @function
image_pixel_droite:
.LFB37:
	.cfi_startproc
	endbr64
	movq	8(%rdi), %rcx
	movslq	40(%rdi), %rsi
	movq	%rcx, %rax
	subq	(%rdi), %rax
	addl	%esi, %eax
	cltd
	idivl	24(%rdi)
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L141
	addq	%rsi, %rcx
	movl	$1, %eax
	movq	%rcx, 8(%rdi)
.L141:
	ret
	.cfi_endproc
.LFE37:
	.size	image_pixel_droite, .-image_pixel_droite
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"distance, image.c : move incorect"
	.text
	.p2align 4
	.globl	image_distance
	.type	image_distance, @function
image_distance:
.LFB38:
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
	movq	%rdi, %rbx
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	movl	(%rsi), %ecx
	movl	4(%rsi), %esi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	cmpl	$2, %edx
	je	.L146
	jg	.L147
	testl	%edx, %edx
	je	.L148
	cmpl	$1, %edx
	jne	.L150
	movl	20(%rdi), %edx
	movslq	40(%rdi), %rbp
	movl	%edx, %eax
	imull	%esi, %eax
	addl	%ecx, %eax
	imull	%ebp, %eax
	cltq
	addq	(%rdi), %rax
	movl	%ecx, %edi
	addq	%rax, %rbp
	orl	%esi, %edi
	js	.L157
	movsd	.LC28(%rip), %xmm0
	cmpl	16(%rbx), %esi
	jge	.L145
	cmpl	%ecx, %edx
	jle	.L145
	addl	$1, %ecx
	xorl	%r12d, %r12d
	cmpl	%ecx, %edx
	setg	%r12b
	jmp	.L154
	.p2align 4,,10
	.p2align 3
.L147:
	cmpl	$3, %edx
	jne	.L150
	movslq	40(%rdi), %rbp
	addl	$1, %esi
	movl	20(%rdi), %edi
	movl	%esi, %edx
	imull	%edi, %edx
	leal	(%rdx,%rcx), %eax
	movl	%esi, %edx
	imull	%ebp, %eax
	notl	%edx
	shrl	$31, %edx
	cltq
	addq	(%rbx), %rax
	addq	%rax, %rbp
	testl	%ecx, %ecx
	js	.L161
	testb	%dl, %dl
	je	.L161
	movsd	.LC28(%rip), %xmm0
	cmpl	16(%rbx), %esi
	jge	.L145
	cmpl	%ecx, %edi
	jle	.L145
	addl	$1, %ecx
	xorl	%r12d, %r12d
	cmpl	%ecx, %edi
	setg	%r12b
	jmp	.L154
	.p2align 4,,10
	.p2align 3
.L150:
	movq	stderr(%rip), %rdi
	leaq	.LC29(%rip), %rdx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
.L163:
	movq	48(%rbx), %rax
	testl	%r12d, %r12d
	je	.L206
	movzbl	0(%rbp), %edx
	leaq	12(%rsp), %rsi
	movq	%rsp, %rdi
	movl	%edx, 12(%rsp)
	movzbl	1(%rbp), %edx
	movl	%edx, 16(%rsp)
	movzbl	2(%rbp), %edx
	movl	%edx, 20(%rsp)
	movl	$1, %edx
	call	*%rax
.L145:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L207
	addq	$32, %rsp
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
.L206:
	.cfi_restore_state
	leaq	12(%rsp), %rsi
	movq	%rsp, %rdi
	xorl	%edx, %edx
	call	*%rax
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L146:
	movl	20(%rdi), %edi
	movslq	24(%rbx), %rbp
	movl	%edi, %edx
	imull	%esi, %edx
	leal	(%rdx,%rcx), %eax
	movl	%ecx, %edx
	imull	40(%rbx), %eax
	cltq
	addq	(%rbx), %rax
	addq	%rax, %rbp
	orl	%esi, %edx
	jns	.L205
	addl	$1, %esi
	js	.L177
	testl	%ecx, %ecx
	jns	.L203
	.p2align 4,,10
	.p2align 3
.L177:
	movsd	.LC28(%rip), %xmm0
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L205:
	movl	16(%rbx), %edx
	movsd	.LC28(%rip), %xmm0
	cmpl	%edx, %esi
	jge	.L145
	cmpl	%ecx, %edi
	jle	.L145
	addl	$1, %esi
	xorl	%r12d, %r12d
	cmpl	%esi, %edx
	setg	%r12b
.L154:
	movzbl	(%rax), %edx
	movl	%edx, (%rsp)
	movzbl	1(%rax), %edx
	movl	%edx, 4(%rsp)
	movzbl	2(%rax), %eax
	movl	%eax, 8(%rsp)
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L148:
	movl	20(%rdi), %edi
	addl	$1, %ecx
	movslq	24(%rbx), %rbp
	movl	%ecx, %edx
	movl	%edi, %eax
	notl	%edx
	imull	%esi, %eax
	shrl	$31, %edx
	addl	%ecx, %eax
	imull	40(%rbx), %eax
	cltq
	addq	(%rbx), %rax
	addq	%rax, %rbp
	testl	%esi, %esi
	js	.L152
	testb	%dl, %dl
	jne	.L205
.L152:
	addl	$1, %esi
	js	.L177
	testb	%dl, %dl
	je	.L177
.L203:
	cmpl	16(%rbx), %esi
	jge	.L177
	cmpl	%ecx, %edi
	jle	.L177
.L155:
	movzbl	0(%rbp), %eax
	movq	%rsp, %rsi
	leaq	12(%rsp), %rdi
	xorl	%edx, %edx
	movl	%eax, 12(%rsp)
	movzbl	1(%rbp), %eax
	movl	%eax, 16(%rsp)
	movzbl	2(%rbp), %eax
	movl	%eax, 20(%rsp)
	call	*48(%rbx)
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L157:
	movl	%ecx, %eax
	addl	$1, %eax
	js	.L177
	testl	%esi, %esi
	js	.L177
	cmpl	16(%rbx), %esi
	jge	.L177
	cmpl	%eax, %edx
	jle	.L177
	jmp	.L155
	.p2align 4,,10
	.p2align 3
.L161:
	movl	%ecx, %eax
	addl	$1, %eax
	js	.L177
	testb	%dl, %dl
	je	.L177
	cmpl	16(%rbx), %esi
	jge	.L177
	cmpl	%eax, %edi
	jle	.L177
	jmp	.L155
.L207:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE38:
	.size	image_distance, .-image_distance
	.p2align 4
	.globl	image_set_distance
	.type	image_set_distance, @function
image_set_distance:
.LFB39:
	.cfi_startproc
	endbr64
	movq	%rsi, 48(%rdi)
	ret
	.cfi_endproc
.LFE39:
	.size	image_set_distance, .-image_set_distance
	.p2align 4
	.globl	image_give_dim
	.type	image_give_dim, @function
image_give_dim:
.LFB40:
	.cfi_startproc
	endbr64
	movl	40(%rdi), %eax
	ret
	.cfi_endproc
.LFE40:
	.size	image_give_dim, .-image_give_dim
	.p2align 4
	.globl	image_give_largeur
	.type	image_give_largeur, @function
image_give_largeur:
.LFB41:
	.cfi_startproc
	endbr64
	movl	20(%rdi), %eax
	ret
	.cfi_endproc
.LFE41:
	.size	image_give_largeur, .-image_give_largeur
	.p2align 4
	.globl	image_give_hauteur
	.type	image_give_hauteur, @function
image_give_hauteur:
.LFB42:
	.cfi_startproc
	endbr64
	movl	16(%rdi), %eax
	ret
	.cfi_endproc
.LFE42:
	.size	image_give_hauteur, .-image_give_hauteur
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 18
__PRETTY_FUNCTION__.0:
	.string	"image_write_pixel"
	.align 16
	.type	__PRETTY_FUNCTION__.1, @object
	.size	__PRETTY_FUNCTION__.1, 17
__PRETTY_FUNCTION__.1:
	.string	"image_read_pixel"
	.align 8
	.type	__PRETTY_FUNCTION__.2, @object
	.size	__PRETTY_FUNCTION__.2, 15
__PRETTY_FUNCTION__.2:
	.string	"image_get_comp"
	.local	tab.3
	.comm	tab.3,12,8
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	sauvegarde.5, @object
	.size	sauvegarde.5, 32
sauvegarde.5:
	.quad	0
	.quad	image_dim_1_to_stream_priv
	.quad	0
	.quad	image_dim_3_to_stream_priv
	.set	sauvegarde.4,sauvegarde.5
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.6, @object
	.size	__PRETTY_FUNCTION__.6, 17
__PRETTY_FUNCTION__.6:
	.string	"image_initialize"
	.align 8
	.type	__PRETTY_FUNCTION__.7, @object
	.size	__PRETTY_FUNCTION__.7, 12
__PRETTY_FUNCTION__.7:
	.string	"FAIRE_image"
	.section	.data.rel.ro.local
	.align 32
	.type	default_distance, @object
	.size	default_distance, 32
default_distance:
	.quad	0
	.quad	private_default_distance_dim1
	.quad	0
	.quad	private_default_distance_dim3
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC28:
	.long	0
	.long	-1074790400
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
