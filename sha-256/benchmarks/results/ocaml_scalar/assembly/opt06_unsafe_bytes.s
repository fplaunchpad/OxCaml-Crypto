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
.LcamlSha256__Pmakearray1042:
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
.LcamlSha256__block503:
	.8byte	caml_exn_Invalid_argument
	.8byte	.LcamlSha256__string501
	.data
	.align	8
	.8byte	4092
.LcamlSha256__string501:
	.ascii	"index out of bounds"
	.space	4
	.byte	4
	.text
	.align	16
	.globl	camlSha256__rotr_0_16_code
camlSha256__rotr_0_16_code:
.LcamlSha256__rotr_0_16_code:
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
	.type camlSha256__big_sigma0_3_19_code,@function
	.size camlSha256__big_sigma0_3_19_code,. - camlSha256__big_sigma0_3_19_code
	.text
	.align	16
	.globl	camlSha256__big_sigma1_4_20_code
camlSha256__big_sigma1_4_20_code:
.LcamlSha256__big_sigma1_4_20_code:
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
	.type camlSha256__big_sigma1_4_20_code,@function
	.size camlSha256__big_sigma1_4_20_code,. - camlSha256__big_sigma1_4_20_code
	.text
	.align	16
	.globl	camlSha256__small_sigma0_5_21_code
camlSha256__small_sigma0_5_21_code:
.LcamlSha256__small_sigma0_5_21_code:
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
	.type camlSha256__small_sigma0_5_21_code,@function
	.size camlSha256__small_sigma0_5_21_code,. - camlSha256__small_sigma0_5_21_code
	.text
	.align	16
	.globl	camlSha256__small_sigma1_6_22_code
camlSha256__small_sigma1_6_22_code:
.LcamlSha256__small_sigma1_6_22_code:
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
	jge	.L266
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L266:
	cmpq	$511, %rsi
	jle	.L270
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L270:
	movq	%rbx, %rdx
	sarq	$1, %rdx
	sarq	$1, %rsi
	movb	%sil, (%rax,%rdx)
	movq	%rdi, %rsi
	shrq	$16, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L280
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L280:
	cmpq	$511, %rsi
	jle	.L284
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L284:
	leaq	2(%rbx), %rdx
	sarq	$1, %rdx
	sarq	$1, %rsi
	movb	%sil, (%rax,%rdx)
	movq	%rdi, %rsi
	shrq	$8, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L295
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L295:
	cmpq	$511, %rsi
	jle	.L299
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L299:
	leaq	4(%rbx), %rdx
	sarq	$1, %rdx
	sarq	$1, %rsi
	movb	%sil, (%rax,%rdx)
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L308
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L308:
	cmpq	$511, %rdi
	jle	.L312
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L312:
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
	movq	%rax, %r10
	movq	32(%r10), %rax
	xorl	%esi, %esi
.L336:
	leaq	1(%rsi,%rsi), %rdx
	leaq	-4(%rdi,%rdx,4), %rcx
	leaq	6(%rcx), %r8
	sarq	$1, %r8
	movzbq	(%rbx,%r8), %r8
	leaq	1(%r8,%r8), %r9
	leaq	4(%rcx), %r8
	sarq	$1, %r8
	movzbq	(%rbx,%r8), %r8
	salq	$9, %r8
	leaq	1(%r8), %r12
	leaq	2(%rcx), %r8
	sarq	$1, %r8
	movzbq	(%rbx,%r8), %r8
	salq	$17, %r8
	incq	%r8
	sarq	$1, %rcx
	movzbq	(%rbx,%rcx), %rcx
	salq	$25, %rcx
	incq	%rcx
	orq	%r8, %rcx
	orq	%r12, %rcx
	orq	%r9, %rcx
	movq	%rcx, -4(%rax,%rdx,4)
	incq	%rsi
	cmpq	$15, %rsi
	jle	.L336
	movl	$16, %ebx
