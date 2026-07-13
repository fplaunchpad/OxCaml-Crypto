	.file ""
	.section .rodata.cst16,"aM",@progbits,16
	.align	16
caml_negf_mask:
	.8byte	0x8000000000000000
	.8byte	0
	.align	16
caml_absf_mask:
	.8byte	0x7fffffffffffffff
	.8byte	-1
caml_negf32_mask:
	.8byte	0x80000000
	.8byte	0
	.align	16
caml_absf32_mask:
	.8byte	0xffffffff7fffffff
	.8byte	-1
	.data
	.globl	camlSha256__data_begin
camlSha256__data_begin:
	.text
	.globl	camlSha256__code_begin
camlSha256__code_begin:
.Lcaml_call_gc_:
	.cfi_startproc
	jmp	caml_call_gc@PLT
	.cfi_endproc
.Lcaml_call_gc_sse_:
	.cfi_startproc
	jmp	caml_call_gc_sse@PLT
	.cfi_endproc
.Lcaml_call_gc_avx_:
	.cfi_startproc
	jmp	caml_call_gc_avx@PLT
	.cfi_endproc
.Lcaml_call_gc_avx512_:
	.cfi_startproc
	jmp	caml_call_gc_avx512@PLT
	.cfi_endproc
	.data
	.align	8
	.globl	camlSha256__gc_roots
camlSha256__gc_roots:
.LcamlSha256__gc_roots:
	.8byte	camlSha256
	.8byte	camlSha256__transform_from_27
	.8byte	0
	.data
	.align	8
	.8byte	17152
	.globl	camlSha256
camlSha256:
.LcamlSha256:
	.8byte	1
	.8byte	camlSha256__rotr_16
	.8byte	camlSha256__ch_17
	.8byte	camlSha256__maj_18
	.8byte	camlSha256__big_sigma0_19
	.8byte	camlSha256__big_sigma1_20
	.8byte	camlSha256__small_sigma0_21
	.8byte	camlSha256__small_sigma1_22
	.8byte	camlSha256__create_23
	.8byte	camlSha256__init_24
	.8byte	camlSha256__get_be32_25
	.8byte	camlSha256__set_be32_26
	.8byte	camlSha256__transform_from_27
	.8byte	camlSha256__transform_29
	.8byte	camlSha256__add_data_30
	.8byte	camlSha256__finish_31
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__finish_31
camlSha256__finish_31:
.LcamlSha256__finish_31:
	.8byte	caml_curry2
	.8byte	0x280000000000007
	.8byte	camlSha256__finish_15_31_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__add_data_30
camlSha256__add_data_30:
.LcamlSha256__add_data_30:
	.8byte	caml_curry3
	.8byte	0x380000000000007
	.8byte	camlSha256__add_data_14_30_code
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__transform_29
camlSha256__transform_29:
.LcamlSha256__transform_29:
	.8byte	camlSha256__transform_13_29_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	5111
	.globl	camlSha256__transform_from_27
camlSha256__transform_from_27:
.LcamlSha256__transform_from_27:
	.8byte	caml_curry3
	.8byte	0x380000000000007
	.8byte	camlSha256__transform_from_11_27_code
	.8byte	1
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__rounds_28
camlSha256__rounds_28:
.LcamlSha256__rounds_28:
	.8byte	caml_curryV_V_V_V_I_I_I_I_I_I_I_IL12
	.8byte	0xc80000000000007
	.8byte	camlSha256__rounds_12_28_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__set_be32_26
camlSha256__set_be32_26:
.LcamlSha256__set_be32_26:
	.8byte	caml_curryV_V_I
	.8byte	0x380000000000007
	.8byte	camlSha256__set_be32_10_26_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__get_be32_25
camlSha256__get_be32_25:
.LcamlSha256__get_be32_25:
	.8byte	caml_curry2_RI
	.8byte	0x280000000000007
	.8byte	camlSha256__get_be32_9_25_code
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__init_24
camlSha256__init_24:
.LcamlSha256__init_24:
	.8byte	camlSha256__init_8_24_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__create_23
camlSha256__create_23:
.LcamlSha256__create_23:
	.8byte	camlSha256__create_7_23_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__small_sigma1_22
camlSha256__small_sigma1_22:
.LcamlSha256__small_sigma1_22:
	.8byte	camlSha256__small_sigma1_6_22_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__small_sigma0_21
camlSha256__small_sigma0_21:
.LcamlSha256__small_sigma0_21:
	.8byte	camlSha256__small_sigma0_5_21_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__big_sigma1_20
camlSha256__big_sigma1_20:
.LcamlSha256__big_sigma1_20:
	.8byte	camlSha256__big_sigma1_4_20_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__big_sigma0_19
camlSha256__big_sigma0_19:
.LcamlSha256__big_sigma0_19:
	.8byte	camlSha256__big_sigma0_3_19_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__maj_18
camlSha256__maj_18:
.LcamlSha256__maj_18:
	.8byte	caml_curryI_I_I_RI
	.8byte	0x380000000000007
	.8byte	camlSha256__maj_2_18_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__ch_17
camlSha256__ch_17:
.LcamlSha256__ch_17:
	.8byte	caml_curryI_I_I_RI
	.8byte	0x380000000000007
	.8byte	camlSha256__ch_1_17_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__rotr_16
camlSha256__rotr_16:
.LcamlSha256__rotr_16:
	.8byte	caml_curryI_V_RI
	.8byte	0x280000000000007
	.8byte	camlSha256__rotr_0_16_code
	.data
	.align	8
	.8byte	2816
	.globl	camlSha256__block312
camlSha256__block312:
.LcamlSha256__block312:
	.8byte	caml_exn_Invalid_argument
	.8byte	camlSha256__string310
	.data
	.align	8
	.8byte	4092
	.globl	camlSha256__string310
camlSha256__string310:
.LcamlSha256__string310:
	.ascii	"index out of bounds"
	.space	4
	.byte	4
	.text
	.align	16
	.globl	camlSha256__rotr_0_16_code
camlSha256__rotr_0_16_code:
.LcamlSha256__rotr_0_16_code:
	.cfi_startproc
	movl	$66, %ecx
	subq	%rbx, %rcx
	sarq	$1, %rcx
	movq	%rax, %rdi
	salq	%cl, %rdi
	movq	%rbx, %rcx
	sarq	$1, %rcx
	movl	%eax, %eax
	shrq	%cl, %rax
	orq	%rdi, %rax
	movslq	%eax, %rax
	ret
	.cfi_endproc
	.type camlSha256__rotr_0_16_code,@function
	.size camlSha256__rotr_0_16_code,. - camlSha256__rotr_0_16_code
	.text
	.align	16
	.globl	camlSha256__ch_1_17_code
camlSha256__ch_1_17_code:
.LcamlSha256__ch_1_17_code:
	.cfi_startproc
	xorq	%rdi, %rbx
	andq	%rbx, %rax
	xorq	%rax, %rdi
	movslq	%edi, %rax
	ret
	.cfi_endproc
	.type camlSha256__ch_1_17_code,@function
	.size camlSha256__ch_1_17_code,. - camlSha256__ch_1_17_code
	.text
	.align	16
	.globl	camlSha256__maj_2_18_code
camlSha256__maj_2_18_code:
.LcamlSha256__maj_2_18_code:
	.cfi_startproc
	movq	%rax, %rsi
	orq	%rbx, %rsi
	andq	%rsi, %rdi
	andq	%rbx, %rax
	orq	%rdi, %rax
	movslq	%eax, %rax
	ret
	.cfi_endproc
	.type camlSha256__maj_2_18_code,@function
	.size camlSha256__maj_2_18_code,. - camlSha256__maj_2_18_code
	.text
	.align	16
	.globl	camlSha256__big_sigma0_3_19_code
