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
	.8byte	camlSha256__transform_from_25
	.8byte	0
	.data
	.align	8
	.8byte	18176
	.globl	camlSha256
camlSha256:
.LcamlSha256:
	.8byte	0x1ffffffff
	.8byte	camlSha256__rotr_15
	.8byte	camlSha256__ch_16
	.8byte	camlSha256__maj_17
	.8byte	camlSha256__big_sigma0_18
	.8byte	camlSha256__big_sigma1_19
	.8byte	camlSha256__small_sigma0_20
	.8byte	camlSha256__small_sigma1_21
	.8byte	1
	.8byte	camlSha256__create_22
	.8byte	camlSha256__get_be32_23
	.8byte	camlSha256__set_be32_24
	.8byte	camlSha256__transform_from_25
	.8byte	camlSha256__transform_26
	.8byte	camlSha256__init_27
	.8byte	camlSha256__add_data_28
	.8byte	camlSha256__finish_29
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__finish_29
camlSha256__finish_29:
.LcamlSha256__finish_29:
	.8byte	caml_curry2
	.8byte	0x280000000000007
	.8byte	camlSha256__finish_14_29_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__add_data_28
camlSha256__add_data_28:
.LcamlSha256__add_data_28:
	.8byte	caml_curry3
	.8byte	0x380000000000007
	.8byte	camlSha256__add_data_13_28_code
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__init_27
camlSha256__init_27:
.LcamlSha256__init_27:
	.8byte	camlSha256__init_12_27_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__transform_26
camlSha256__transform_26:
.LcamlSha256__transform_26:
	.8byte	camlSha256__transform_11_26_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	5111
	.globl	camlSha256__transform_from_25
camlSha256__transform_from_25:
.LcamlSha256__transform_from_25:
	.8byte	caml_curry3
	.8byte	0x380000000000007
	.8byte	camlSha256__transform_from_10_25_code
	.8byte	1
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__set_be32_24
camlSha256__set_be32_24:
.LcamlSha256__set_be32_24:
	.8byte	caml_curry3
	.8byte	0x380000000000007
	.8byte	camlSha256__set_be32_9_24_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__get_be32_23
camlSha256__get_be32_23:
.LcamlSha256__get_be32_23:
	.8byte	caml_curry2
	.8byte	0x280000000000007
	.8byte	camlSha256__get_be32_8_23_code
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__create_22
camlSha256__create_22:
.LcamlSha256__create_22:
	.8byte	camlSha256__create_7_22_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	66304
.LcamlSha256__Pmakearray1986:
	.8byte	0x85145f31
	.8byte	0xe26e8923
	.8byte	0x16b81f79f
	.8byte	0x1d36bb74b
	.8byte	1923974327
	.8byte	0xb3e223e3
	.8byte	0x1247f0549
	.8byte	0x15638bdab
	.8byte	0x1b00f5531
	.8byte	621196803
	.8byte	1214450557
	.8byte	0xaa18fb87
	.8byte	0xe57cbae9
	.8byte	0x101bd63fd
	.8byte	0x137b80d4f
	.8byte	0x18337e2e9
	.8byte	0x1c936d383
	.8byte	0x1df7c8f0d
	.8byte	528694157
	.8byte	1209615257
	.8byte	1540511967
	.8byte	0x94e90955
	.8byte	0xb96153b9
	.8byte	0xedf311b5
	.8byte	0x1307ca2a5
	.8byte	0x150638cdb
	.8byte	0x160064f91
	.8byte	0x17eb2ff8f
	.8byte	0x18dc017e7
	.8byte	0x1ab4f228f
	.8byte	227853987
	.8byte	676483791
	.8byte	1332614411
	.8byte	1547059825
	.8byte	0x9a58dbf9
	.8byte	0xa6701a27
	.8byte	0xca14e6a9
	.8byte	0xecd41577
	.8byte	0x10385925d
	.8byte	0x124e4590b
	.8byte	0x1457fd143
	.8byte	0x15034cc97
	.8byte	0x1849716e1
	.8byte	0x18ed8a347
	.8byte	0x1a325d033
	.8byte	0x1ad320c49
	.8byte	0x1e81c6b0b
	.8byte	550846689
	.8byte	860455469
	.8byte	1013897233
	.8byte	1318121113
	.8byte	1767995755
	.8byte	1916279143
	.8byte	0x9db15495
	.8byte	0xb739949f
	.8byte	0xd05cdfe7
	.8byte	0xe91f05dd
	.8byte	0xf14ac6df
	.8byte	0x10990f029
	.8byte	0x1198e0411
	.8byte	0x1217dfff5
	.8byte	0x148a0d9d7
	.8byte	0x17df347ef
	.8byte	0x18ce2f1e5
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__small_sigma1_21
camlSha256__small_sigma1_21:
.LcamlSha256__small_sigma1_21:
	.8byte	camlSha256__small_sigma1_6_21_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__small_sigma0_20
camlSha256__small_sigma0_20:
.LcamlSha256__small_sigma0_20:
	.8byte	camlSha256__small_sigma0_5_20_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__big_sigma1_19
camlSha256__big_sigma1_19:
.LcamlSha256__big_sigma1_19:
	.8byte	camlSha256__big_sigma1_4_19_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__big_sigma0_18
camlSha256__big_sigma0_18:
.LcamlSha256__big_sigma0_18:
	.8byte	camlSha256__big_sigma0_3_18_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__maj_17
camlSha256__maj_17:
.LcamlSha256__maj_17:
	.8byte	caml_curry3
	.8byte	0x380000000000007
	.8byte	camlSha256__maj_2_17_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__ch_16
camlSha256__ch_16:
.LcamlSha256__ch_16:
	.8byte	caml_curry3
	.8byte	0x380000000000007
	.8byte	camlSha256__ch_1_16_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__rotr_15
camlSha256__rotr_15:
.LcamlSha256__rotr_15:
	.8byte	caml_curry2
	.8byte	0x280000000000007
	.8byte	camlSha256__rotr_0_15_code
	.data
	.align	8
	.8byte	2816
	.globl	camlSha256__block115
camlSha256__block115:
.LcamlSha256__block115:
	.8byte	caml_exn_Invalid_argument
	.8byte	camlSha256__string113
	.data
	.align	8
	.8byte	4092
	.globl	camlSha256__string113
camlSha256__string113:
.LcamlSha256__string113:
	.ascii	"index out of bounds"
	.space	4
	.byte	4
	.text
	.align	16
	.globl	camlSha256__rotr_0_15_code
camlSha256__rotr_0_15_code:
.LcamlSha256__rotr_0_15_code:
	.cfi_startproc
	movabsq	$8589934591, %rsi
	movl	$66, %ecx
	subq	%rbx, %rcx
	sarq	$1, %rcx
	leaq	-1(%rax), %rdi
	salq	%cl, %rdi
	incq	%rdi
	andq	%rsi, %rdi
	movq	%rbx, %rcx
	sarq	$1, %rcx
	shrq	%cl, %rax
	orq	$1, %rax
	orq	%rdi, %rax
	ret
	.cfi_endproc
	.type camlSha256__rotr_0_15_code,@function
	.size camlSha256__rotr_0_15_code,. - camlSha256__rotr_0_15_code
	.text
	.align	16
	.globl	camlSha256__ch_1_16_code
camlSha256__ch_1_16_code:
.LcamlSha256__ch_1_16_code:
	.cfi_startproc
	movq	%rax, %rsi
	movq	%rdi, %rax
	xorq	%rax, %rbx
	orq	$1, %rbx
	andq	%rbx, %rsi
	xorq	%rsi, %rax
	orq	$1, %rax
	ret
	.cfi_endproc
	.type camlSha256__ch_1_16_code,@function
	.size camlSha256__ch_1_16_code,. - camlSha256__ch_1_16_code
	.text
	.align	16
	.globl	camlSha256__maj_2_17_code
camlSha256__maj_2_17_code:
.LcamlSha256__maj_2_17_code:
	.cfi_startproc
	movq	%rax, %rsi
	orq	%rbx, %rsi
	andq	%rsi, %rdi
	andq	%rbx, %rax
	orq	%rdi, %rax
	ret
	.cfi_endproc
	.type camlSha256__maj_2_17_code,@function
	.size camlSha256__maj_2_17_code,. - camlSha256__maj_2_17_code
	.text
	.align	16
	.globl	camlSha256__big_sigma0_3_18_code
camlSha256__big_sigma0_3_18_code:
.LcamlSha256__big_sigma0_3_18_code:
	.cfi_startproc
	movabsq	$8589934591, %rdi
	movq	%rax, %rbx
	salq	$10, %rbx
	addq	$-1023, %rbx
	andq	%rdi, %rbx
	movq	%rax, %rdi
	shrq	$22, %rdi
	orq	$1, %rdi
	orq	%rbx, %rdi
	movabsq	$8589934591, %rsi
	movq	%rax, %rbx
	salq	$19, %rbx
	addq	$-524287, %rbx
	andq	%rsi, %rbx
	movq	%rax, %rsi
	shrq	$13, %rsi
	orq	$1, %rsi
	orq	%rbx, %rsi
	movabsq	$8589934591, %rdx
	movq	%rax, %rbx
	salq	$30, %rbx
	addq	$-1073741823, %rbx
	andq	%rdx, %rbx
	shrq	$2, %rax
	orq	$1, %rax
	orq	%rbx, %rax
	xorq	%rsi, %rax
	xorq	%rdi, %rax
	orq	$1, %rax
	ret
	.cfi_endproc
	.type camlSha256__big_sigma0_3_18_code,@function
	.size camlSha256__big_sigma0_3_18_code,. - camlSha256__big_sigma0_3_18_code
	.text
	.align	16
	.globl	camlSha256__big_sigma1_4_19_code