.L377:
	leaq	1(%rbx,%rbx), %rdi
	movq	-124(%rax,%rdi,4), %rsi
	movq	-20(%rax,%rdi,4), %rdx
	movabsq	$8589934591, %r12
	movq	-132(%rax,%rdi,4), %r13
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
	movabsq	$8589934591, %r11
	movq	%rsi, %r8
	salq	$25, %r8
	addq	$-33554431, %r8
	andq	%r11, %r8
	shrq	$7, %rsi
	orq	$1, %rsi
	orq	%r8, %rsi
	xorq	%r9, %rsi
	xorq	%rcx, %rsi
	orq	$1, %rsi
	movq	-60(%rax,%rdi,4), %r9
	movq	%rdx, %rcx
	shrq	$10, %rcx
	movabsq	$8589934591, %r11
	movq	%rdx, %r8
	salq	$13, %r8
	addq	$-8191, %r8
	andq	%r11, %r8
	movq	%rdx, %r11
	shrq	$19, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r8
	salq	$15, %r8
	addq	$-32767, %r8
	andq	%rbp, %r8
	shrq	$17, %rdx
	orq	$1, %rdx
	orq	%r8, %rdx
	xorq	%r11, %rdx
	xorq	%rcx, %rdx
	orq	$1, %rdx
	addq	%r9, %rdx
	addq	%rdx, %rsi
	leaq	-3(%rsi,%r13), %rsi
	andq	%r12, %rsi
	movq	%rsi, -4(%rax,%rdi,4)
	incq	%rbx
	cmpq	$79, %rbx
	jle	.L377
	movq	(%r10), %rbx
	movq	56(%rbx), %r11
	movq	48(%rbx), %r13
	movq	40(%rbx), %r12
	movq	32(%rbx), %r9
	movq	24(%rbx), %r8
	movq	16(%rbx), %rcx
	movq	8(%rbx), %rdx
	movq	(%rbx), %rsi
	movl	$1, %edi
	movq	%r10, %rbx
	movq	%r11, 624(%r14)
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
	subq	$88, %rsp
	.cfi_adjust_cfa_offset 88
	movq	%rax, (%rsp)
	movq	%rbx, 8(%rsp)
	movq	624(%r14), %rax
	movq	%rdi, 16(%rsp)
	movq	%rdx, 24(%rsp)
	movq	%rcx, 32(%rsp)
.L448:
	movq	16(%rsp), %rbx
	cmpq	$15, %rbx
	jle	.L485
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
	leaq	-1(%rdi,%r12), %rdi
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
	addq	$88, %rsp
	.cfi_adjust_cfa_offset -88
	ret
	.cfi_adjust_cfa_offset 88
	.align	4