camlSha256__big_sigma0_3_19_code:
.LcamlSha256__big_sigma0_3_19_code:
	.cfi_startproc
	movq	%rax, %rbx
	salq	$10, %rbx
	movl	%eax, %esi
	movq	%rsi, %rdi
	sarq	$22, %rdi
	orq	%rbx, %rdi
	movq	%rax, %rbx
	salq	$19, %rbx
	movq	%rsi, %rdx
	sarq	$13, %rdx
	orq	%rbx, %rdx
	salq	$30, %rax
	sarq	$2, %rsi
	orq	%rax, %rsi
	xorq	%rdx, %rsi
	xorq	%rdi, %rsi
	movslq	%esi, %rax
	ret
	.cfi_endproc
	.type camlSha256__big_sigma0_3_19_code,@function
	.size camlSha256__big_sigma0_3_19_code,. - camlSha256__big_sigma0_3_19_code
	.text
	.align	16
	.globl	camlSha256__big_sigma1_4_20_code
camlSha256__big_sigma1_4_20_code:
.LcamlSha256__big_sigma1_4_20_code:
	.cfi_startproc
	movq	%rax, %rbx
	salq	$7, %rbx
	movl	%eax, %esi
	movq	%rsi, %rdi
	sarq	$25, %rdi
	orq	%rbx, %rdi
	movq	%rax, %rbx
	salq	$21, %rbx
	movq	%rsi, %rdx
	sarq	$11, %rdx
	orq	%rbx, %rdx
	salq	$26, %rax
	sarq	$6, %rsi
	orq	%rax, %rsi
	xorq	%rdx, %rsi
	xorq	%rdi, %rsi
	movslq	%esi, %rax
	ret
	.cfi_endproc
	.type camlSha256__big_sigma1_4_20_code,@function
	.size camlSha256__big_sigma1_4_20_code,. - camlSha256__big_sigma1_4_20_code
	.text
	.align	16
	.globl	camlSha256__small_sigma0_5_21_code
camlSha256__small_sigma0_5_21_code:
.LcamlSha256__small_sigma0_5_21_code:
	.cfi_startproc
	movl	%eax, %edi
	movq	%rdi, %rbx
	sarq	$3, %rbx
	movq	%rax, %rsi
	salq	$14, %rsi
	movq	%rdi, %rdx
	sarq	$18, %rdx
	orq	%rsi, %rdx
	salq	$25, %rax
	sarq	$7, %rdi
	orq	%rax, %rdi
	xorq	%rdx, %rdi
	xorq	%rbx, %rdi
	movslq	%edi, %rax
	ret
	.cfi_endproc
	.type camlSha256__small_sigma0_5_21_code,@function
	.size camlSha256__small_sigma0_5_21_code,. - camlSha256__small_sigma0_5_21_code
	.text
	.align	16
	.globl	camlSha256__small_sigma1_6_22_code
camlSha256__small_sigma1_6_22_code:
.LcamlSha256__small_sigma1_6_22_code:
	.cfi_startproc
	movl	%eax, %edi
	movq	%rdi, %rbx
	sarq	$10, %rbx
	movq	%rax, %rsi
	salq	$13, %rsi
	movq	%rdi, %rdx
	sarq	$19, %rdx
	orq	%rsi, %rdx
	salq	$15, %rax
	sarq	$17, %rdi
	orq	%rax, %rdi
	xorq	%rdx, %rdi
	xorq	%rbx, %rdi
	movslq	%edi, %rax
	ret
	.cfi_endproc
	.type camlSha256__small_sigma1_6_22_code,@function
	.size camlSha256__small_sigma1_6_22_code,. - camlSha256__small_sigma1_6_22_code
	.text
	.align	16
	.globl	camlSha256__create_7_23_code
camlSha256__create_7_23_code:
.LcamlSha256__create_7_23_code:
	.cfi_startproc
	.cfi_def_cfa_offset 8
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
	movl	$161, %edi
	movq	caml_make_unboxed_int32_vect@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L278:
	xorl	%ebx, %ebx
.L235:
	leaq	1(%rbx,%rbx), %rdi
	xorl	%esi, %esi
	movl	%esi, -2(%rax,%rdi,2)
	incq	%rbx
	cmpq	$79, %rbx
	jle	.L235
	movq	%rax, (%rsp)
	movl	$129, %edi
	movq	caml_create_bytes@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L279:
	movq	%rax, %rdi
	movl	$1, %ecx
	movl	$129, %edx
	movl	$1, %esi
	movq	%rdi, 8(%rsp)
	call	caml_fill_bytes@PLT
	movl	$1, %esi
	movl	$5, %edi
	movq	caml_array_make@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L280:
	movq	%rax, 16(%rsp)
	movl	$17, %edi
	movq	caml_make_unboxed_int32_vect@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L281:
	movq	%rax, %rbx
	xorl	%eax, %eax
	movq	(%rsp), %rsi
	movq	8(%rsp), %rdx
	movq	16(%rsp), %rcx
.L258:
	leaq	1(%rax,%rax), %rdi
	xorl	%r8d, %r8d
	movl	%r8d, -2(%rbx,%rdi,2)
	incq	%rax
	cmpq	$7, %rax
	jle	.L258
	subq	$48, %r15
	cmpq	(%r14), %r15
	jb	.L282
.L284:
	leaq	8(%r15), %rax
	movq	$5120, -8(%rax)
	movq	%rbx, (%rax)
	movq	%rcx, 8(%rax)
	movq	$1, 16(%rax)
	movq	%rdx, 24(%rax)
	movq	%rsi, 32(%rax)
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
.L282:
	call	.Lcaml_call_gc_
.L283:
	jmp	.L284
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlSha256__create_7_23_code,@function
	.size camlSha256__create_7_23_code,. - camlSha256__create_7_23_code
	.text
	.align	16
	.globl	camlSha256__init_8_24_code
camlSha256__init_8_24_code:
.LcamlSha256__init_8_24_code:
	.cfi_startproc
	movq	(%rax), %rbx
	movl	$1779033703, %edi
	movl	%edi, (%rbx)
	movq	$-1150833019, %rdi
	movl	%edi, 4(%rbx)
	movl	$1013904242, %edi
	movl	%edi, 8(%rbx)
	movq	$-1521486534, %rdi
	movl	%edi, 12(%rbx)
	movl	$1359893119, %edi
	movl	%edi, 16(%rbx)
	movq	$-1694144372, %rdi
	movl	%edi, 20(%rbx)
	movl	$528734635, %edi
	movl	%edi, 24(%rbx)
	movl	$1541459225, %edi
	movl	%edi, 28(%rbx)
	movq	$1, 16(%rax)
	movq	8(%rax), %rax
	movq	-8(%rax), %rbx
	salq	$8, %rbx
	shrq	$17, %rbx
	orq	$1, %rbx
	cmpq	$1, %rbx
	jbe	.L324
	movq	$1, (%rax)
	cmpq	$3, %rbx
	jbe	.L318
	movq	$1, 8(%rax)
	movl	$1, %eax
	ret
	.align	4
.L318:
	movq	camlSha256__block312@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L324:
	movq	camlSha256__block312@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.cfi_endproc
	.type camlSha256__init_8_24_code,@function
	.size camlSha256__init_8_24_code,. - camlSha256__init_8_24_code
	.text
	.align	16
	.globl	camlSha256__get_be32_9_25_code