camlSha256__big_sigma1_4_19_code:
.LcamlSha256__big_sigma1_4_19_code:
	.cfi_startproc
	movabsq	$8589934591, %rdi
	movq	%rax, %rbx
	salq	$7, %rbx
	addq	$-127, %rbx
	andq	%rdi, %rbx
	movq	%rax, %rdi
	shrq	$25, %rdi
	orq	$1, %rdi
	orq	%rbx, %rdi
	movabsq	$8589934591, %rsi
	movq	%rax, %rbx
	salq	$21, %rbx
	addq	$-2097151, %rbx
	andq	%rsi, %rbx
	movq	%rax, %rsi
	shrq	$11, %rsi
	orq	$1, %rsi
	orq	%rbx, %rsi
	movabsq	$8589934591, %rdx
	movq	%rax, %rbx
	salq	$26, %rbx
	addq	$-67108863, %rbx
	andq	%rdx, %rbx
	shrq	$6, %rax
	orq	$1, %rax
	orq	%rbx, %rax
	xorq	%rsi, %rax
	xorq	%rdi, %rax
	orq	$1, %rax
	ret
	.cfi_endproc
	.type camlSha256__big_sigma1_4_19_code,@function
	.size camlSha256__big_sigma1_4_19_code,. - camlSha256__big_sigma1_4_19_code
	.text
	.align	16
	.globl	camlSha256__small_sigma0_5_20_code
camlSha256__small_sigma0_5_20_code:
.LcamlSha256__small_sigma0_5_20_code:
	.cfi_startproc
	movq	%rax, %rbx
	shrq	$3, %rbx
	movabsq	$8589934591, %rsi
	movq	%rax, %rdi
	salq	$14, %rdi
	addq	$-16383, %rdi
	andq	%rsi, %rdi
	movq	%rax, %rsi
	shrq	$18, %rsi
	orq	$1, %rsi
	orq	%rdi, %rsi
	movabsq	$8589934591, %rdx
	movq	%rax, %rdi
	salq	$25, %rdi
	addq	$-33554431, %rdi
	andq	%rdx, %rdi
	shrq	$7, %rax
	orq	$1, %rax
	orq	%rdi, %rax
	xorq	%rsi, %rax
	xorq	%rbx, %rax
	orq	$1, %rax
	ret
	.cfi_endproc
	.type camlSha256__small_sigma0_5_20_code,@function
	.size camlSha256__small_sigma0_5_20_code,. - camlSha256__small_sigma0_5_20_code
	.text
	.align	16
	.globl	camlSha256__small_sigma1_6_21_code
camlSha256__small_sigma1_6_21_code:
.LcamlSha256__small_sigma1_6_21_code:
	.cfi_startproc
	movq	%rax, %rbx
	shrq	$10, %rbx
	movabsq	$8589934591, %rsi
	movq	%rax, %rdi
	salq	$13, %rdi
	addq	$-8191, %rdi
	andq	%rsi, %rdi
	movq	%rax, %rsi
	shrq	$19, %rsi
	orq	$1, %rsi
	orq	%rdi, %rsi
	movabsq	$8589934591, %rdx
	movq	%rax, %rdi
	salq	$15, %rdi
	addq	$-32767, %rdi
	andq	%rdx, %rdi
	shrq	$17, %rax
	orq	$1, %rax
	orq	%rdi, %rax
	xorq	%rsi, %rax
	xorq	%rbx, %rax
	orq	$1, %rax
	ret
	.cfi_endproc
	.type camlSha256__small_sigma1_6_21_code,@function
	.size camlSha256__small_sigma1_6_21_code,. - camlSha256__small_sigma1_6_21_code
	.text
	.align	16
	.globl	camlSha256__create_7_22_code
camlSha256__create_7_22_code:
.LcamlSha256__create_7_22_code:
	.cfi_startproc
	.cfi_def_cfa_offset 8
	subq	$24, %rsp
	.cfi_adjust_cfa_offset 24
	movl	$1, %esi
	movl	$161, %edi
	movq	caml_array_make@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L227:
	movq	%rax, (%rsp)
	movl	$129, %edi
	movq	caml_create_bytes@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L228:
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
.L229:
	movq	%rax, 16(%rsp)
	movl	$1, %esi
	movl	$17, %edi
	movq	caml_array_make@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L230:
	movq	%rax, %rbx
	subq	$48, %r15
	cmpq	(%r14), %r15
	jb	.L231
.L233:
	leaq	8(%r15), %rax
	movq	$5120, -8(%rax)
	movq	%rbx, (%rax)
	movq	16(%rsp), %rbx
	movq	%rbx, 8(%rax)
	movq	$1, 16(%rax)
	movq	8(%rsp), %rbx
	movq	%rbx, 24(%rax)
	movq	(%rsp), %rbx
	movq	%rbx, 32(%rax)
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
.L231:
	call	.Lcaml_call_gc_
.L232:
	jmp	.L233
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlSha256__create_7_22_code,@function
	.size camlSha256__create_7_22_code,. - camlSha256__create_7_22_code
	.text
	.align	16
	.globl	camlSha256__get_be32_8_23_code
camlSha256__get_be32_8_23_code:
.LcamlSha256__get_be32_8_23_code:
	.cfi_startproc
	movq	-8(%rax), %rdi
	salq	$8, %rdi
	shrq	$18, %rdi
	leaq	-1(,%rdi,8), %rdi
	movzbq	(%rax,%rdi), %rsi
	subq	%rsi, %rdi
	leaq	6(%rbx), %rsi
	sarq	$1, %rsi
	cmpq	%rdi, %rsi
	jae	.L305
	movzbq	(%rax,%rsi), %rsi
	leaq	1(%rsi,%rsi), %rsi
	leaq	4(%rbx), %rdx
	sarq	$1, %rdx
	cmpq	%rdi, %rdx
	jae	.L299
	movzbq	(%rax,%rdx), %rdx
	salq	$9, %rdx
	incq	%rdx
	leaq	2(%rbx), %rcx
	sarq	$1, %rcx
	cmpq	%rdi, %rcx
	jae	.L293
	movzbq	(%rax,%rcx), %rcx
	salq	$17, %rcx
	incq	%rcx
	sarq	$1, %rbx
	cmpq	%rdi, %rbx
	jae	.L287
	movzbq	(%rax,%rbx), %rax
	salq	$25, %rax
	incq	%rax
	orq	%rcx, %rax
	orq	%rdx, %rax
	orq	%rsi, %rax
	ret
	.align	4
.L287:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L293:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L299:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L305:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.cfi_endproc
	.type camlSha256__get_be32_8_23_code,@function
	.size camlSha256__get_be32_8_23_code,. - camlSha256__get_be32_8_23_code
	.text
	.align	16
	.globl	camlSha256__set_be32_9_24_code
camlSha256__set_be32_9_24_code:
.LcamlSha256__set_be32_9_24_code:
	.cfi_startproc
	movq	%rdi, %rsi
	shrq	$24, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L316
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L316:
	cmpq	$511, %rsi
	jle	.L323
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L323:
	movq	-8(%rax), %rdx
	salq	$8, %rdx
	shrq	$18, %rdx
	leaq	-1(,%rdx,8), %rdx
	movzbq	(%rax,%rdx), %rcx
	subq	%rcx, %rdx
	movq	%rbx, %rcx
	sarq	$1, %rcx
	cmpq	%rdx, %rcx
	jae	.L421
	sarq	$1, %rsi
	movb	%sil, (%rax,%rcx)
	movq	%rdi, %rsi
	shrq	$16, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L341
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L341:
	cmpq	$511, %rsi
	jle	.L348
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L348:
	leaq	2(%rbx), %rcx
	sarq	$1, %rcx
	cmpq	%rdx, %rcx
	jae	.L413
	sarq	$1, %rsi
	movb	%sil, (%rax,%rcx)
	movq	%rdi, %rsi
	shrq	$8, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L361
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L361:
	cmpq	$511, %rsi
	jle	.L368
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L368:
	leaq	4(%rbx), %rcx
	sarq	$1, %rcx
	cmpq	%rdx, %rcx
	jae	.L405
	sarq	$1, %rsi
	movb	%sil, (%rax,%rcx)
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L379
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L379:
	cmpq	$511, %rdi
	jle	.L386
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L386:
	addq	$6, %rbx
	sarq	$1, %rbx
	cmpq	%rdx, %rbx
	jae	.L397
	sarq	$1, %rdi
	movb	%dil, (%rax,%rbx)
	movl	$1, %eax
	ret
	.align	4
.L397:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L405:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L413:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L421:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.cfi_endproc
	.type camlSha256__set_be32_9_24_code,@function
	.size camlSha256__set_be32_9_24_code,. - camlSha256__set_be32_9_24_code
	.text
	.align	16
	.globl	camlSha256__transform_from_10_25_code
camlSha256__transform_from_10_25_code:
.LcamlSha256__transform_from_10_25_code:
	.cfi_startproc
	.cfi_def_cfa_offset 8
	subq	$56, %rsp
	.cfi_adjust_cfa_offset 56
	movq	32(%rax), %rsi
	movq	%rsi, (%rsp)
	xorl	%esi, %esi