.L485:
	movq	16(%rsp), %rbx
	leaq	-7(,%rbx,8), %rbx
	movq	%rbx, 40(%rsp)
	movabsq	$8589934591, %rbx
	movq	%rbx, 48(%rsp)
	movq	(%rsp), %rbx
	movq	40(%rsp), %rdi
	movq	-4(%rbx,%rdi,4), %rdx
	leaq	.LcamlSha256__rounds_27(%rip), %rbx
	movq	24(%rbx), %rbx
	movq	%rbx, 56(%rsp)
	movq	40(%rsp), %rdi
	movq	-4(%rbx,%rdi,4), %rcx
	movq	%r12, %rbx
	xorq	%r13, %rbx
	orq	$1, %rbx
	movq	%r9, %rdi
	andq	%rbx, %rdi
	movq	%r13, %rbx
	xorq	%rdi, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r10
	movq	%r9, %rdi
	salq	$7, %rdi
	addq	$-127, %rdi
	andq	%r10, %rdi
	movq	%r9, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rdi, %r10
	movabsq	$8589934591, %r11
	movq	%r9, %rdi
	salq	$21, %rdi
	addq	$-2097151, %rdi
	andq	%r11, %rdi
	movq	%r9, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rdi, %r11
	movabsq	$8589934591, %rbp
	movq	%r9, %rdi
	salq	$26, %rdi
	addq	$-67108863, %rdi
	andq	%rbp, %rdi
	movq	%r9, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%rdi, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rax
	addq	%rbx, %rax
	addq	%rcx, %rax
	leaq	-4(%rax,%rdx), %rax
	andq	48(%rsp), %rax
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
	movabsq	$8589934591, %r10
	movq	%rsi, %rdx
	salq	$10, %rdx
	addq	$-1023, %rdx
	andq	%r10, %rdx
	movq	%rsi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%rdx, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %rdx
	salq	$19, %rdx
	addq	$-524287, %rdx
	andq	%r11, %rdx
	movq	%rsi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%rdx, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %rdx
	salq	$30, %rdx
	addq	$-1073741823, %rdx
	andq	%rbp, %rdx
	movq	%rsi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%rdx, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rdi), %rdi
	andq	%r8, %rdi
	leaq	-1(%rax,%rdi), %rax
	andq	%rcx, %rax
	movq	40(%rsp), %rdi
	addq	$2, %rdi
	movabsq	$8589934591, %rdx
	movq	%rdx, 48(%rsp)
	movq	(%rsp), %rdx
	movq	-4(%rdx,%rdi,4), %rcx
	movq	56(%rsp), %rdx
	movq	-4(%rdx,%rdi,4), %r8
	movq	%r9, %rdi
	xorq	%r12, %rdi
	orq	$1, %rdi
	movq	%rbx, %rdx
	andq	%rdi, %rdx
	movq	%r12, %rdi
	xorq	%rdx, %rdi
	orq	$1, %rdi
	movabsq	$8589934591, %r10
	movq	%rbx, %rdx
	salq	$7, %rdx
	addq	$-127, %rdx
	andq	%r10, %rdx
	movq	%rbx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rdx, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %rdx
	salq	$21, %rdx
	addq	$-2097151, %rdx
	andq	%r11, %rdx
	movq	%rbx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rdx, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %rdx
	salq	$26, %rdx
	addq	$-67108863, %rdx
	andq	%rbp, %rdx
	movq	%rbx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%rdx, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	(%r13,%rbp), %rdx
	addq	%rdx, %rdi
	addq	%r8, %rdi
	leaq	-4(%rdi,%rcx), %rdi
	andq	48(%rsp), %rdi
	movabsq	$8589934591, %rcx
	movq	32(%rsp), %rdx
	leaq	-1(%rdx,%rdi), %rdx
	andq	%rcx, %rdx
	movq	%rdx, 48(%rsp)
	movabsq	$8589934591, %r8
	movabsq	$8589934591, %r13
	movq	%rax, %rdx
	orq	%rsi, %rdx
	movq	24(%rsp), %rcx
	andq	%rdx, %rcx
	movq	%rax, %rdx
	andq	%rsi, %rdx
	orq	%rcx, %rdx
	movabsq	$8589934591, %r10
	movq	%rax, %rcx
	salq	$10, %rcx
	addq	$-1023, %rcx
	andq	%r10, %rcx
	movq	%rax, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%rcx, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %rcx
	salq	$19, %rcx
	addq	$-524287, %rcx
	andq	%r11, %rcx
	movq	%rax, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%rcx, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %rcx
	salq	$30, %rcx
	addq	$-1073741823, %rcx
	andq	%rbp, %rcx
	movq	%rax, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%rcx, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rdx), %rdx
	andq	%r13, %rdx
	leaq	-1(%rdi,%rdx), %rdx
	andq	%r8, %rdx
	movq	40(%rsp), %rdi
	addq	$4, %rdi
	movabsq	$8589934591, %rcx
	movq	%rcx, 64(%rsp)
	movq	(%rsp), %rcx
	movq	-4(%rcx,%rdi,4), %r8
	movq	56(%rsp), %rcx
	movq	-4(%rcx,%rdi,4), %r13
	movq	%rbx, %rdi
	xorq	%r9, %rdi
	orq	$1, %rdi
	movq	48(%rsp), %rcx
	andq	%rdi, %rcx
	movq	%r9, %rdi
	xorq	%rcx, %rdi
	orq	$1, %rdi
	movabsq	$8589934591, %r10
	movq	48(%rsp), %rcx
	salq	$7, %rcx
	addq	$-127, %rcx
	andq	%r10, %rcx
	movq	48(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rcx, %r10
	movabsq	$8589934591, %r11
	movq	48(%rsp), %rcx
	salq	$21, %rcx
	addq	$-2097151, %rcx
	andq	%r11, %rcx
	movq	48(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rcx, %r11
	movabsq	$8589934591, %rcx
	movq	48(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%rcx, %rbp
	movq	48(%rsp), %rcx
	shrq	$6, %rcx
	orq	$1, %rcx
	orq	%rbp, %rcx
	xorq	%r11, %rcx
	xorq	%r10, %rcx
	orq	$1, %rcx
	addq	%r12, %rcx
	addq	%rcx, %rdi
	addq	%r13, %rdi
	leaq	-4(%rdi,%r8), %rdi
	andq	64(%rsp), %rdi
	movabsq	$8589934591, %r8
	movq	24(%rsp), %rcx
	leaq	-1(%rcx,%rdi), %rcx
	andq	%r8, %rcx
	movq	%rcx, 64(%rsp)
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdx, %rcx
	orq	%rax, %rcx
	movq	%rsi, %r8
	andq	%rcx, %r8
	movq	%rdx, %rcx
	andq	%rax, %rcx
	orq	%r8, %rcx
	movabsq	$8589934591, %r10
	movq	%rdx, %r8
	salq	$10, %r8
	addq	$-1023, %r8
	andq	%r10, %r8
	movq	%rdx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r8, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r8
	salq	$19, %r8
	addq	$-524287, %r8
	andq	%r11, %r8
	movq	%rdx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r8
	salq	$30, %r8
	addq	$-1073741823, %r8
	andq	%rbp, %r8
	movq	%rdx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r8, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rcx), %rcx
	andq	%r13, %rcx
	leaq	-1(%rdi,%rcx), %rdi
	andq	%r12, %rdi
	movq	40(%rsp), %rcx
	addq	$6, %rcx
	movabsq	$8589934591, %r8
	movq	%r8, 72(%rsp)
	movq	(%rsp), %r8
	movq	-4(%r8,%rcx,4), %r12
	movq	56(%rsp), %r8
	movq	-4(%r8,%rcx,4), %r13
	movq	48(%rsp), %rcx
	xorq	%rbx, %rcx
	orq	$1, %rcx
	movq	64(%rsp), %r8
	andq	%rcx, %r8
	movq	%rbx, %rcx
	xorq	%r8, %rcx
	orq	$1, %rcx
	movabsq	$8589934591, %r10
	movq	64(%rsp), %r8
	salq	$7, %r8
	addq	$-127, %r8
	andq	%r10, %r8
	movq	64(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r8, %r10
	movabsq	$8589934591, %r11
	movq	64(%rsp), %r8
	salq	$21, %r8
	addq	$-2097151, %r8
	andq	%r11, %r8
	movq	64(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %r8
	movq	64(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r8, %rbp
	movq	64(%rsp), %r8
	shrq	$6, %r8
	orq	$1, %r8
	orq	%rbp, %r8
	xorq	%r11, %r8
	xorq	%r10, %r8
	orq	$1, %r8
	addq	%r9, %r8
	addq	%r8, %rcx
	addq	%r13, %rcx
	leaq	-4(%rcx,%r12), %rcx
	andq	72(%rsp), %rcx
	movabsq	$8589934591, %r8
	leaq	-1(%rsi,%rcx), %rsi
	andq	%r8, %rsi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rdi, %r8
	orq	%rdx, %r8
	movq	%rax, %r9
	andq	%r8, %r9
	movq	%rdi, %r8
	andq	%rdx, %r8
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
	leaq	-1(%rcx,%r8), %rcx
	andq	%r12, %rcx
	movq	40(%rsp), %r8
	addq	$8, %r8
	movabsq	$8589934591, %r9
	movq	%r9, 72(%rsp)
	movq	(%rsp), %r9
	movq	-4(%r9,%r8,4), %r12
	movq	56(%rsp), %r9
	movq	-4(%r9,%r8,4), %r13
	movq	64(%rsp), %r8
	xorq	48(%rsp), %r8
	orq	$1, %r8
	movq	%rsi, %r9
	andq	%r8, %r9
	movq	48(%rsp), %r8
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
	addq	%rbp, %rbx
	addq	%r8, %rbx
	addq	%r13, %rbx
	leaq	-4(%rbx,%r12), %rbx
	andq	72(%rsp), %rbx
	movabsq	$8589934591, %r8
	leaq	-1(%rax,%rbx), %rax
	andq	%r8, %rax
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%rcx, %r8
	orq	%rdi, %r8
	movq	%rdx, %r9
	andq	%r8, %r9
	movq	%rcx, %r8
	andq	%rdi, %r8
	orq	%r9, %r8
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
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rbx,%r8), %r8
	andq	%r12, %r8
	movq	40(%rsp), %rbx
	addq	$10, %rbx
	movabsq	$8589934591, %r9
	movq	%r9, 72(%rsp)
	movq	(%rsp), %r9
	movq	-4(%r9,%rbx,4), %r12
	movq	56(%rsp), %r9
	movq	-4(%r9,%rbx,4), %r13
	movq	%rsi, %rbx
	xorq	64(%rsp), %rbx
	orq	$1, %rbx
	movq	%rax, %r9
	andq	%rbx, %r9
	movq	64(%rsp), %rbx
	xorq	%r9, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r10
	movq	%rax, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%rax, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%rax, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%rax, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%rax, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%rax, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	48(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %rbx
	addq	%r13, %rbx
	leaq	-4(%rbx,%r12), %rbx
	andq	72(%rsp), %rbx
	movabsq	$8589934591, %r9
	leaq	-1(%rdx,%rbx), %r13
	andq	%r9, %r13
	movabsq	$8589934591, %rdx
	movq	%rdx, 48(%rsp)
	movabsq	$8589934591, %r12
	movq	%r8, %rdx
	orq	%rcx, %rdx
	movq	%rdi, %r9
	andq	%rdx, %r9
	movq	%r8, %rdx
	andq	%rcx, %rdx
	orq	%r9, %rdx
	movabsq	$8589934591, %r10
	movq	%r8, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%r8, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%r8, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%r8, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%r8, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%r8, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rdx), %rdx
	andq	%r12, %rdx
	leaq	-1(%rbx,%rdx), %rdx
	andq	48(%rsp), %rdx
	movq	40(%rsp), %rbx
	addq	$12, %rbx
	movabsq	$8589934591, %r9
	movq	%r9, 48(%rsp)
	movq	(%rsp), %r9
	movq	-4(%r9,%rbx,4), %r9
	movq	%r9, 72(%rsp)
	movq	56(%rsp), %r9
	movq	-4(%r9,%rbx,4), %r12
	movq	%rax, %rbx
	xorq	%rsi, %rbx
	orq	$1, %rbx
	movq	%r13, %r9
	andq	%rbx, %r9
	movq	%rsi, %rbx
	xorq	%r9, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r10
	movq	%r13, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%r13, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%r13, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%r13, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%r13, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%r13, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	64(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %rbx
	addq	%r12, %rbx
	movq	72(%rsp), %r9
	leaq	-4(%rbx,%r9), %rbx
	andq	48(%rsp), %rbx
	movabsq	$8589934591, %r9
	leaq	-1(%rdi,%rbx), %r12
	andq	%r9, %r12
	movabsq	$8589934591, %rdi
	movq	%rdi, 48(%rsp)
	movabsq	$8589934591, %rdi
	movq	%rdi, 64(%rsp)
	movq	%rdx, %rdi
	orq	%r8, %rdi
	movq	%rcx, %r9
	andq	%rdi, %r9
	movq	%rdx, %rdi
	andq	%r8, %rdi
	orq	%r9, %rdi
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
	leaq	-1(%rbp,%rdi), %rdi
	andq	64(%rsp), %rdi
	leaq	-1(%rbx,%rdi), %rdi
	andq	48(%rsp), %rdi
	movq	40(%rsp), %rbx
	addq	$14, %rbx
	movabsq	$8589934591, %r9
	movq	%r9, 40(%rsp)
	movq	(%rsp), %r9
	movq	-4(%r9,%rbx,4), %r9
	movq	%r9, 48(%rsp)
	movq	56(%rsp), %r9
	movq	-4(%r9,%rbx,4), %rbx
	movq	%rbx, 56(%rsp)
	movq	%r13, %rbx
	xorq	%rax, %rbx
	orq	$1, %rbx
	movq	%r12, %r9
	andq	%rbx, %r9
	movq	%rax, %rbx
	xorq	%r9, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r10
	movq	%r12, %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	%r12, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%r12, %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	%r12, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%r12, %r9
	salq	$26, %r9
	addq	$-67108863, %r9
	andq	%rbp, %r9
	movq	%r12, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rsi
	addq	%rsi, %rbx
	movq	56(%rsp), %rsi
	addq	%rsi, %rbx
	movq	48(%rsp), %rsi
	leaq	-4(%rbx,%rsi), %rbx
	andq	40(%rsp), %rbx
	movabsq	$8589934591, %rsi
	leaq	-1(%rcx,%rbx), %r9
	andq	%rsi, %r9
	movabsq	$8589934591, %rsi
	movq	%rsi, 40(%rsp)
	movabsq	$8589934591, %rsi
	movq	%rsi, 48(%rsp)
	movq	%rdi, %rsi
	orq	%rdx, %rsi
	movq	%r8, %rcx
	andq	%rsi, %rcx
	movq	%rdi, %rsi
	andq	%rdx, %rsi
	orq	%rcx, %rsi
	movabsq	$8589934591, %r10
	movq	%rdi, %rcx
	salq	$10, %rcx
	addq	$-1023, %rcx
	andq	%r10, %rcx
	movq	%rdi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%rcx, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %rcx
	salq	$19, %rcx
	addq	$-524287, %rcx
	andq	%r11, %rcx
	movq	%rdi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%rcx, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %rcx
	salq	$30, %rcx
	addq	$-1073741823, %rcx
	andq	%rbp, %rcx
	movq	%rdi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%rcx, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rsi), %rsi
	andq	48(%rsp), %rsi
	leaq	-1(%rbx,%rsi), %rsi
	andq	40(%rsp), %rsi
	movq	16(%rsp), %rbx
	addq	$2, %rbx
	movq	%rbx, 16(%rsp)
	movq	%rdi, 24(%rsp)
	movq	%rdx, 32(%rsp)
	jmp	.L448
	.cfi_adjust_cfa_offset -88
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
	jbe	.L1154
	movl	$3558067407, %esi
	movq	%rsi, (%rbx)
	cmpq	$3, %rdi
	jbe	.L1148
	movabsq	$6288268555, %rsi
	movq	%rsi, 8(%rbx)
	cmpq	$5, %rdi
	jbe	.L1142
	movq	$2027808485, 16(%rbx)
	cmpq	$7, %rdi
	jbe	.L1136
	movabsq	$5546961525, %rsi
	movq	%rsi, 24(%rbx)
	cmpq	$9, %rdi
	jbe	.L1130
	movl	$2719786239, %esi
	movq	%rsi, 32(%rbx)
	cmpq	$11, %rdi
	jbe	.L1124
	movabsq	$5201645849, %rsi
	movq	%rsi, 40(%rbx)
	cmpq	$13, %rdi
	jbe	.L1118
	movq	$1057469271, 48(%rbx)
	cmpq	$15, %rdi
	jbe	.L1112
	movl	$3082918451, %edi
	movq	%rdi, 56(%rbx)
	movq	$1, 16(%rax)
	movq	8(%rax), %rax
	movq	-8(%rax), %rbx
	salq	$8, %rbx
	shrq	$17, %rbx
	orq	$1, %rbx
	cmpq	$1, %rbx
	jbe	.L1106
	movq	$1, (%rax)
	cmpq	$3, %rbx
	jbe	.L1100
	movq	$1, 8(%rax)
	movl	$1, %eax
	ret
	.align	4
.L1100:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1106:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1112:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1118:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1124:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1130:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1136:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1142:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1148:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1154:
	leaq	.LcamlSha256__block503(%rip), %rax
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
	jbe	.L1396
	movq	8(%rax), %rsi
	movabsq	$8589934591, %rcx
	leaq	-8(%rsi,%r13,8), %rdx
	andq	%rcx, %rdx
	movq	%rdx, 8(%rax)
	cmpq	%rsi, %rdx
	jge	.L1203
	cmpq	$1, %rdi
	jbe	.L1194
	movabsq	$8589934591, %rdx
	movq	(%rax), %rsi
	addq	$2, %rsi
	andq	%rdx, %rsi
	movq	%rsi, (%rax)
	cmpq	$1, %rdi
	jbe	.L1389
	jmp	.L1205
	.align	4
.L1194:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1203:
	cmpq	$1, %rdi
	jbe	.L1389
.L1205:
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
	je	.L1314
	movl	$130, %r8d
	subq	%rcx, %r8
	cmpq	%r8, %r13
	jge	.L1267
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L1227
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1227:
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
	jge	.L1240
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1240:
	cmpq	$1, %rcx
	jge	.L1244
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1244:
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
	jle	.L1257
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1257:
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	16(%r12), %rax
	leaq	-1(%rax,%r13), %rax
	movq	%rax, 16(%r12)
	movl	$1, %eax
	movl	$1, %esi
	jmp	.L1399
	.align	4
.L1267:
	movq	24(%r12), %rbp
	cmpq	$1, %r8
	jge	.L1273
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1273:
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
	jge	.L1286
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1286:
	cmpq	$1, %rcx
	jge	.L1290
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1290:
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
	jle	.L1303
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1303:
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
.L1406:
	xorl	%eax, %eax
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rsi
	subq	%rsi, %rbx
	leaq	1(%rbx), %r13
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	jmp	.L1327
	.align	4
.L1314:
	xorl	%eax, %eax
	movl	$1, %esi
.L1327:
	movq	%rbx, 8(%rsp)
	movq	%r12, (%rsp)
	cmpq	$129, %r13
	jl	.L1336
.L1331:
	movq	%r13, 24(%rsp)
	movq	%r12, %rax
	movq	%rsi, %rdi
	movq	%rsi, 16(%rsp)
	call	camlSha256__transform_from_10_26_code@PLT
.L1407:
	movq	24(%rsp), %r13
	addq	$-128, %r13
	movq	16(%rsp), %rsi
	addq	$128, %rsi
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	cmpq	$129, %r13
	jge	.L1331
.L1336:
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L1345
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1345:
	cmpq	$1, %rsi
	jge	.L1349
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1349:
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
	jle	.L1362
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1362:
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
	jge	.L1375
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1375:
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	%r13, 16(%r12)
	jmp	.L1399
	.align	4
.L1389:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1396:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1399:
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
	jae	.L1723
	movq	$-128, %rdx
	movb	%dl, (%rbx,%rsi)
	leaq	2(%rax), %rsi
	cmpq	$113, %rsi
	jle	.L1456
	movl	$130, %edx
	subq	%rsi, %rdx
	cmpq	$1, %rsi
	jge	.L1435
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1435:
	cmpq	$1, %rdx
	jge	.L1439
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1439:
	movq	%rdi, %rax
	salq	$1, %rax
	subq	%rdx, %rax
	addq	$2, %rax
	cmpq	%rax, %rsi
	jle	.L1446
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1446:
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
.L1728:
	movl	$1, %esi
	movq	(%rsp), %r12
	movq	8(%rsp), %r13
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rdi
.L1456:
	movl	$114, %edx
	subq	%rsi, %rdx
	cmpq	$1, %rsi
	jge	.L1461
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1461:
	cmpq	$1, %rdx
	jge	.L1465
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1465:
	salq	$1, %rdi
	subq	%rdx, %rdi
	leaq	2(%rdi), %rax
	cmpq	%rax, %rsi
	jle	.L1472
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1472:
	movl	$1, %ecx
	movq	%rbx, %rdi
	call	caml_fill_bytes@PLT
	movq	8(%r12), %rax
	movq	-8(%rax), %rdi
	salq	$8, %rdi
	shrq	$17, %rdi
	orq	$1, %rdi
	cmpq	$1, %rdi
	jbe	.L1713
	movq	(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$24, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L1491
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1491:
	cmpq	$511, %rdx
	jle	.L1495
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1495:
	sarq	$1, %rdx
	movb	%dl, 56(%rbx)
	movq	%rsi, %rdx
	shrq	$16, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L1504
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1504:
	cmpq	$511, %rdx
	jle	.L1508
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1508:
	sarq	$1, %rdx
	movb	%dl, 57(%rbx)
	movq	%rsi, %rdx
	shrq	$8, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L1517
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1517:
	cmpq	$511, %rdx
	jle	.L1521
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1521:
	sarq	$1, %rdx
	movb	%dl, 58(%rbx)
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L1528
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1528:
	cmpq	$511, %rsi
	jle	.L1532
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1532:
	sarq	$1, %rsi
	movb	%sil, 59(%rbx)
	cmpq	$3, %rdi
	jbe	.L1699
	movq	8(%rax), %rax
	movq	%rax, %rdi
	shrq	$24, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L1547
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1547:
	cmpq	$511, %rdi
	jle	.L1551
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1551:
	sarq	$1, %rdi
	movb	%dil, 60(%rbx)
	movq	%rax, %rdi
	shrq	$16, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L1560
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1560:
	cmpq	$511, %rdi
	jle	.L1564
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1564:
	sarq	$1, %rdi
	movb	%dil, 61(%rbx)
	movq	%rax, %rdi
	shrq	$8, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L1573
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1573:
	cmpq	$511, %rdi
	jle	.L1577
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1577:
	sarq	$1, %rdi
	movb	%dil, 62(%rbx)
	andl	$511, %eax
	cmpq	$1, %rax
	jge	.L1584
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1584:
	cmpq	$511, %rax
	jle	.L1588
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1588:
	movq	%r13, 8(%rsp)
	sarq	$1, %rax
	movb	%al, 63(%rbx)
	movl	$1, %edi
	movq	%r12, %rax
	movq	%r12, (%rsp)
	call	camlSha256__transform_from_10_26_code@PLT
.L1729:
	xorl	%eax, %eax
	movq	(%rsp), %rdx
	movq	8(%rsp), %rcx
.L1596:
	leaq	1(%rax,%rax), %rbx
	movq	(%rdx), %rdi
	movq	-8(%rdi), %rsi
	salq	$8, %rsi
	shrq	$17, %rsi
	cmpq	%rsi, %rbx
	jae	.L1684
	movq	-4(%rdi,%rbx,4), %rdi
	leaq	-3(,%rbx,4), %rbx
	movq	%rdi, %rsi
	shrq	$24, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L1615
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1615:
	cmpq	$511, %rsi
	jle	.L1619
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1619:
	movq	%rbx, %r8
	sarq	$1, %r8
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r8)
	movq	%rdi, %rsi
	shrq	$16, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L1629
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1629:
	cmpq	$511, %rsi
	jle	.L1633
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1633:
	leaq	2(%rbx), %r8
	sarq	$1, %r8
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r8)
	movq	%rdi, %rsi
	shrq	$8, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L1644
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1644:
	cmpq	$511, %rsi
	jle	.L1648
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1648:
	leaq	4(%rbx), %r8
	sarq	$1, %r8
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r8)
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L1657
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1657:
	cmpq	$511, %rdi
	jle	.L1661
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1661:
	addq	$6, %rbx
	sarq	$1, %rbx
	sarq	$1, %rdi
	movb	%dil, (%rcx,%rbx)
	incq	%rax
	cmpq	$7, %rax
	jle	.L1596
	movl	$1, %eax
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.align	4
.L1684:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1699:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1713:
	leaq	.LcamlSha256__block503(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1723:
	leaq	.LcamlSha256__block503(%rip), %rax
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
	leaq	.LcamlSha256__Pmakearray1042(%rip), %rax
	movq	%rax, %rdi
	movq	caml_obj_dup@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L1745:
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
	.4byte	(.L1745 - .) + 0
	.2byte	17
	.2byte	0
	.align	4
	.4byte	(.L1746 - .) + 0
	.align	8
	.4byte	(.L1729 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L1747 - .) + 0
	.align	8
	.4byte	(.L1728 - .) + 0
	.2byte	49
	.2byte	3
	.2byte	0
	.2byte	8
	.2byte	16
	.align	4
	.4byte	(.L1748 - .) + 0
	.align	8
	.4byte	(.L1407 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L1749 - .) + 0
	.align	8
	.4byte	(.L1406 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L1750 - .) + 0
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
	.4byte	(.L1751 - .) + 0
	.align	8
	.4byte	(.L229 - .) + 0
	.2byte	33
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L1752 - .) + 0
	.align	8
	.4byte	(.L228 - .) + 0
	.2byte	33
	.2byte	1
	.2byte	0
	.align	4
	.4byte	(.L1753 - .) + 0
	.align	8
	.4byte	(.L227 - .) + 0
	.2byte	33
	.2byte	0
	.align	4
	.4byte	(.L1754 - .) + 0
	.align	8
	.align	4
.L1748:
	.4byte	(.L1756 - .) + 1
	.4byte	85479832
	.4byte	(.L1757 - .) + 0
	.4byte	119017608
	.align	4
.L1747:
	.4byte	(.L1756 - .) + 1
	.4byte	85479832
	.4byte	(.L1757 - .) + 0
	.4byte	123209848
	.align	4
.L1752:
	.4byte	(.L1758 - .) + 0
	.4byte	28849368
	.align	4
.L1751:
	.4byte	(.L1758 - .) + 0
	.4byte	28325080
	.align	4
.L1746:
	.4byte	(.L1759 - .) + 1140850688
	.4byte	-2147377152
	.align	4
.L1754:
	.4byte	(.L1758 - .) + 0
	.4byte	30422240
	.align	4
.L1750:
	.4byte	(.L1756 - .) + 1
	.4byte	85479832
	.4byte	(.L1760 - .) + 0
	.4byte	104863896
	.align	4
.L1749:
	.4byte	(.L1760 - .) + 0
	.4byte	109582608
	.align	4
.L1753:
	.4byte	(.L1762 - .) + 1
	.4byte	31467664
	.4byte	(.L1758 - .) + 0
	.4byte	29897992
.L1761:
	.ascii	"bytes.ml\0"
.L1755:
	.ascii	"sha256.ml\0"
	.align	4
.L1757:
	.4byte	(.L1755 - .) + 0
	.ascii	"Sha256.finish\0"
	.align	4
.L1762:
	.4byte	(.L1761 - .) + 0
	.ascii	"Stdlib__Bytes.make\0"
	.align	4
.L1759:
	.4byte	(.L1755 - .) + 0
	.2byte	16
	.2byte	2
	.4byte	820
	.ascii	"Sha256.constants\0"
	.align	4
.L1758:
	.4byte	(.L1755 - .) + 0
	.ascii	"Sha256.create\0"
	.align	4
.L1760:
	.4byte	(.L1755 - .) + 0
	.ascii	"Sha256.add_data\0"
	.align	4
.L1756:
	.4byte	(.L1755 - .) + 0
	.ascii	"Sha256.transform\0"
	.align	8
	.size camlSha256__frametable,. - camlSha256__frametable
	.data
	.section .note.GNU-stack,"",@progbits