camlSha256__get_be32_9_25_code:
.LcamlSha256__get_be32_9_25_code:
	.cfi_startproc
	leaq	6(%rbx), %rdi
	sarq	$1, %rdi
	movzbq	(%rax,%rdi), %rdi
	leaq	4(%rbx), %rsi
	sarq	$1, %rsi
	movzbq	(%rax,%rsi), %rsi
	movslq	%esi, %rsi
	salq	$8, %rsi
	orq	%rdi, %rsi
	leaq	2(%rbx), %rdi
	sarq	$1, %rdi
	movzbq	(%rax,%rdi), %rdi
	movslq	%edi, %rdi
	salq	$16, %rdi
	sarq	$1, %rbx
	movzbq	(%rax,%rbx), %rax
	movslq	%eax, %rax
	salq	$24, %rax
	orq	%rdi, %rax
	orq	%rsi, %rax
	movslq	%eax, %rax
	ret
	.cfi_endproc
	.type camlSha256__get_be32_9_25_code,@function
	.size camlSha256__get_be32_9_25_code,. - camlSha256__get_be32_9_25_code
	.text
	.align	16
	.globl	camlSha256__set_be32_10_26_code
camlSha256__set_be32_10_26_code:
.LcamlSha256__set_be32_10_26_code:
	.cfi_startproc
	movq	%rbx, %rsi
	sarq	$1, %rsi
	movl	$255, %edx
	movl	%edi, %r8d
	movq	%r8, %rcx
	sarq	$24, %rcx
	andq	%rdx, %rcx
	movb	%cl, (%rax,%rsi)
	leaq	2(%rbx), %rsi
	sarq	$1, %rsi
	movq	%r8, %rcx
	sarq	$16, %rcx
	andq	%rdx, %rcx
	movb	%cl, (%rax,%rsi)
	leaq	4(%rbx), %rsi
	sarq	$1, %rsi
	sarq	$8, %r8
	andq	%rdx, %r8
	movb	%r8b, (%rax,%rsi)
	addq	$6, %rbx
	sarq	$1, %rbx
	andq	%rdx, %rdi
	movb	%dil, (%rax,%rbx)
	movl	$1, %eax
	ret
	.cfi_endproc
	.type camlSha256__set_be32_10_26_code,@function
	.size camlSha256__set_be32_10_26_code,. - camlSha256__set_be32_10_26_code
	.text
	.align	16
	.globl	camlSha256__transform_from_11_27_code
camlSha256__transform_from_11_27_code:
.LcamlSha256__transform_from_11_27_code:
	.cfi_startproc
	movq	%rax, %r10
	movq	%rbx, %rax
	movq	32(%r10), %rbx
	xorl	%esi, %esi
.L400:
	leaq	1(%rsi,%rsi), %rdx
	leaq	-4(%rdi,%rdx,4), %rcx
	leaq	6(%rcx), %r8
	sarq	$1, %r8
	movzbq	(%rax,%r8), %r8
	leaq	4(%rcx), %r9
	sarq	$1, %r9
	movzbq	(%rax,%r9), %r9
	movslq	%r9d, %r9
	salq	$8, %r9
	orq	%r8, %r9
	leaq	2(%rcx), %r8
	sarq	$1, %r8
	movzbq	(%rax,%r8), %r8
	movslq	%r8d, %r8
	salq	$16, %r8
	sarq	$1, %rcx
	movzbq	(%rax,%rcx), %rcx
	movslq	%ecx, %rcx
	salq	$24, %rcx
	orq	%r8, %rcx
	orq	%r9, %rcx
	movslq	%ecx, %rcx
	movl	%ecx, -2(%rbx,%rdx,2)
	incq	%rsi
	cmpq	$15, %rsi
	jle	.L400
	movl	$16, %eax
.L447:
	leaq	1(%rax,%rax), %rdi
	leaq	-30(%rdi), %rsi
	movslq	-2(%rbx,%rsi,2), %rsi
	leaq	-4(%rdi), %rdx
	movslq	-2(%rbx,%rdx,2), %rdx
	leaq	-32(%rdi), %rcx
	leaq	-14(%rdi), %r8
	movslq	-2(%rbx,%rcx,2), %r11
	movl	%esi, %r9d
	movq	%r9, %rcx
	sarq	$3, %rcx
	movq	%rsi, %r12
	salq	$14, %r12
	movq	%r9, %r13
	sarq	$18, %r13
	orq	%r12, %r13
	salq	$25, %rsi
	sarq	$7, %r9
	orq	%rsi, %r9
	xorq	%r13, %r9
	xorq	%rcx, %r9
	movslq	-2(%rbx,%r8,2), %r12
	movl	%edx, %ecx
	movq	%rcx, %rsi
	sarq	$10, %rsi
	movq	%rdx, %r8
	salq	$13, %r8
	movq	%rcx, %r13
	sarq	$19, %r13
	orq	%r8, %r13
	salq	$15, %rdx
	sarq	$17, %rcx
	orq	%rdx, %rcx
	xorq	%r13, %rcx
	xorq	%rsi, %rcx
	leaq	(%rcx,%r12), %rsi
	addq	%r9, %rsi
	addq	%r11, %rsi
	movslq	%esi, %rsi
	movl	%esi, -2(%rbx,%rdi,2)
	incq	%rax
	cmpq	$79, %rax
	jle	.L447
	movq	(%r10), %rax
	movslq	28(%rax), %r11
	movslq	24(%rax), %rbp
	movslq	20(%rax), %r13
	movslq	16(%rax), %r12
	movslq	12(%rax), %r9
	movslq	8(%rax), %r8
	movslq	4(%rax), %rcx
	movslq	(%rax), %rdx
	movl	$1, %esi
	movq	camlSha256__transform_from_27@GOTPCREL(%rip), %rax
	movq	24(%rax), %rax
	movq	%r10, %rdi
	movq	%rbp, 624(%r14)
	movq	%r11, 632(%r14)
	jmp	camlSha256__rounds_12_28_code@PLT
	.cfi_endproc
	.type camlSha256__transform_from_11_27_code,@function
	.size camlSha256__transform_from_11_27_code,. - camlSha256__transform_from_11_27_code
	.text
	.align	16
	.globl	camlSha256__rounds_12_28_code
camlSha256__rounds_12_28_code:
.LcamlSha256__rounds_12_28_code:
	.cfi_startproc
	.cfi_def_cfa_offset 8
	subq	$56, %rsp
	.cfi_adjust_cfa_offset 56
	movq	%rax, (%rsp)
	movq	%rbx, 8(%rsp)
	movq	%rdi, 16(%rsp)
	movq	624(%r14), %rax
	movq	632(%r14), %rbx
	movq	%rsi, %rdi
	movq	%rdi, 24(%rsp)
.L529:
	movq	24(%rsp), %rdi
	cmpq	$15, %rdi
	jle	.L566
	movq	16(%rsp), %rdi
	movq	(%rdi), %rdi
	movslq	(%rdi), %rsi
	addq	%rdx, %rsi
	movslq	%esi, %rsi
	movl	%esi, (%rdi)
	movslq	4(%rdi), %rsi
	addq	%rcx, %rsi
	movslq	%esi, %rsi
	movl	%esi, 4(%rdi)
	movslq	8(%rdi), %rsi
	addq	%r8, %rsi
	movslq	%esi, %rsi
	movl	%esi, 8(%rdi)
	movslq	12(%rdi), %rsi
	addq	%r9, %rsi
	movslq	%esi, %rsi
	movl	%esi, 12(%rdi)
	movslq	16(%rdi), %rsi
	addq	%r12, %rsi
	movslq	%esi, %rsi
	movl	%esi, 16(%rdi)
	movslq	20(%rdi), %rsi
	addq	%r13, %rsi
	movslq	%esi, %rsi
	movl	%esi, 20(%rdi)
	movslq	24(%rdi), %rsi
	addq	%rsi, %rax
	movslq	%eax, %rax
	movl	%eax, 24(%rdi)
	movslq	28(%rdi), %rax
	addq	%rbx, %rax
	movslq	%eax, %rax
	movl	%eax, 28(%rdi)
	movl	$1, %eax
	addq	$56, %rsp
	.cfi_adjust_cfa_offset -56
	ret
	.cfi_adjust_cfa_offset 56
	.align	4
