	.file	"sha256.c"
	.text
	.p2align 4
	.type	SHA256_transform, @function
SHA256_transform:
.LFB15:
	.cfi_startproc
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
	subq	$376, %rsp
	.cfi_def_cfa_offset 432
	movdqa	.LC0(%rip), %xmm0
	movdqu	44(%rdi), %xmm2
	movdqu	60(%rdi), %xmm1
	movdqu	60(%rdi), %xmm3
	leaq	32(%rsp), %r11
	leaq	352(%rsp), %rdx
	pand	%xmm0, %xmm2
	movdqu	76(%rdi), %xmm4
	movdqu	92(%rdi), %xmm5
	movdqa	%xmm0, %xmm6
	movq	%fs:40, %rax
	movq	%rax, 360(%rsp)
	xorl	%eax, %eax
	pand	%xmm0, %xmm1
	psrlw	$8, %xmm3
	leaq	96(%rsp), %rax
	packuswb	%xmm1, %xmm2
	movdqu	44(%rdi), %xmm1
	pand	%xmm0, %xmm4
	psrlw	$8, %xmm5
	psrlw	$8, %xmm1
	packuswb	%xmm3, %xmm1
	movdqu	92(%rdi), %xmm3
	pand	%xmm0, %xmm3
	packuswb	%xmm3, %xmm4
	movdqu	76(%rdi), %xmm3
	pand	%xmm4, %xmm6
	psrlw	$8, %xmm4
	psrlw	$8, %xmm3
	packuswb	%xmm5, %xmm3
	movdqa	%xmm0, %xmm5
	pand	%xmm2, %xmm5
	psrlw	$8, %xmm2
	packuswb	%xmm4, %xmm2
	movdqa	%xmm0, %xmm4
	pand	%xmm3, %xmm0
	pand	%xmm1, %xmm4
	psrlw	$8, %xmm3
	packuswb	%xmm6, %xmm5
	psrlw	$8, %xmm1
	packuswb	%xmm0, %xmm4
	packuswb	%xmm3, %xmm1
	movdqa	%xmm1, %xmm3
	punpckhbw	%xmm4, %xmm1
	punpcklbw	%xmm4, %xmm3
	movdqa	%xmm2, %xmm4
	movdqa	%xmm1, %xmm0
	punpcklbw	%xmm5, %xmm4
	punpckhbw	%xmm5, %xmm2
	movdqa	%xmm3, %xmm5
	punpckhbw	%xmm2, %xmm0
	punpcklbw	%xmm4, %xmm5
	punpckhbw	%xmm4, %xmm3
	punpcklbw	%xmm2, %xmm1
	movaps	%xmm0, 80(%rsp)
	psrldq	$8, %xmm0
	movaps	%xmm5, 32(%rsp)
	movaps	%xmm3, 48(%rsp)
	movaps	%xmm1, 64(%rsp)
	.p2align 4,,10
	.p2align 3
