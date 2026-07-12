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
	.8byte	camlSha256__transform_from_26
	.8byte	.LcamlSha256__rounds_27
	.8byte	0
	.data
	.align	8
	.8byte	18176
	.globl	camlSha256
camlSha256:
.LcamlSha256:
	.8byte	0x1ffffffff
	.8byte	camlSha256__rotr_16
	.8byte	camlSha256__ch_17
	.8byte	camlSha256__maj_18
	.8byte	camlSha256__big_sigma0_19
	.8byte	camlSha256__big_sigma1_20
	.8byte	camlSha256__small_sigma0_21
	.8byte	camlSha256__small_sigma1_22
	.8byte	1
	.8byte	camlSha256__create_23
	.8byte	camlSha256__get_be32_24
	.8byte	camlSha256__set_be32_25
	.8byte	camlSha256__transform_from_26
	.8byte	camlSha256__transform_28
	.8byte	camlSha256__init_29
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
	.globl	camlSha256__init_29
camlSha256__init_29:
.LcamlSha256__init_29:
	.8byte	camlSha256__init_13_29_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__transform_28
camlSha256__transform_28:
.LcamlSha256__transform_28:
	.8byte	camlSha256__transform_12_28_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	5111
.LcamlSha256__rounds_27:
	.8byte	caml_curry11L11
	.8byte	0xb80000000000007
	.8byte	.LcamlSha256__rounds_11_27_code
	.8byte	1
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__transform_from_26
camlSha256__transform_from_26:
.LcamlSha256__transform_from_26:
	.8byte	caml_curry3
	.8byte	0x380000000000007
	.8byte	camlSha256__transform_from_10_26_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__set_be32_25
camlSha256__set_be32_25:
.LcamlSha256__set_be32_25:
	.8byte	caml_curry3
	.8byte	0x380000000000007
	.8byte	camlSha256__set_be32_9_25_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__get_be32_24
camlSha256__get_be32_24:
.LcamlSha256__get_be32_24:
	.8byte	caml_curry2
	.8byte	0x280000000000007
	.8byte	camlSha256__get_be32_8_24_code
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
	.8byte	66304
.LcamlSha256__Pmakearray1038:
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
	.8byte	caml_curry3
	.8byte	0x380000000000007
	.8byte	camlSha256__maj_2_18_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__ch_17
camlSha256__ch_17:
.LcamlSha256__ch_17:
	.8byte	caml_curry3
	.8byte	0x380000000000007
	.8byte	camlSha256__ch_1_17_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__rotr_16
camlSha256__rotr_16:
.LcamlSha256__rotr_16:
	.8byte	caml_curry2
	.8byte	0x280000000000007
	.8byte	camlSha256__rotr_0_16_code
	.data
	.align	8
	.8byte	2816
.LcamlSha256__block506:
	.8byte	caml_exn_Invalid_argument
	.8byte	.LcamlSha256__string504
	.data
	.align	8
	.8byte	4092
.LcamlSha256__string504:
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
	leaq	-1(%rax), %rdi
	salq	%cl, %rdi
	incq	%rdi
	movq	%rbx, %rcx
	sarq	$1, %rcx
	shrq	%cl, %rax
	orq	$1, %rax
	orq	%rdi, %rax
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
	movq	%rax, %rsi
	movq	%rdi, %rax
	xorq	%rax, %rbx
	orq	$1, %rbx
	andq	%rbx, %rsi
	xorq	%rsi, %rax
	orq	$1, %rax
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
	movabsq	$8589934591, %rdx
	movq	%rax, %rbx
	salq	$10, %rbx
	leaq	-1023(%rbx), %rdi
	movq	%rax, %rbx
	shrq	$22, %rbx
	orq	$1, %rbx
	orq	%rdi, %rbx
	movq	%rax, %rdi
	salq	$19, %rdi
	leaq	-524287(%rdi), %rsi
	movq	%rax, %rdi
	shrq	$13, %rdi
	orq	$1, %rdi
	orq	%rsi, %rdi
	movq	%rax, %rsi
	salq	$30, %rsi
	addq	$-1073741823, %rsi
	shrq	$2, %rax
	orq	$1, %rax
	orq	%rsi, %rax
	xorq	%rdi, %rax
	xorq	%rbx, %rax
	orq	$1, %rax
	andq	%rdx, %rax
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
	movabsq	$8589934591, %rdx
	movq	%rax, %rbx
	salq	$7, %rbx
	leaq	-127(%rbx), %rdi
	movq	%rax, %rbx
	shrq	$25, %rbx
	orq	$1, %rbx
	orq	%rdi, %rbx
	movq	%rax, %rdi
	salq	$21, %rdi
	leaq	-2097151(%rdi), %rsi
	movq	%rax, %rdi
	shrq	$11, %rdi
	orq	$1, %rdi
	orq	%rsi, %rdi
	movq	%rax, %rsi
	salq	$26, %rsi
	addq	$-67108863, %rsi
	shrq	$6, %rax
	orq	$1, %rax
	orq	%rsi, %rax
	xorq	%rdi, %rax
	xorq	%rbx, %rax
	orq	$1, %rax
	andq	%rdx, %rax
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
	movabsq	$8589934591, %rdx
	movq	%rax, %rbx
	shrq	$3, %rbx
	movq	%rax, %rdi
	salq	$14, %rdi
	leaq	-16383(%rdi), %rsi
	movq	%rax, %rdi
	shrq	$18, %rdi
	orq	$1, %rdi
	orq	%rsi, %rdi
	movq	%rax, %rsi
	salq	$25, %rsi
	addq	$-33554431, %rsi
	shrq	$7, %rax
	orq	$1, %rax
	orq	%rsi, %rax
	xorq	%rdi, %rax
	xorq	%rbx, %rax
	orq	$1, %rax
	andq	%rdx, %rax
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
	movabsq	$8589934591, %rdx
	movq	%rax, %rbx
	shrq	$10, %rbx
	movq	%rax, %rdi
	salq	$13, %rdi
	leaq	-8191(%rdi), %rsi
	movq	%rax, %rdi
	shrq	$19, %rdi
	orq	$1, %rdi
	orq	%rsi, %rdi
	movq	%rax, %rsi
	salq	$15, %rsi
	addq	$-32767, %rsi
	shrq	$17, %rax
	orq	$1, %rax
	orq	%rsi, %rax
	xorq	%rdi, %rax
	xorq	%rbx, %rax
	orq	$1, %rax
	andq	%rdx, %rax
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
	movl	$1, %esi
	movl	$161, %edi
	movq	caml_array_make@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L220:
	movq	%rax, (%rsp)
	movl	$129, %edi
	movq	caml_create_bytes@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L221:
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
.L222:
	movq	%rax, 16(%rsp)
	movl	$1, %esi
	movl	$17, %edi
	movq	caml_array_make@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L223:
	movq	%rax, %rbx
	subq	$48, %r15
	cmpq	(%r14), %r15
	jb	.L224