.L566:
	movq	24(%rsp), %rdi
	leaq	-7(,%rdi,8), %rdi
	movq	%rdi, 32(%rsp)
	movq	8(%rsp), %rdi
	movq	32(%rsp), %rsi
	movslq	-2(%rdi,%rsi,2), %rdi
	movq	%rdi, 40(%rsp)
	movq	(%rsp), %rdi
	movq	32(%rsp), %rsi
	movslq	-2(%rdi,%rsi,2), %rdi
	movq	%rdi, 48(%rsp)
	movq	%r13, %rdi
	xorq	%rax, %rdi
	movq	%r12, %rsi
	andq	%rdi, %rsi
	movq	%rax, %rdi
	xorq	%rsi, %rdi
	movq	%r12, %r11
	salq	$7, %r11
	movl	%r12d, %r10d
	movq	%r10, %rsi
	sarq	$25, %rsi
	orq	%r11, %rsi
	movq	%r12, %rbp
	salq	$21, %rbp
	movq	%r10, %r11
	sarq	$11, %r11
	orq	%rbp, %r11
	movq	%r12, %rbp
	salq	$26, %rbp
	sarq	$6, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%rsi, %r10
	addq	%r10, %rbx
	addq	%rdi, %rbx
	movq	48(%rsp), %rdi
	addq	%rdi, %rbx
	movq	40(%rsp), %rdi
	addq	%rdi, %rbx
	movslq	%ebx, %rbx
	leaq	(%r9,%rbx), %rdi
	movslq	%edi, %rdi
	movq	%rdx, %rsi
	orq	%rcx, %rsi
	movq	%r8, %r9
	andq	%rsi, %r9
	movq	%rdx, %rsi
	andq	%rcx, %rsi
	orq	%r9, %rsi
	movq	%rdx, %r11
	salq	$10, %r11
	movl	%edx, %r10d
	movq	%r10, %r9
	sarq	$22, %r9
	orq	%r11, %r9
	movq	%rdx, %rbp
	salq	$19, %rbp
	movq	%r10, %r11
	sarq	$13, %r11
	orq	%rbp, %r11
	movq	%rdx, %rbp
	salq	$30, %rbp
	sarq	$2, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r9, %r10
	addq	%r10, %rsi
	addq	%rsi, %rbx
	movslq	%ebx, %rbx
	movq	32(%rsp), %rsi
	addq	$2, %rsi
	movq	8(%rsp), %r9
	movslq	-2(%r9,%rsi,2), %r9
	movq	%r9, 40(%rsp)
	movq	(%rsp), %r9
	movslq	-2(%r9,%rsi,2), %rsi
	movq	%rsi, 48(%rsp)
	movq	%r12, %rsi
	xorq	%r13, %rsi
	movq	%rdi, %r9
	andq	%rsi, %r9
	movq	%r13, %rsi
	xorq	%r9, %rsi
	movq	%rdi, %r11
	salq	$7, %r11
	movl	%edi, %r10d
	movq	%r10, %r9
	sarq	$25, %r9
	orq	%r11, %r9
	movq	%rdi, %rbp
	salq	$21, %rbp
	movq	%r10, %r11
	sarq	$11, %r11
	orq	%rbp, %r11
	movq	%rdi, %rbp
	salq	$26, %rbp
	sarq	$6, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r9, %r10
	addq	%r10, %rax
	addq	%rsi, %rax
	movq	48(%rsp), %rsi
	addq	%rsi, %rax
	movq	40(%rsp), %rsi
	addq	%rsi, %rax
	movslq	%eax, %rax
	leaq	(%r8,%rax), %rsi
	movslq	%esi, %rsi
	movq	%rbx, %r8
	orq	%rdx, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	%rbx, %r8
	andq	%rdx, %r8
	orq	%r9, %r8
	movq	%rbx, %r11
	salq	$10, %r11
	movl	%ebx, %r10d
	movq	%r10, %r9
	sarq	$22, %r9
	orq	%r11, %r9
	movq	%rbx, %rbp
	salq	$19, %rbp
	movq	%r10, %r11
	sarq	$13, %r11
	orq	%rbp, %r11
	movq	%rbx, %rbp
	salq	$30, %rbp
	sarq	$2, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r9, %r10
	addq	%r10, %r8
	addq	%r8, %rax
	movslq	%eax, %rax
	movq	32(%rsp), %r8
	addq	$4, %r8
	movq	8(%rsp), %r9
	movslq	-2(%r9,%r8,2), %r9
	movq	%r9, 40(%rsp)
	movq	(%rsp), %r9
	movslq	-2(%r9,%r8,2), %r8
	movq	%r8, 48(%rsp)
	movq	%rdi, %r8
	xorq	%r12, %r8
	movq	%rsi, %r9
	andq	%r8, %r9
	movq	%r12, %r8
	xorq	%r9, %r8
	movq	%rsi, %r11
	salq	$7, %r11
	movl	%esi, %r10d
	movq	%r10, %r9
	sarq	$25, %r9
	orq	%r11, %r9
	movq	%rsi, %rbp
	salq	$21, %rbp
	movq	%r10, %r11
	sarq	$11, %r11
	orq	%rbp, %r11
	movq	%rsi, %rbp
	salq	$26, %rbp
	sarq	$6, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r9, %r10
	leaq	(%r13,%r10), %r9
	addq	%r9, %r8
	movq	48(%rsp), %r9
	addq	%r9, %r8
	movq	40(%rsp), %r9
	addq	%r9, %r8
	movslq	%r8d, %r8
	addq	%r8, %rcx
	movslq	%ecx, %rcx
	movq	%rax, %r9
	orq	%rbx, %r9
	movq	%rdx, %r13
	andq	%r9, %r13
	movq	%rax, %r9
	andq	%rbx, %r9
	orq	%r13, %r9
	movq	%rax, %r11
	salq	$10, %r11
	movl	%eax, %r10d
	movq	%r10, %r13
	sarq	$22, %r13
	orq	%r11, %r13
	movq	%rax, %rbp
	salq	$19, %rbp
	movq	%r10, %r11
	sarq	$13, %r11
	orq	%rbp, %r11
	movq	%rax, %rbp
	salq	$30, %rbp
	sarq	$2, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r13, %r10
	addq	%r10, %r9
	addq	%r9, %r8
	movslq	%r8d, %r8
	movq	32(%rsp), %r9
	addq	$6, %r9
	movq	8(%rsp), %r13
	movslq	-2(%r13,%r9,2), %r13
	movq	%r13, 40(%rsp)
	movq	(%rsp), %r13
	movslq	-2(%r13,%r9,2), %r9
	movq	%r9, 48(%rsp)
	movq	%rsi, %r9
	xorq	%rdi, %r9
	movq	%rcx, %r13
	andq	%r9, %r13
	movq	%rdi, %r9
	xorq	%r13, %r9
	movq	%rcx, %r11
	salq	$7, %r11
	movl	%ecx, %r10d
	movq	%r10, %r13
	sarq	$25, %r13
	orq	%r11, %r13
	movq	%rcx, %rbp
	salq	$21, %rbp
	movq	%r10, %r11
	sarq	$11, %r11
	orq	%rbp, %r11
	movq	%rcx, %rbp
	salq	$26, %rbp
	sarq	$6, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r13, %r10
	addq	%r10, %r12
	addq	%r12, %r9
	movq	48(%rsp), %r12
	addq	%r12, %r9
	movq	40(%rsp), %r12
	addq	%r12, %r9
	movslq	%r9d, %r9
	addq	%r9, %rdx
	movslq	%edx, %rdx
	movq	%r8, %r12
	orq	%rax, %r12
	movq	%rbx, %r13
	andq	%r12, %r13
	movq	%r8, %r12
	andq	%rax, %r12
	orq	%r13, %r12
	movq	%r8, %r11
	salq	$10, %r11
	movl	%r8d, %r10d
	movq	%r10, %r13
	sarq	$22, %r13
	orq	%r11, %r13
	movq	%r8, %rbp
	salq	$19, %rbp
	movq	%r10, %r11
	sarq	$13, %r11
	orq	%rbp, %r11
	movq	%r8, %rbp
	salq	$30, %rbp
	sarq	$2, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r13, %r10
	addq	%r10, %r12
	addq	%r12, %r9
	movslq	%r9d, %r9
	movq	32(%rsp), %r12
	addq	$8, %r12
	movq	8(%rsp), %r13
	movslq	-2(%r13,%r12,2), %r13
	movq	%r13, 40(%rsp)
	movq	(%rsp), %r13
	movslq	-2(%r13,%r12,2), %r12
	movq	%r12, 48(%rsp)
	movq	%rcx, %r12
	xorq	%rsi, %r12
	movq	%rdx, %r13
	andq	%r12, %r13
	movq	%rsi, %r12
	xorq	%r13, %r12
	movq	%rdx, %r11
	salq	$7, %r11
	movl	%edx, %r10d
	movq	%r10, %r13
	sarq	$25, %r13
	orq	%r11, %r13
	movq	%rdx, %rbp
	salq	$21, %rbp
	movq	%r10, %r11
	sarq	$11, %r11
	orq	%rbp, %r11
	movq	%rdx, %rbp
	salq	$26, %rbp
	sarq	$6, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r13, %r10
	addq	%r10, %rdi
	addq	%r12, %rdi
	movq	48(%rsp), %r12
	addq	%r12, %rdi
	movq	40(%rsp), %r12
	addq	%r12, %rdi
	movslq	%edi, %rdi
	addq	%rdi, %rbx
	movslq	%ebx, %rbx
	movq	%r9, %r12
	orq	%r8, %r12
	movq	%rax, %r13
	andq	%r12, %r13
	movq	%r9, %r12
	andq	%r8, %r12
	orq	%r13, %r12
	movq	%r9, %r11
	salq	$10, %r11
	movl	%r9d, %r10d
	movq	%r10, %r13
	sarq	$22, %r13
	orq	%r11, %r13
	movq	%r9, %rbp
	salq	$19, %rbp
	movq	%r10, %r11
	sarq	$13, %r11
	orq	%rbp, %r11
	movq	%r9, %rbp
	salq	$30, %rbp
	sarq	$2, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r13, %r10
	addq	%r10, %r12
	addq	%r12, %rdi
	movslq	%edi, %rdi
	movq	32(%rsp), %r12
	addq	$10, %r12
	movq	8(%rsp), %r13
	movslq	-2(%r13,%r12,2), %r13
	movq	%r13, 40(%rsp)
	movq	(%rsp), %r13
	movslq	-2(%r13,%r12,2), %r12
	movq	%r12, 48(%rsp)
	movq	%rdx, %r12
	xorq	%rcx, %r12
	movq	%rbx, %r13
	andq	%r12, %r13
	movq	%rcx, %r12
	xorq	%r13, %r12
	movq	%rbx, %r11
	salq	$7, %r11
	movl	%ebx, %r10d
	movq	%r10, %r13
	sarq	$25, %r13
	orq	%r11, %r13
	movq	%rbx, %rbp
	salq	$21, %rbp
	movq	%r10, %r11
	sarq	$11, %r11
	orq	%rbp, %r11
	movq	%rbx, %rbp
	salq	$26, %rbp
	sarq	$6, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r13, %r10
	addq	%r10, %rsi
	addq	%r12, %rsi
	movq	48(%rsp), %r12
	addq	%r12, %rsi
	movq	40(%rsp), %r12
	addq	%r12, %rsi
	movslq	%esi, %rsi
	addq	%rsi, %rax
	movslq	%eax, %rax
	movq	%rdi, %r12
	orq	%r9, %r12
	movq	%r8, %r13
	andq	%r12, %r13
	movq	%rdi, %r12
	andq	%r9, %r12
	orq	%r13, %r12
	movq	%rdi, %r11
	salq	$10, %r11
	movl	%edi, %r10d
	movq	%r10, %r13
	sarq	$22, %r13
	orq	%r11, %r13
	movq	%rdi, %rbp
	salq	$19, %rbp
	movq	%r10, %r11
	sarq	$13, %r11
	orq	%rbp, %r11
	movq	%rdi, %rbp
	salq	$30, %rbp
	sarq	$2, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r13, %r10
	addq	%r10, %r12
	addq	%r12, %rsi
	movslq	%esi, %rsi
	movq	32(%rsp), %r12
	addq	$12, %r12
	movq	8(%rsp), %r13
	movslq	-2(%r13,%r12,2), %r13
	movq	%r13, 40(%rsp)
	movq	(%rsp), %r13
	movslq	-2(%r13,%r12,2), %r12
	movq	%r12, 48(%rsp)
	movq	%rbx, %r12
	xorq	%rdx, %r12
	movq	%rax, %r13
	andq	%r12, %r13
	movq	%rdx, %r12
	xorq	%r13, %r12
	movq	%rax, %r11
	salq	$7, %r11
	movl	%eax, %r10d
	movq	%r10, %r13
	sarq	$25, %r13
	orq	%r11, %r13
	movq	%rax, %rbp
	salq	$21, %rbp
	movq	%r10, %r11
	sarq	$11, %r11
	orq	%rbp, %r11
	movq	%rax, %rbp
	salq	$26, %rbp
	sarq	$6, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r13, %r10
	addq	%r10, %rcx
	addq	%r12, %rcx
	movq	48(%rsp), %r12
	addq	%r12, %rcx
	movq	40(%rsp), %r12
	addq	%r12, %rcx
	movslq	%ecx, %rcx
	addq	%rcx, %r8
	movslq	%r8d, %r13
	movq	%rsi, %r8
	orq	%rdi, %r8
	movq	%r9, %r12
	andq	%r8, %r12
	movq	%rsi, %r8
	andq	%rdi, %r8
	orq	%r12, %r8
	movq	%rsi, %r11
	salq	$10, %r11
	movl	%esi, %r10d
	movq	%r10, %r12
	sarq	$22, %r12
	orq	%r11, %r12
	movq	%rsi, %rbp
	salq	$19, %rbp
	movq	%r10, %r11
	sarq	$13, %r11
	orq	%rbp, %r11
	movq	%rsi, %rbp
	salq	$30, %rbp
	sarq	$2, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r12, %r10
	addq	%r10, %r8
	addq	%r8, %rcx
	movslq	%ecx, %rcx
	movq	32(%rsp), %r8
	addq	$14, %r8
	movq	8(%rsp), %r12
	movslq	-2(%r12,%r8,2), %r12
	movq	%r12, 32(%rsp)
	movq	(%rsp), %r12
	movslq	-2(%r12,%r8,2), %r8
	movq	%r8, 40(%rsp)
	movq	%rax, %r8
	xorq	%rbx, %r8
	movq	%r13, %r12
	andq	%r8, %r12
	movq	%rbx, %r8
	xorq	%r12, %r8
	movq	%r13, %r11
	salq	$7, %r11
	movl	%r13d, %r10d
	movq	%r10, %r12
	sarq	$25, %r12
	orq	%r11, %r12
	movq	%r13, %rbp
	salq	$21, %rbp
	movq	%r10, %r11
	sarq	$11, %r11
	orq	%rbp, %r11
	movq	%r13, %rbp
	salq	$26, %rbp
	sarq	$6, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r12, %r10
	addq	%r10, %rdx
	addq	%r8, %rdx
	movq	40(%rsp), %r8
	addq	%r8, %rdx
	movq	32(%rsp), %r8
	addq	%r8, %rdx
	movslq	%edx, %rdx
	leaq	(%r9,%rdx), %r8
	movslq	%r8d, %r12
	movq	%rcx, %r8
	orq	%rsi, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	%rcx, %r8
	andq	%rsi, %r8
	orq	%r9, %r8
	movq	%rcx, %r11
	salq	$10, %r11
	movl	%ecx, %r10d
	movq	%r10, %r9
	sarq	$22, %r9
	orq	%r11, %r9
	movq	%rcx, %rbp
	salq	$19, %rbp
	movq	%r10, %r11
	sarq	$13, %r11
	orq	%rbp, %r11
	movq	%rcx, %rbp
	salq	$30, %rbp
	sarq	$2, %r10
	orq	%rbp, %r10
	xorq	%r11, %r10
	xorq	%r9, %r10
	addq	%r10, %r8
	addq	%r8, %rdx
	movslq	%edx, %rdx
	movq	24(%rsp), %r8
	addq	$2, %r8
	movq	%rdi, %r9
	movq	%r13, %rdi
	movq	%r8, 24(%rsp)
	movq	%rsi, %r8
	movq	%rdi, %r13
	jmp	.L529
	.cfi_adjust_cfa_offset -56
	.cfi_endproc
	.type camlSha256__rounds_12_28_code,@function
	.size camlSha256__rounds_12_28_code,. - camlSha256__rounds_12_28_code
	.text
	.align	16
	.globl	camlSha256__transform_13_29_code