.L2:
	movq	-60(%rax), %xmm2
	addq	$8, %rax
	movdqa	%xmm2, %xmm1
	movdqa	%xmm2, %xmm3
	movdqa	%xmm2, %xmm4
	psrld	$18, %xmm3
	pslld	$14, %xmm1
	por	%xmm3, %xmm1
	psrld	$7, %xmm4
	movdqa	%xmm2, %xmm3
	pslld	$25, %xmm3
	psrld	$3, %xmm2
	por	%xmm4, %xmm3
	movdqa	%xmm0, %xmm4
	pxor	%xmm3, %xmm1
	psrld	$17, %xmm4
	movdqa	%xmm0, %xmm3
	pxor	%xmm2, %xmm1
	psrld	$19, %xmm3
	movdqa	%xmm0, %xmm2
	pslld	$13, %xmm2
	por	%xmm3, %xmm2
	movdqa	%xmm0, %xmm3
	pslld	$15, %xmm3
	psrld	$10, %xmm0
	por	%xmm4, %xmm3
	pxor	%xmm3, %xmm2
	pxor	%xmm0, %xmm2
	movq	-36(%rax), %xmm0
	paddd	%xmm2, %xmm1
	movq	-72(%rax), %xmm2
	paddd	%xmm2, %xmm0
	paddd	%xmm1, %xmm0
	movq	%xmm0, -8(%rax)
	cmpq	%rdx, %rax
	jne	.L2
	movl	0(%rbp), %r15d
	movl	4(%rbp), %r14d
	leaq	SHA256_constants(%rip), %rbx
	movl	28(%rbp), %edi
	movl	12(%rbp), %eax
	leaq	256(%rbx), %r12
	movl	16(%rbp), %r10d
	movl	20(%rbp), %r9d
	movl	%r15d, 20(%rsp)
	movl	%r14d, %ecx
	movl	24(%rbp), %r8d
	movl	8(%rbp), %r13d
	movl	%eax, (%rsp)
	movl	%r15d, %esi
	movl	%r10d, 4(%rsp)
	movl	%r9d, 8(%rsp)
	movl	%r13d, %edx
	movl	%r8d, 12(%rsp)
	movl	%edi, 16(%rsp)
	movl	%r14d, 24(%rsp)
	movl	%r13d, 28(%rsp)
	movq	%rbp, %r13
	movq	%rbx, %rbp
	movl	%edi, %ebx
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%r10d, %r14d
	movl	%r10d, %edi
	movl	%esi, %r15d
	rorl	$6, %r14d
	rorl	$11, %edi
	andl	%ecx, %r15d
	xorl	%r14d, %edi
	movl	%r10d, %r14d
	roll	$7, %r14d
	xorl	%r14d, %edi
	movl	(%r11), %r14d
	addl	0(%rbp), %r14d
	addl	%r14d, %edi
	movl	%r9d, %r14d
	xorl	%r8d, %r14d
	andl	%r10d, %r14d
	xorl	%r8d, %r14d
	addl	%r14d, %edi
	movl	%esi, %r14d
	addl	%ebx, %edi
	movl	%esi, %ebx
	rorl	$2, %r14d
	rorl	$13, %ebx
	addl	%edi, %eax
	xorl	%r14d, %ebx
	movl	%esi, %r14d
	roll	$10, %r14d
	xorl	%r14d, %ebx
	movl	%esi, %r14d
	orl	%ecx, %r14d
	andl	%edx, %r14d
	orl	%r15d, %r14d
	addl	%r14d, %ebx
	movl	%eax, %r14d
	addl	%edi, %ebx
	movl	4(%r11), %edi
	addl	4(%rbp), %edi
	rorl	$6, %r14d
	addl	%edi, %r8d
	movl	%r10d, %edi
	movl	%ebx, %r15d
	xorl	%r9d, %edi
	andl	%eax, %edi
	xorl	%r9d, %edi
	addl	%edi, %r8d
	movl	%eax, %edi
	rorl	$11, %edi
	xorl	%r14d, %edi
	movl	%eax, %r14d
	andl	%esi, %r15d
	roll	$7, %r14d
	xorl	%r14d, %edi
	movl	%ebx, %r14d
	addl	%edi, %r8d
	rorl	$2, %r14d
	leal	(%r8,%rdx), %edi
	movl	%ebx, %edx
	rorl	$13, %edx
	xorl	%r14d, %edx
	movl	%ebx, %r14d
	roll	$10, %r14d
	xorl	%r14d, %edx
	movl	%ebx, %r14d
	orl	%esi, %r14d
	andl	%ecx, %r14d
	orl	%r15d, %r14d
	movl	%ebx, %r15d
	addl	%r14d, %edx
	movl	%edi, %r14d
	addl	%r8d, %edx
	movl	8(%r11), %r8d
	addl	8(%rbp), %r8d
	rorl	$6, %r14d
	addl	%r9d, %r8d
	movl	%eax, %r9d
	xorl	%r10d, %r9d
	andl	%edi, %r9d
	xorl	%r10d, %r9d
	addl	%r9d, %r8d
	movl	%edi, %r9d
	rorl	$11, %r9d
	xorl	%r14d, %r9d
	movl	%edi, %r14d
	roll	$7, %r14d
	xorl	%r14d, %r9d
	movl	%edx, %r14d
	addl	%r9d, %r8d
	rorl	$2, %r14d
	leal	(%r8,%rcx), %r9d
	movl	%edx, %ecx
	rorl	$13, %ecx
	xorl	%r14d, %ecx
	movl	%edx, %r14d
	roll	$10, %r14d
	xorl	%r14d, %ecx
	movl	%ebx, %r14d
	orl	%edx, %r14d
	andl	%edx, %r15d
	andl	%esi, %r14d
	orl	%r15d, %r14d
	movl	%edx, %r15d
	addl	%r14d, %ecx
	movl	%r9d, %r14d
	addl	%r8d, %ecx
	movl	12(%r11), %r8d
	addl	12(%rbp), %r8d
	rorl	$6, %r14d
	addl	%r10d, %r8d
	movl	%eax, %r10d
	andl	%ecx, %r15d
	xorl	%edi, %r10d
	andl	%r9d, %r10d
	xorl	%eax, %r10d
	addl	%r10d, %r8d
	movl	%r9d, %r10d
	rorl	$11, %r10d
	xorl	%r14d, %r10d
	movl	%r9d, %r14d
	roll	$7, %r14d
	xorl	%r14d, %r10d
	movl	%ecx, %r14d
	addl	%r10d, %r8d
	rorl	$2, %r14d
	leal	(%r8,%rsi), %r10d
	movl	%ecx, %esi
	rorl	$13, %esi
	xorl	%r14d, %esi
	movl	%ecx, %r14d
	roll	$10, %r14d
	xorl	%r14d, %esi
	movl	%edx, %r14d
	orl	%ecx, %r14d
	andl	%ebx, %r14d
	orl	%r15d, %r14d
	movl	%ecx, %r15d
	addl	%r14d, %esi
	movl	%r10d, %r14d
	addl	%r8d, %esi
	movl	16(%r11), %r8d
	addl	16(%rbp), %r8d
	addl	%eax, %r8d
	movl	%edi, %eax
	xorl	%r9d, %eax
	andl	%r10d, %eax
	rorl	$6, %r14d
	andl	%esi, %r15d
	xorl	%edi, %eax
	addl	%eax, %r8d
	movl	%r10d, %eax
	rorl	$11, %eax
	xorl	%r14d, %eax
	movl	%r10d, %r14d
	roll	$7, %r14d
	xorl	%r14d, %eax
	movl	%esi, %r14d
	addl	%eax, %r8d
	movl	%esi, %eax
	rorl	$2, %r14d
	rorl	$13, %eax
	addl	%r8d, %ebx
	xorl	%r14d, %eax
	movl	%esi, %r14d
	roll	$10, %r14d
	xorl	%r14d, %eax
	movl	%ecx, %r14d
	orl	%esi, %r14d
	andl	%edx, %r14d
	orl	%r15d, %r14d
	movl	%esi, %r15d
	addl	%r14d, %eax
	movl	%ebx, %r14d
	addl	%r8d, %eax
	movl	20(%r11), %r8d
	addl	20(%rbp), %r8d
	rorl	$6, %r14d
	addl	%r8d, %edi
	movl	%r9d, %r8d
	xorl	%r10d, %r8d
	andl	%ebx, %r8d
	xorl	%r9d, %r8d
	addl	%r8d, %edi
	movl	%ebx, %r8d
	rorl	$11, %r8d
	xorl	%r14d, %r8d
	movl	%ebx, %r14d
	roll	$7, %r14d
	xorl	%r14d, %r8d
	movl	%eax, %r14d
	addl	%r8d, %edi
	rorl	$2, %r14d
	andl	%eax, %r15d
	leal	(%rdx,%rdi), %r8d
	movl	%eax, %edx
	rorl	$13, %edx
	xorl	%r14d, %edx
	movl	%eax, %r14d
	roll	$10, %r14d
	xorl	%r14d, %edx
	movl	%esi, %r14d
	orl	%eax, %r14d
	andl	%ecx, %r14d
	orl	%r15d, %r14d
	movl	%eax, %r15d
	addl	%r14d, %edx
	movl	%r8d, %r14d
	addl	%edi, %edx
	movl	24(%r11), %edi
	addl	24(%rbp), %edi
	rorl	$6, %r14d
	addl	%r9d, %edi
	movl	%r10d, %r9d
	andl	%edx, %r15d
	xorl	%ebx, %r9d
	andl	%r8d, %r9d
	xorl	%r10d, %r9d
	addl	%r9d, %edi
	movl	%r8d, %r9d
	rorl	$11, %r9d
	xorl	%r14d, %r9d
	movl	%r8d, %r14d
	roll	$7, %r14d
	xorl	%r14d, %r9d
	movl	%edx, %r14d
	addl	%r9d, %edi
	rorl	$2, %r14d
	leal	(%rcx,%rdi), %r9d
	movl	%edx, %ecx
	rorl	$13, %ecx
	xorl	%r14d, %ecx
	movl	%edx, %r14d
	roll	$10, %r14d
	xorl	%r14d, %ecx
	movl	%eax, %r14d
	orl	%edx, %r14d
	andl	%esi, %r14d
	orl	%r15d, %r14d
	movl	%edx, %r15d
	addq	$32, %rbp
	addq	$32, %r11
	addl	%r14d, %ecx
	movl	%r9d, %r14d
	addl	%edi, %ecx
	movl	-4(%r11), %edi
	addl	-4(%rbp), %edi
	rorl	$6, %r14d
	addl	%r10d, %edi
	movl	%ebx, %r10d
	andl	%ecx, %r15d
	xorl	%r8d, %r10d
	andl	%r9d, %r10d
	xorl	%ebx, %r10d
	addl	%r10d, %edi
	movl	%r9d, %r10d
	rorl	$11, %r10d
	xorl	%r14d, %r10d
	movl	%r9d, %r14d
	roll	$7, %r14d
	xorl	%r14d, %r10d
	movl	%ecx, %r14d
	addl	%r10d, %edi
	rorl	$2, %r14d
	leal	(%rsi,%rdi), %r10d
	movl	%ecx, %esi
	rorl	$13, %esi
	xorl	%r14d, %esi
	movl	%ecx, %r14d
	roll	$10, %r14d
	xorl	%r14d, %esi
	movl	%edx, %r14d
	orl	%ecx, %r14d
	andl	%eax, %r14d
	orl	%r15d, %r14d
	addl	%r14d, %esi
	addl	%edi, %esi
	cmpq	%r12, %rbp
	jne	.L3
	movl	%ebx, %edi
	movl	(%rsp), %ebx
	movq	%r13, %rbp
	movl	20(%rsp), %r15d
	movl	24(%rsp), %r14d
	movl	28(%rsp), %r13d
	addl	%eax, %ebx
	movl	4(%rsp), %eax
	addl	%esi, %r15d
	addl	%ecx, %r14d
	addl	%edx, %r13d
	movl	%r15d, 0(%rbp)
	addl	%r10d, %eax
	movl	%r14d, 4(%rbp)
	movl	%eax, 16(%rbp)
	movl	8(%rsp), %eax
	movl	%r13d, 8(%rbp)
	addl	%r9d, %eax
	movl	%ebx, 12(%rbp)
	movl	%eax, 20(%rbp)
	movl	12(%rsp), %eax
	addl	%r8d, %eax
	movl	%eax, 24(%rbp)
	movl	16(%rsp), %eax
	addl	%edi, %eax
	movl	%eax, 28(%rbp)
	movq	360(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L9
	addq	$376, %rsp
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
.L9:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE15:
	.size	SHA256_transform, .-SHA256_transform
	.p2align 4
	.globl	SHA256_init
	.type	SHA256_init, @function
SHA256_init:
.LFB16:
	.cfi_startproc
	endbr64
	cmpl	$224, %esi
	je	.L11
	cmpl	$256, %esi
	jne	.L16
	movdqa	.LC3(%rip), %xmm0
	movl	$0, 40(%rdi)
	movq	$0, 32(%rdi)
	movups	%xmm0, (%rdi)
	movdqa	.LC4(%rip), %xmm0
	movups	%xmm0, 16(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L16:
	pxor	%xmm0, %xmm0
	movl	$0, 40(%rdi)
	movq	$0, 32(%rdi)
	movups	%xmm0, (%rdi)
	movups	%xmm0, 16(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	movdqa	.LC1(%rip), %xmm0
	movl	$0, 40(%rdi)
	movq	$0, 32(%rdi)
	movups	%xmm0, (%rdi)
	movdqa	.LC2(%rip), %xmm0
	movups	%xmm0, 16(%rdi)
	ret
	.cfi_endproc
.LFE16:
	.size	SHA256_init, .-SHA256_init
	.p2align 4
	.globl	SHA256_add_data
	.type	SHA256_add_data, @function
SHA256_add_data:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	leal	0(,%rdx,8), %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdx, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%edx, %ebp
	xorl	%edx, %edx
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	addl	36(%rdi), %eax
	movq	%rsi, %rbx
	movl	%eax, 36(%rdi)
	setc	%dl
	movl	32(%rdi), %eax
	cmpl	$1, %edx
	movq	%r13, %rdx
	sbbl	$-1, %eax
	shrq	$29, %rdx
	addl	%edx, %eax
	movl	%eax, 32(%rdi)
	movslq	40(%rdi), %rdi
	testl	%edi, %edi
	jne	.L45
	leaq	44(%r12), %rbp
.L21:
	cmpq	$63, %r13
	jbe	.L32
	leaq	-64(%r13), %rax
	andq	$-64, %rax
	leaq	64(%rbx,%rax), %r14
	.p2align 4,,10
	.p2align 3
.L25:
	movdqu	(%rbx), %xmm0
	movq	%r12, %rdi
	addq	$64, %rbx
	movups	%xmm0, 0(%rbp)
	movdqu	-48(%rbx), %xmm1
	movups	%xmm1, 16(%rbp)
	movdqu	-32(%rbx), %xmm2
	movups	%xmm2, 32(%rbp)
	movdqu	-16(%rbx), %xmm3
	movups	%xmm3, 48(%rbp)
	call	SHA256_transform
	cmpq	%r14, %rbx
	jne	.L25
	andl	$63, %r13d
.L24:
	movl	%r13d, %eax
	cmpl	$8, %r13d
	jb	.L47
	movq	(%r14), %rax
	leaq	52(%r12), %rsi
	andq	$-8, %rsi
	movq	%rax, 44(%r12)
	movl	%r13d, %eax
	movq	-8(%r14,%rax), %rdx
	movq	%rdx, -8(%rbp,%rax)
	subq	%rsi, %rbp
	leal	0(%r13,%rbp), %eax
	subq	%rbp, %r14
	andl	$-8, %eax
	cmpl	$8, %eax
	jb	.L23
	andl	$-8, %eax
	xorl	%edx, %edx
.L30:
	movl	%edx, %ecx
	addl	$8, %edx
	movq	(%r14,%rcx), %rdi
	movq	%rdi, (%rsi,%rcx)
	cmpl	%eax, %edx
	jb	.L30
.L23:
	movl	%r13d, 40(%r12)
	popq	%rbx
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L47:
	.cfi_restore_state
	testb	$4, %r13b
	jne	.L48
	testl	%eax, %eax
	je	.L23
	movzbl	(%r14), %edx
	movb	%dl, 44(%r12)
	testb	$2, %al
	je	.L23
	movzwl	-2(%r14,%rax), %edx
	movw	%dx, -2(%rbp,%rax)
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L45:
	movl	$64, %r14d
	subl	%edi, %r14d
	cmpq	%r14, %r13
	jb	.L49
	leaq	44(%r12), %rbp
	movq	%r14, %rdx
	addq	%r14, %rbx
	subq	%r14, %r13
	addq	%rbp, %rdi
	call	memcpy@PLT
	movq	%r12, %rdi
	call	SHA256_transform
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L49:
	leaq	44(%r12,%rdi), %rdi
	movq	%r13, %rdx
	call	memcpy@PLT
	addl	40(%r12), %ebp
	movl	%ebp, %r13d
	movl	%r13d, 40(%r12)
	popq	%rbx
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L32:
	.cfi_restore_state
	movq	%rbx, %r14
	jmp	.L24
.L48:
	movl	(%r14), %edx
	movl	%edx, 44(%r12)
	movl	-4(%r14,%rax), %edx
	movl	%edx, -4(%rbp,%rax)
	jmp	.L23
	.cfi_endproc
.LFE17:
	.size	SHA256_add_data, .-SHA256_add_data
	.p2align 4
	.globl	SHA256_finish
	.type	SHA256_finish, @function
SHA256_finish:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movslq	40(%rdi), %rax
	leal	1(%rax), %ecx
	movb	$-128, 44(%rdi,%rax)
	movslq	%ecx, %rax
	cmpl	$56, %ecx
	jg	.L51
	movl	$56, %edx
	leaq	44(%rdi), %r13
	subl	%ecx, %edx
	movslq	%edx, %rdx
.L52:
	leaq	0(%r13,%rax), %rdi
	xorl	%esi, %esi
	call	memset@PLT
	movzbl	36(%rbx), %eax
	movzbl	37(%rbx), %edx
	movq	%rbx, %rdi
	salq	$8, %rax
	orq	%rdx, %rax
	movzbl	38(%rbx), %edx
	salq	$8, %rax
	orq	%rdx, %rax
	movzbl	39(%rbx), %edx
	salq	$8, %rax
	orq	%rdx, %rax
	movzbl	32(%rbx), %edx
	salq	$8, %rax
	orq	%rdx, %rax
	movzbl	33(%rbx), %edx
	salq	$8, %rax
	orq	%rdx, %rax
	movzbl	34(%rbx), %edx
	salq	$8, %rax
	orq	%rdx, %rax
	movzbl	35(%rbx), %edx
	salq	$8, %rax
	orq	%rdx, %rax
	movq	%rax, 100(%rbx)
	call	SHA256_transform
	cmpl	$224, %r12d
	je	.L55
	cmpl	$256, %r12d
	jne	.L50
	leaq	32(%rbx), %rsi
	.p2align 4,,10
	.p2align 3
.L57:
	movzbl	3(%rbx), %ecx
	movzbl	(%rbx), %eax
	addq	$4, %rbx
	addq	$4, %rbp
	movzbl	-3(%rbx), %edx
	movb	%cl, -4(%rbp)
	movzbl	-2(%rbx), %ecx
	movb	%dl, -2(%rbp)
	movb	%cl, -3(%rbp)
	movb	%al, -1(%rbp)
	cmpq	%rsi, %rbx
	jne	.L57
.L50:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L55:
	.cfi_restore_state
	leaq	28(%rbp), %rsi
	.p2align 4,,10
	.p2align 3
.L58:
	movzbl	3(%rbx), %ecx
	movzbl	(%rbx), %eax
	addq	$4, %rbp
	addq	$4, %rbx
	movzbl	-3(%rbx), %edx
	movb	%cl, -4(%rbp)
	movzbl	-2(%rbx), %ecx
	movb	%dl, -2(%rbp)
	movb	%cl, -3(%rbp)
	movb	%al, -1(%rbp)
	cmpq	%rsi, %rbp
	jne	.L58
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
	movl	$64, %edx
	leaq	44(%rdi), %r13
	subl	%ecx, %edx
	addq	%r13, %rax
	movslq	%edx, %rdx
	testq	%rdx, %rdx
	je	.L54
	xorl	%ecx, %ecx
	testb	$1, %dl
	je	.L53
	movl	$1, %ecx
	movb	$0, (%rax)
	cmpq	%rdx, %rcx
	jnb	.L54
.L53:
	movb	$0, (%rax,%rcx)
	movb	$0, 1(%rax,%rcx)
	addq	$2, %rcx
	cmpq	%rdx, %rcx
	jb	.L53
.L54:
	movq	%rbx, %rdi
	call	SHA256_transform
	xorl	%eax, %eax
	movl	$56, %edx
	jmp	.L52
	.cfi_endproc
.LFE18:
	.size	SHA256_finish, .-SHA256_finish
	.section	.rodata
	.align 32
	.type	SHA256_constants, @object
	.size	SHA256_constants, 256
SHA256_constants:
	.long	1116352408
	.long	1899447441
	.long	-1245643825
	.long	-373957723
	.long	961987163
	.long	1508970993
	.long	-1841331548
	.long	-1424204075
	.long	-670586216
	.long	310598401
	.long	607225278
	.long	1426881987
	.long	1925078388
	.long	-2132889090
	.long	-1680079193
	.long	-1046744716
	.long	-459576895
	.long	-272742522
	.long	264347078
	.long	604807628
	.long	770255983
	.long	1249150122
	.long	1555081692
	.long	1996064986
	.long	-1740746414
	.long	-1473132947
	.long	-1341970488
	.long	-1084653625
	.long	-958395405
	.long	-710438585
	.long	113926993
	.long	338241895
	.long	666307205
	.long	773529912
	.long	1294757372
	.long	1396182291
	.long	1695183700
	.long	1986661051
	.long	-2117940946
	.long	-1838011259
	.long	-1564481375
	.long	-1474664885
	.long	-1035236496
	.long	-949202525
	.long	-778901479
	.long	-694614492
	.long	-200395387
	.long	275423344
	.long	430227734
	.long	506948616
	.long	659060556
	.long	883997877
	.long	958139571
	.long	1322822218
	.long	1537002063
	.long	1747873779
	.long	1955562222
	.long	2024104815
	.long	-2067236844
	.long	-1933114872
	.long	-1866530822
	.long	-1538233109
	.long	-1090935817
	.long	-965641998
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.align 16
.LC1:
	.long	-1056596264
	.long	914150663
	.long	812702999
	.long	-150054599
	.align 16
.LC2:
	.long	-4191439
	.long	1750603025
	.long	1694076839
	.long	-1090891868
	.align 16
.LC3:
	.long	1779033703
	.long	-1150833019
	.long	1013904242
	.long	-1521486534
	.align 16
.LC4:
	.long	1359893119
	.long	-1694144372
	.long	528734635
	.long	1541459225
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
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