.L226:
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
.L224:
	call	.Lcaml_call_gc_
.L225:
	jmp	.L226
	.cfi_adjust_cfa_offset -24
	.cfi_endproc
	.type camlSha256__create_7_23_code,@function
	.size camlSha256__create_7_23_code,. - camlSha256__create_7_23_code
	.text
	.align	16
	.globl	camlSha256__get_be32_8_24_code
camlSha256__get_be32_8_24_code:
.LcamlSha256__get_be32_8_24_code:
	.cfi_startproc
	leaq	6(%rbx), %rdi
	sarq	$1, %rdi
	movzbq	(%rax,%rdi), %rdi
	leaq	1(%rdi,%rdi), %rsi
	leaq	4(%rbx), %rdi
	sarq	$1, %rdi
	movzbq	(%rax,%rdi), %rdi
	salq	$9, %rdi
	leaq	1(%rdi), %rdx
	leaq	2(%rbx), %rdi
	sarq	$1, %rdi
	movzbq	(%rax,%rdi), %rdi
	salq	$17, %rdi
	incq	%rdi
	sarq	$1, %rbx
	movzbq	(%rax,%rbx), %rax
	salq	$25, %rax
	incq	%rax
	orq	%rdi, %rax
	orq	%rdx, %rax
	orq	%rsi, %rax
	ret
	.cfi_endproc
	.type camlSha256__get_be32_8_24_code,@function
	.size camlSha256__get_be32_8_24_code,. - camlSha256__get_be32_8_24_code
	.text
	.align	16
	.globl	camlSha256__set_be32_9_25_code
camlSha256__set_be32_9_25_code:
.LcamlSha256__set_be32_9_25_code:
	.cfi_startproc
	movq	%rdi, %rsi
	shrq	$24, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L259
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L259:
	cmpq	$511, %rsi
	jle	.L263
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L263:
	movq	%rbx, %rdx
	sarq	$1, %rdx
	sarq	$1, %rsi
	movb	%sil, (%rax,%rdx)
	movq	%rdi, %rsi
	shrq	$16, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L273
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L273:
	cmpq	$511, %rsi
	jle	.L277
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L277:
	leaq	2(%rbx), %rdx
	sarq	$1, %rdx
	sarq	$1, %rsi
	movb	%sil, (%rax,%rdx)
	movq	%rdi, %rsi
	shrq	$8, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L288
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L288:
	cmpq	$511, %rsi
	jle	.L292
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L292:
	leaq	4(%rbx), %rdx
	sarq	$1, %rdx
	sarq	$1, %rsi
	movb	%sil, (%rax,%rdx)
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L301
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L301:
	cmpq	$511, %rdi
	jle	.L305
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L305:
	addq	$6, %rbx
	sarq	$1, %rbx
	sarq	$1, %rdi
	movb	%dil, (%rax,%rbx)
	movl	$1, %eax
	ret
	.cfi_endproc
	.type camlSha256__set_be32_9_25_code,@function
	.size camlSha256__set_be32_9_25_code,. - camlSha256__set_be32_9_25_code
	.text
	.align	16
	.globl	camlSha256__transform_from_10_26_code
camlSha256__transform_from_10_26_code:
.LcamlSha256__transform_from_10_26_code:
	.cfi_startproc
	movq	%rax, %rdx
	movq	32(%rdx), %rax
	xorl	%esi, %esi
.L329:
	leaq	1(%rsi,%rsi), %rcx
	leaq	-4(%rdi,%rcx,4), %r8
	leaq	6(%r8), %r9
	sarq	$1, %r9
	movzbq	(%rbx,%r9), %r9
	leaq	1(%r9,%r9), %r12
	leaq	4(%r8), %r9
	sarq	$1, %r9
	movzbq	(%rbx,%r9), %r9
	salq	$9, %r9
	leaq	1(%r9), %r13
	leaq	2(%r8), %r9
	sarq	$1, %r9
	movzbq	(%rbx,%r9), %r9
	salq	$17, %r9
	incq	%r9
	sarq	$1, %r8
	movzbq	(%rbx,%r8), %r8
	salq	$25, %r8
	incq	%r8
	orq	%r9, %r8
	orq	%r13, %r8
	orq	%r12, %r8
	movq	%r8, -4(%rax,%rcx,4)
	incq	%rsi
	cmpq	$15, %rsi
	jle	.L329
	movl	$16, %ebx
.L370:
	leaq	1(%rbx,%rbx), %rdi
	movq	-124(%rax,%rdi,4), %rcx
	movq	-20(%rax,%rdi,4), %rsi
	movabsq	$8589934591, %r8
	movq	-132(%rax,%rdi,4), %r9
	movabsq	$8589934591, %r10
	movq	%rcx, %r12
	shrq	$3, %r12
	movq	%rcx, %r13
	salq	$14, %r13
	leaq	-16383(%r13), %r11
	movq	%rcx, %r13
	shrq	$18, %r13
	orq	$1, %r13
	orq	%r11, %r13
	movq	%rcx, %r11
	salq	$25, %r11
	addq	$-33554431, %r11
	shrq	$7, %rcx
	orq	$1, %rcx
	orq	%r11, %rcx
	xorq	%r13, %rcx
	xorq	%r12, %rcx
	orq	$1, %rcx
	andq	%r10, %rcx
	movq	-60(%rax,%rdi,4), %r12
	movabsq	$8589934591, %r13
	movq	%rsi, %r10
	shrq	$10, %r10
	movq	%rsi, %r11
	salq	$13, %r11
	addq	$-8191, %r11
	movq	%rsi, %rbp
	shrq	$19, %rbp
	orq	$1, %rbp
	orq	%r11, %rbp
	movq	%rsi, %r11
	salq	$15, %r11
	addq	$-32767, %r11
	shrq	$17, %rsi
	orq	$1, %rsi
	orq	%r11, %rsi
	xorq	%rbp, %rsi
	xorq	%r10, %rsi
	orq	$1, %rsi
	andq	%r13, %rsi
	addq	%r12, %rsi
	addq	%rcx, %rsi
	leaq	-3(%rsi,%r9), %rsi
	andq	%r8, %rsi
	movq	%rsi, -4(%rax,%rdi,4)
	incq	%rbx
	cmpq	$79, %rbx
	jle	.L370
	movq	(%rdx), %rbx
	movq	56(%rbx), %r10
	movq	48(%rbx), %r13
	movq	40(%rbx), %r12
	movq	32(%rbx), %r9
	movq	24(%rbx), %r8
	movq	16(%rbx), %rcx
	movq	8(%rbx), %r11
	movq	(%rbx), %rsi
	movl	$1, %edi
	movq	%rdx, %rbx
	movq	%r11, %rdx
	movq	%r10, 624(%r14)
	jmp	.LcamlSha256__rounds_11_27_code
	.cfi_endproc
	.type camlSha256__transform_from_10_26_code,@function
	.size camlSha256__transform_from_10_26_code,. - camlSha256__transform_from_10_26_code
	.text
	.align	16
	.globl	camlSha256__rounds_11_27_code