camlSha256__transform_13_29_code:
.LcamlSha256__transform_13_29_code:
	.cfi_startproc
	movl	$1, %edi
	movq	24(%rax), %rbx
	jmp	camlSha256__transform_from_11_27_code@PLT
	.cfi_endproc
	.type camlSha256__transform_13_29_code,@function
	.size camlSha256__transform_13_29_code,. - camlSha256__transform_13_29_code
	.text
	.align	16
	.globl	camlSha256__add_data_14_30_code
camlSha256__add_data_14_30_code:
.LcamlSha256__add_data_14_30_code:
	.cfi_startproc
	.cfi_def_cfa_offset 8
	subq	$40, %rsp
	.cfi_adjust_cfa_offset 40
	movq	%rax, %r12
	movq	%rdi, %r13
	movq	8(%r12), %rax
	movq	-8(%rax), %rdi
	salq	$8, %rdi
	shrq	$17, %rdi
	orq	$1, %rdi
	cmpq	$3, %rdi
	jbe	.L1412
	movq	8(%rax), %rsi
	movabsq	$8589934591, %rcx
	leaq	-8(%rsi,%r13,8), %rdx
	andq	%rcx, %rdx
	movq	%rdx, 8(%rax)
	cmpq	%rsi, %rdx
	jge	.L1219
	cmpq	$1, %rdi
	jbe	.L1210
	movabsq	$8589934591, %rdx
	movq	(%rax), %rsi
	addq	$2, %rsi
	andq	%rdx, %rsi
	movq	%rsi, (%rax)
	cmpq	$1, %rdi
	jbe	.L1405
	jmp	.L1221
	.align	4