.L436:
	leaq	1(%rsi,%rsi), %rdx
	leaq	-4(%rdi,%rdx,4), %rcx
	movq	-8(%rbx), %r8
	salq	$8, %r8
	shrq	$18, %r8
	leaq	-1(,%r8,8), %r8
	movzbq	(%rbx,%r8), %r9
	subq	%r9, %r8
	leaq	6(%rcx), %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L515
	movzbq	(%rbx,%r9), %r9
	leaq	1(%r9,%r9), %r9
	leaq	4(%rcx), %r12
	sarq	$1, %r12
	cmpq	%r8, %r12
	jae	.L509
	movzbq	(%rbx,%r12), %r12
	salq	$9, %r12
	incq	%r12
	leaq	2(%rcx), %r13
	sarq	$1, %r13
	cmpq	%r8, %r13
	jae	.L503
	movzbq	(%rbx,%r13), %r13
	salq	$17, %r13
	incq	%r13
	sarq	$1, %rcx
	cmpq	%r8, %rcx
	jae	.L497
	movzbq	(%rbx,%rcx), %rcx
	salq	$25, %rcx
	incq	%rcx
	orq	%r13, %rcx
	orq	%r12, %rcx
	orq	%r9, %rcx
	movq	(%rsp), %r8
	movq	%rcx, -4(%r8,%rdx,4)
	incq	%rsi
	cmpq	$15, %rsi
	jg	.L525
	jmp	.L436
	.align	4
.L497:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L503:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L509:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L515:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L525:
	movl	$16, %ebx