camlSha256__rounds_11_27_code:
.LcamlSha256__rounds_11_27_code:
	.cfi_startproc
	.cfi_def_cfa_offset 8
	subq	$104, %rsp
	.cfi_adjust_cfa_offset 104
	movq	%rax, (%rsp)
	movq	%rbx, 8(%rsp)
	movq	624(%r14), %rax
	movq	%rdi, 16(%rsp)
	movq	%rdx, 24(%rsp)
	movq	%rcx, 32(%rsp)
	movq	%r12, 40(%rsp)
.L439:
	movq	16(%rsp), %rbx
	cmpq	$15, %rbx
	jle	.L476
	movq	8(%rsp), %rbx
	movq	(%rbx), %rbx
	movabsq	$8589934591, %rdx
	movq	(%rbx), %rdi
	leaq	-1(%rdi,%rsi), %rdi
	andq	%rdx, %rdi
	movq	%rdi, (%rbx)
	movabsq	$8589934591, %rsi
	movq	8(%rbx), %rdi
	movq	24(%rsp), %rdx
	leaq	-1(%rdi,%rdx), %rdi
	andq	%rsi, %rdi
	movq	%rdi, 8(%rbx)
	movabsq	$8589934591, %rsi
	movq	16(%rbx), %rdi
	movq	32(%rsp), %rdx
	leaq	-1(%rdi,%rdx), %rdi
	andq	%rsi, %rdi
	movq	%rdi, 16(%rbx)
	movabsq	$8589934591, %rsi
	movq	24(%rbx), %rdi
	leaq	-1(%rdi,%r8), %rdi
	andq	%rsi, %rdi
	movq	%rdi, 24(%rbx)
	movabsq	$8589934591, %rsi
	movq	32(%rbx), %rdi
	leaq	-1(%rdi,%r9), %rdi
	andq	%rsi, %rdi
	movq	%rdi, 32(%rbx)
	movabsq	$8589934591, %rsi
	movq	40(%rbx), %rdi
	movq	40(%rsp), %rdx
	leaq	-1(%rdi,%rdx), %rdi
	andq	%rsi, %rdi
	movq	%rdi, 40(%rbx)
	movabsq	$8589934591, %rsi
	movq	48(%rbx), %rdi
	leaq	-1(%rdi,%r13), %rdi
	andq	%rsi, %rdi
	movq	%rdi, 48(%rbx)
	movabsq	$8589934591, %rdi
	movq	56(%rbx), %rsi
	leaq	-1(%rsi,%rax), %rax
	andq	%rdi, %rax
	movq	%rax, 56(%rbx)
	movl	$1, %eax
	addq	$104, %rsp
	.cfi_adjust_cfa_offset -104
	ret
	.cfi_adjust_cfa_offset 104
	.align	4
