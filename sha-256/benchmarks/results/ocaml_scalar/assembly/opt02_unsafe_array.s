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
	.8byte	camlSha256__transform_25
	.8byte	0
	.data
	.align	8
	.8byte	17152
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
	.8byte	camlSha256__transform_25
	.8byte	camlSha256__init_26
	.8byte	camlSha256__add_data_27
	.8byte	camlSha256__finish_28
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__finish_28
camlSha256__finish_28:
.LcamlSha256__finish_28:
	.8byte	caml_curry2
	.8byte	0x280000000000007
	.8byte	camlSha256__finish_14_29_code
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__add_data_27
camlSha256__add_data_27:
.LcamlSha256__add_data_27:
	.8byte	caml_curry3
	.8byte	0x380000000000007
	.8byte	camlSha256__add_data_13_28_code
	.data
	.align	8
	.8byte	3063
	.globl	camlSha256__init_26
camlSha256__init_26:
.LcamlSha256__init_26:
	.8byte	camlSha256__init_12_27_code
	.8byte	0x180000000000005
	.data
	.align	8
	.8byte	4087
	.globl	camlSha256__transform_25
camlSha256__transform_25:
.LcamlSha256__transform_25:
	.8byte	camlSha256__transform_10_25_code
	.8byte	0x180000000000005
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
.LcamlSha256__Pmakearray998:
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
	.globl	camlSha256__transform_10_25_code
camlSha256__transform_10_25_code:
.LcamlSha256__transform_10_25_code:
	.cfi_startproc
	.cfi_def_cfa_offset 8
	subq	$88, %rsp
	.cfi_adjust_cfa_offset 88
	movq	32(%rax), %rbx
	movq	%rbx, (%rsp)
	xorl	%ebx, %ebx
.L436:
	leaq	1(%rbx,%rbx), %rdi
	leaq	-3(,%rdi,4), %rsi
	movq	24(%rax), %rdx
	movq	-8(%rdx), %rcx
	salq	$8, %rcx
	shrq	$18, %rcx
	leaq	-1(,%rcx,8), %rcx
	movzbq	(%rdx,%rcx), %r8
	subq	%r8, %rcx
	leaq	6(%rsi), %r8
	sarq	$1, %r8
	cmpq	%rcx, %r8
	jae	.L516
	movzbq	(%rdx,%r8), %r8
	leaq	1(%r8,%r8), %r8
	leaq	4(%rsi), %r9
	sarq	$1, %r9
	cmpq	%rcx, %r9
	jae	.L510
	movzbq	(%rdx,%r9), %r9
	salq	$9, %r9
	incq	%r9
	leaq	2(%rsi), %r12
	sarq	$1, %r12
	cmpq	%rcx, %r12
	jae	.L504
	movzbq	(%rdx,%r12), %r12
	salq	$17, %r12
	incq	%r12
	sarq	$1, %rsi
	cmpq	%rcx, %rsi
	jae	.L498
	movzbq	(%rdx,%rsi), %rsi
	salq	$25, %rsi
	incq	%rsi
	orq	%r12, %rsi
	orq	%r9, %rsi
	orq	%r8, %rsi
	movq	(%rsp), %rdx
	movq	%rsi, -4(%rdx,%rdi,4)
	incq	%rbx
	cmpq	$15, %rbx
	jg	.L526
	jmp	.L436
	.align	4
.L498:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L504:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L510:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L516:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L526:
	movl	$16, %ebx
.L528:
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
	jle	.L528
	movq	(%rax), %rax
	movq	(%rax), %rcx
	movq	8(%rax), %r9
	movq	16(%rax), %rbx
	movq	24(%rax), %rdx
	movq	32(%rax), %r12
	movq	40(%rax), %rdi
	movq	48(%rax), %r13
	movq	56(%rax), %rsi
	xorl	%r8d, %r8d
	movq	%r8, 8(%rsp)
	movq	%r9, %r8
	movq	%r8, 16(%rsp)
	movq	%rbx, 24(%rsp)
	movq	%rdi, %rbx
	movq	%rbx, 32(%rsp)