.L1210:
	movq	camlSha256__block312@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1219:
	cmpq	$1, %rdi
	jbe	.L1405
.L1221:
	movabsq	$8589934591, %rsi
	movq	%r13, %rdi
	shrq	$29, %rdi
	orq	$1, %rdi
	movq	(%rax), %rdx
	leaq	-1(%rdx,%rdi), %rdi
	andq	%rsi, %rdi
	movq	%rdi, (%rax)
	movq	16(%r12), %rcx
	cmpq	$1, %rcx
	je	.L1330
	movl	$130, %r8d
	subq	%rcx, %r8
	cmpq	%r8, %r13
	jge	.L1283
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L1243
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1243:
	movq	-8(%rbx), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rbx,%rax), %rdi
	subq	%rdi, %rax
	salq	$1, %rax
	subq	%r13, %rax
	addq	$2, %rax
	cmpq	$1, %rax
	jge	.L1256
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1256:
	cmpq	$1, %rcx
	jge	.L1260
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1260:
	movq	-8(%rdx), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rdx,%rax), %rdi
	subq	%rdi, %rax
	salq	$1, %rax
	subq	%r13, %rax
	addq	$2, %rax
	cmpq	%rax, %rcx
	jle	.L1273
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1273:
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	16(%r12), %rax
	leaq	-1(%rax,%r13), %rax
	movq	%rax, 16(%r12)
	movl	$1, %eax
	movl	$1, %esi
	jmp	.L1335
	.align	4
.L1283:
	movq	24(%r12), %rbp
	cmpq	$1, %r8
	jge	.L1289
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1289:
	movq	-8(%rbx), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rbx,%rax), %rdi
	subq	%rdi, %rax
	salq	$1, %rax
	subq	%r8, %rax
	addq	$2, %rax
	cmpq	$1, %rax
	jge	.L1302
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1302:
	cmpq	$1, %rcx
	jge	.L1306
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1306:
	movq	-8(%rbp), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rbp,%rax), %rdi
	subq	%rdi, %rax
	salq	$1, %rax
	subq	%r8, %rax
	addq	$2, %rax
	cmpq	%rax, %rcx
	jle	.L1319
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1319:
	movq	%r13, 16(%rsp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rbx, 8(%rsp)
	movq	%rbp, %rdx
	movq	%r8, 24(%rsp)
	call	caml_blit_bytes@PLT
	movl	$1, %edi
	movq	%r12, %rax
	movq	%r12, (%rsp)
	movq	%rbp, %rbx
	call	camlSha256__transform_from_11_27_code@PLT
.L1418:
	xorl	%eax, %eax
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rsi
	subq	%rsi, %rbx
	leaq	1(%rbx), %r13
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	jmp	.L1343
	.align	4
.L1330:
	xorl	%eax, %eax
	movl	$1, %esi
	jmp	.L1343
	.align	4
.L1335:
	movl	$1, %eax
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.align	4
.L1343:
	movq	%rbx, 8(%rsp)
	movq	%r12, (%rsp)
	cmpq	$129, %r13
	jl	.L1352
.L1347:
	movq	%r13, 24(%rsp)
	movq	%r12, %rax
	movq	%rsi, %rdi
	movq	%rsi, 16(%rsp)
	call	camlSha256__transform_from_11_27_code@PLT
.L1419:
	movq	24(%rsp), %r13
	addq	$-128, %r13
	movq	16(%rsp), %rsi
	addq	$128, %rsi
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	cmpq	$129, %r13
	jge	.L1347
.L1352:
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L1361
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1361:
	cmpq	$1, %rsi
	jge	.L1365
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1365:
	movq	-8(%rbx), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rbx,%rax), %rdi
	subq	%rdi, %rax
	salq	$1, %rax
	subq	%r13, %rax
	addq	$2, %rax
	cmpq	%rax, %rsi
	jle	.L1378
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1378:
	movq	-8(%rdx), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rdx,%rax), %rdi
	subq	%rdi, %rax
	salq	$1, %rax
	subq	%r13, %rax
	addq	$2, %rax
	cmpq	$1, %rax
	jge	.L1391
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1391:
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	%r13, 16(%r12)
	movl	$1, %eax
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.align	4
.L1405:
	movq	camlSha256__block312@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1412:
	movq	camlSha256__block312@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.type camlSha256__add_data_14_30_code,@function
	.size camlSha256__add_data_14_30_code,. - camlSha256__add_data_14_30_code
	.text
	.align	16
	.globl	camlSha256__finish_15_31_code