.L476:
	movq	16(%rsp), %rbx
	leaq	-7(,%rbx,8), %rbx
	movq	%rbx, 48(%rsp)
	movabsq	$8589934591, %rbx
	movq	%rbx, 56(%rsp)
	movq	(%rsp), %rbx
	movq	48(%rsp), %rdi
	movq	-4(%rbx,%rdi,4), %rdx
	leaq	.LcamlSha256__rounds_27(%rip), %rbx
	movq	24(%rbx), %rbx
	movq	%rbx, 64(%rsp)
	movq	48(%rsp), %rdi
	movq	-4(%rbx,%rdi,4), %rcx
	movq	40(%rsp), %rbx
	xorq	%r13, %rbx
	orq	$1, %rbx
	movq	%r9, %rdi
	andq	%rbx, %rdi
	movq	%r13, %rbx
	xorq	%rdi, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r12
	movq	%r9, %rdi
	salq	$7, %rdi
	leaq	-127(%rdi), %r10
	movq	%r9, %rdi
	shrq	$25, %rdi
	orq	$1, %rdi
	orq	%r10, %rdi
	movq	%r9, %r10
	salq	$21, %r10
	leaq	-2097151(%r10), %r11
	movq	%r9, %r10
	shrq	$11, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%r9, %r11
	salq	$26, %r11
	leaq	-67108863(%r11), %rbp
	movq	%r9, %r11
	shrq	$6, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%rdi, %r11
	orq	$1, %r11
	andq	%r12, %r11
	addq	%r11, %rax
	addq	%rbx, %rax
	addq	%rcx, %rax
	leaq	-4(%rax,%rdx), %rax
	andq	56(%rsp), %rax
	movabsq	$8589934591, %rdi
	leaq	-1(%r8,%rax), %rbx
	andq	%rdi, %rbx
	movabsq	$8589934591, %rcx
	movabsq	$8589934591, %r8
	movq	%rsi, %rdi
	orq	24(%rsp), %rdi
	movq	32(%rsp), %rdx
	andq	%rdi, %rdx
	movq	%rsi, %rdi
	andq	24(%rsp), %rdi
	orq	%rdx, %rdi
	movabsq	$8589934591, %r12
	movq	%rsi, %rdx
	salq	$10, %rdx
	leaq	-1023(%rdx), %r10
	movq	%rsi, %rdx
	shrq	$22, %rdx
	orq	$1, %rdx
	orq	%r10, %rdx
	movq	%rsi, %r10
	salq	$19, %r10
	leaq	-524287(%r10), %r11
	movq	%rsi, %r10
	shrq	$13, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%rsi, %r11
	salq	$30, %r11
	leaq	-1073741823(%r11), %rbp
	movq	%rsi, %r11
	shrq	$2, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%rdx, %r11
	orq	$1, %r11
	andq	%r12, %r11
	leaq	-1(%r11,%rdi), %rdi
	andq	%r8, %rdi
	leaq	-1(%rax,%rdi), %rax
	andq	%rcx, %rax
	movq	48(%rsp), %rdi
	addq	$2, %rdi
	movabsq	$8589934591, %rdx
	movq	%rdx, 56(%rsp)
	movq	(%rsp), %rdx
	movq	-4(%rdx,%rdi,4), %rcx
	movq	64(%rsp), %rdx
	movq	-4(%rdx,%rdi,4), %r8
	movq	%r9, %rdi
	xorq	40(%rsp), %rdi
	orq	$1, %rdi
	movq	%rbx, %rdx
	andq	%rdi, %rdx
	movq	40(%rsp), %rdi
	xorq	%rdx, %rdi
	orq	$1, %rdi
	movabsq	$8589934591, %r12
	movq	%rbx, %rdx
	salq	$7, %rdx
	leaq	-127(%rdx), %r10
	movq	%rbx, %rdx
	shrq	$25, %rdx
	orq	$1, %rdx
	orq	%r10, %rdx
	movq	%rbx, %r10
	salq	$21, %r10
	leaq	-2097151(%r10), %r11
	movq	%rbx, %r10
	shrq	$11, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%rbx, %r11
	salq	$26, %r11
	leaq	-67108863(%r11), %rbp
	movq	%rbx, %r11
	shrq	$6, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%rdx, %r11
	orq	$1, %r11
	andq	%r12, %r11
	leaq	(%r13,%r11), %rdx
	addq	%rdx, %rdi
	addq	%r8, %rdi
	leaq	-4(%rdi,%rcx), %rdi
	andq	56(%rsp), %rdi
	movabsq	$8589934591, %rcx
	movq	32(%rsp), %rdx
	leaq	-1(%rdx,%rdi), %rdx
	andq	%rcx, %rdx
	movq	%rdx, 56(%rsp)
	movabsq	$8589934591, %r8
	movabsq	$8589934591, %r12
	movq	%rax, %rdx
	orq	%rsi, %rdx
	movq	24(%rsp), %rcx
	andq	%rdx, %rcx
	movq	%rax, %rdx
	andq	%rsi, %rdx
	orq	%rcx, %rdx
	movabsq	$8589934591, %r13
	movq	%rax, %rcx
	salq	$10, %rcx
	leaq	-1023(%rcx), %r10
	movq	%rax, %rcx
	shrq	$22, %rcx
	orq	$1, %rcx
	orq	%r10, %rcx
	movq	%rax, %r10
	salq	$19, %r10
	leaq	-524287(%r10), %r11
	movq	%rax, %r10
	shrq	$13, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%rax, %r11
	salq	$30, %r11
	leaq	-1073741823(%r11), %rbp
	movq	%rax, %r11
	shrq	$2, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%rcx, %r11
	orq	$1, %r11
	andq	%r13, %r11
	leaq	-1(%r11,%rdx), %rdx
	andq	%r12, %rdx
	leaq	-1(%rdi,%rdx), %rdi
	andq	%r8, %rdi
	movq	48(%rsp), %rdx
	addq	$4, %rdx
	movabsq	$8589934591, %rcx
	movq	%rcx, 72(%rsp)
	movq	(%rsp), %rcx
	movq	-4(%rcx,%rdx,4), %r8
	movq	64(%rsp), %rcx
	movq	-4(%rcx,%rdx,4), %r12
	movq	%rbx, %rdx
	xorq	%r9, %rdx
	orq	$1, %rdx
	movq	56(%rsp), %rcx
	andq	%rdx, %rcx
	movq	%r9, %rdx
	xorq	%rcx, %rdx
	orq	$1, %rdx
	movabsq	$8589934591, %r13
	movq	56(%rsp), %rcx
	salq	$7, %rcx
	leaq	-127(%rcx), %r10
	movq	56(%rsp), %rcx
	shrq	$25, %rcx
	orq	$1, %rcx
	orq	%r10, %rcx
	movq	56(%rsp), %r10
	salq	$21, %r10
	leaq	-2097151(%r10), %r11
	movq	56(%rsp), %r10
	shrq	$11, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	56(%rsp), %r11
	salq	$26, %r11
	addq	$-67108863, %r11
	movq	56(%rsp), %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r11, %rbp
	xorq	%r10, %rbp
	xorq	%rcx, %rbp
	orq	$1, %rbp
	andq	%r13, %rbp
	movq	40(%rsp), %rcx
	addq	%rbp, %rcx
	addq	%rcx, %rdx
	addq	%r12, %rdx
	leaq	-4(%rdx,%r8), %rdx
	andq	72(%rsp), %rdx
	movabsq	$8589934591, %r8
	movq	24(%rsp), %rcx
	leaq	-1(%rcx,%rdx), %rcx
	andq	%r8, %rcx
	movq	%rcx, 72(%rsp)
	movabsq	$8589934591, %rcx
	movq	%rcx, 80(%rsp)
	movabsq	$8589934591, %r12
	movq	%rdi, %rcx
	orq	%rax, %rcx
	movq	%rsi, %r8
	andq	%rcx, %r8
	movq	%rdi, %rcx
	andq	%rax, %rcx
	orq	%r8, %rcx
	movabsq	$8589934591, %r13
	movq	%rdi, %r8
	salq	$10, %r8
	leaq	-1023(%r8), %r10
	movq	%rdi, %r8
	shrq	$22, %r8
	orq	$1, %r8
	orq	%r10, %r8
	movq	%rdi, %r10
	salq	$19, %r10
	leaq	-524287(%r10), %r11
	movq	%rdi, %r10
	shrq	$13, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%rdi, %r11
	salq	$30, %r11
	leaq	-1073741823(%r11), %rbp
	movq	%rdi, %r11
	shrq	$2, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%r8, %r11
	orq	$1, %r11
	andq	%r13, %r11
	leaq	-1(%r11,%rcx), %rcx
	andq	%r12, %rcx
	leaq	-1(%rdx,%rcx), %rdx
	andq	80(%rsp), %rdx
	movq	48(%rsp), %rcx
	addq	$6, %rcx
	movabsq	$8589934591, %r8
	movq	%r8, 80(%rsp)
	movq	(%rsp), %r8
	movq	-4(%r8,%rcx,4), %r8
	movq	%r8, 88(%rsp)
	movq	64(%rsp), %r8
	movq	-4(%r8,%rcx,4), %r12
	movq	56(%rsp), %rcx
	xorq	%rbx, %rcx
	orq	$1, %rcx
	movq	72(%rsp), %r8
	andq	%rcx, %r8
	movq	%rbx, %rcx
	xorq	%r8, %rcx
	orq	$1, %rcx
	movabsq	$8589934591, %r13
	movq	72(%rsp), %r8
	salq	$7, %r8
	leaq	-127(%r8), %r10
	movq	72(%rsp), %r8
	shrq	$25, %r8
	orq	$1, %r8
	orq	%r10, %r8
	movq	72(%rsp), %r10
	salq	$21, %r10
	leaq	-2097151(%r10), %r11
	movq	72(%rsp), %r10
	shrq	$11, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	72(%rsp), %r11
	salq	$26, %r11
	addq	$-67108863, %r11
	movq	72(%rsp), %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r11, %rbp
	xorq	%r10, %rbp
	xorq	%r8, %rbp
	orq	$1, %rbp
	andq	%r13, %rbp
	leaq	(%r9,%rbp), %r8
	addq	%r8, %rcx
	addq	%r12, %rcx
	movq	88(%rsp), %r8
	leaq	-4(%rcx,%r8), %rcx
	andq	80(%rsp), %rcx
	movabsq	$8589934591, %r8
	leaq	-1(%rsi,%rcx), %rsi
	andq	%r8, %rsi
	movq	%rsi, 80(%rsp)
	movabsq	$8589934591, %r9
	movabsq	$8589934591, %r12
	movq	%rdx, %rsi
	orq	%rdi, %rsi
	movq	%rax, %r8
	andq	%rsi, %r8
	movq	%rdx, %rsi
	andq	%rdi, %rsi
	orq	%r8, %rsi
	movabsq	$8589934591, %r13
	movq	%rdx, %r8
	salq	$10, %r8
	leaq	-1023(%r8), %r10
	movq	%rdx, %r8
	shrq	$22, %r8
	orq	$1, %r8
	orq	%r10, %r8
	movq	%rdx, %r10
	salq	$19, %r10
	leaq	-524287(%r10), %r11
	movq	%rdx, %r10
	shrq	$13, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%rdx, %r11
	salq	$30, %r11
	leaq	-1073741823(%r11), %rbp
	movq	%rdx, %r11
	shrq	$2, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%r8, %r11
	orq	$1, %r11
	andq	%r13, %r11
	leaq	-1(%r11,%rsi), %rsi
	andq	%r12, %rsi
	leaq	-1(%rcx,%rsi), %rsi
	andq	%r9, %rsi
	movq	48(%rsp), %rcx
	addq	$8, %rcx
	movabsq	$8589934591, %r8
	movq	%r8, 88(%rsp)
	movq	(%rsp), %r8
	movq	-4(%r8,%rcx,4), %r9
	movq	64(%rsp), %r8
	movq	-4(%r8,%rcx,4), %r12
	movq	72(%rsp), %rcx
	xorq	56(%rsp), %rcx
	orq	$1, %rcx
	movq	80(%rsp), %r8
	andq	%rcx, %r8
	movq	56(%rsp), %rcx
	xorq	%r8, %rcx
	orq	$1, %rcx
	movabsq	$8589934591, %r13
	movq	80(%rsp), %r8
	salq	$7, %r8
	leaq	-127(%r8), %r10
	movq	80(%rsp), %r8
	shrq	$25, %r8
	orq	$1, %r8
	orq	%r10, %r8
	movq	80(%rsp), %r10
	salq	$21, %r10
	leaq	-2097151(%r10), %r11
	movq	80(%rsp), %r10
	shrq	$11, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	80(%rsp), %r11
	salq	$26, %r11
	addq	$-67108863, %r11
	movq	80(%rsp), %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r11, %rbp
	xorq	%r10, %rbp
	xorq	%r8, %rbp
	orq	$1, %rbp
	andq	%r13, %rbp
	addq	%rbp, %rbx
	addq	%rcx, %rbx
	addq	%r12, %rbx
	leaq	-4(%rbx,%r9), %rbx
	andq	88(%rsp), %rbx
	movabsq	$8589934591, %rcx
	leaq	-1(%rax,%rbx), %rax
	andq	%rcx, %rax
	movabsq	$8589934591, %r9
	movabsq	$8589934591, %r12
	movq	%rsi, %rcx
	orq	%rdx, %rcx
	movq	%rdi, %r8
	andq	%rcx, %r8
	movq	%rsi, %rcx
	andq	%rdx, %rcx
	orq	%r8, %rcx
	movabsq	$8589934591, %r13
	movq	%rsi, %r8
	salq	$10, %r8
	leaq	-1023(%r8), %r10
	movq	%rsi, %r8
	shrq	$22, %r8
	orq	$1, %r8
	orq	%r10, %r8
	movq	%rsi, %r10
	salq	$19, %r10
	leaq	-524287(%r10), %r11
	movq	%rsi, %r10
	shrq	$13, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%rsi, %r11
	salq	$30, %r11
	leaq	-1073741823(%r11), %rbp
	movq	%rsi, %r11
	shrq	$2, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%r8, %r11
	orq	$1, %r11
	andq	%r13, %r11
	leaq	-1(%r11,%rcx), %rcx
	andq	%r12, %rcx
	leaq	-1(%rbx,%rcx), %r8
	andq	%r9, %r8
	movq	48(%rsp), %rbx
	addq	$10, %rbx
	movabsq	$8589934591, %rcx
	movq	%rcx, 88(%rsp)
	movq	(%rsp), %rcx
	movq	-4(%rcx,%rbx,4), %r9
	movq	64(%rsp), %rcx
	movq	-4(%rcx,%rbx,4), %r12
	movq	80(%rsp), %rbx
	xorq	72(%rsp), %rbx
	orq	$1, %rbx
	movq	%rax, %rcx
	andq	%rbx, %rcx
	movq	72(%rsp), %rbx
	xorq	%rcx, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r13
	movq	%rax, %rcx
	salq	$7, %rcx
	leaq	-127(%rcx), %r10
	movq	%rax, %rcx
	shrq	$25, %rcx
	orq	$1, %rcx
	orq	%r10, %rcx
	movq	%rax, %r10
	salq	$21, %r10
	leaq	-2097151(%r10), %r11
	movq	%rax, %r10
	shrq	$11, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%rax, %r11
	salq	$26, %r11
	leaq	-67108863(%r11), %rbp
	movq	%rax, %r11
	shrq	$6, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%rcx, %r11
	orq	$1, %r11
	andq	%r13, %r11
	movq	56(%rsp), %rcx
	addq	%r11, %rcx
	addq	%rcx, %rbx
	addq	%r12, %rbx
	leaq	-4(%rbx,%r9), %rbx
	andq	88(%rsp), %rbx
	movabsq	$8589934591, %rcx
	leaq	-1(%rdi,%rbx), %r13
	andq	%rcx, %r13
	movabsq	$8589934591, %rdi
	movq	%rdi, 56(%rsp)
	movabsq	$8589934591, %r9
	movq	%r8, %rdi
	orq	%rsi, %rdi
	movq	%rdx, %rcx
	andq	%rdi, %rcx
	movq	%r8, %rdi
	andq	%rsi, %rdi
	orq	%rcx, %rdi
	movabsq	$8589934591, %r12
	movq	%r8, %rcx
	salq	$10, %rcx
	leaq	-1023(%rcx), %r10
	movq	%r8, %rcx
	shrq	$22, %rcx
	orq	$1, %rcx
	orq	%r10, %rcx
	movq	%r8, %r10
	salq	$19, %r10
	leaq	-524287(%r10), %r11
	movq	%r8, %r10
	shrq	$13, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%r8, %r11
	salq	$30, %r11
	leaq	-1073741823(%r11), %rbp
	movq	%r8, %r11
	shrq	$2, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%rcx, %r11
	orq	$1, %r11
	andq	%r12, %r11
	leaq	-1(%r11,%rdi), %rdi
	andq	%r9, %rdi
	leaq	-1(%rbx,%rdi), %rcx
	andq	56(%rsp), %rcx
	movq	48(%rsp), %rbx
	addq	$12, %rbx
	movabsq	$8589934591, %rdi
	movq	%rdi, 56(%rsp)
	movq	(%rsp), %rdi
	movq	-4(%rdi,%rbx,4), %rdi
	movq	%rdi, 88(%rsp)
	movq	64(%rsp), %rdi
	movq	-4(%rdi,%rbx,4), %r9
	movq	%rax, %rbx
	xorq	80(%rsp), %rbx
	orq	$1, %rbx
	movq	%r13, %rdi
	andq	%rbx, %rdi
	movq	80(%rsp), %rbx
	xorq	%rdi, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r12
	movq	%r13, %rdi
	salq	$7, %rdi
	leaq	-127(%rdi), %r10
	movq	%r13, %rdi
	shrq	$25, %rdi
	orq	$1, %rdi
	orq	%r10, %rdi
	movq	%r13, %r10
	salq	$21, %r10
	leaq	-2097151(%r10), %r11
	movq	%r13, %r10
	shrq	$11, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%r13, %r11
	salq	$26, %r11
	leaq	-67108863(%r11), %rbp
	movq	%r13, %r11
	shrq	$6, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%rdi, %r11
	orq	$1, %r11
	andq	%r12, %r11
	movq	72(%rsp), %rdi
	addq	%r11, %rdi
	addq	%rdi, %rbx
	addq	%r9, %rbx
	movq	88(%rsp), %rdi
	leaq	-4(%rbx,%rdi), %rbx
	andq	56(%rsp), %rbx
	movabsq	$8589934591, %rdi
	leaq	-1(%rdx,%rbx), %rdx
	andq	%rdi, %rdx
	movabsq	$8589934591, %rdi
	movq	%rdi, 56(%rsp)
	movabsq	$8589934591, %rdi
	movq	%rdi, 72(%rsp)
	movq	%rcx, %rdi
	orq	%r8, %rdi
	movq	%rsi, %r9
	andq	%rdi, %r9
	movq	%rcx, %rdi
	andq	%r8, %rdi
	orq	%r9, %rdi
	movabsq	$8589934591, %r12
	movq	%rcx, %r9
	salq	$10, %r9
	leaq	-1023(%r9), %r10
	movq	%rcx, %r9
	shrq	$22, %r9
	orq	$1, %r9
	orq	%r10, %r9
	movq	%rcx, %r10
	salq	$19, %r10
	leaq	-524287(%r10), %r11
	movq	%rcx, %r10
	shrq	$13, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%rcx, %r11
	salq	$30, %r11
	leaq	-1073741823(%r11), %rbp
	movq	%rcx, %r11
	shrq	$2, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%r9, %r11
	orq	$1, %r11
	andq	%r12, %r11
	leaq	-1(%r11,%rdi), %rdi
	andq	72(%rsp), %rdi
	leaq	-1(%rbx,%rdi), %rdi
	andq	56(%rsp), %rdi
	movq	48(%rsp), %rbx
	addq	$14, %rbx
	movabsq	$8589934591, %r9
	movq	%r9, 48(%rsp)
	movq	(%rsp), %r9
	movq	-4(%r9,%rbx,4), %r9
	movq	%r9, 56(%rsp)
	movq	64(%rsp), %r9
	movq	-4(%r9,%rbx,4), %rbx
	movq	%rbx, 64(%rsp)
	movq	%r13, %rbx
	xorq	%rax, %rbx
	orq	$1, %rbx
	movq	%rdx, %r9
	andq	%rbx, %r9
	movq	%rax, %rbx
	xorq	%r9, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r12
	movq	%rdx, %r9
	salq	$7, %r9
	leaq	-127(%r9), %r10
	movq	%rdx, %r9
	shrq	$25, %r9
	orq	$1, %r9
	orq	%r10, %r9
	movq	%rdx, %r10
	salq	$21, %r10
	leaq	-2097151(%r10), %r11
	movq	%rdx, %r10
	shrq	$11, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%rdx, %r11
	salq	$26, %r11
	leaq	-67108863(%r11), %rbp
	movq	%rdx, %r11
	shrq	$6, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%r9, %r11
	orq	$1, %r11
	andq	%r12, %r11
	movq	80(%rsp), %r9
	addq	%r11, %r9
	addq	%r9, %rbx
	movq	64(%rsp), %r9
	addq	%r9, %rbx
	movq	56(%rsp), %r9
	leaq	-4(%rbx,%r9), %rbx
	andq	48(%rsp), %rbx
	movabsq	$8589934591, %r12
	leaq	-1(%rsi,%rbx), %r9
	andq	%r12, %r9
	movabsq	$8589934591, %rsi
	movq	%rsi, 48(%rsp)
	movabsq	$8589934591, %rsi
	movq	%rsi, 56(%rsp)
	movq	%rdi, %rsi
	orq	%rcx, %rsi
	movq	%r8, %r12
	andq	%rsi, %r12
	movq	%rdi, %rsi
	andq	%rcx, %rsi
	orq	%r12, %rsi
	movabsq	$8589934591, %r12
	movq	%r12, 64(%rsp)
	movq	%rdi, %r12
	salq	$10, %r12
	leaq	-1023(%r12), %r10
	movq	%rdi, %r12
	shrq	$22, %r12
	orq	$1, %r12
	orq	%r10, %r12
	movq	%rdi, %r10
	salq	$19, %r10
	leaq	-524287(%r10), %r11
	movq	%rdi, %r10
	shrq	$13, %r10
	orq	$1, %r10
	orq	%r11, %r10
	movq	%rdi, %r11
	salq	$30, %r11
	leaq	-1073741823(%r11), %rbp
	movq	%rdi, %r11
	shrq	$2, %r11
	orq	$1, %r11
	orq	%rbp, %r11
	xorq	%r10, %r11
	xorq	%r12, %r11
	orq	$1, %r11
	andq	64(%rsp), %r11
	leaq	-1(%r11,%rsi), %rsi
	andq	56(%rsp), %rsi
	leaq	-1(%rbx,%rsi), %rsi
	andq	48(%rsp), %rsi
	movq	16(%rsp), %rbx
	addq	$2, %rbx
	movq	%rbx, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movq	%rcx, 32(%rsp)
	movq	%rdx, 40(%rsp)
	jmp	.L439
	.cfi_adjust_cfa_offset -104
	.cfi_endproc
	.type camlSha256__rounds_11_27_code,@function
	.size camlSha256__rounds_11_27_code,. - camlSha256__rounds_11_27_code
	.text
	.align	16
	.globl	camlSha256__transform_12_28_code