.L596:
	movq	8(%rsp), %rbx
	salq	$4, %rbx
	incq	%rbx
	movq	%rbx, 40(%rsp)
	movabsq	$8589934591, %rbx
	movq	%rbx, 48(%rsp)
	movq	(%rsp), %rbx
	movq	40(%rsp), %rdi
	movq	-4(%rbx,%rdi,4), %r8
	movq	camlSha256__transform_25@GOTPCREL(%rip), %rbx
	movq	16(%rbx), %rbx
	movq	%rbx, 56(%rsp)
	movq	40(%rsp), %rdi
	movq	-4(%rbx,%rdi,4), %r9
	movq	32(%rsp), %rbx
	xorq	%r13, %rbx
	orq	$1, %rbx
	movq	%r12, %rdi
	andq	%rbx, %rdi
	movq	%r13, %rbx
	xorq	%rdi, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r10
	movq	%r12, %rdi
	salq	$7, %rdi
	addq	$-127, %rdi
	andq	%r10, %rdi
	movq	%r12, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rdi, %r10
	movabsq	$8589934591, %r11
	movq	%r12, %rdi
	salq	$21, %rdi
	addq	$-2097151, %rdi
	andq	%r11, %rdi
	movq	%r12, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rdi, %r11
	movabsq	$8589934591, %rbp
	movq	%r12, %rdi
	salq	$26, %rdi
	addq	$-67108863, %rdi
	andq	%rbp, %rdi
	movq	%r12, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%rdi, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	(%rsi,%rbp), %rdi
	addq	%rdi, %rbx
	addq	%r9, %rbx
	leaq	-4(%rbx,%r8), %rbx
	andq	48(%rsp), %rbx
	movabsq	$8589934591, %rsi
	leaq	-1(%rdx,%rbx), %rdi
	andq	%rsi, %rdi
	movabsq	$8589934591, %r8
	movabsq	$8589934591, %r9
	movq	%rcx, %rsi
	orq	16(%rsp), %rsi
	movq	24(%rsp), %rdx
	andq	%rsi, %rdx
	movq	%rcx, %rsi
	andq	16(%rsp), %rsi
	orq	%rdx, %rsi
	movabsq	$8589934591, %r10
	movq	%rcx, %rdx
	salq	$10, %rdx
	addq	$-1023, %rdx
	andq	%r10, %rdx
	movq	%rcx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%rdx, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %rdx
	salq	$19, %rdx
	addq	$-524287, %rdx
	andq	%r11, %rdx
	movq	%rcx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%rdx, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %rdx
	salq	$30, %rdx
	addq	$-1073741823, %rdx
	andq	%rbp, %rdx
	movq	%rcx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%rdx, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rsi), %rsi
	andq	%r9, %rsi
	leaq	-1(%rbx,%rsi), %rbx
	andq	%r8, %rbx
	movq	40(%rsp), %rsi
	addq	$2, %rsi
	movabsq	$8589934591, %rdx
	movq	%rdx, 48(%rsp)
	movq	(%rsp), %rdx
	movq	-4(%rdx,%rsi,4), %r8
	movq	56(%rsp), %rdx
	movq	-4(%rdx,%rsi,4), %r9
	movq	%r12, %rsi
	xorq	32(%rsp), %rsi
	orq	$1, %rsi
	movq	%rdi, %rdx
	andq	%rsi, %rdx
	movq	32(%rsp), %rsi
	xorq	%rdx, %rsi
	orq	$1, %rsi
	movabsq	$8589934591, %r10
	movq	%rdi, %rdx
	salq	$7, %rdx
	addq	$-127, %rdx
	andq	%r10, %rdx
	movq	%rdi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rdx, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %rdx
	salq	$21, %rdx
	addq	$-2097151, %rdx
	andq	%r11, %rdx
	movq	%rdi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rdx, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %rdx
	salq	$26, %rdx
	addq	$-67108863, %rdx
	andq	%rbp, %rdx
	movq	%rdi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%rdx, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	(%r13,%rbp), %rdx
	addq	%rdx, %rsi
	addq	%r9, %rsi
	leaq	-4(%rsi,%r8), %rsi
	andq	48(%rsp), %rsi
	movabsq	$8589934591, %r8
	movq	24(%rsp), %rdx
	leaq	-1(%rdx,%rsi), %rdx
	andq	%r8, %rdx
	movq	%rdx, 48(%rsp)
	movabsq	$8589934591, %r9
	movabsq	$8589934591, %r13
	movq	%rbx, %rdx
	orq	%rcx, %rdx
	movq	16(%rsp), %r8
	andq	%rdx, %r8
	movq	%rbx, %rdx
	andq	%rcx, %rdx
	orq	%r8, %rdx
	movabsq	$8589934591, %r10
	movq	%rbx, %r8
	salq	$10, %r8
	addq	$-1023, %r8
	andq	%r10, %r8
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r8, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r8
	salq	$19, %r8
	addq	$-524287, %r8
	andq	%r11, %r8
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r8
	salq	$30, %r8
	addq	$-1073741823, %r8
	andq	%rbp, %r8
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r8, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rdx), %rdx
	andq	%r13, %rdx
	leaq	-1(%rsi,%rdx), %r13
	andq	%r9, %r13
	movq	40(%rsp), %rsi
	addq	$4, %rsi
	movabsq	$8589934591, %rdx
	movq	%rdx, 64(%rsp)
	movq	(%rsp), %rdx
	movq	-4(%rdx,%rsi,4), %r8
	movq	56(%rsp), %rdx
	movq	-4(%rdx,%rsi,4), %r9
	movq	%rdi, %rsi
	xorq	%r12, %rsi
	orq	$1, %rsi
	movq	48(%rsp), %rdx
	andq	%rsi, %rdx
	movq	%r12, %rsi
	xorq	%rdx, %rsi
	orq	$1, %rsi
	movabsq	$8589934591, %r10
	movq	48(%rsp), %rdx
	salq	$7, %rdx
	addq	$-127, %rdx
	andq	%r10, %rdx
	movq	48(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rdx, %r10
	movabsq	$8589934591, %r11
	movq	48(%rsp), %rdx
	salq	$21, %rdx
	addq	$-2097151, %rdx
	andq	%r11, %rdx
	movq	48(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rdx, %r11
	movabsq	$8589934591, %rdx
	movq	48(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%rdx, %rbp
	movq	48(%rsp), %rdx
	shrq	$6, %rdx
	orq	$1, %rdx
	orq	%rbp, %rdx
	xorq	%r11, %rdx
	xorq	%r10, %rdx
	orq	$1, %rdx
	movq	32(%rsp), %r10
	addq	%r10, %rdx
	addq	%rdx, %rsi
	addq	%r9, %rsi
	leaq	-4(%rsi,%r8), %rsi
	andq	64(%rsp), %rsi
	movabsq	$8589934591, %r8
	movq	16(%rsp), %rdx
	leaq	-1(%rdx,%rsi), %rdx
	andq	%r8, %rdx
	movq	%rdx, 64(%rsp)
	movabsq	$8589934591, %rdx
	movq	%rdx, 72(%rsp)
	movabsq	$8589934591, %r9
	movq	%r13, %rdx
	orq	%rbx, %rdx
	movq	%rcx, %r8
	andq	%rdx, %r8
	movq	%r13, %rdx
	andq	%rbx, %rdx
	orq	%r8, %rdx
	movabsq	$8589934591, %r10
	movq	%r13, %r8
	salq	$10, %r8
	addq	$-1023, %r8
	andq	%r10, %r8
	movq	%r13, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r8, %r10
	movabsq	$8589934591, %r11
	movq	%r13, %r8
	salq	$19, %r8
	addq	$-524287, %r8
	andq	%r11, %r8
	movq	%r13, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %rbp
	movq	%r13, %r8
	salq	$30, %r8
	addq	$-1073741823, %r8
	andq	%rbp, %r8
	movq	%r13, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r8, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rdx), %rdx
	andq	%r9, %rdx
	leaq	-1(%rsi,%rdx), %r8
	andq	72(%rsp), %r8
	movq	40(%rsp), %rsi
	addq	$6, %rsi
	movabsq	$8589934591, %rdx
	movq	%rdx, 72(%rsp)
	movq	(%rsp), %rdx
	movq	-4(%rdx,%rsi,4), %rdx
	movq	%rdx, 80(%rsp)
	movq	56(%rsp), %rdx
	movq	-4(%rdx,%rsi,4), %r9
	movq	48(%rsp), %rsi
	xorq	%rdi, %rsi
	orq	$1, %rsi
	movq	64(%rsp), %rdx
	andq	%rsi, %rdx
	movq	%rdi, %rsi
	xorq	%rdx, %rsi
	orq	$1, %rsi
	movabsq	$8589934591, %r10
	movq	64(%rsp), %rdx
	salq	$7, %rdx
	addq	$-127, %rdx
	andq	%r10, %rdx
	movq	64(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rdx, %r10
	movabsq	$8589934591, %r11
	movq	64(%rsp), %rdx
	salq	$21, %rdx
	addq	$-2097151, %rdx
	andq	%r11, %rdx
	movq	64(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rdx, %r11
	movabsq	$8589934591, %rdx
	movq	64(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%rdx, %rbp
	movq	64(%rsp), %rdx
	shrq	$6, %rdx
	orq	$1, %rdx
	orq	%rbp, %rdx
	xorq	%r11, %rdx
	xorq	%r10, %rdx
	orq	$1, %rdx
	addq	%r12, %rdx
	addq	%rdx, %rsi
	addq	%r9, %rsi
	movq	80(%rsp), %rdx
	leaq	-4(%rsi,%rdx), %rsi
	andq	72(%rsp), %rsi
	movabsq	$8589934591, %r9
	leaq	-1(%rcx,%rsi), %rdx
	andq	%r9, %rdx
	movq	%rdx, 72(%rsp)
	movabsq	$8589934591, %r9
	movabsq	$8589934591, %r12
	movq	%r8, %rdx
	orq	%r13, %rdx
	movq	%rbx, %rcx
	andq	%rdx, %rcx
	movq	%r8, %rdx
	andq	%r13, %rdx
	orq	%rcx, %rdx
	movabsq	$8589934591, %r10
	movq	%r8, %rcx
	salq	$10, %rcx
	addq	$-1023, %rcx
	andq	%r10, %rcx
	movq	%r8, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%rcx, %r10
	movabsq	$8589934591, %r11
	movq	%r8, %rcx
	salq	$19, %rcx
	addq	$-524287, %rcx
	andq	%r11, %rcx
	movq	%r8, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%rcx, %r11
	movabsq	$8589934591, %rbp
	movq	%r8, %rcx
	salq	$30, %rcx
	addq	$-1073741823, %rcx
	andq	%rbp, %rcx
	movq	%r8, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%rcx, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rdx), %rdx
	andq	%r12, %rdx
	leaq	-1(%rsi,%rdx), %r12
	andq	%r9, %r12
	movq	40(%rsp), %rsi
	addq	$8, %rsi
	movabsq	$8589934591, %rdx
	movq	%rdx, 80(%rsp)
	movq	(%rsp), %rdx
	movq	-4(%rdx,%rsi,4), %rcx
	movq	56(%rsp), %rdx
	movq	-4(%rdx,%rsi,4), %r9
	movq	64(%rsp), %rsi
	xorq	48(%rsp), %rsi
	orq	$1, %rsi
	movq	72(%rsp), %rdx
	andq	%rsi, %rdx
	movq	48(%rsp), %rsi
	xorq	%rdx, %rsi
	orq	$1, %rsi
	movabsq	$8589934591, %r10
	movq	72(%rsp), %rdx
	salq	$7, %rdx
	addq	$-127, %rdx
	andq	%r10, %rdx
	movq	72(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rdx, %r10
	movabsq	$8589934591, %r11
	movq	72(%rsp), %rdx
	salq	$21, %rdx
	addq	$-2097151, %rdx
	andq	%r11, %rdx
	movq	72(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rdx, %r11
	movabsq	$8589934591, %rdx
	movq	72(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%rdx, %rbp
	movq	72(%rsp), %rdx
	shrq	$6, %rdx
	orq	$1, %rdx
	orq	%rbp, %rdx
	xorq	%r11, %rdx
	xorq	%r10, %rdx
	orq	$1, %rdx
	addq	%rdx, %rdi
	addq	%rsi, %rdi
	addq	%r9, %rdi
	leaq	-4(%rdi,%rcx), %rdi
	andq	80(%rsp), %rdi
	movabsq	$8589934591, %rdx
	leaq	-1(%rbx,%rdi), %rsi
	andq	%rdx, %rsi
	movabsq	$8589934591, %rcx
	movabsq	$8589934591, %r9
	movq	%r12, %rbx
	orq	%r8, %rbx
	movq	%r13, %rdx
	andq	%rbx, %rdx
	movq	%r12, %rbx
	andq	%r8, %rbx
	orq	%rdx, %rbx
	movabsq	$8589934591, %r10
	movq	%r12, %rdx
	salq	$10, %rdx
	addq	$-1023, %rdx
	andq	%r10, %rdx
	movq	%r12, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%rdx, %r10
	movabsq	$8589934591, %r11
	movq	%r12, %rdx
	salq	$19, %rdx
	addq	$-524287, %rdx
	andq	%r11, %rdx
	movq	%r12, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%rdx, %r11
	movabsq	$8589934591, %rbp
	movq	%r12, %rdx
	salq	$30, %rdx
	addq	$-1073741823, %rdx
	andq	%rbp, %rdx
	movq	%r12, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%rdx, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	%r9, %rbx
	leaq	-1(%rdi,%rbx), %rdx
	andq	%rcx, %rdx
	movq	40(%rsp), %rbx
	addq	$10, %rbx
	movabsq	$8589934591, %rdi
	movq	%rdi, 80(%rsp)
	movq	(%rsp), %rdi
	movq	-4(%rdi,%rbx,4), %rcx
	movq	56(%rsp), %rdi
	movq	-4(%rdi,%rbx,4), %r9
	movq	72(%rsp), %rbx
	xorq	64(%rsp), %rbx
	orq	$1, %rbx
	movq	%rsi, %rdi
	andq	%rbx, %rdi
	movq	64(%rsp), %rbx
	xorq	%rdi, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r10
	movq	%rsi, %rdi
	salq	$7, %rdi
	addq	$-127, %rdi
	andq	%r10, %rdi
	movq	%rsi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rdi, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %rdi
	salq	$21, %rdi
	addq	$-2097151, %rdi
	andq	%r11, %rdi
	movq	%rsi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rdi, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %rdi
	salq	$26, %rdi
	addq	$-67108863, %rdi
	andq	%rbp, %rdi
	movq	%rsi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%rdi, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	48(%rsp), %rdi
	addq	%rbp, %rdi
	addq	%rdi, %rbx
	addq	%r9, %rbx
	leaq	-4(%rbx,%rcx), %rdi
	andq	80(%rsp), %rdi
	movabsq	$8589934591, %rcx
	leaq	-1(%r13,%rdi), %rbx
	andq	%rcx, %rbx
	movabsq	$8589934591, %rcx
	movq	%rcx, 48(%rsp)
	movabsq	$8589934591, %r13
	movq	%rdx, %rcx
	orq	%r12, %rcx
	movq	%r8, %r9
	andq	%rcx, %r9
	movq	%rdx, %rcx
	andq	%r12, %rcx
	orq	%r9, %rcx
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
	leaq	-1(%rbp,%rcx), %rcx
	andq	%r13, %rcx
	leaq	-1(%rdi,%rcx), %rdi
	andq	48(%rsp), %rdi
	movq	%rdi, %r9
	movq	40(%rsp), %rdi
	addq	$12, %rdi
	movabsq	$8589934591, %rcx
	movq	%rcx, 48(%rsp)
	movq	(%rsp), %rcx
	movq	-4(%rcx,%rdi,4), %rcx
	movq	%rcx, 80(%rsp)
	movq	56(%rsp), %rcx
	movq	-4(%rcx,%rdi,4), %r13
	movq	%rsi, %rdi
	xorq	72(%rsp), %rdi
	orq	$1, %rdi
	movq	%rbx, %rcx
	andq	%rdi, %rcx
	movq	72(%rsp), %rdi
	xorq	%rcx, %rdi
	orq	$1, %rdi
	movabsq	$8589934591, %r10
	movq	%rbx, %rcx
	salq	$7, %rcx
	addq	$-127, %rcx
	andq	%r10, %rcx
	movq	%rbx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rcx, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %rcx
	salq	$21, %rcx
	addq	$-2097151, %rcx
	andq	%r11, %rcx
	movq	%rbx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rcx, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %rcx
	salq	$26, %rcx
	addq	$-67108863, %rcx
	andq	%rbp, %rcx
	movq	%rbx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%rcx, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	64(%rsp), %rcx
	addq	%rbp, %rcx
	addq	%rcx, %rdi
	addq	%r13, %rdi
	movq	80(%rsp), %rcx
	leaq	-4(%rdi,%rcx), %rcx
	andq	48(%rsp), %rcx
	movabsq	$8589934591, %r13
	leaq	-1(%r8,%rcx), %rdi
	andq	%r13, %rdi
	movabsq	$8589934591, %r8
	movq	%r8, 48(%rsp)
	movabsq	$8589934591, %r8
	movq	%r8, 64(%rsp)
	movq	%r9, %r8
	orq	%rdx, %r8
	movq	%r12, %r13
	andq	%r8, %r13
	movq	%r9, %r8
	andq	%rdx, %r8
	orq	%r13, %r8
	movabsq	$8589934591, %r10
	movq	%r9, %r13
	salq	$10, %r13
	addq	$-1023, %r13
	andq	%r10, %r13
	movq	%r9, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r13, %r10
	movabsq	$8589934591, %r11
	movq	%r9, %r13
	salq	$19, %r13
	addq	$-524287, %r13
	andq	%r11, %r13
	movq	%r9, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r13, %r11
	movabsq	$8589934591, %rbp
	movq	%r9, %r13
	salq	$30, %r13
	addq	$-1073741823, %r13
	andq	%rbp, %r13
	movq	%r9, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r13, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	64(%rsp), %r8
	leaq	-1(%rcx,%r8), %rcx
	andq	48(%rsp), %rcx
	movq	%rcx, %r8
	movq	40(%rsp), %rcx
	addq	$14, %rcx
	movabsq	$8589934591, %r13
	movq	%r13, 40(%rsp)
	movq	(%rsp), %r13
	movq	-4(%r13,%rcx,4), %r13
	movq	%r13, 48(%rsp)
	movq	56(%rsp), %r13
	movq	-4(%r13,%rcx,4), %rcx
	movq	%rcx, 56(%rsp)
	movq	%rbx, %rcx
	xorq	%rsi, %rcx
	orq	$1, %rcx
	movq	%rdi, %r13
	andq	%rcx, %r13
	movq	%rsi, %rcx
	xorq	%r13, %rcx
	orq	$1, %rcx
	movabsq	$8589934591, %r10
	movq	%rdi, %r13
	salq	$7, %r13
	addq	$-127, %r13
	andq	%r10, %r13
	movq	%rdi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r13, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r13
	salq	$21, %r13
	addq	$-2097151, %r13
	andq	%r11, %r13
	movq	%rdi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r13, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r13
	salq	$26, %r13
	addq	$-67108863, %r13
	andq	%rbp, %r13
	movq	%rdi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r13, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	72(%rsp), %r13
	addq	%rbp, %r13
	addq	%r13, %rcx
	movq	56(%rsp), %r13
	addq	%r13, %rcx
	movq	48(%rsp), %r13
	leaq	-4(%rcx,%r13), %rcx
	andq	40(%rsp), %rcx
	movq	%rcx, 40(%rsp)
	movabsq	$8589934591, %r13
	movq	40(%rsp), %rcx
	leaq	-1(%r12,%rcx), %rcx
	andq	%r13, %rcx
	movq	%rcx, %r12
	movabsq	$8589934591, %rcx
	movq	%rcx, 48(%rsp)
	movabsq	$8589934591, %rcx
	movq	%rcx, 56(%rsp)
	movq	%r8, %rcx
	orq	%r9, %rcx
	movq	%rdx, %r13
	andq	%rcx, %r13
	movq	%r8, %rcx
	andq	%r9, %rcx
	orq	%r13, %rcx
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
	leaq	-1(%rbp,%rcx), %rcx
	andq	56(%rsp), %rcx
	movq	40(%rsp), %r13
	leaq	-1(%r13,%rcx), %rcx
	andq	48(%rsp), %rcx
	movq	8(%rsp), %r13
	incq	%r13
	cmpq	$7, %r13
	jg	.L1130
	movq	%r13, 8(%rsp)
	movq	%rbx, %r13
	movq	%r8, %rbx
	movq	%rbx, 16(%rsp)
	movq	%r9, %rbx
	movq	%rbx, 24(%rsp)
	movq	%rdi, %rbx
	movq	%rbx, 32(%rsp)
	jmp	.L596
	.align	4
.L1130:
	movabsq	$8589934591, %r13
	movq	(%rax), %r10
	leaq	-1(%r10,%rcx), %rcx
	andq	%r13, %rcx
	movq	%rcx, (%rax)
	movabsq	$8589934591, %r13
	movq	8(%rax), %rcx
	leaq	-1(%rcx,%r8), %rcx
	andq	%r13, %rcx
	movq	%rcx, 8(%rax)
	movabsq	$8589934591, %r8
	movq	16(%rax), %rcx
	leaq	-1(%rcx,%r9), %rcx
	andq	%r8, %rcx
	movq	%rcx, 16(%rax)
	movabsq	$8589934591, %rcx
	movq	24(%rax), %r8
	leaq	-1(%r8,%rdx), %rdx
	andq	%rcx, %rdx
	movq	%rdx, 24(%rax)
	movabsq	$8589934591, %rcx
	movq	32(%rax), %rdx
	leaq	-1(%rdx,%r12), %rdx
	andq	%rcx, %rdx
	movq	%rdx, 32(%rax)
	movabsq	$8589934591, %rdx
	movq	40(%rax), %rcx
	leaq	-1(%rcx,%rdi), %rdi
	andq	%rdx, %rdi
	movq	%rdi, 40(%rax)
	movabsq	$8589934591, %rdi
	movq	48(%rax), %rdx
	leaq	-1(%rdx,%rbx), %rbx
	andq	%rdi, %rbx
	movq	%rbx, 48(%rax)
	movabsq	$8589934591, %rdi
	movq	56(%rax), %rbx
	leaq	-1(%rbx,%rsi), %rbx
	andq	%rdi, %rbx
	movq	%rbx, 56(%rax)
	movl	$1, %eax
	addq	$88, %rsp
	.cfi_adjust_cfa_offset -88
	ret
	.cfi_adjust_cfa_offset 88
	.cfi_adjust_cfa_offset -88
	.cfi_endproc
	.type camlSha256__transform_10_25_code,@function
	.size camlSha256__transform_10_25_code,. - camlSha256__transform_10_25_code
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
	jbe	.L1302
	movl	$3558067407, %esi
	movq	%rsi, (%rbx)
	cmpq	$3, %rdi
	jbe	.L1296
	movabsq	$6288268555, %rsi
	movq	%rsi, 8(%rbx)
	cmpq	$5, %rdi
	jbe	.L1290
	movq	$2027808485, 16(%rbx)
	cmpq	$7, %rdi
	jbe	.L1284
	movabsq	$5546961525, %rsi
	movq	%rsi, 24(%rbx)
	cmpq	$9, %rdi
	jbe	.L1278
	movl	$2719786239, %esi
	movq	%rsi, 32(%rbx)
	cmpq	$11, %rdi
	jbe	.L1272
	movabsq	$5201645849, %rsi
	movq	%rsi, 40(%rbx)
	cmpq	$13, %rdi
	jbe	.L1266
	movq	$1057469271, 48(%rbx)
	cmpq	$15, %rdi
	jbe	.L1260
	movl	$3082918451, %edi
	movq	%rdi, 56(%rbx)
	movq	$1, 16(%rax)
	movq	8(%rax), %rax
	movq	-8(%rax), %rbx
	salq	$8, %rbx
	shrq	$17, %rbx
	orq	$1, %rbx
	cmpq	$1, %rbx
	jbe	.L1254
	movq	$1, (%rax)
	cmpq	$3, %rbx
	jbe	.L1248
	movq	$1, 8(%rax)
	movl	$1, %eax
	ret
	.align	4
.L1248:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1254:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1260:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1266:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1272:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1278:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1284:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1290:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1296:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1302:
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
	jbe	.L1575
	movq	8(%rax), %rsi
	movabsq	$8589934591, %rcx
	leaq	-8(%rsi,%r13,8), %rdx
	andq	%rcx, %rdx
	movq	%rdx, 8(%rax)
	cmpq	%rsi, %rdx
	jge	.L1351
	cmpq	$1, %rdi
	jbe	.L1342
	movabsq	$8589934591, %rdx
	movq	(%rax), %rsi
	addq	$2, %rsi
	andq	%rdx, %rsi
	movq	%rsi, (%rax)
	cmpq	$1, %rdi
	jbe	.L1568
	jmp	.L1353
	.align	4
.L1342:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1351:
	cmpq	$1, %rdi
	jbe	.L1568
.L1353:
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
	je	.L1462
	movl	$130, %r8d
	subq	%rcx, %r8
	cmpq	%r8, %r13
	jge	.L1415
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L1375
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1375:
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
	jge	.L1388
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1388:
	cmpq	$1, %rcx
	jge	.L1392
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1392:
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
	jle	.L1405
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1405:
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	16(%r12), %rax
	leaq	-1(%rax,%r13), %rax
	movq	%rax, 16(%r12)
	movl	$1, %eax
	movl	$1, %esi
	jmp	.L1578
	.align	4
.L1415:
	movq	24(%r12), %rdx
	cmpq	$1, %r8
	jge	.L1421
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1421:
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
	jge	.L1434
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1434:
	cmpq	$1, %rcx
	jge	.L1438
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1438:
	movq	-8(%rdx), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rdx,%rax), %rdi
	subq	%rdi, %rax
	salq	$1, %rax
	subq	%r8, %rax
	addq	$2, %rax
	cmpq	%rax, %rcx
	jle	.L1451
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1451:
	movq	%r13, 16(%rsp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rbx, 8(%rsp)
	movq	%r8, 24(%rsp)
	call	caml_blit_bytes@PLT
	movq	%r12, %rax
	movq	%r12, (%rsp)
	call	camlSha256__transform_10_25_code@PLT
.L1585:
	xorl	%eax, %eax
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rsi
	subq	%rsi, %rbx
	leaq	1(%rbx), %r13
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	jmp	.L1475
	.align	4
.L1462:
	xorl	%eax, %eax
	movl	$1, %esi
.L1475:
	movq	%rbx, 8(%rsp)
	movq	%r12, (%rsp)
	cmpq	$129, %r13
	jl	.L1515
.L1479:
	movq	24(%r12), %rdx
	cmpq	$1, %rsi
	jge	.L1484
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1484:
	movq	-8(%rbx), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rbx,%rax), %rdi
	subq	%rdi, %rax
	leaq	-127(%rax,%rax), %rax
	cmpq	%rax, %rsi
	jle	.L1495
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1495:
	movq	-8(%rdx), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rdx,%rax), %rdi
	subq	%rdi, %rax
	leaq	-127(%rax,%rax), %rax
	cmpq	$1, %rax
	jge	.L1506
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1506:
	movq	%r13, 24(%rsp)
	movl	$129, %r8d
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%rsi, 16(%rsp)
	call	caml_blit_bytes@PLT
	movq	%r12, %rax
	call	camlSha256__transform_10_25_code@PLT
.L1586:
	movq	24(%rsp), %r13
	addq	$-128, %r13
	movq	16(%rsp), %rsi
	addq	$128, %rsi
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	cmpq	$129, %r13
	jge	.L1479
.L1515:
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L1524
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1524:
	cmpq	$1, %rsi
	jge	.L1528
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1528:
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
	jle	.L1541
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1541:
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
	jge	.L1554
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1554:
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	%r13, 16(%r12)
	jmp	.L1578
	.align	4
.L1568:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1575:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1578:
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
	movq	%rax, %r12
	movq	16(%r12), %rax
	movq	24(%r12), %r13
	movq	-8(%r13), %rdi
	salq	$8, %rdi
	shrq	$18, %rdi
	leaq	-1(,%rdi,8), %rbp
	movzbq	(%r13,%rbp), %rdi
	subq	%rdi, %rbp
	movq	%rax, %rdi
	sarq	$1, %rdi
	cmpq	%rbp, %rdi
	jae	.L2040
	movq	$-128, %rsi
	movb	%sil, (%r13,%rdi)
	leaq	2(%rax), %rsi
	cmpq	$113, %rsi
	jle	.L1635
	movl	$130, %edx
	subq	%rsi, %rdx
	cmpq	$1, %rsi
	jge	.L1614
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1614:
	cmpq	$1, %rdx
	jge	.L1618
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1618:
	movq	%rbp, %rax
	salq	$1, %rax
	subq	%rdx, %rax
	addq	$2, %rax
	cmpq	%rax, %rsi
	jle	.L1625
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1625:
	movq	%rbp, 24(%rsp)
	movq	%rbx, 8(%rsp)
	movl	$1, %ecx
	movq	%r13, %rdi
	movq	%r13, 16(%rsp)
	call	caml_fill_bytes@PLT
	movq	%r12, %rax
	movq	%r12, (%rsp)
	call	camlSha256__transform_10_25_code@PLT
.L2045:
	movl	$1, %esi
	movq	(%rsp), %rax
	movq	8(%rsp), %rbx
	movq	16(%rsp), %r13
	movq	24(%rsp), %rbp
	movq	%rax, %r12
.L1635:
	movl	$114, %eax
	subq	%rsi, %rax
	cmpq	$1, %rsi
	jge	.L1640
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1640:
	cmpq	$1, %rax
	jge	.L1644
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1644:
	movq	%rbp, %rdi
	salq	$1, %rdi
	subq	%rax, %rdi
	addq	$2, %rdi
	cmpq	%rdi, %rsi
	jle	.L1651
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1651:
	movl	$1, %ecx
	movq	%r13, %rdi
	movq	%rax, %rdx
	call	caml_fill_bytes@PLT
	movq	8(%r12), %rax
	movq	-8(%rax), %rdi
	salq	$8, %rdi
	shrq	$17, %rdi
	orq	$1, %rdi
	cmpq	$1, %rdi
	jbe	.L2030
	movq	(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$24, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L1670
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1670:
	cmpq	$511, %rdx
	jle	.L1677
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1677:
	cmpq	$56, %rbp
	jbe	.L2022
	sarq	$1, %rdx
	movb	%dl, 56(%r13)
	movq	%rsi, %rdx
	shrq	$16, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L1688
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1688:
	cmpq	$511, %rdx
	jle	.L1695
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1695:
	cmpq	$57, %rbp
	jbe	.L2014
	sarq	$1, %rdx
	movb	%dl, 57(%r13)
	movq	%rsi, %rdx
	shrq	$8, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L1706
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1706:
	cmpq	$511, %rdx
	jle	.L1713
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1713:
	cmpq	$58, %rbp
	jbe	.L2006
	sarq	$1, %rdx
	movb	%dl, 58(%r13)
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L1722
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1722:
	cmpq	$511, %rsi
	jle	.L1729
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1729:
	cmpq	$59, %rbp
	jbe	.L1998
	sarq	$1, %rsi
	movb	%sil, 59(%r13)
	cmpq	$3, %rdi
	jbe	.L1992
	movq	8(%rax), %rax
	movq	%rax, %rdi
	shrq	$24, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L1746
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1746:
	cmpq	$511, %rdi
	jle	.L1753
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1753:
	cmpq	$60, %rbp
	jbe	.L1984
	sarq	$1, %rdi
	movb	%dil, 60(%r13)
	movq	%rax, %rdi
	shrq	$16, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L1764
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1764:
	cmpq	$511, %rdi
	jle	.L1771
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1771:
	cmpq	$61, %rbp
	jbe	.L1976
	sarq	$1, %rdi
	movb	%dil, 61(%r13)
	movq	%rax, %rdi
	shrq	$8, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L1782
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1782:
	cmpq	$511, %rdi
	jle	.L1789
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1789:
	cmpq	$62, %rbp
	jbe	.L1968
	sarq	$1, %rdi
	movb	%dil, 62(%r13)
	andl	$511, %eax
	cmpq	$1, %rax
	jge	.L1798
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1798:
	cmpq	$511, %rax
	jle	.L1805
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1805:
	cmpq	$63, %rbp
	jbe	.L1960
	movq	%rbx, 8(%rsp)
	sarq	$1, %rax
	movb	%al, 63(%r13)
	movq	%r12, %rax
	movq	%r12, (%rsp)
	call	camlSha256__transform_10_25_code@PLT
.L2046:
	xorl	%eax, %eax
	movq	(%rsp), %rdx
	movq	8(%rsp), %rcx
.L1815:
	leaq	1(%rax,%rax), %rbx
	movq	(%rdx), %rdi
	movq	-8(%rdi), %rsi
	salq	$8, %rsi
	shrq	$17, %rsi
	cmpq	%rsi, %rbx
	jae	.L1953
	movq	-4(%rdi,%rbx,4), %rdi
	leaq	-3(,%rbx,4), %rbx
	movq	%rdi, %rsi
	shrq	$24, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L1834
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1834:
	cmpq	$511, %rsi
	jle	.L1841
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1841:
	movq	-8(%rcx), %r8
	salq	$8, %r8
	shrq	$18, %r8
	leaq	-1(,%r8,8), %r8
	movzbq	(%rcx,%r8), %r9
	subq	%r9, %r8
	movq	%rbx, %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L1945
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r9)
	movq	%rdi, %rsi
	shrq	$16, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L1859
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1859:
	cmpq	$511, %rsi
	jle	.L1866
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1866:
	leaq	2(%rbx), %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L1937
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r9)
	movq	%rdi, %rsi
	shrq	$8, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L1879
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1879:
	cmpq	$511, %rsi
	jle	.L1886
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1886:
	leaq	4(%rbx), %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L1929
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r9)
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L1897
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1897:
	cmpq	$511, %rdi
	jle	.L1904
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1904:
	addq	$6, %rbx
	sarq	$1, %rbx
	cmpq	%r8, %rbx
	jae	.L1921
	sarq	$1, %rdi
	movb	%dil, (%rcx,%rbx)
	incq	%rax
	cmpq	$7, %rax
	jle	.L1815
	movl	$1, %eax
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.align	4
.L1921:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1929:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1937:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1945:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1953:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1960:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1968:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1976:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1984:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1992:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1998:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2006:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2014:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2022:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2030:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2040:
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
	leaq	.LcamlSha256__Pmakearray998(%rip), %rax
	movq	%rax, %rdi
	movq	caml_obj_dup@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L2062:
	movq	%rax, %rbx
	movq	camlSha256__transform_25@GOTPCREL(%rip), %rax
	addq	$16, %rax
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
	.4byte	(.L2062 - .) + 0
	.2byte	17
	.2byte	0
	.align	4
	.4byte	(.L2063 - .) + 0
	.align	8
	.4byte	(.L2046 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L2064 - .) + 0
	.align	8
	.4byte	(.L2045 - .) + 0
	.2byte	49
	.2byte	3
	.2byte	0
	.2byte	8
	.2byte	16
	.align	4
	.4byte	(.L2065 - .) + 0
	.align	8
	.4byte	(.L1586 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L2066 - .) + 0
	.align	8
	.4byte	(.L1585 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L2067 - .) + 0
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
	.4byte	(.L2068 - .) + 0
	.align	8
	.4byte	(.L229 - .) + 0
	.2byte	33
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L2069 - .) + 0
	.align	8
	.4byte	(.L228 - .) + 0
	.2byte	33
	.2byte	1
	.2byte	0
	.align	4
	.4byte	(.L2070 - .) + 0
	.align	8
	.4byte	(.L227 - .) + 0
	.2byte	33
	.2byte	0
	.align	4
	.4byte	(.L2071 - .) + 0
	.align	8
	.align	4
.L2066:
	.4byte	(.L2073 - .) + 0
	.4byte	92805272
	.align	4
.L2067:
	.4byte	(.L2073 - .) + 0
	.4byte	88086680
	.align	4
.L2069:
	.4byte	(.L2074 - .) + 0
	.4byte	28849368
	.align	4
.L2068:
	.4byte	(.L2074 - .) + 0
	.4byte	28325080
	.align	4
.L2063:
	.4byte	(.L2075 - .) + 1140850688
	.4byte	-2147377152
	.align	4
.L2064:
	.4byte	(.L2076 - .) + 0
	.4byte	106432632
	.align	4
.L2071:
	.4byte	(.L2074 - .) + 0
	.4byte	30422240
	.align	4
.L2065:
	.4byte	(.L2076 - .) + 0
	.4byte	102240392
	.align	4
.L2070:
	.4byte	(.L2078 - .) + 1
	.4byte	31467664
	.4byte	(.L2074 - .) + 0
	.4byte	29897992
.L2077:
	.ascii	"bytes.ml\0"
.L2072:
	.ascii	"sha256.ml\0"
	.align	4
.L2076:
	.4byte	(.L2072 - .) + 0
	.ascii	"Sha256.finish\0"
	.align	4
.L2078:
	.4byte	(.L2077 - .) + 0
	.ascii	"Stdlib__Bytes.make\0"
	.align	4
.L2075:
	.4byte	(.L2072 - .) + 0
	.2byte	16
	.2byte	2
	.4byte	820
	.ascii	"Sha256.constants\0"
	.align	4
.L2074:
	.4byte	(.L2072 - .) + 0
	.ascii	"Sha256.create\0"
	.align	4
.L2073:
	.4byte	(.L2072 - .) + 0
	.ascii	"Sha256.add_data\0"
	.align	8
	.size camlSha256__frametable,. - camlSha256__frametable
	.data
	.section .note.GNU-stack,"",@progbits