.L527:
	leaq	1(%rbx,%rbx), %rdi
	movq	(%rsp), %rsi
	movq	-124(%rsi,%rdi,4), %rsi
	movq	(%rsp), %rdx
	movq	-20(%rdx,%rdi,4), %rdx
	movabsq	$8589934591, %r12
	movq	(%rsp), %rcx
	movq	-132(%rcx,%rdi,4), %r13
	movq	%rsi, %rcx
	shrq	$3, %rcx
	movabsq	$8589934591, %r9
	movq	%rsi, %r8
	salq	$14, %r8
	addq	$-16383, %r8
	andq	%r9, %r8
	movq	%rsi, %r9
	shrq	$18, %r9
	orq	$1, %r9
	orq	%r8, %r9
	movabsq	$8589934591, %r10
	movq	%rsi, %r8
	salq	$25, %r8
	addq	$-33554431, %r8
	andq	%r10, %r8
	shrq	$7, %rsi
	orq	$1, %rsi
	orq	%r8, %rsi
	xorq	%r9, %rsi
	xorq	%rcx, %rsi
	orq	$1, %rsi
	movq	(%rsp), %rcx
	movq	-60(%rcx,%rdi,4), %r10
	movq	%rdx, %rcx
	shrq	$10, %rcx
	movabsq	$8589934591, %r9
	movq	%rdx, %r8
	salq	$13, %r8
	addq	$-8191, %r8
	andq	%r9, %r8
	movq	%rdx, %r9
	shrq	$19, %r9
	orq	$1, %r9
	orq	%r8, %r9
	movabsq	$8589934591, %r11
	movq	%rdx, %r8
	salq	$15, %r8
	addq	$-32767, %r8
	andq	%r11, %r8
	shrq	$17, %rdx
	orq	$1, %rdx
	orq	%r8, %rdx
	xorq	%r9, %rdx
	xorq	%rcx, %rdx
	orq	$1, %rdx
	addq	%r10, %rdx
	addq	%rdx, %rsi
	leaq	-3(%rsi,%r13), %rsi
	andq	%r12, %rsi
	movq	(%rsp), %rdx
	movq	%rsi, -4(%rdx,%rdi,4)
	incq	%rbx
	cmpq	$79, %rbx
	jle	.L527
	movq	(%rax), %rax
	movq	%rax, 8(%rsp)
	movq	(%rax), %rax
	movq	%rax, 16(%rsp)
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 24(%rsp)
	movq	8(%rsp), %rax
	movq	16(%rax), %rax
	movq	%rax, 32(%rsp)
	movq	8(%rsp), %rax
	movq	32(%rax), %rax
	movq	8(%rsp), %rbx
	movq	40(%rbx), %rbx
	movq	8(%rsp), %rdi
	movq	48(%rdi), %rdi
	movabsq	$8589934591, %rcx
	movq	(%rsp), %rsi
	movq	(%rsi), %r8
	movq	camlSha256__transform_from_25@GOTPCREL(%rip), %rsi
	movq	24(%rsi), %r12
	movq	(%r12), %r9
	movq	%rbx, %rsi
	xorq	%rdi, %rsi
	orq	$1, %rsi
	movq	%rax, %rdx
	andq	%rsi, %rdx
	movq	%rdi, %rsi
	xorq	%rdx, %rsi
	orq	$1, %rsi
	movabsq	$8589934591, %r13
	movq	%rax, %rdx
	salq	$7, %rdx
	addq	$-127, %rdx
	andq	%r13, %rdx
	movq	%rax, %r13
	shrq	$25, %r13
	orq	$1, %r13
	orq	%rdx, %r13
	movabsq	$8589934591, %r10
	movq	%rax, %rdx
	salq	$21, %rdx
	addq	$-2097151, %rdx
	andq	%r10, %rdx
	movq	%rax, %r10
	shrq	$11, %r10
	orq	$1, %r10
	orq	%rdx, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %rdx
	salq	$26, %rdx
	addq	$-67108863, %rdx
	andq	%r11, %rdx
	movq	%rax, %r11
	shrq	$6, %r11
	orq	$1, %r11
	orq	%rdx, %r11
	xorq	%r10, %r11
	xorq	%r13, %r11
	orq	$1, %r11
	movq	8(%rsp), %rdx
	movq	56(%rdx), %rdx
	addq	%r11, %rdx
	addq	%rdx, %rsi
	addq	%r9, %rsi
	leaq	-4(%rsi,%r8), %rsi
	andq	%rcx, %rsi
	movabsq	$8589934591, %rcx
	movq	8(%rsp), %rdx
	movq	24(%rdx), %rdx
	leaq	-1(%rdx,%rsi), %rdx
	andq	%rcx, %rdx
	movabsq	$8589934591, %r9
	movabsq	$8589934591, %r13
	movq	16(%rsp), %rcx
	orq	24(%rsp), %rcx
	movq	32(%rsp), %r8
	andq	%rcx, %r8
	movq	16(%rsp), %rcx
	andq	24(%rsp), %rcx
	orq	%r8, %rcx
	movabsq	$8589934591, %r10
	movq	16(%rsp), %r8
	salq	$10, %r8
	addq	$-1023, %r8
	andq	%r10, %r8
	movq	16(%rsp), %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r8, %r10
	movabsq	$8589934591, %r11
	movq	16(%rsp), %r8
	salq	$19, %r8
	addq	$-524287, %r8
	andq	%r11, %r8
	movq	16(%rsp), %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %r8
	movq	16(%rsp), %rbp
	salq	$30, %rbp
	addq	$-1073741823, %rbp
	andq	%r8, %rbp
	movq	16(%rsp), %r8
	shrq	$2, %r8
	orq	$1, %r8
	orq	%rbp, %r8
	xorq	%r11, %r8
	xorq	%r10, %r8
	orq	$1, %r8
	leaq	-1(%r8,%rcx), %rcx
	andq	%r13, %rcx
	leaq	-1(%rsi,%rcx), %rsi
	andq	%r9, %rsi
	movabsq	$8589934591, %r9
	movq	(%rsp), %rcx
	movq	8(%rcx), %r13
	movq	%r12, 40(%rsp)
	movq	40(%rsp), %rcx
	movq	8(%rcx), %r12
	movq	%rax, %rcx
	xorq	%rbx, %rcx
	orq	$1, %rcx
	movq	%rdx, %r8
	andq	%rcx, %r8
	movq	%rbx, %rcx
	xorq	%r8, %rcx
	orq	$1, %rcx
	movabsq	$8589934591, %r10
	movq	%rdx, %r8
	salq	$7, %r8
	addq	$-127, %r8
	andq	%r10, %r8
	movq	%rdx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r8, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r8
	salq	$21, %r8
	addq	$-2097151, %r8
	andq	%r11, %r8
	movq	%rdx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r8
	salq	$26, %r8
	addq	$-67108863, %r8
	andq	%rbp, %r8
	movq	%rdx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r8, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rdi
	addq	%rcx, %rdi
	addq	%r12, %rdi
	leaq	-4(%rdi,%r13), %rdi
	andq	%r9, %rdi
	movabsq	$8589934591, %r8
	movq	32(%rsp), %rcx
	leaq	-1(%rcx,%rdi), %rcx
	andq	%r8, %rcx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rsi, %r8
	orq	16(%rsp), %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	andq	16(%rsp), %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdi,%r8), %rdi
	andq	%r12, %rdi
	movabsq	$8589934591, %r8
	movq	%r8, 32(%rsp)
	movq	(%rsp), %r8
	movq	16(%r8), %r12
	movq	40(%rsp), %r8
	movq	16(%r8), %r13
	movq	%rdx, %r8
	xorq	%rax, %r8
	orq	$1, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rbx
	addq	%r8, %rbx
	addq	%r13, %rbx
	leaq	-4(%rbx,%r12), %rbx
	andq	32(%rsp), %rbx
	movabsq	$8589934591, %r9
	movq	24(%rsp), %r8
	leaq	-1(%r8,%rbx), %r8
	andq	%r9, %r8
	movq	%r8, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdi, %r8
	orq	%rsi, %r8
	movq	16(%rsp), %r9
	andq	%r8, %r9
	movq	%rdi, %r8
	andq	%rsi, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rbx,%r8), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 32(%rsp)
	movq	(%rsp), %r8
	movq	24(%r8), %r12
	movq	40(%rsp), %r8
	movq	24(%r8), %r13
	movq	%rcx, %r8
	xorq	%rdx, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rax
	addq	%r8, %rax
	addq	%r13, %rax
	leaq	-4(%rax,%r12), %rax
	andq	32(%rsp), %rax
	movabsq	$8589934591, %r9
	movq	16(%rsp), %r8
	leaq	-1(%r8,%rax), %r8
	andq	%r9, %r8
	movq	%r8, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %r8
	orq	%rdi, %r8
	movq	%rsi, %r9
	andq	%r8, %r9
	movq	%rbx, %r8
	andq	%rdi, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rax,%r8), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	32(%r8), %r12
	movq	40(%rsp), %r8
	movq	32(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rcx, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rcx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rdx
	addq	%r8, %rdx
	addq	%r13, %rdx
	leaq	-4(%rdx,%r12), %rdx
	andq	48(%rsp), %rdx
	movabsq	$8589934591, %r8
	leaq	-1(%rsi,%rdx), %rsi
	andq	%r8, %rsi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdx,%r8), %rdx
	andq	%r12, %rdx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	40(%r8), %r12
	movq	40(%rsp), %r8
	movq	40(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rsi, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rcx
	addq	%r8, %rcx
	addq	%r13, %rcx
	leaq	-4(%rcx,%r12), %rcx
	andq	48(%rsp), %rcx
	movabsq	$8589934591, %r8
	leaq	-1(%rdi,%rcx), %rdi
	andq	%r8, %rdi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdx, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rcx,%r8), %rcx
	andq	%r12, %rcx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	48(%r8), %r12
	movq	40(%rsp), %r8
	movq	48(%r8), %r13
	movq	%rsi, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rcx, %rbx
	orq	%rdx, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rcx, %rbx
	andq	%rdx, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	56(%r8), %r12
	movq	40(%rsp), %r8
	movq	56(%r8), %r13
	movq	%rdi, %r8
	xorq	%rsi, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rcx, %rax
	movq	%rdx, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rcx, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	64(%r8), %r12
	movq	40(%rsp), %r8
	movq	64(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rdi, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rdi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rsi
	addq	%r8, %rsi
	addq	%r13, %rsi
	leaq	-4(%rsi,%r12), %rsi
	andq	48(%rsp), %rsi
	movabsq	$8589934591, %r8
	leaq	-1(%rdx,%rsi), %rdx
	andq	%r8, %rdx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rsi,%r8), %rsi
	andq	%r12, %rsi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	72(%r8), %r12
	movq	40(%rsp), %r8
	movq	72(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rdx, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rdi
	addq	%r8, %rdi
	addq	%r13, %rdi
	leaq	-4(%rdi,%r12), %rdi
	andq	48(%rsp), %rdi
	movabsq	$8589934591, %r8
	leaq	-1(%rcx,%rdi), %rcx
	andq	%r8, %rcx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rsi, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdi,%r8), %rdi
	andq	%r12, %rdi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	80(%r8), %r12
	movq	40(%rsp), %r8
	movq	80(%r8), %r13
	movq	%rdx, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdi, %rbx
	orq	%rsi, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rdi, %rbx
	andq	%rsi, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	88(%r8), %r12
	movq	40(%rsp), %r8
	movq	88(%r8), %r13
	movq	%rcx, %r8
	xorq	%rdx, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rdi, %rax
	movq	%rsi, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rdi, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	96(%r8), %r12
	movq	40(%rsp), %r8
	movq	96(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rcx, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rcx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rdx
	addq	%r8, %rdx
	addq	%r13, %rdx
	leaq	-4(%rdx,%r12), %rdx
	andq	48(%rsp), %rdx
	movabsq	$8589934591, %r8
	leaq	-1(%rsi,%rdx), %rsi
	andq	%r8, %rsi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdx,%r8), %rdx
	andq	%r12, %rdx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	104(%r8), %r12
	movq	40(%rsp), %r8
	movq	104(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rsi, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rcx
	addq	%r8, %rcx
	addq	%r13, %rcx
	leaq	-4(%rcx,%r12), %rcx
	andq	48(%rsp), %rcx
	movabsq	$8589934591, %r8
	leaq	-1(%rdi,%rcx), %rdi
	andq	%r8, %rdi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdx, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rcx,%r8), %rcx
	andq	%r12, %rcx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	112(%r8), %r12
	movq	40(%rsp), %r8
	movq	112(%r8), %r13
	movq	%rsi, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rcx, %rbx
	orq	%rdx, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rcx, %rbx
	andq	%rdx, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	120(%r8), %r12
	movq	40(%rsp), %r8
	movq	120(%r8), %r13
	movq	%rdi, %r8
	xorq	%rsi, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rcx, %rax
	movq	%rdx, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rcx, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	128(%r8), %r12
	movq	40(%rsp), %r8
	movq	128(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rdi, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rdi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rsi
	addq	%r8, %rsi
	addq	%r13, %rsi
	leaq	-4(%rsi,%r12), %rsi
	andq	48(%rsp), %rsi
	movabsq	$8589934591, %r8
	leaq	-1(%rdx,%rsi), %rdx
	andq	%r8, %rdx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rsi,%r8), %rsi
	andq	%r12, %rsi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	136(%r8), %r12
	movq	40(%rsp), %r8
	movq	136(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rdx, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rdi
	addq	%r8, %rdi
	addq	%r13, %rdi
	leaq	-4(%rdi,%r12), %rdi
	andq	48(%rsp), %rdi
	movabsq	$8589934591, %r8
	leaq	-1(%rcx,%rdi), %rcx
	andq	%r8, %rcx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rsi, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdi,%r8), %rdi
	andq	%r12, %rdi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	144(%r8), %r12
	movq	40(%rsp), %r8
	movq	144(%r8), %r13
	movq	%rdx, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdi, %rbx
	orq	%rsi, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rdi, %rbx
	andq	%rsi, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	152(%r8), %r12
	movq	40(%rsp), %r8
	movq	152(%r8), %r13
	movq	%rcx, %r8
	xorq	%rdx, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rdi, %rax
	movq	%rsi, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rdi, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	160(%r8), %r12
	movq	40(%rsp), %r8
	movq	160(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rcx, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rcx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rdx
	addq	%r8, %rdx
	addq	%r13, %rdx
	leaq	-4(%rdx,%r12), %rdx
	andq	48(%rsp), %rdx
	movabsq	$8589934591, %r8
	leaq	-1(%rsi,%rdx), %rsi
	andq	%r8, %rsi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdx,%r8), %rdx
	andq	%r12, %rdx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	168(%r8), %r12
	movq	40(%rsp), %r8
	movq	168(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rsi, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rcx
	addq	%r8, %rcx
	addq	%r13, %rcx
	leaq	-4(%rcx,%r12), %rcx
	andq	48(%rsp), %rcx
	movabsq	$8589934591, %r8
	leaq	-1(%rdi,%rcx), %rdi
	andq	%r8, %rdi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdx, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rcx,%r8), %rcx
	andq	%r12, %rcx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	176(%r8), %r12
	movq	40(%rsp), %r8
	movq	176(%r8), %r13
	movq	%rsi, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rcx, %rbx
	orq	%rdx, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rcx, %rbx
	andq	%rdx, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	184(%r8), %r12
	movq	40(%rsp), %r8
	movq	184(%r8), %r13
	movq	%rdi, %r8
	xorq	%rsi, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rcx, %rax
	movq	%rdx, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rcx, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	192(%r8), %r12
	movq	40(%rsp), %r8
	movq	192(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rdi, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rdi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rsi
	addq	%r8, %rsi
	addq	%r13, %rsi
	leaq	-4(%rsi,%r12), %rsi
	andq	48(%rsp), %rsi
	movabsq	$8589934591, %r8
	leaq	-1(%rdx,%rsi), %rdx
	andq	%r8, %rdx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rsi,%r8), %rsi
	andq	%r12, %rsi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	200(%r8), %r12
	movq	40(%rsp), %r8
	movq	200(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rdx, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rdi
	addq	%r8, %rdi
	addq	%r13, %rdi
	leaq	-4(%rdi,%r12), %rdi
	andq	48(%rsp), %rdi
	movabsq	$8589934591, %r8
	leaq	-1(%rcx,%rdi), %rcx
	andq	%r8, %rcx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rsi, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdi,%r8), %rdi
	andq	%r12, %rdi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	208(%r8), %r12
	movq	40(%rsp), %r8
	movq	208(%r8), %r13
	movq	%rdx, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdi, %rbx
	orq	%rsi, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rdi, %rbx
	andq	%rsi, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	216(%r8), %r12
	movq	40(%rsp), %r8
	movq	216(%r8), %r13
	movq	%rcx, %r8
	xorq	%rdx, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rdi, %rax
	movq	%rsi, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rdi, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	224(%r8), %r12
	movq	40(%rsp), %r8
	movq	224(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rcx, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rcx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rdx
	addq	%r8, %rdx
	addq	%r13, %rdx
	leaq	-4(%rdx,%r12), %rdx
	andq	48(%rsp), %rdx
	movabsq	$8589934591, %r8
	leaq	-1(%rsi,%rdx), %rsi
	andq	%r8, %rsi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdx,%r8), %rdx
	andq	%r12, %rdx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	232(%r8), %r12
	movq	40(%rsp), %r8
	movq	232(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rsi, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rcx
	addq	%r8, %rcx
	addq	%r13, %rcx
	leaq	-4(%rcx,%r12), %rcx
	andq	48(%rsp), %rcx
	movabsq	$8589934591, %r8
	leaq	-1(%rdi,%rcx), %rdi
	andq	%r8, %rdi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdx, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rcx,%r8), %rcx
	andq	%r12, %rcx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	240(%r8), %r12
	movq	40(%rsp), %r8
	movq	240(%r8), %r13
	movq	%rsi, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rcx, %rbx
	orq	%rdx, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rcx, %rbx
	andq	%rdx, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	248(%r8), %r12
	movq	40(%rsp), %r8
	movq	248(%r8), %r13
	movq	%rdi, %r8
	xorq	%rsi, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rcx, %rax
	movq	%rdx, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rcx, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	256(%r8), %r12
	movq	40(%rsp), %r8
	movq	256(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rdi, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rdi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rsi
	addq	%r8, %rsi
	addq	%r13, %rsi
	leaq	-4(%rsi,%r12), %rsi
	andq	48(%rsp), %rsi
	movabsq	$8589934591, %r8
	leaq	-1(%rdx,%rsi), %rdx
	andq	%r8, %rdx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rsi,%r8), %rsi
	andq	%r12, %rsi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	264(%r8), %r12
	movq	40(%rsp), %r8
	movq	264(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rdx, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rdi
	addq	%r8, %rdi
	addq	%r13, %rdi
	leaq	-4(%rdi,%r12), %rdi
	andq	48(%rsp), %rdi
	movabsq	$8589934591, %r8
	leaq	-1(%rcx,%rdi), %rcx
	andq	%r8, %rcx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rsi, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdi,%r8), %rdi
	andq	%r12, %rdi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	272(%r8), %r12
	movq	40(%rsp), %r8
	movq	272(%r8), %r13
	movq	%rdx, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdi, %rbx
	orq	%rsi, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rdi, %rbx
	andq	%rsi, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	280(%r8), %r12
	movq	40(%rsp), %r8
	movq	280(%r8), %r13
	movq	%rcx, %r8
	xorq	%rdx, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rdi, %rax
	movq	%rsi, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rdi, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	288(%r8), %r12
	movq	40(%rsp), %r8
	movq	288(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rcx, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rcx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rdx
	addq	%r8, %rdx
	addq	%r13, %rdx
	leaq	-4(%rdx,%r12), %rdx
	andq	48(%rsp), %rdx
	movabsq	$8589934591, %r8
	leaq	-1(%rsi,%rdx), %rsi
	andq	%r8, %rsi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdx,%r8), %rdx
	andq	%r12, %rdx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	296(%r8), %r12
	movq	40(%rsp), %r8
	movq	296(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rsi, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rcx
	addq	%r8, %rcx
	addq	%r13, %rcx
	leaq	-4(%rcx,%r12), %rcx
	andq	48(%rsp), %rcx
	movabsq	$8589934591, %r8
	leaq	-1(%rdi,%rcx), %rdi
	andq	%r8, %rdi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdx, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rcx,%r8), %rcx
	andq	%r12, %rcx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	304(%r8), %r12
	movq	40(%rsp), %r8
	movq	304(%r8), %r13
	movq	%rsi, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rcx, %rbx
	orq	%rdx, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rcx, %rbx
	andq	%rdx, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	312(%r8), %r12
	movq	40(%rsp), %r8
	movq	312(%r8), %r13
	movq	%rdi, %r8
	xorq	%rsi, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rcx, %rax
	movq	%rdx, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rcx, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	320(%r8), %r12
	movq	40(%rsp), %r8
	movq	320(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rdi, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rdi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rsi
	addq	%r8, %rsi
	addq	%r13, %rsi
	leaq	-4(%rsi,%r12), %rsi
	andq	48(%rsp), %rsi
	movabsq	$8589934591, %r8
	leaq	-1(%rdx,%rsi), %rdx
	andq	%r8, %rdx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rsi,%r8), %rsi
	andq	%r12, %rsi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	328(%r8), %r12
	movq	40(%rsp), %r8
	movq	328(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rdx, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rdi
	addq	%r8, %rdi
	addq	%r13, %rdi
	leaq	-4(%rdi,%r12), %rdi
	andq	48(%rsp), %rdi
	movabsq	$8589934591, %r8
	leaq	-1(%rcx,%rdi), %rcx
	andq	%r8, %rcx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rsi, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdi,%r8), %rdi
	andq	%r12, %rdi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	336(%r8), %r12
	movq	40(%rsp), %r8
	movq	336(%r8), %r13
	movq	%rdx, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdi, %rbx
	orq	%rsi, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rdi, %rbx
	andq	%rsi, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	344(%r8), %r12
	movq	40(%rsp), %r8
	movq	344(%r8), %r13
	movq	%rcx, %r8
	xorq	%rdx, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rdi, %rax
	movq	%rsi, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rdi, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	352(%r8), %r12
	movq	40(%rsp), %r8
	movq	352(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rcx, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rcx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rdx
	addq	%r8, %rdx
	addq	%r13, %rdx
	leaq	-4(%rdx,%r12), %rdx
	andq	48(%rsp), %rdx
	movabsq	$8589934591, %r8
	leaq	-1(%rsi,%rdx), %rsi
	andq	%r8, %rsi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdx,%r8), %rdx
	andq	%r12, %rdx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	360(%r8), %r12
	movq	40(%rsp), %r8
	movq	360(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rsi, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rcx
	addq	%r8, %rcx
	addq	%r13, %rcx
	leaq	-4(%rcx,%r12), %rcx
	andq	48(%rsp), %rcx
	movabsq	$8589934591, %r8
	leaq	-1(%rdi,%rcx), %rdi
	andq	%r8, %rdi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdx, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rcx,%r8), %rcx
	andq	%r12, %rcx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	368(%r8), %r12
	movq	40(%rsp), %r8
	movq	368(%r8), %r13
	movq	%rsi, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rcx, %rbx
	orq	%rdx, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rcx, %rbx
	andq	%rdx, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	376(%r8), %r12
	movq	40(%rsp), %r8
	movq	376(%r8), %r13
	movq	%rdi, %r8
	xorq	%rsi, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rcx, %rax
	movq	%rdx, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rcx, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	384(%r8), %r12
	movq	40(%rsp), %r8
	movq	384(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rdi, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rdi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rsi
	addq	%r8, %rsi
	addq	%r13, %rsi
	leaq	-4(%rsi,%r12), %rsi
	andq	48(%rsp), %rsi
	movabsq	$8589934591, %r8
	leaq	-1(%rdx,%rsi), %rdx
	andq	%r8, %rdx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rsi,%r8), %rsi
	andq	%r12, %rsi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	392(%r8), %r12
	movq	40(%rsp), %r8
	movq	392(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rdx, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rdi
	addq	%r8, %rdi
	addq	%r13, %rdi
	leaq	-4(%rdi,%r12), %rdi
	andq	48(%rsp), %rdi
	movabsq	$8589934591, %r8
	leaq	-1(%rcx,%rdi), %rcx
	andq	%r8, %rcx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rsi, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdi,%r8), %rdi
	andq	%r12, %rdi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	400(%r8), %r12
	movq	40(%rsp), %r8
	movq	400(%r8), %r13
	movq	%rdx, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdi, %rbx
	orq	%rsi, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rdi, %rbx
	andq	%rsi, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	408(%r8), %r12
	movq	40(%rsp), %r8
	movq	408(%r8), %r13
	movq	%rcx, %r8
	xorq	%rdx, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rdi, %rax
	movq	%rsi, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rdi, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	416(%r8), %r12
	movq	40(%rsp), %r8
	movq	416(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rcx, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rcx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rdx
	addq	%r8, %rdx
	addq	%r13, %rdx
	leaq	-4(%rdx,%r12), %rdx
	andq	48(%rsp), %rdx
	movabsq	$8589934591, %r8
	leaq	-1(%rsi,%rdx), %rsi
	andq	%r8, %rsi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdx,%r8), %rdx
	andq	%r12, %rdx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	424(%r8), %r12
	movq	40(%rsp), %r8
	movq	424(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rsi, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rcx
	addq	%r8, %rcx
	addq	%r13, %rcx
	leaq	-4(%rcx,%r12), %rcx
	andq	48(%rsp), %rcx
	movabsq	$8589934591, %r8
	leaq	-1(%rdi,%rcx), %rdi
	andq	%r8, %rdi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdx, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rcx,%r8), %rcx
	andq	%r12, %rcx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	432(%r8), %r12
	movq	40(%rsp), %r8
	movq	432(%r8), %r13
	movq	%rsi, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rcx, %rbx
	orq	%rdx, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rcx, %rbx
	andq	%rdx, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	440(%r8), %r12
	movq	40(%rsp), %r8
	movq	440(%r8), %r13
	movq	%rdi, %r8
	xorq	%rsi, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rcx, %rax
	movq	%rdx, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rcx, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	448(%r8), %r12
	movq	40(%rsp), %r8
	movq	448(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rdi, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rdi, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rsi
	addq	%r8, %rsi
	addq	%r13, %rsi
	leaq	-4(%rsi,%r12), %rsi
	andq	48(%rsp), %rsi
	movabsq	$8589934591, %r8
	leaq	-1(%rdx,%rsi), %rdx
	andq	%r8, %rdx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rsi,%r8), %rsi
	andq	%r12, %rsi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	456(%r8), %r12
	movq	40(%rsp), %r8
	movq	456(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rdx, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rdi
	addq	%r8, %rdi
	addq	%r13, %rdi
	leaq	-4(%rdi,%r12), %rdi
	andq	48(%rsp), %rdi
	movabsq	$8589934591, %r8
	leaq	-1(%rcx,%rdi), %rcx
	andq	%r8, %rcx
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rsi, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rsi, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdi,%r8), %rdi
	andq	%r12, %rdi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	464(%r8), %r12
	movq	40(%rsp), %r8
	movq	464(%r8), %r13
	movq	%rdx, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rcx, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rcx, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rcx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rcx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rcx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdi, %rbx
	orq	%rsi, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	%rdi, %rbx
	andq	%rsi, %rbx
	orq	%r9, %rbx
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r13, %rbx
	leaq	-1(%r8,%rbx), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	472(%r8), %r12
	movq	40(%rsp), %r8
	movq	472(%r8), %r13
	movq	%rcx, %r8
	xorq	%rdx, %r8
	orq	$1, %r8
	movq	24(%rsp), %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	24(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	24(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	24(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	24(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	24(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	24(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	movq	32(%rsp), %r10
	addq	%r10, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rax,%r8), %rax
	andq	%r9, %rax
	movq	%rax, 32(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rbx, %rax
	orq	%rdi, %rax
	movq	%rsi, %r9
	andq	%rax, %r9
	movq	%rbx, %rax
	andq	%rdi, %rax
	orq	%r9, %rax
	movabsq	$8589934591, %r10
	movq	%rbx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rax), %rax
	andq	%r13, %rax
	leaq	-1(%r8,%rax), %rax
	andq	%r12, %rax
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	480(%r8), %r12
	movq	40(%rsp), %r8
	movq	480(%r8), %r13
	movq	24(%rsp), %r8
	xorq	%rcx, %r8
	orq	$1, %r8
	movq	32(%rsp), %r9
	andq	%r8, %r9
	movq	%rcx, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	32(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	32(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	32(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	32(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	32(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	32(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rdx
	addq	%r8, %rdx
	addq	%r13, %rdx
	leaq	-4(%rdx,%r12), %rdx
	andq	48(%rsp), %rdx
	movabsq	$8589934591, %r8
	leaq	-1(%rsi,%rdx), %rsi
	andq	%r8, %rsi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rax, %r8
	orq	%rbx, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	%rax, %r8
	andq	%rbx, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rdx,%r8), %rdx
	andq	%r12, %rdx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	488(%r8), %r12
	movq	40(%rsp), %r8
	movq	488(%r8), %r13
	movq	32(%rsp), %r8
	xorq	24(%rsp), %r8
	orq	$1, %r8
	movq	%rsi, %r9
	andq	%r8, %r9
	movq	24(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rsi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rsi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rsi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rcx
	addq	%r8, %rcx
	addq	%r13, %rcx
	leaq	-4(%rcx,%r12), %rcx
	andq	48(%rsp), %rcx
	movabsq	$8589934591, %r8
	leaq	-1(%rdi,%rcx), %rdi
	andq	%r8, %rdi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdx, %r8
	orq	%rax, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%rdx, %r8
	andq	%rax, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%rdx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%rdx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%rdx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rcx,%r8), %rcx
	andq	%r12, %rcx
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movq	(%rsp), %r8
	movq	496(%r8), %r12
	movq	40(%rsp), %r8
	movq	496(%r8), %r13
	movq	%rsi, %r8
	xorq	32(%rsp), %r8
	orq	$1, %r8
	movq	%rdi, %r9
	andq	%r8, %r9
	movq	32(%rsp), %r8
	xorq	%r9, %r8
	orq	$1, %r8
	movabsq	$8589934591, %r10
	movq	%rdi, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rdi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rdi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rdi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %r8
	addq	%r13, %r8
	leaq	-4(%r8,%r12), %r8
	andq	48(%rsp), %r8
	movabsq	$8589934591, %r9
	leaq	-1(%rbx,%r8), %rbx
	andq	%r9, %rbx
	movabsq	$8589934591, %r9
	movq	%r9, 24(%rsp)
	movabsq	$8589934591, %r13
	movq	%rcx, %r9
	orq	%rdx, %r9
	movq	%rax, %r12
	andq	%r9, %r12
	movq	%rcx, %r9
	andq	%rdx, %r9
	orq	%r12, %r9
	movabsq	$8589934591, %r10
	movq	%rcx, %r12
	salq	$10, %r12
	addq	$-1023, %r12
	andq	%r10, %r12
	movq	%rcx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r12, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r12
	salq	$19, %r12
	addq	$-524287, %r12
	andq	%r11, %r12
	movq	%rcx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r12, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r12
	salq	$30, %r12
	addq	$-1073741823, %r12
	andq	%rbp, %r12
	movq	%rcx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r12, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r9), %r9
	andq	%r13, %r9
	leaq	-1(%r8,%r9), %r8
	andq	24(%rsp), %r8
	movabsq	$8589934591, %r9
	movq	%r9, 24(%rsp)
	movq	(%rsp), %r9
	movq	504(%r9), %r9
	movq	%r9, (%rsp)
	movq	40(%rsp), %r9
	movq	504(%r9), %r13
	movq	%rdi, %r9
	xorq	%rsi, %r9
	orq	$1, %r9
	movq	%rbx, %r12
	andq	%r9, %r12
	movq	%rsi, %r9
	xorq	%r12, %r9
	orq	$1, %r9
	movabsq	$8589934591, %r10
	movq	%rbx, %r12
	salq	$7, %r12
	addq	$-127, %r12
	andq	%r10, %r12
	movq	%rbx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r12, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r12
	salq	$21, %r12
	addq	$-2097151, %r12
	andq	%r11, %r12
	movq	%rbx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r12, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r12
	salq	$26, %r12
	addq	$-67108863, %r12
	andq	%rbp, %r12
	movq	%rbx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r12, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	32(%rsp), %r12
	addq	%rbp, %r12
	addq	%r12, %r9
	addq	%r13, %r9
	movq	(%rsp), %r12
	leaq	-4(%r9,%r12), %r9
	andq	24(%rsp), %r9
	movabsq	$8589934591, %r12
	movq	%r12, (%rsp)
	movabsq	$8589934591, %r12
	movq	%r12, 24(%rsp)
	movabsq	$8589934591, %r12
	movq	%r12, 32(%rsp)
	movq	%r8, %r12
	orq	%rcx, %r12
	movq	%rdx, %r13
	andq	%r12, %r13
	movq	%r8, %r12
	andq	%rcx, %r12
	orq	%r13, %r12
	movabsq	$8589934591, %r10
	movq	%r8, %r13
	salq	$10, %r13
	addq	$-1023, %r13
	andq	%r10, %r13
	movq	%r8, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r13, %r10
	movabsq	$8589934591, %r11
	movq	%r8, %r13
	salq	$19, %r13
	addq	$-524287, %r13
	andq	%r11, %r13
	movq	%r8, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r13, %r11
	movabsq	$8589934591, %rbp
	movq	%r8, %r13
	salq	$30, %r13
	addq	$-1073741823, %r13
	andq	%rbp, %r13
	movq	%r8, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r13, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r12), %r12
	andq	32(%rsp), %r12
	leaq	-1(%r9,%r12), %r12
	andq	24(%rsp), %r12
	movq	16(%rsp), %r13
	leaq	-1(%r13,%r12), %r12
	andq	(%rsp), %r12
	movq	8(%rsp), %r13
	movq	%r12, (%r13)
	movabsq	$8589934591, %r12
	movq	8(%rsp), %r13
	movq	8(%r13), %r13
	leaq	-1(%r13,%r8), %r8
	andq	%r12, %r8
	movq	8(%rsp), %r12
	movq	%r8, 8(%r12)
	movabsq	$8589934591, %r8
	movq	8(%rsp), %r12
	movq	16(%r12), %r12
	leaq	-1(%r12,%rcx), %rcx
	andq	%r8, %rcx
	movq	8(%rsp), %r8
	movq	%rcx, 16(%r8)
	movabsq	$8589934591, %rcx
	movq	8(%rsp), %r8
	movq	24(%r8), %r8
	leaq	-1(%r8,%rdx), %rdx
	andq	%rcx, %rdx
	movq	8(%rsp), %rcx
	movq	%rdx, 24(%rcx)
	movabsq	$8589934591, %rdx
	movabsq	$8589934591, %rcx
	leaq	-1(%rax,%r9), %rax
	andq	%rcx, %rax
	movq	8(%rsp), %rcx
	movq	32(%rcx), %rcx
	leaq	-1(%rcx,%rax), %rax
	andq	%rdx, %rax
	movq	8(%rsp), %rdx
	movq	%rax, 32(%rdx)
	movabsq	$8589934591, %rdx
	movq	8(%rsp), %rax
	movq	40(%rax), %rax
	leaq	-1(%rax,%rbx), %rax
	andq	%rdx, %rax
	movq	8(%rsp), %rbx
	movq	%rax, 40(%rbx)
	movabsq	$8589934591, %rbx
	movq	8(%rsp), %rax
	movq	48(%rax), %rax
	leaq	-1(%rax,%rdi), %rax
	andq	%rbx, %rax
	movq	8(%rsp), %rbx
	movq	%rax, 48(%rbx)
	movabsq	$8589934591, %rbx
	movq	8(%rsp), %rax
	movq	56(%rax), %rax
	leaq	-1(%rax,%rsi), %rax
	andq	%rbx, %rax
	movq	8(%rsp), %rbx
	movq	%rax, 56(%rbx)
	movl	$1, %eax
	addq	$56, %rsp
	.cfi_adjust_cfa_offset -56
	ret
	.cfi_adjust_cfa_offset 56
	.cfi_adjust_cfa_offset -56
	.cfi_endproc
	.type camlSha256__transform_from_10_25_code,@function
	.size camlSha256__transform_from_10_25_code,. - camlSha256__transform_from_10_25_code
	.text
	.align	16
	.globl	camlSha256__transform_11_26_code
camlSha256__transform_11_26_code:
.LcamlSha256__transform_11_26_code:
	.cfi_startproc
	movl	$1, %edi
	movq	24(%rax), %rbx
	jmp	camlSha256__transform_from_10_25_code@PLT
	.cfi_endproc
	.type camlSha256__transform_11_26_code,@function
	.size camlSha256__transform_11_26_code,. - camlSha256__transform_11_26_code
	.text
	.align	16
	.globl	camlSha256__init_12_27_code
camlSha256__init_12_27_code:
.LcamlSha256__init_12_27_code:
	.cfi_startproc
	movq	(%rax), %rbx
	movq	-8(%rbx), %rdi
	salq	$8, %rdi
	shrq	$17, %rdi
	orq	$1, %rdi
	cmpq	$1, %rdi
	jbe	.L4919
	movl	$3558067407, %esi
	movq	%rsi, (%rbx)
	cmpq	$3, %rdi
	jbe	.L4913
	movabsq	$6288268555, %rsi
	movq	%rsi, 8(%rbx)
	cmpq	$5, %rdi
	jbe	.L4907
	movq	$2027808485, 16(%rbx)
	cmpq	$7, %rdi
	jbe	.L4901
	movabsq	$5546961525, %rsi
	movq	%rsi, 24(%rbx)
	cmpq	$9, %rdi
	jbe	.L4895
	movl	$2719786239, %esi
	movq	%rsi, 32(%rbx)
	cmpq	$11, %rdi
	jbe	.L4889
	movabsq	$5201645849, %rsi
	movq	%rsi, 40(%rbx)
	cmpq	$13, %rdi
	jbe	.L4883
	movq	$1057469271, 48(%rbx)
	cmpq	$15, %rdi
	jbe	.L4877
	movl	$3082918451, %edi
	movq	%rdi, 56(%rbx)
	movq	$1, 16(%rax)
	movq	8(%rax), %rax
	movq	-8(%rax), %rbx
	salq	$8, %rbx
	shrq	$17, %rbx
	orq	$1, %rbx
	cmpq	$1, %rbx
	jbe	.L4871
	movq	$1, (%rax)
	cmpq	$3, %rbx
	jbe	.L4865
	movq	$1, 8(%rax)
	movl	$1, %eax
	ret
	.align	4
.L4865:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L4871:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L4877:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L4883:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L4889:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L4895:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L4901:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L4907:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L4913:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L4919:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.cfi_endproc
	.type camlSha256__init_12_27_code,@function
	.size camlSha256__init_12_27_code,. - camlSha256__init_12_27_code
	.text
	.align	16
	.globl	camlSha256__add_data_13_28_code
camlSha256__add_data_13_28_code:
.LcamlSha256__add_data_13_28_code:
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
	jbe	.L5161
	movq	8(%rax), %rsi
	movabsq	$8589934591, %rcx
	leaq	-8(%rsi,%r13,8), %rdx
	andq	%rcx, %rdx
	movq	%rdx, 8(%rax)
	cmpq	%rsi, %rdx
	jge	.L4968
	cmpq	$1, %rdi
	jbe	.L4959
	movabsq	$8589934591, %rdx
	movq	(%rax), %rsi
	addq	$2, %rsi
	andq	%rdx, %rsi
	movq	%rsi, (%rax)
	cmpq	$1, %rdi
	jbe	.L5154
	jmp	.L4970
	.align	4
.L4959:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L4968:
	cmpq	$1, %rdi
	jbe	.L5154
.L4970:
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
	je	.L5079
	movl	$130, %r8d
	subq	%rcx, %r8
	cmpq	%r8, %r13
	jge	.L5032
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L4992
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L4992:
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
	jge	.L5005
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5005:
	cmpq	$1, %rcx
	jge	.L5009
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5009:
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
	jle	.L5022
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5022:
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	16(%r12), %rax
	leaq	-1(%rax,%r13), %rax
	movq	%rax, 16(%r12)
	movl	$1, %eax
	movl	$1, %esi
	jmp	.L5164
	.align	4
.L5032:
	movq	24(%r12), %rbp
	cmpq	$1, %r8
	jge	.L5038
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5038:
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
	jge	.L5051
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5051:
	cmpq	$1, %rcx
	jge	.L5055
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5055:
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
	jle	.L5068
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5068:
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
	call	camlSha256__transform_from_10_25_code@PLT
.L5171:
	xorl	%eax, %eax
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rsi
	subq	%rsi, %rbx
	leaq	1(%rbx), %r13
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	jmp	.L5092
	.align	4
.L5079:
	xorl	%eax, %eax
	movl	$1, %esi
.L5092:
	movq	%rbx, 8(%rsp)
	movq	%r12, (%rsp)
	cmpq	$129, %r13
	jl	.L5101
.L5096:
	movq	%r13, 24(%rsp)
	movq	%r12, %rax
	movq	%rsi, %rdi
	movq	%rsi, 16(%rsp)
	call	camlSha256__transform_from_10_25_code@PLT
.L5172:
	movq	24(%rsp), %r13
	addq	$-128, %r13
	movq	16(%rsp), %rsi
	addq	$128, %rsi
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	cmpq	$129, %r13
	jge	.L5096
.L5101:
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L5110
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5110:
	cmpq	$1, %rsi
	jge	.L5114
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5114:
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
	jle	.L5127
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5127:
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
	jge	.L5140
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5140:
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	%r13, 16(%r12)
	jmp	.L5164
	.align	4
.L5154:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5161:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5164:
	movl	$1, %eax
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.type camlSha256__add_data_13_28_code,@function
	.size camlSha256__add_data_13_28_code,. - camlSha256__add_data_13_28_code
	.text
	.align	16
	.globl	camlSha256__finish_14_29_code
camlSha256__finish_14_29_code:
.LcamlSha256__finish_14_29_code:
	.cfi_startproc
	.cfi_def_cfa_offset 8
	subq	$40, %rsp
	.cfi_adjust_cfa_offset 40
	movq	%rax, %r13
	movq	%rbx, %r12
	movq	16(%r13), %rax
	movq	24(%r13), %rbx
	movq	-8(%rbx), %rdi
	salq	$8, %rdi
	shrq	$18, %rdi
	leaq	-1(,%rdi,8), %rbp
	movzbq	(%rbx,%rbp), %rdi
	subq	%rdi, %rbp
	movq	%rax, %rdi
	sarq	$1, %rdi
	cmpq	%rbp, %rdi
	jae	.L5626
	movq	$-128, %rsi
	movb	%sil, (%rbx,%rdi)
	leaq	2(%rax), %rsi
	cmpq	$113, %rsi
	jle	.L5221
	movl	$130, %edx
	subq	%rsi, %rdx
	cmpq	$1, %rsi
	jge	.L5200
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5200:
	cmpq	$1, %rdx
	jge	.L5204
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5204:
	movq	%rbp, %rax
	salq	$1, %rax
	subq	%rdx, %rax
	addq	$2, %rax
	cmpq	%rax, %rsi
	jle	.L5211
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5211:
	movq	%rbp, 24(%rsp)
	movq	%r12, 8(%rsp)
	movl	$1, %ecx
	movq	%rbx, %rdi
	call	caml_fill_bytes@PLT
	movl	$1, %edi
	movq	%r13, %rax
	movq	%r13, (%rsp)
	movq	%rbx, 16(%rsp)
	call	camlSha256__transform_from_10_25_code@PLT
.L5631:
	movl	$1, %esi
	movq	(%rsp), %rax
	movq	8(%rsp), %r12
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rbp
	movq	%rax, %r13
.L5221:
	movl	$114, %eax
	subq	%rsi, %rax
	cmpq	$1, %rsi
	jge	.L5226
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5226:
	cmpq	$1, %rax
	jge	.L5230
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5230:
	movq	%rbp, %rdi
	salq	$1, %rdi
	subq	%rax, %rdi
	addq	$2, %rdi
	cmpq	%rdi, %rsi
	jle	.L5237
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5237:
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%rax, %rdx
	call	caml_fill_bytes@PLT
	movq	8(%r13), %rax
	movq	-8(%rax), %rdi
	salq	$8, %rdi
	shrq	$17, %rdi
	orq	$1, %rdi
	cmpq	$1, %rdi
	jbe	.L5616
	movq	(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$24, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L5256
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5256:
	cmpq	$511, %rdx
	jle	.L5263
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5263:
	cmpq	$56, %rbp
	jbe	.L5608
	sarq	$1, %rdx
	movb	%dl, 56(%rbx)
	movq	%rsi, %rdx
	shrq	$16, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L5274
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5274:
	cmpq	$511, %rdx
	jle	.L5281
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5281:
	cmpq	$57, %rbp
	jbe	.L5600
	sarq	$1, %rdx
	movb	%dl, 57(%rbx)
	movq	%rsi, %rdx
	shrq	$8, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L5292
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5292:
	cmpq	$511, %rdx
	jle	.L5299
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5299:
	cmpq	$58, %rbp
	jbe	.L5592
	sarq	$1, %rdx
	movb	%dl, 58(%rbx)
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L5308
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5308:
	cmpq	$511, %rsi
	jle	.L5315
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5315:
	cmpq	$59, %rbp
	jbe	.L5584
	sarq	$1, %rsi
	movb	%sil, 59(%rbx)
	cmpq	$3, %rdi
	jbe	.L5578
	movq	8(%rax), %rax
	movq	%rax, %rdi
	shrq	$24, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L5332
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5332:
	cmpq	$511, %rdi
	jle	.L5339
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5339:
	cmpq	$60, %rbp
	jbe	.L5570
	sarq	$1, %rdi
	movb	%dil, 60(%rbx)
	movq	%rax, %rdi
	shrq	$16, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L5350
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5350:
	cmpq	$511, %rdi
	jle	.L5357
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5357:
	cmpq	$61, %rbp
	jbe	.L5562
	sarq	$1, %rdi
	movb	%dil, 61(%rbx)
	movq	%rax, %rdi
	shrq	$8, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L5368
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5368:
	cmpq	$511, %rdi
	jle	.L5375
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5375:
	cmpq	$62, %rbp
	jbe	.L5554
	sarq	$1, %rdi
	movb	%dil, 62(%rbx)
	andl	$511, %eax
	cmpq	$1, %rax
	jge	.L5384
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5384:
	cmpq	$511, %rax
	jle	.L5391
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5391:
	cmpq	$63, %rbp
	jbe	.L5546
	movq	%r12, 8(%rsp)
	sarq	$1, %rax
	movb	%al, 63(%rbx)
	movl	$1, %edi
	movq	%r13, %rax
	movq	%r13, (%rsp)
	call	camlSha256__transform_from_10_25_code@PLT
.L5632:
	xorl	%eax, %eax
	movq	(%rsp), %rdx
	movq	8(%rsp), %rcx
.L5401:
	leaq	1(%rax,%rax), %rbx
	movq	(%rdx), %rdi
	movq	-8(%rdi), %rsi
	salq	$8, %rsi
	shrq	$17, %rsi
	cmpq	%rsi, %rbx
	jae	.L5539
	movq	-4(%rdi,%rbx,4), %rdi
	leaq	-3(,%rbx,4), %rbx
	movq	%rdi, %rsi
	shrq	$24, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L5420
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5420:
	cmpq	$511, %rsi
	jle	.L5427
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5427:
	movq	-8(%rcx), %r8
	salq	$8, %r8
	shrq	$18, %r8
	leaq	-1(,%r8,8), %r8
	movzbq	(%rcx,%r8), %r9
	subq	%r9, %r8
	movq	%rbx, %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L5531
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r9)
	movq	%rdi, %rsi
	shrq	$16, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L5445
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5445:
	cmpq	$511, %rsi
	jle	.L5452
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5452:
	leaq	2(%rbx), %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L5523
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r9)
	movq	%rdi, %rsi
	shrq	$8, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L5465
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5465:
	cmpq	$511, %rsi
	jle	.L5472
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5472:
	leaq	4(%rbx), %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L5515
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r9)
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L5483
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5483:
	cmpq	$511, %rdi
	jle	.L5490
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5490:
	addq	$6, %rbx
	sarq	$1, %rbx
	cmpq	%r8, %rbx
	jae	.L5507
	sarq	$1, %rdi
	movb	%dil, (%rcx,%rbx)
	incq	%rax
	cmpq	$7, %rax
	jle	.L5401
	movl	$1, %eax
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.align	4
.L5507:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5515:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5523:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5531:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5539:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5546:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5554:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5562:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5570:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5578:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5584:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5592:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5600:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5608:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5616:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L5626:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.cfi_adjust_cfa_offset -40
	.cfi_endproc
	.type camlSha256__finish_14_29_code,@function
	.size camlSha256__finish_14_29_code,. - camlSha256__finish_14_29_code
	.text
	.align	16
	.globl	camlSha256__entry
camlSha256__entry:
.LcamlSha256__entry:
	.cfi_startproc
	.cfi_def_cfa_offset 8
	subq	$8, %rsp
	.cfi_adjust_cfa_offset 8
	leaq	.LcamlSha256__Pmakearray1986(%rip), %rax
	movq	%rax, %rdi
	movq	caml_obj_dup@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L5648:
	movq	%rax, %rbx
	movq	camlSha256__transform_from_25@GOTPCREL(%rip), %rax
	addq	$24, %rax
	movq	%rax, %rdi
	movq	%rbx, %rsi
	call	caml_initialize@PLT
	movq	camlSha256@GOTPCREL(%rip), %rax
	addq	$64, %rax
	movq	%rax, %rdi
	movq	%rbx, %rsi
	call	caml_initialize@PLT
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
	.4byte	(.L5648 - .) + 0
	.2byte	17
	.2byte	0
	.align	4
	.4byte	(.L5649 - .) + 0
	.align	8
	.4byte	(.L5632 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L5650 - .) + 0
	.align	8
	.4byte	(.L5631 - .) + 0
	.2byte	49
	.2byte	3
	.2byte	0
	.2byte	8
	.2byte	16
	.align	4
	.4byte	(.L5651 - .) + 0
	.align	8
	.4byte	(.L5172 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L5652 - .) + 0
	.align	8
	.4byte	(.L5171 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L5653 - .) + 0
	.align	8
	.4byte	(.L232 - .) + 0
	.2byte	34
	.2byte	4
	.2byte	0
	.2byte	3
	.2byte	8
	.2byte	16
	.byte	1
	.byte	4
	.align	8
	.4byte	(.L230 - .) + 0
	.2byte	33
	.2byte	3
	.2byte	0
	.2byte	8
	.2byte	16
	.align	4
	.4byte	(.L5654 - .) + 0
	.align	8
	.4byte	(.L229 - .) + 0
	.2byte	33
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L5655 - .) + 0
	.align	8
	.4byte	(.L228 - .) + 0
	.2byte	33
	.2byte	1
	.2byte	0
	.align	4
	.4byte	(.L5656 - .) + 0
	.align	8
	.4byte	(.L227 - .) + 0
	.2byte	33
	.2byte	0
	.align	4
	.4byte	(.L5657 - .) + 0
	.align	8
	.align	4
.L5655:
	.4byte	(.L5659 - .) + 0
	.4byte	28849368
	.align	4
.L5653:
	.4byte	(.L5660 - .) + 1
	.4byte	201871768
	.4byte	(.L5661 - .) + 0
	.4byte	221255832
	.align	4
.L5654:
	.4byte	(.L5659 - .) + 0
	.4byte	28325080
	.align	4
.L5651:
	.4byte	(.L5660 - .) + 1
	.4byte	201871768
	.4byte	(.L5662 - .) + 0
	.4byte	235409544
	.align	4
.L5649:
	.4byte	(.L5663 - .) + 1140850688
	.4byte	-2147377152
	.align	4
.L5657:
	.4byte	(.L5659 - .) + 0
	.4byte	30422240
	.align	4
.L5652:
	.4byte	(.L5661 - .) + 0
	.4byte	225974544
	.align	4
.L5656:
	.4byte	(.L5665 - .) + 1
	.4byte	31467664
	.4byte	(.L5659 - .) + 0
	.4byte	29897992
	.align	4
.L5650:
	.4byte	(.L5660 - .) + 1
	.4byte	201871768
	.4byte	(.L5662 - .) + 0
	.4byte	239601784
.L5664:
	.ascii	"bytes.ml\0"
.L5658:
	.ascii	"sha256.ml\0"
	.align	4
.L5662:
	.4byte	(.L5658 - .) + 0
	.ascii	"Sha256.finish\0"
	.align	4
.L5665:
	.4byte	(.L5664 - .) + 0
	.ascii	"Stdlib__Bytes.make\0"
	.align	4
.L5663:
	.4byte	(.L5658 - .) + 0
	.2byte	16
	.2byte	2
	.4byte	820
	.ascii	"Sha256.constants\0"
	.align	4
.L5659:
	.4byte	(.L5658 - .) + 0
	.ascii	"Sha256.create\0"
	.align	4
.L5661:
	.4byte	(.L5658 - .) + 0
	.ascii	"Sha256.add_data\0"
	.align	4
.L5660:
	.4byte	(.L5658 - .) + 0
	.ascii	"Sha256.transform\0"
	.align	8
	.size camlSha256__frametable,. - camlSha256__frametable
	.data
	.section .note.GNU-stack,"",@progbits