camlSha256__transform_12_28_code:
.LcamlSha256__transform_12_28_code:
	.cfi_startproc
	movl	$1, %edi
	movq	24(%rax), %rbx
	jmp	camlSha256__transform_from_10_26_code@PLT
	.cfi_endproc
	.type camlSha256__transform_12_28_code,@function
	.size camlSha256__transform_12_28_code,. - camlSha256__transform_12_28_code
	.text
	.align	16
	.globl	camlSha256__init_13_29_code
camlSha256__init_13_29_code:
.LcamlSha256__init_13_29_code:
	.cfi_startproc
	movq	(%rax), %rbx
	movq	-8(%rbx), %rdi
	salq	$8, %rdi
	shrq	$17, %rdi
	orq	$1, %rdi
	cmpq	$1, %rdi
	jbe	.L1113
	movl	$3558067407, %esi
	movq	%rsi, (%rbx)
	cmpq	$3, %rdi
	jbe	.L1107
	movabsq	$6288268555, %rsi
	movq	%rsi, 8(%rbx)
	cmpq	$5, %rdi
	jbe	.L1101
	movq	$2027808485, 16(%rbx)
	cmpq	$7, %rdi
	jbe	.L1095
	movabsq	$5546961525, %rsi
	movq	%rsi, 24(%rbx)
	cmpq	$9, %rdi
	jbe	.L1089
	movl	$2719786239, %esi
	movq	%rsi, 32(%rbx)
	cmpq	$11, %rdi
	jbe	.L1083
	movabsq	$5201645849, %rsi
	movq	%rsi, 40(%rbx)
	cmpq	$13, %rdi
	jbe	.L1077
	movq	$1057469271, 48(%rbx)
	cmpq	$15, %rdi
	jbe	.L1071
	movl	$3082918451, %edi
	movq	%rdi, 56(%rbx)
	movq	$1, 16(%rax)
	movq	8(%rax), %rax
	movq	-8(%rax), %rbx
	salq	$8, %rbx
	shrq	$17, %rbx
	orq	$1, %rbx
	cmpq	$1, %rbx
	jbe	.L1065
	movq	$1, (%rax)
	cmpq	$3, %rbx
	jbe	.L1059
	movq	$1, 8(%rax)
	movl	$1, %eax
	ret
	.align	4