camlSha256__finish_15_31_code:
.LcamlSha256__finish_15_31_code:
	.cfi_startproc
	.cfi_def_cfa_offset 8
	subq	$40, %rsp
	.cfi_adjust_cfa_offset 40
	movq	%rax, %r12
	movq	%rbx, %r13
	movq	16(%r12), %rax
	movq	24(%r12), %rbx
	movq	-8(%rbx), %rdi
	salq	$8, %rdi
	shrq	$18, %rdi
	leaq	-1(,%rdi,8), %rdi
	movzbq	(%rbx,%rdi), %rsi
	subq	%rsi, %rdi
	movq	%rax, %rsi
	sarq	$1, %rsi
	cmpq	%rdi, %rsi
	jae	.L1620
	movq	$-128, %rdx
	movb	%dl, (%rbx,%rsi)
	leaq	2(%rax), %rsi
	cmpq	$113, %rsi
	jle	.L1468
	movl	$130, %edx
	subq	%rsi, %rdx
	cmpq	$1, %rsi
	jge	.L1447
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1447:
	cmpq	$1, %rdx
	jge	.L1451
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1451:
	movq	%rdi, %rax
	salq	$1, %rax
	subq	%rdx, %rax
	addq	$2, %rax
	cmpq	%rax, %rsi
	jle	.L1458
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1458:
	movq	%rdi, 24(%rsp)
	movq	%r13, 8(%rsp)
	movl	$1, %ecx
	movq	%rbx, %rdi
	call	caml_fill_bytes@PLT
	movl	$1, %edi
	movq	%r12, %rax
	movq	%r12, (%rsp)
	movq	%rbx, 16(%rsp)
	call	camlSha256__transform_from_11_27_code@PLT
.L1625:
	movl	$1, %esi
	movq	(%rsp), %r12
	movq	8(%rsp), %r13
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rdi
.L1468:
	movl	$114, %edx
	subq	%rsi, %rdx
	cmpq	$1, %rsi
	jge	.L1473
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1473:
	cmpq	$1, %rdx
	jge	.L1477
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1477:
	salq	$1, %rdi
	subq	%rdx, %rdi
	leaq	2(%rdi), %rax
	cmpq	%rax, %rsi
	jle	.L1484
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1484:
	movl	$1, %ecx
	movq	%rbx, %rdi
	call	caml_fill_bytes@PLT
	movq	8(%r12), %rax
	movq	-8(%rax), %rdi
	salq	$8, %rdi
	shrq	$17, %rdi
	orq	$1, %rdi
	cmpq	$1, %rdi
	jbe	.L1610
	movq	(%rax), %rsi
	salq	$31, %rsi
	sarq	$32, %rsi
	movl	$255, %edx
	movl	%esi, %r8d
	movq	%r8, %rcx
	sarq	$24, %rcx
	andq	%rdx, %rcx
	movb	%cl, 56(%rbx)
	movq	%r8, %rcx
	sarq	$16, %rcx
	andq	%rdx, %rcx
	movb	%cl, 57(%rbx)
	sarq	$8, %r8
	andq	%rdx, %r8
	movb	%r8b, 58(%rbx)
	andq	%rdx, %rsi
	movb	%sil, 59(%rbx)
	cmpq	$3, %rdi
	jbe	.L1604
	movq	%r13, 8(%rsp)
	movq	8(%rax), %rax
	salq	$31, %rax
	sarq	$32, %rax
	movl	%eax, %esi
	movq	%rsi, %rdi
	sarq	$24, %rdi
	andq	%rdx, %rdi
	movb	%dil, 60(%rbx)
	movq	%rsi, %rdi
	sarq	$16, %rdi
	andq	%rdx, %rdi
	movb	%dil, 61(%rbx)
	sarq	$8, %rsi
	andq	%rdx, %rsi
	movb	%sil, 62(%rbx)
	andq	%rdx, %rax
	movb	%al, 63(%rbx)
	movl	$1, %edi
	movq	%r12, %rax
	movq	%r12, (%rsp)
	call	camlSha256__transform_from_11_27_code@PLT
.L1626:
	xorl	%eax, %eax
	movq	(%rsp), %rcx
	movq	8(%rsp), %r8
.L1558:
	leaq	1(%rax,%rax), %rbx
	movq	(%rcx), %rdi
	movslq	-2(%rdi,%rbx,2), %rdi
	leaq	-3(,%rbx,4), %rbx
	movq	%rbx, %rsi
	sarq	$1, %rsi
	movl	$255, %edx
	movl	%edi, %r12d
	movq	%r12, %r9
	sarq	$24, %r9
	andq	%rdx, %r9
	movb	%r9b, (%r8,%rsi)
	leaq	2(%rbx), %rsi
	sarq	$1, %rsi
	movq	%r12, %r9
	sarq	$16, %r9
	andq	%rdx, %r9
	movb	%r9b, (%r8,%rsi)
	leaq	4(%rbx), %rsi
	sarq	$1, %rsi
	sarq	$8, %r12
	andq	%rdx, %r12
	movb	%r12b, (%r8,%rsi)
	addq	$6, %rbx
	sarq	$1, %rbx
	andq	%rdx, %rdi
	movb	%dil, (%r8,%rbx)
	incq	%rax
	cmpq	$7, %rax
	jle	.L1558
	movl	$1, %eax
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.align	4
.L1604:
	movq	camlSha256__block312@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1610:
	movq	camlSha256__block312@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1620:
	movq	camlSha256__block312@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.type camlSha256__finish_15_31_code,@function
	.size camlSha256__finish_15_31_code,. - camlSha256__finish_15_31_code
	.text
	.align	16
	.globl	camlSha256__entry
camlSha256__entry:
.LcamlSha256__entry:
	.cfi_startproc
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	movl	$129, %eax
	movq	%rax, %rdi
	movq	caml_make_unboxed_int32_vect@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L1725:
	movq	%rax, %rbx
	movq	camlSha256__transform_from_27@GOTPCREL(%rip), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	movq	%rbx, %rsi
	call	caml_initialize@PLT
	movq	camlSha256@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	movq	%rbx, %rsi
	call	caml_initialize@PLT
	xorl	%eax, %eax