.L1059:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1065:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1071:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1077:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1083:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1089:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1095:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1101:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1107:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1113:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.cfi_endproc
	.type camlSha256__init_13_29_code,@function
	.size camlSha256__init_13_29_code,. - camlSha256__init_13_29_code
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
	jbe	.L1355
	movq	8(%rax), %rsi
	movabsq	$8589934591, %rcx
	leaq	-8(%rsi,%r13,8), %rdx
	andq	%rcx, %rdx
	movq	%rdx, 8(%rax)
	cmpq	%rsi, %rdx
	jge	.L1162
	cmpq	$1, %rdi
	jbe	.L1153
	movabsq	$8589934591, %rdx
	movq	(%rax), %rsi
	addq	$2, %rsi
	andq	%rdx, %rsi
	movq	%rsi, (%rax)
	cmpq	$1, %rdi
	jbe	.L1348
	jmp	.L1164
	.align	4
.L1153:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1162:
	cmpq	$1, %rdi
	jbe	.L1348
.L1164:
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
	je	.L1273
	movl	$130, %r8d
	subq	%rcx, %r8
	cmpq	%r8, %r13
	jge	.L1226
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L1186
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1186:
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
	jge	.L1199
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1199:
	cmpq	$1, %rcx
	jge	.L1203
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1203:
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
	jle	.L1216
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1216:
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	16(%r12), %rax
	leaq	-1(%rax,%r13), %rax
	movq	%rax, 16(%r12)
	movl	$1, %eax
	movl	$1, %esi
	jmp	.L1358
	.align	4
.L1226:
	movq	24(%r12), %rbp
	cmpq	$1, %r8
	jge	.L1232
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1232:
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
	jge	.L1245
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1245:
	cmpq	$1, %rcx
	jge	.L1249
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1249:
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
	jle	.L1262
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1262:
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
	call	camlSha256__transform_from_10_26_code@PLT
.L1365:
	xorl	%eax, %eax
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rsi
	subq	%rsi, %rbx
	leaq	1(%rbx), %r13
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	jmp	.L1286
	.align	4
.L1273:
	xorl	%eax, %eax
	movl	$1, %esi
.L1286:
	movq	%rbx, 8(%rsp)
	movq	%r12, (%rsp)
	cmpq	$129, %r13
	jl	.L1295
.L1290:
	movq	%r13, 24(%rsp)
	movq	%r12, %rax
	movq	%rsi, %rdi
	movq	%rsi, 16(%rsp)
	call	camlSha256__transform_from_10_26_code@PLT
.L1366:
	movq	24(%rsp), %r13
	addq	$-128, %r13
	movq	16(%rsp), %rsi
	addq	$128, %rsi
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	cmpq	$129, %r13
	jge	.L1290
.L1295:
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L1304
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1304:
	cmpq	$1, %rsi
	jge	.L1308
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1308:
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
	jle	.L1321
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1321:
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
	jge	.L1334
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1334:
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	%r13, 16(%r12)
	jmp	.L1358
	.align	4
.L1348:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1355:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1358:
	movl	$1, %eax
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
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
	jae	.L1682
	movq	$-128, %rdx
	movb	%dl, (%rbx,%rsi)
	leaq	2(%rax), %rsi
	cmpq	$113, %rsi
	jle	.L1415
	movl	$130, %edx
	subq	%rsi, %rdx
	cmpq	$1, %rsi
	jge	.L1394
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1394:
	cmpq	$1, %rdx
	jge	.L1398
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1398:
	movq	%rdi, %rax
	salq	$1, %rax
	subq	%rdx, %rax
	addq	$2, %rax
	cmpq	%rax, %rsi
	jle	.L1405
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1405:
	movq	%rdi, 24(%rsp)
	movq	%r13, 8(%rsp)
	movl	$1, %ecx
	movq	%rbx, %rdi
	call	caml_fill_bytes@PLT
	movl	$1, %edi
	movq	%r12, %rax
	movq	%r12, (%rsp)
	movq	%rbx, 16(%rsp)
	call	camlSha256__transform_from_10_26_code@PLT