.L1643:
	leaq	1(%rax,%rax), %rdi
	xorl	%esi, %esi
	movl	%esi, -2(%rbx,%rdi,2)
	incq	%rax
	cmpq	$63, %rax
	jle	.L1643
	movl	$1116352408, %eax
	movl	%eax, (%rbx)
	movl	$1899447441, %eax
	movl	%eax, 4(%rbx)
	movq	$-1245643825, %rax
	movl	%eax, 8(%rbx)
	movq	$-373957723, %rax
	movl	%eax, 12(%rbx)
	movl	$961987163, %eax
	movl	%eax, 16(%rbx)
	movl	$1508970993, %eax
	movl	%eax, 20(%rbx)
	movq	$-1841331548, %rax
	movl	%eax, 24(%rbx)
	movq	$-1424204075, %rax
	movl	%eax, 28(%rbx)
	movq	$-670586216, %rax
	movl	%eax, 32(%rbx)
	movl	$310598401, %eax
	movl	%eax, 36(%rbx)
	movl	$607225278, %eax
	movl	%eax, 40(%rbx)
	movl	$1426881987, %eax
	movl	%eax, 44(%rbx)
	movl	$1925078388, %eax
	movl	%eax, 48(%rbx)
	movq	$-2132889090, %rax
	movl	%eax, 52(%rbx)
	movq	$-1680079193, %rax
	movl	%eax, 56(%rbx)
	movq	$-1046744716, %rax
	movl	%eax, 60(%rbx)
	movq	$-459576895, %rax
	movl	%eax, 64(%rbx)
	movq	$-272742522, %rax
	movl	%eax, 68(%rbx)
	movl	$264347078, %eax
	movl	%eax, 72(%rbx)
	movl	$604807628, %eax
	movl	%eax, 76(%rbx)
	movl	$770255983, %eax
	movl	%eax, 80(%rbx)
	movl	$1249150122, %eax
	movl	%eax, 84(%rbx)
	movl	$1555081692, %eax
	movl	%eax, 88(%rbx)
	movl	$1996064986, %eax
	movl	%eax, 92(%rbx)
	movq	$-1740746414, %rax
	movl	%eax, 96(%rbx)
	movq	$-1473132947, %rax
	movl	%eax, 100(%rbx)
	movq	$-1341970488, %rax
	movl	%eax, 104(%rbx)
	movq	$-1084653625, %rax
	movl	%eax, 108(%rbx)
	movq	$-958395405, %rax
	movl	%eax, 112(%rbx)
	movq	$-710438585, %rax
	movl	%eax, 116(%rbx)
	movl	$113926993, %eax
	movl	%eax, 120(%rbx)
	movl	$338241895, %eax
	movl	%eax, 124(%rbx)
	movl	$666307205, %eax
	movl	%eax, 128(%rbx)
	movl	$773529912, %eax
	movl	%eax, 132(%rbx)
	movl	$1294757372, %eax
	movl	%eax, 136(%rbx)
	movl	$1396182291, %eax
	movl	%eax, 140(%rbx)
	movl	$1695183700, %eax
	movl	%eax, 144(%rbx)
	movl	$1986661051, %eax
	movl	%eax, 148(%rbx)
	movq	$-2117940946, %rax
	movl	%eax, 152(%rbx)
	movq	$-1838011259, %rax
	movl	%eax, 156(%rbx)
	movq	$-1564481375, %rax
	movl	%eax, 160(%rbx)
	movq	$-1474664885, %rax
	movl	%eax, 164(%rbx)
	movq	$-1035236496, %rax
	movl	%eax, 168(%rbx)
	movq	$-949202525, %rax
	movl	%eax, 172(%rbx)
	movq	$-778901479, %rax
	movl	%eax, 176(%rbx)
	movq	$-694614492, %rax
	movl	%eax, 180(%rbx)
	movq	$-200395387, %rax
	movl	%eax, 184(%rbx)
	movl	$275423344, %eax
	movl	%eax, 188(%rbx)
	movl	$430227734, %eax
	movl	%eax, 192(%rbx)
	movl	$506948616, %eax
	movl	%eax, 196(%rbx)
	movl	$659060556, %eax
	movl	%eax, 200(%rbx)
	movl	$883997877, %eax
	movl	%eax, 204(%rbx)
	movl	$958139571, %eax
	movl	%eax, 208(%rbx)
	movl	$1322822218, %eax
	movl	%eax, 212(%rbx)
	movl	$1537002063, %eax
	movl	%eax, 216(%rbx)
	movl	$1747873779, %eax
	movl	%eax, 220(%rbx)
	movl	$1955562222, %eax
	movl	%eax, 224(%rbx)
	movl	$2024104815, %eax
	movl	%eax, 228(%rbx)
	movq	$-2067236844, %rax
	movl	%eax, 232(%rbx)
	movq	$-1933114872, %rax
	movl	%eax, 236(%rbx)
	movq	$-1866530822, %rax
	movl	%eax, 240(%rbx)
	movq	$-1538233109, %rax
	movl	%eax, 244(%rbx)
	movq	$-1090935817, %rax
	movl	%eax, 248(%rbx)
	movq	$-965641998, %rax
	movl	%eax, 252(%rbx)
	movl	$1, %eax
	addq	$8, %rsp
	.cfi_adjust_cfa_offset -8
	ret
	.cfi_adjust_cfa_offset 8
	.cfi_adjust_cfa_offset -8
	.cfi_endproc
	.type camlSha256__entry,@function
	.size camlSha256__entry,. - camlSha256__entry
	.data
	.align	8
	.text
	.align	4
	.text
	.globl	camlSha256__code_end
camlSha256__code_end:
	.data
	.align	8
	.data
	.8byte	0
	.globl	camlSha256__data_end
camlSha256__data_end:
	.8byte	0
	.section .rodata
	.align	8
	.globl	camlSha256__frametable
camlSha256__frametable:
	.8byte	10
	.4byte	(.L1725 - .) + 0
	.2byte	17
	.2byte	0
	.align	4
	.4byte	(.L1726 - .) + 0
	.align	8
	.4byte	(.L1626 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L1727 - .) + 0
	.align	8
	.4byte	(.L1625 - .) + 0
	.2byte	49
	.2byte	3
	.2byte	0
	.2byte	8
	.2byte	16
	.align	4
	.4byte	(.L1728 - .) + 0
	.align	8
	.4byte	(.L1419 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L1729 - .) + 0
	.align	8
	.4byte	(.L1418 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L1730 - .) + 0
	.align	8
	.4byte	(.L283 - .) + 0
	.2byte	34
	.2byte	4
	.2byte	3
	.2byte	7
	.2byte	9
	.2byte	11
	.byte	1
	.byte	4
	.align	8
	.4byte	(.L281 - .) + 0
	.2byte	33
	.2byte	3
	.2byte	0
	.2byte	8
	.2byte	16
	.align	4
	.4byte	(.L1731 - .) + 0
	.align	8
	.4byte	(.L280 - .) + 0
	.2byte	33
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L1732 - .) + 0
	.align	8
	.4byte	(.L279 - .) + 0
	.2byte	33
	.2byte	1
	.2byte	0
	.align	4
	.4byte	(.L1733 - .) + 0
	.align	8
	.4byte	(.L278 - .) + 0
	.2byte	33
	.2byte	0
	.align	4
	.4byte	(.L1734 - .) + 0
	.align	8
	.align	4
.L1726:
	.4byte	(.L1736 - .) + 0
	.4byte	15739152
	.align	4
.L1732:
	.4byte	(.L1737 - .) + 0
	.4byte	52442328
	.align	4
.L1731:
	.4byte	(.L1737 - .) + 0
	.4byte	51918112
	.align	4
.L1729:
	.4byte	(.L1738 - .) + 0
	.4byte	131602704
	.align	4
.L1734:
	.4byte	(.L1737 - .) + 0
	.4byte	54015272
	.align	4
.L1728:
	.4byte	(.L1739 - .) + 1
	.4byte	115364248
	.4byte	(.L1740 - .) + 0
	.4byte	138940552
	.align	4
.L1733:
	.4byte	(.L1742 - .) + 1
	.4byte	31467664
	.4byte	(.L1737 - .) + 0
	.4byte	53490952
	.align	4
.L1730:
	.4byte	(.L1739 - .) + 1
	.4byte	115364248
	.4byte	(.L1738 - .) + 0
	.4byte	127932568
	.align	4
.L1727:
	.4byte	(.L1739 - .) + 1
	.4byte	115364248
	.4byte	(.L1740 - .) + 0
	.4byte	142084216
.L1741:
	.ascii	"bytes.ml\0"
.L1735:
	.ascii	"sha256.ml\0"
	.align	4
.L1736:
	.4byte	(.L1735 - .) + 0
	.ascii	"Sha256.constants\0"
	.align	4
.L1740:
	.4byte	(.L1735 - .) + 0
	.ascii	"Sha256.finish\0"
	.align	4
.L1742:
	.4byte	(.L1741 - .) + 0
	.ascii	"Stdlib__Bytes.make\0"
	.align	4
.L1737:
	.4byte	(.L1735 - .) + 0
	.ascii	"Sha256.create\0"
	.align	4
.L1738:
	.4byte	(.L1735 - .) + 0
	.ascii	"Sha256.add_data\0"
	.align	4
.L1739:
	.4byte	(.L1735 - .) + 0
	.ascii	"Sha256.transform\0"
	.align	8
	.size camlSha256__frametable,. - camlSha256__frametable
	.data
	.section .note.GNU-stack,"",@progbits