.L1687:
	movl	$1, %esi
	movq	(%rsp), %r12
	movq	8(%rsp), %r13
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rdi
.L1415:
	movl	$114, %edx
	subq	%rsi, %rdx
	cmpq	$1, %rsi
	jge	.L1420
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1420:
	cmpq	$1, %rdx
	jge	.L1424
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1424:
	salq	$1, %rdi
	subq	%rdx, %rdi
	leaq	2(%rdi), %rax
	cmpq	%rax, %rsi
	jle	.L1431
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1431:
	movl	$1, %ecx
	movq	%rbx, %rdi
	call	caml_fill_bytes@PLT
	movq	8(%r12), %rax
	movq	-8(%rax), %rdi
	salq	$8, %rdi
	shrq	$17, %rdi
	orq	$1, %rdi
	cmpq	$1, %rdi
	jbe	.L1672
	movq	(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$24, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L1450
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1450:
	cmpq	$511, %rdx
	jle	.L1454
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1454:
	sarq	$1, %rdx
	movb	%dl, 56(%rbx)
	movq	%rsi, %rdx
	shrq	$16, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L1463
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1463:
	cmpq	$511, %rdx
	jle	.L1467
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1467:
	sarq	$1, %rdx
	movb	%dl, 57(%rbx)
	movq	%rsi, %rdx
	shrq	$8, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L1476
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1476:
	cmpq	$511, %rdx
	jle	.L1480
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1480:
	sarq	$1, %rdx
	movb	%dl, 58(%rbx)
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L1487
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1487:
	cmpq	$511, %rsi
	jle	.L1491
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1491:
	sarq	$1, %rsi
	movb	%sil, 59(%rbx)
	cmpq	$3, %rdi
	jbe	.L1658
	movq	8(%rax), %rax
	movq	%rax, %rdi
	shrq	$24, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L1506
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1506:
	cmpq	$511, %rdi
	jle	.L1510
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1510:
	sarq	$1, %rdi
	movb	%dil, 60(%rbx)
	movq	%rax, %rdi
	shrq	$16, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L1519
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1519:
	cmpq	$511, %rdi
	jle	.L1523
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1523:
	sarq	$1, %rdi
	movb	%dil, 61(%rbx)
	movq	%rax, %rdi
	shrq	$8, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L1532
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1532:
	cmpq	$511, %rdi
	jle	.L1536
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1536:
	sarq	$1, %rdi
	movb	%dil, 62(%rbx)
	andl	$511, %eax
	cmpq	$1, %rax
	jge	.L1543
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1543:
	cmpq	$511, %rax
	jle	.L1547
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1547:
	movq	%r13, 8(%rsp)
	sarq	$1, %rax
	movb	%al, 63(%rbx)
	movl	$1, %edi
	movq	%r12, %rax
	movq	%r12, (%rsp)
	call	camlSha256__transform_from_10_26_code@PLT
.L1688:
	xorl	%eax, %eax
	movq	(%rsp), %rdx
	movq	8(%rsp), %rcx
.L1555:
	leaq	1(%rax,%rax), %rbx
	movq	(%rdx), %rdi
	movq	-8(%rdi), %rsi
	salq	$8, %rsi
	shrq	$17, %rsi
	cmpq	%rsi, %rbx
	jae	.L1643
	movq	-4(%rdi,%rbx,4), %rdi
	leaq	-3(,%rbx,4), %rbx
	movq	%rdi, %rsi
	shrq	$24, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L1574
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1574:
	cmpq	$511, %rsi
	jle	.L1578
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1578:
	movq	%rbx, %r8
	sarq	$1, %r8
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r8)
	movq	%rdi, %rsi
	shrq	$16, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L1588
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1588:
	cmpq	$511, %rsi
	jle	.L1592
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1592:
	leaq	2(%rbx), %r8
	sarq	$1, %r8
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r8)
	movq	%rdi, %rsi
	shrq	$8, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L1603
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1603:
	cmpq	$511, %rsi
	jle	.L1607
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1607:
	leaq	4(%rbx), %r8
	sarq	$1, %r8
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r8)
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L1616
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1616:
	cmpq	$511, %rdi
	jle	.L1620
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1620:
	addq	$6, %rbx
	sarq	$1, %rbx
	sarq	$1, %rdi
	movb	%dil, (%rcx,%rbx)
	incq	%rax
	cmpq	$7, %rax
	jle	.L1555
	movl	$1, %eax
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.align	4
.L1643:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1658:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1672:
	leaq	.LcamlSha256__block506(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1682:
	leaq	.LcamlSha256__block506(%rip), %rax
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
	leaq	.LcamlSha256__Pmakearray1038(%rip), %rax
	movq	%rax, %rdi
	movq	caml_obj_dup@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L1704:
	movq	%rax, %rbx
	leaq	.LcamlSha256__rounds_27(%rip), %rax
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
	.4byte	(.L1704 - .) + 0
	.2byte	17
	.2byte	0
	.align	4
	.4byte	(.L1705 - .) + 0
	.align	8
	.4byte	(.L1688 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L1706 - .) + 0
	.align	8
	.4byte	(.L1687 - .) + 0
	.2byte	49
	.2byte	3
	.2byte	0
	.2byte	8
	.2byte	16
	.align	4
	.4byte	(.L1707 - .) + 0
	.align	8
	.4byte	(.L1366 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L1708 - .) + 0
	.align	8
	.4byte	(.L1365 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L1709 - .) + 0
	.align	8
	.4byte	(.L225 - .) + 0
	.2byte	34
	.2byte	4
	.2byte	0
	.2byte	3
	.2byte	8
	.2byte	16
	.byte	1
	.byte	4
	.align	8
	.4byte	(.L223 - .) + 0
	.2byte	33
	.2byte	3
	.2byte	0
	.2byte	8
	.2byte	16
	.align	4
	.4byte	(.L1710 - .) + 0
	.align	8
	.4byte	(.L222 - .) + 0
	.2byte	33
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L1711 - .) + 0
	.align	8
	.4byte	(.L221 - .) + 0
	.2byte	33
	.2byte	1
	.2byte	0
	.align	4
	.4byte	(.L1712 - .) + 0
	.align	8
	.4byte	(.L220 - .) + 0
	.2byte	33
	.2byte	0
	.align	4
	.4byte	(.L1713 - .) + 0
	.align	8
	.align	4
.L1708:
	.4byte	(.L1715 - .) + 0
	.4byte	109582608
	.align	4
.L1712:
	.4byte	(.L1717 - .) + 1
	.4byte	31467664
	.4byte	(.L1718 - .) + 0
	.4byte	29897992
	.align	4
.L1710:
	.4byte	(.L1718 - .) + 0
	.4byte	28325080
	.align	4
.L1707:
	.4byte	(.L1719 - .) + 1
	.4byte	85479832
	.4byte	(.L1720 - .) + 0
	.4byte	119017608
	.align	4
.L1705:
	.4byte	(.L1721 - .) + 1140850688
	.4byte	-2147377152
	.align	4
.L1711:
	.4byte	(.L1718 - .) + 0
	.4byte	28849368
	.align	4
.L1706:
	.4byte	(.L1719 - .) + 1
	.4byte	85479832
	.4byte	(.L1720 - .) + 0
	.4byte	123209848
	.align	4
.L1709:
	.4byte	(.L1719 - .) + 1
	.4byte	85479832
	.4byte	(.L1715 - .) + 0
	.4byte	104863896
	.align	4
.L1713:
	.4byte	(.L1718 - .) + 0
	.4byte	30422240
.L1716:
	.ascii	"bytes.ml\0"
.L1714:
	.ascii	"sha256.ml\0"
	.align	4
.L1720:
	.4byte	(.L1714 - .) + 0
	.ascii	"Sha256.finish\0"
	.align	4
.L1717:
	.4byte	(.L1716 - .) + 0
	.ascii	"Stdlib__Bytes.make\0"
	.align	4
.L1721:
	.4byte	(.L1714 - .) + 0
	.2byte	16
	.2byte	2
	.4byte	820
	.ascii	"Sha256.constants\0"
	.align	4
.L1718:
	.4byte	(.L1714 - .) + 0
	.ascii	"Sha256.create\0"
	.align	4
.L1715:
	.4byte	(.L1714 - .) + 0
	.ascii	"Sha256.add_data\0"
	.align	4
.L1719:
	.4byte	(.L1714 - .) + 0
	.ascii	"Sha256.transform\0"
	.align	8
	.size camlSha256__frametable,. - camlSha256__frametable
	.data
	.section .note.GNU-stack,"",@progbits
