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
.LcamlSha256__Pmakearray1062:
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
	subq	$104, %rsp
	.cfi_adjust_cfa_offset 104
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
	jae	.L531
	movzbq	(%rdx,%r8), %r8
	leaq	1(%r8,%r8), %r8
	leaq	4(%rsi), %r9
	sarq	$1, %r9
	cmpq	%rcx, %r9
	jae	.L525
	movzbq	(%rdx,%r9), %r9
	salq	$9, %r9
	incq	%r9
	leaq	2(%rsi), %r12
	sarq	$1, %r12
	cmpq	%rcx, %r12
	jae	.L519
	movzbq	(%rdx,%r12), %r12
	salq	$17, %r12
	incq	%r12
	sarq	$1, %rsi
	cmpq	%rcx, %rsi
	jae	.L513
	movzbq	(%rdx,%rsi), %rsi
	salq	$25, %rsi
	incq	%rsi
	orq	%r12, %rsi
	orq	%r9, %rsi
	orq	%r8, %rsi
	movq	(%rsp), %rdx
	movq	-8(%rdx), %rdx
	salq	$8, %rdx
	shrq	$17, %rdx
	orq	$1, %rdx
	cmpq	%rdx, %rdi
	jae	.L507
	movq	(%rsp), %rcx
	movq	%rsi, -4(%rcx,%rdi,4)
	incq	%rbx
	cmpq	$15, %rbx
	jle	.L436
	movq	%rdx, 8(%rsp)
	movl	$16, %ebx
	jmp	.L543
	.align	4
.L507:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L513:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L519:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L525:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L531:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L543:
	leaq	1(%rbx,%rbx), %rdi
	leaq	-32(%rdi), %rsi
	movq	8(%rsp), %rdx
	cmpq	%rdx, %rsi
	jae	.L649
	movq	(%rsp), %rdx
	movq	-4(%rdx,%rsi,4), %rsi
	leaq	-30(%rdi), %rdx
	movq	8(%rsp), %rcx
	cmpq	%rcx, %rdx
	jae	.L643
	movq	(%rsp), %rcx
	movq	-4(%rcx,%rdx,4), %rdx
	leaq	-14(%rdi), %rcx
	movq	8(%rsp), %r8
	cmpq	%r8, %rcx
	jae	.L637
	movq	(%rsp), %r8
	movq	-4(%r8,%rcx,4), %rcx
	leaq	-4(%rdi), %r8
	movq	8(%rsp), %r9
	cmpq	%r9, %r8
	jae	.L631
	movq	(%rsp), %r9
	movq	-4(%r9,%r8,4), %r8
	movq	8(%rsp), %r9
	cmpq	%r9, %rdi
	jae	.L625
	movabsq	$8589934591, %r10
	movq	%rdx, %r9
	shrq	$3, %r9
	movabsq	$8589934591, %r13
	movq	%rdx, %r12
	salq	$14, %r12
	addq	$-16383, %r12
	andq	%r13, %r12
	movq	%rdx, %r13
	shrq	$18, %r13
	orq	$1, %r13
	orq	%r12, %r13
	movabsq	$8589934591, %r11
	movq	%rdx, %r12
	salq	$25, %r12
	addq	$-33554431, %r12
	andq	%r11, %r12
	shrq	$7, %rdx
	orq	$1, %rdx
	orq	%r12, %rdx
	xorq	%r13, %rdx
	xorq	%r9, %rdx
	orq	$1, %rdx
	movq	%r8, %r9
	shrq	$10, %r9
	movabsq	$8589934591, %r13
	movq	%r8, %r12
	salq	$13, %r12
	addq	$-8191, %r12
	andq	%r13, %r12
	movq	%r8, %r13
	shrq	$19, %r13
	orq	$1, %r13
	orq	%r12, %r13
	movabsq	$8589934591, %r11
	movq	%r8, %r12
	salq	$15, %r12
	addq	$-32767, %r12
	andq	%r11, %r12
	shrq	$17, %r8
	orq	$1, %r8
	orq	%r12, %r8
	xorq	%r13, %r8
	xorq	%r9, %r8
	orq	$1, %r8
	addq	%r8, %rcx
	addq	%rcx, %rdx
	leaq	-3(%rdx,%rsi), %rsi
	andq	%r10, %rsi
	movq	(%rsp), %rdx
	movq	%rsi, -4(%rdx,%rdi,4)
	incq	%rbx
	cmpq	$79, %rbx
	jg	.L653
	jmp	.L543
	.align	4
.L625:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L631:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L637:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L643:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L649:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L653:
	movq	(%rax), %rax
	movq	-8(%rax), %rsi
	salq	$8, %rsi
	shrq	$17, %rsi
	orq	$1, %rsi
	cmpq	$1, %rsi
	jbe	.L1508
	movq	(%rax), %r9
	cmpq	$3, %rsi
	jbe	.L1502
	movq	8(%rax), %r12
	cmpq	$5, %rsi
	jbe	.L1496
	movq	16(%rax), %rbx
	cmpq	$7, %rsi
	jbe	.L1490
	movq	24(%rax), %rcx
	cmpq	$9, %rsi
	jbe	.L1484
	movq	32(%rax), %r8
	cmpq	$11, %rsi
	jbe	.L1478
	movq	40(%rax), %r13
	cmpq	$13, %rsi
	jbe	.L1472
	movq	48(%rax), %rdi
	cmpq	$15, %rsi
	jbe	.L1466
	movq	56(%rax), %rsi
	xorl	%edx, %edx
	movq	%rdx, 16(%rsp)
	movq	%r12, %rdx
	movq	%rdx, 24(%rsp)
	movq	%r13, %rdx
	movq	%rdx, 32(%rsp)
	movq	%rbx, 40(%rsp)
.L714:
	movq	16(%rsp), %rbx
	salq	$4, %rbx
	incq	%rbx
	movq	%rbx, 48(%rsp)
	movq	8(%rsp), %rdx
	cmpq	%rdx, %rbx
	jae	.L1424
	movq	(%rsp), %rbx
	movq	48(%rsp), %rdx
	movq	-4(%rbx,%rdx,4), %rbx
	movq	%rbx, 56(%rsp)
	movq	48(%rsp), %rbx
	cmpq	$129, %rbx
	jae	.L1418
	movabsq	$8589934591, %r12
	movq	camlSha256__transform_25@GOTPCREL(%rip), %rbx
	movq	16(%rbx), %rbx
	movq	%rbx, 64(%rsp)
	movq	48(%rsp), %rdx
	movq	-4(%rbx,%rdx,4), %r13
	movq	32(%rsp), %rbx
	xorq	%rdi, %rbx
	orq	$1, %rbx
	movq	%r8, %rdx
	andq	%rbx, %rdx
	movq	%rdi, %rbx
	xorq	%rdx, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r10
	movq	%r8, %rdx
	salq	$7, %rdx
	addq	$-127, %rdx
	andq	%r10, %rdx
	movq	%r8, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rdx, %r10
	movabsq	$8589934591, %r11
	movq	%r8, %rdx
	salq	$21, %rdx
	addq	$-2097151, %rdx
	andq	%r11, %rdx
	movq	%r8, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rdx, %r11
	movabsq	$8589934591, %rbp
	movq	%r8, %rdx
	salq	$26, %rdx
	addq	$-67108863, %rdx
	andq	%rbp, %rdx
	movq	%r8, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%rdx, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rsi
	addq	%rsi, %rbx
	addq	%r13, %rbx
	movq	56(%rsp), %rsi
	leaq	-4(%rbx,%rsi), %rbx
	andq	%r12, %rbx
	movabsq	$8589934591, %rdx
	leaq	-1(%rcx,%rbx), %rsi
	andq	%rdx, %rsi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%r9, %rdx
	orq	24(%rsp), %rdx
	movq	40(%rsp), %rcx
	andq	%rdx, %rcx
	movq	%r9, %rdx
	andq	24(%rsp), %rdx
	orq	%rcx, %rdx
	movabsq	$8589934591, %r10
	movq	%r9, %rcx
	salq	$10, %rcx
	addq	$-1023, %rcx
	andq	%r10, %rcx
	movq	%r9, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%rcx, %r10
	movabsq	$8589934591, %r11
	movq	%r9, %rcx
	salq	$19, %rcx
	addq	$-524287, %rcx
	andq	%r11, %rcx
	movq	%r9, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%rcx, %r11
	movabsq	$8589934591, %rbp
	movq	%r9, %rcx
	salq	$30, %rcx
	addq	$-1073741823, %rcx
	andq	%rbp, %rcx
	movq	%r9, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%rcx, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rdx), %rdx
	andq	%r13, %rdx
	leaq	-1(%rbx,%rdx), %rbx
	andq	%r12, %rbx
	movq	48(%rsp), %rdx
	addq	$2, %rdx
	movq	8(%rsp), %rcx
	cmpq	%rcx, %rdx
	jae	.L1412
	movq	(%rsp), %rcx
	movq	-4(%rcx,%rdx,4), %rcx
	movq	%rcx, 56(%rsp)
	cmpq	$129, %rdx
	jae	.L1406
	movabsq	$8589934591, %r12
	movq	64(%rsp), %rcx
	movq	-4(%rcx,%rdx,4), %r13
	movq	%r8, %rdx
	xorq	32(%rsp), %rdx
	orq	$1, %rdx
	movq	%rsi, %rcx
	andq	%rdx, %rcx
	movq	32(%rsp), %rdx
	xorq	%rcx, %rdx
	orq	$1, %rdx
	movabsq	$8589934591, %r10
	movq	%rsi, %rcx
	salq	$7, %rcx
	addq	$-127, %rcx
	andq	%r10, %rcx
	movq	%rsi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rcx, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %rcx
	salq	$21, %rcx
	addq	$-2097151, %rcx
	andq	%r11, %rcx
	movq	%rsi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rcx, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %rcx
	salq	$26, %rcx
	addq	$-67108863, %rcx
	andq	%rbp, %rcx
	movq	%rsi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%rcx, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rdi
	addq	%rdx, %rdi
	addq	%r13, %rdi
	movq	56(%rsp), %rdx
	leaq	-4(%rdi,%rdx), %rdi
	andq	%r12, %rdi
	movabsq	$8589934591, %rcx
	movq	40(%rsp), %rdx
	leaq	-1(%rdx,%rdi), %rdx
	andq	%rcx, %rdx
	movabsq	$8589934591, %rcx
	movq	%rcx, 56(%rsp)
	movabsq	$8589934591, %r13
	movq	%rbx, %rcx
	orq	%r9, %rcx
	movq	24(%rsp), %r12
	andq	%rcx, %r12
	movq	%rbx, %rcx
	andq	%r9, %rcx
	orq	%r12, %rcx
	movabsq	$8589934591, %r10
	movq	%rbx, %r12
	salq	$10, %r12
	addq	$-1023, %r12
	andq	%r10, %r12
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r12, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r12
	salq	$19, %r12
	addq	$-524287, %r12
	andq	%r11, %r12
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r12, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r12
	salq	$30, %r12
	addq	$-1073741823, %r12
	andq	%rbp, %r12
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r12, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rcx), %rcx
	andq	%r13, %rcx
	leaq	-1(%rdi,%rcx), %rdi
	andq	56(%rsp), %rdi
	movq	48(%rsp), %rcx
	addq	$4, %rcx
	movq	8(%rsp), %r12
	cmpq	%r12, %rcx
	jae	.L1400
	movq	(%rsp), %r12
	movq	-4(%r12,%rcx,4), %r12
	movq	%r12, 56(%rsp)
	cmpq	$129, %rcx
	jae	.L1394
	movabsq	$8589934591, %r12
	movq	%r12, 72(%rsp)
	movq	64(%rsp), %r12
	movq	-4(%r12,%rcx,4), %r13
	movq	%rsi, %rcx
	xorq	%r8, %rcx
	orq	$1, %rcx
	movq	%rdx, %r12
	andq	%rcx, %r12
	movq	%r8, %rcx
	xorq	%r12, %rcx
	orq	$1, %rcx
	movabsq	$8589934591, %r10
	movq	%rdx, %r12
	salq	$7, %r12
	addq	$-127, %r12
	andq	%r10, %r12
	movq	%rdx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r12, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r12
	salq	$21, %r12
	addq	$-2097151, %r12
	andq	%r11, %r12
	movq	%rdx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r12, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r12
	salq	$26, %r12
	addq	$-67108863, %r12
	andq	%rbp, %r12
	movq	%rdx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r12, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	32(%rsp), %r12
	addq	%rbp, %r12
	addq	%r12, %rcx
	addq	%r13, %rcx
	movq	56(%rsp), %r12
	leaq	-4(%rcx,%r12), %rcx
	andq	72(%rsp), %rcx
	movabsq	$8589934591, %r13
	movq	24(%rsp), %r12
	leaq	-1(%r12,%rcx), %r12
	andq	%r13, %r12
	movq	%r12, 56(%rsp)
	movabsq	$8589934591, %r12
	movq	%r12, 72(%rsp)
	movabsq	$8589934591, %r12
	movq	%r12, 80(%rsp)
	movq	%rdi, %r12
	orq	%rbx, %r12
	movq	%r9, %r13
	andq	%r12, %r13
	movq	%rdi, %r12
	andq	%rbx, %r12
	orq	%r13, %r12
	movabsq	$8589934591, %r10
	movq	%rdi, %r13
	salq	$10, %r13
	addq	$-1023, %r13
	andq	%r10, %r13
	movq	%rdi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r13, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r13
	salq	$19, %r13
	addq	$-524287, %r13
	andq	%r11, %r13
	movq	%rdi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r13, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r13
	salq	$30, %r13
	addq	$-1073741823, %r13
	andq	%rbp, %r13
	movq	%rdi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r13, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r12), %r12
	andq	80(%rsp), %r12
	leaq	-1(%rcx,%r12), %r12
	andq	72(%rsp), %r12
	movq	48(%rsp), %rcx
	addq	$6, %rcx
	movq	8(%rsp), %r13
	cmpq	%r13, %rcx
	jae	.L1388
	movq	(%rsp), %r13
	movq	-4(%r13,%rcx,4), %r13
	movq	%r13, 72(%rsp)
	cmpq	$129, %rcx
	jae	.L1382
	movabsq	$8589934591, %r13
	movq	%r13, 80(%rsp)
	movq	64(%rsp), %r13
	movq	-4(%r13,%rcx,4), %rcx
	movq	%rcx, 88(%rsp)
	movq	%rdx, %rcx
	xorq	%rsi, %rcx
	orq	$1, %rcx
	movq	56(%rsp), %r13
	andq	%rcx, %r13
	movq	%rsi, %rcx
	xorq	%r13, %rcx
	orq	$1, %rcx
	movabsq	$8589934591, %r10
	movq	56(%rsp), %r13
	salq	$7, %r13
	addq	$-127, %r13
	andq	%r10, %r13
	movq	56(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r13, %r10
	movabsq	$8589934591, %r11
	movq	56(%rsp), %r13
	salq	$21, %r13
	addq	$-2097151, %r13
	andq	%r11, %r13
	movq	56(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r13, %r11
	movabsq	$8589934591, %r13
	movq	56(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r13, %rbp
	movq	56(%rsp), %r13
	shrq	$6, %r13
	orq	$1, %r13
	orq	%rbp, %r13
	xorq	%r11, %r13
	xorq	%r10, %r13
	orq	$1, %r13
	addq	%r13, %r8
	addq	%r8, %rcx
	movq	88(%rsp), %r8
	addq	%r8, %rcx
	movq	72(%rsp), %r8
	leaq	-4(%rcx,%r8), %rcx
	andq	80(%rsp), %rcx
	movabsq	$8589934591, %r13
	leaq	-1(%r9,%rcx), %r8
	andq	%r13, %r8
	movq	%r8, 72(%rsp)
	movabsq	$8589934591, %r8
	movq	%r8, 80(%rsp)
	movabsq	$8589934591, %r13
	movq	%r12, %r8
	orq	%rdi, %r8
	movq	%rbx, %r9
	andq	%r8, %r9
	movq	%r12, %r8
	andq	%rdi, %r8
	orq	%r9, %r8
	movabsq	$8589934591, %r10
	movq	%r12, %r9
	salq	$10, %r9
	addq	$-1023, %r9
	andq	%r10, %r9
	movq	%r12, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	%r12, %r9
	salq	$19, %r9
	addq	$-524287, %r9
	andq	%r11, %r9
	movq	%r12, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %rbp
	movq	%r12, %r9
	salq	$30, %r9
	addq	$-1073741823, %r9
	andq	%rbp, %r9
	movq	%r12, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r9, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	%r13, %r8
	leaq	-1(%rcx,%r8), %r8
	andq	80(%rsp), %r8
	movq	48(%rsp), %rcx
	addq	$8, %rcx
	movq	8(%rsp), %r9
	cmpq	%r9, %rcx
	jae	.L1376
	movq	(%rsp), %r9
	movq	-4(%r9,%rcx,4), %r9
	movq	%r9, 80(%rsp)
	cmpq	$129, %rcx
	jae	.L1370
	movabsq	$8589934591, %r9
	movq	%r9, 88(%rsp)
	movq	64(%rsp), %r9
	movq	-4(%r9,%rcx,4), %r13
	movq	56(%rsp), %rcx
	xorq	%rdx, %rcx
	orq	$1, %rcx
	movq	72(%rsp), %r9
	andq	%rcx, %r9
	movq	%rdx, %rcx
	xorq	%r9, %rcx
	orq	$1, %rcx
	movabsq	$8589934591, %r10
	movq	72(%rsp), %r9
	salq	$7, %r9
	addq	$-127, %r9
	andq	%r10, %r9
	movq	72(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r9, %r10
	movabsq	$8589934591, %r11
	movq	72(%rsp), %r9
	salq	$21, %r9
	addq	$-2097151, %r9
	andq	%r11, %r9
	movq	72(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r9, %r11
	movabsq	$8589934591, %r9
	movq	72(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r9, %rbp
	movq	72(%rsp), %r9
	shrq	$6, %r9
	orq	$1, %r9
	orq	%rbp, %r9
	xorq	%r11, %r9
	xorq	%r10, %r9
	orq	$1, %r9
	addq	%r9, %rsi
	addq	%rcx, %rsi
	addq	%r13, %rsi
	movq	80(%rsp), %rcx
	leaq	-4(%rsi,%rcx), %rcx
	andq	88(%rsp), %rcx
	movq	48(%rsp), %rsi
	leaq	10(%rsi), %r9
	movq	8(%rsp), %rsi
	cmpq	%rsi, %r9
	jae	.L1364
	movabsq	$8589934591, %r13
	leaq	-1(%rbx,%rcx), %rsi
	andq	%r13, %rsi
	movabsq	$8589934591, %rbx
	movq	%rbx, 80(%rsp)
	movabsq	$8589934591, %rbx
	movq	%rbx, 88(%rsp)
	movq	%r8, %rbx
	orq	%r12, %rbx
	movq	%rdi, %r13
	andq	%rbx, %r13
	movq	%r8, %rbx
	andq	%r12, %rbx
	orq	%r13, %rbx
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
	leaq	-1(%rbp,%rbx), %rbx
	andq	88(%rsp), %rbx
	leaq	-1(%rcx,%rbx), %rcx
	andq	80(%rsp), %rcx
	movq	(%rsp), %rbx
	movq	-4(%rbx,%r9,4), %rbx
	movq	%rbx, 80(%rsp)
	cmpq	$129, %r9
	jae	.L1358
	movabsq	$8589934591, %rbx
	movq	%rbx, 88(%rsp)
	movq	64(%rsp), %rbx
	movq	-4(%rbx,%r9,4), %r13
	movq	72(%rsp), %rbx
	xorq	56(%rsp), %rbx
	orq	$1, %rbx
	movq	%rsi, %r9
	andq	%rbx, %r9
	movq	56(%rsp), %rbx
	xorq	%r9, %rbx
	orq	$1, %rbx
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
	addq	%rbp, %rdx
	addq	%rdx, %rbx
	addq	%r13, %rbx
	movq	80(%rsp), %rdx
	leaq	-4(%rbx,%rdx), %rdx
	andq	88(%rsp), %rdx
	movq	48(%rsp), %rbx
	leaq	12(%rbx), %r9
	movq	8(%rsp), %rbx
	cmpq	%rbx, %r9
	jae	.L1352
	movabsq	$8589934591, %rbx
	movq	%rbx, 80(%rsp)
	movabsq	$8589934591, %rbx
	movq	%rbx, 88(%rsp)
	movq	%rcx, %rbx
	orq	%r8, %rbx
	movq	%r12, %r13
	andq	%rbx, %r13
	movq	%rcx, %rbx
	andq	%r8, %rbx
	orq	%r13, %rbx
	movabsq	$8589934591, %r10
	movq	%rcx, %r13
	salq	$10, %r13
	addq	$-1023, %r13
	andq	%r10, %r13
	movq	%rcx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r13, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %r13
	salq	$19, %r13
	addq	$-524287, %r13
	andq	%r11, %r13
	movq	%rcx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r13, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %r13
	salq	$30, %r13
	addq	$-1073741823, %r13
	andq	%rbp, %r13
	movq	%rcx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r13, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	88(%rsp), %rbx
	leaq	-1(%rdx,%rbx), %rbx
	andq	80(%rsp), %rbx
	movabsq	$8589934591, %r13
	leaq	-1(%rdi,%rdx), %rdi
	andq	%r13, %rdi
	movq	(%rsp), %rdx
	movq	-4(%rdx,%r9,4), %rdx
	movq	%rdx, 80(%rsp)
	cmpq	$129, %r9
	jae	.L1346
	movabsq	$8589934591, %rdx
	movq	%rdx, 88(%rsp)
	movq	64(%rsp), %rdx
	movq	-4(%rdx,%r9,4), %r13
	movq	%rsi, %rdx
	xorq	72(%rsp), %rdx
	orq	$1, %rdx
	movq	%rdi, %r9
	andq	%rdx, %r9
	movq	72(%rsp), %rdx
	xorq	%r9, %rdx
	orq	$1, %rdx
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
	movq	56(%rsp), %r9
	addq	%rbp, %r9
	addq	%r9, %rdx
	addq	%r13, %rdx
	movq	80(%rsp), %r9
	leaq	-4(%rdx,%r9), %rdx
	andq	88(%rsp), %rdx
	movq	%rdx, 56(%rsp)
	movq	48(%rsp), %rdx
	leaq	14(%rdx), %r9
	movq	8(%rsp), %rdx
	cmpq	%rdx, %r9
	jae	.L1340
	movabsq	$8589934591, %rdx
	movq	%rdx, 48(%rsp)
	movabsq	$8589934591, %rdx
	movq	%rdx, 80(%rsp)
	movq	%rbx, %rdx
	orq	%rcx, %rdx
	movq	%r8, %r13
	andq	%rdx, %r13
	movq	%rbx, %rdx
	andq	%rcx, %rdx
	orq	%r13, %rdx
	movabsq	$8589934591, %r10
	movq	%rbx, %r13
	salq	$10, %r13
	addq	$-1023, %r13
	andq	%r10, %r13
	movq	%rbx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r13, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %r13
	salq	$19, %r13
	addq	$-524287, %r13
	andq	%r11, %r13
	movq	%rbx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r13, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %r13
	salq	$30, %r13
	addq	$-1073741823, %r13
	andq	%rbp, %r13
	movq	%rbx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r13, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rdx), %rdx
	andq	80(%rsp), %rdx
	movq	56(%rsp), %r13
	leaq	-1(%r13,%rdx), %rdx
	andq	48(%rsp), %rdx
	movabsq	$8589934591, %r13
	movq	56(%rsp), %r10
	leaq	-1(%r12,%r10), %r12
	andq	%r13, %r12
	movq	(%rsp), %r13
	movq	-4(%r13,%r9,4), %r13
	movq	%r13, 48(%rsp)
	cmpq	$129, %r9
	jae	.L1334
	movabsq	$8589934591, %r13
	movq	%r13, 56(%rsp)
	movq	64(%rsp), %r13
	movq	-4(%r13,%r9,4), %r9
	movq	%r9, 64(%rsp)
	movq	%rdi, %r9
	xorq	%rsi, %r9
	orq	$1, %r9
	movq	%r12, %r13
	andq	%r9, %r13
	movq	%rsi, %r9
	xorq	%r13, %r9
	orq	$1, %r9
	movabsq	$8589934591, %r10
	movq	%r12, %r13
	salq	$7, %r13
	addq	$-127, %r13
	andq	%r10, %r13
	movq	%r12, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r13, %r10
	movabsq	$8589934591, %r11
	movq	%r12, %r13
	salq	$21, %r13
	addq	$-2097151, %r13
	andq	%r11, %r13
	movq	%r12, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r13, %r11
	movabsq	$8589934591, %rbp
	movq	%r12, %r13
	salq	$26, %r13
	addq	$-67108863, %r13
	andq	%rbp, %r13
	movq	%r12, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r13, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	72(%rsp), %r13
	addq	%rbp, %r13
	addq	%r13, %r9
	movq	64(%rsp), %r13
	addq	%r13, %r9
	movq	48(%rsp), %r13
	leaq	-4(%r9,%r13), %r9
	andq	56(%rsp), %r9
	movq	%r9, 48(%rsp)
	movabsq	$8589934591, %r9
	movq	48(%rsp), %r13
	leaq	-1(%r8,%r13), %r8
	andq	%r9, %r8
	movabsq	$8589934591, %r9
	movq	%r9, 56(%rsp)
	movabsq	$8589934591, %r9
	movq	%r9, 64(%rsp)
	movq	%rdx, %r9
	orq	%rbx, %r9
	movq	%rcx, %r13
	andq	%r9, %r13
	movq	%rdx, %r9
	andq	%rbx, %r9
	orq	%r13, %r9
	movabsq	$8589934591, %r10
	movq	%rdx, %r13
	salq	$10, %r13
	addq	$-1023, %r13
	andq	%r10, %r13
	movq	%rdx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r13, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r13
	salq	$19, %r13
	addq	$-524287, %r13
	andq	%r11, %r13
	movq	%rdx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r13, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r13
	salq	$30, %r13
	addq	$-1073741823, %r13
	andq	%rbp, %r13
	movq	%rdx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r13, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r9), %r9
	andq	64(%rsp), %r9
	movq	48(%rsp), %r13
	leaq	-1(%r13,%r9), %r9
	andq	56(%rsp), %r9
	movq	16(%rsp), %r13
	incq	%r13
	cmpq	$7, %r13
	jg	.L1328
	movq	%r13, 16(%rsp)
	movq	%rdx, 24(%rsp)
	movq	%r12, %rdx
	movq	%rdx, 32(%rsp)
	movq	%rbx, 40(%rsp)
	jmp	.L714
	.align	4
.L1328:
	movabsq	$8589934591, %r13
	movq	(%rax), %r10
	leaq	-1(%r10,%r9), %r9
	andq	%r13, %r9
	movq	%r9, (%rax)
	movabsq	$8589934591, %r9
	movq	8(%rax), %r13
	leaq	-1(%r13,%rdx), %rdx
	andq	%r9, %rdx
	movq	%rdx, 8(%rax)
	movabsq	$8589934591, %rdx
	movq	16(%rax), %r9
	leaq	-1(%r9,%rbx), %rbx
	andq	%rdx, %rbx
	movq	%rbx, 16(%rax)
	movabsq	$8589934591, %rdx
	movq	24(%rax), %rbx
	leaq	-1(%rbx,%rcx), %rbx
	andq	%rdx, %rbx
	movq	%rbx, 24(%rax)
	movabsq	$8589934591, %rdx
	movq	32(%rax), %rbx
	leaq	-1(%rbx,%r8), %rbx
	andq	%rdx, %rbx
	movq	%rbx, 32(%rax)
	movabsq	$8589934591, %rdx
	movq	40(%rax), %rbx
	leaq	-1(%rbx,%r12), %rbx
	andq	%rdx, %rbx
	movq	%rbx, 40(%rax)
	movabsq	$8589934591, %rdx
	movq	48(%rax), %rbx
	leaq	-1(%rbx,%rdi), %rbx
	andq	%rdx, %rbx
	movq	%rbx, 48(%rax)
	movabsq	$8589934591, %rdi
	movq	56(%rax), %rbx
	leaq	-1(%rbx,%rsi), %rbx
	andq	%rdi, %rbx
	movq	%rbx, 56(%rax)
	movl	$1, %eax
	addq	$104, %rsp
	.cfi_adjust_cfa_offset -104
	ret
	.cfi_adjust_cfa_offset 104
	.align	4
.L1334:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1340:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1346:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1352:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1358:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1364:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1370:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1376:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1382:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1388:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1394:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1400:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1406:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1412:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1418:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1424:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1466:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1472:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1478:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1484:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1490:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1496:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1502:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1508:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.cfi_adjust_cfa_offset -104
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
	jbe	.L1644
	movl	$3558067407, %esi
	movq	%rsi, (%rbx)
	cmpq	$3, %rdi
	jbe	.L1638
	movabsq	$6288268555, %rsi
	movq	%rsi, 8(%rbx)
	cmpq	$5, %rdi
	jbe	.L1632
	movq	$2027808485, 16(%rbx)
	cmpq	$7, %rdi
	jbe	.L1626
	movabsq	$5546961525, %rsi
	movq	%rsi, 24(%rbx)
	cmpq	$9, %rdi
	jbe	.L1620
	movl	$2719786239, %esi
	movq	%rsi, 32(%rbx)
	cmpq	$11, %rdi
	jbe	.L1614
	movabsq	$5201645849, %rsi
	movq	%rsi, 40(%rbx)
	cmpq	$13, %rdi
	jbe	.L1608
	movq	$1057469271, 48(%rbx)
	cmpq	$15, %rdi
	jbe	.L1602
	movl	$3082918451, %edi
	movq	%rdi, 56(%rbx)
	movq	$1, 16(%rax)
	movq	8(%rax), %rax
	movq	-8(%rax), %rbx
	salq	$8, %rbx
	shrq	$17, %rbx
	orq	$1, %rbx
	cmpq	$1, %rbx
	jbe	.L1596
	movq	$1, (%rax)
	cmpq	$3, %rbx
	jbe	.L1590
	movq	$1, 8(%rax)
	movl	$1, %eax
	ret
	.align	4
.L1590:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1596:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1602:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1608:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1614:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1620:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1626:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1632:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1638:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1644:
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
	jbe	.L1917
	movq	8(%rax), %rsi
	movabsq	$8589934591, %rcx
	leaq	-8(%rsi,%r13,8), %rdx
	andq	%rcx, %rdx
	movq	%rdx, 8(%rax)
	cmpq	%rsi, %rdx
	jge	.L1693
	cmpq	$1, %rdi
	jbe	.L1684
	movabsq	$8589934591, %rdx
	movq	(%rax), %rsi
	addq	$2, %rsi
	andq	%rdx, %rsi
	movq	%rsi, (%rax)
	cmpq	$1, %rdi
	jbe	.L1910
	jmp	.L1695
	.align	4
.L1684:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1693:
	cmpq	$1, %rdi
	jbe	.L1910
.L1695:
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
	je	.L1804
	movl	$130, %r8d
	subq	%rcx, %r8
	cmpq	%r8, %r13
	jge	.L1757
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L1717
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1717:
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
	jge	.L1730
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1730:
	cmpq	$1, %rcx
	jge	.L1734
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1734:
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
	jle	.L1747
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1747:
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	16(%r12), %rax
	leaq	-1(%rax,%r13), %rax
	movq	%rax, 16(%r12)
	movl	$1, %eax
	movl	$1, %esi
	jmp	.L1920
	.align	4
.L1757:
	movq	24(%r12), %rdx
	cmpq	$1, %r8
	jge	.L1763
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1763:
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
	jge	.L1776
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1776:
	cmpq	$1, %rcx
	jge	.L1780
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1780:
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
	jle	.L1793
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1793:
	movq	%r13, 16(%rsp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rbx, 8(%rsp)
	movq	%r8, 24(%rsp)
	call	caml_blit_bytes@PLT
	movq	%r12, %rax
	movq	%r12, (%rsp)
	call	camlSha256__transform_10_25_code@PLT
.L1927:
	xorl	%eax, %eax
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rsi
	subq	%rsi, %rbx
	leaq	1(%rbx), %r13
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	jmp	.L1817
	.align	4
.L1804:
	xorl	%eax, %eax
	movl	$1, %esi
.L1817:
	movq	%rbx, 8(%rsp)
	movq	%r12, (%rsp)
	cmpq	$129, %r13
	jl	.L1857
.L1821:
	movq	24(%r12), %rdx
	cmpq	$1, %rsi
	jge	.L1826
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1826:
	movq	-8(%rbx), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rbx,%rax), %rdi
	subq	%rdi, %rax
	leaq	-127(%rax,%rax), %rax
	cmpq	%rax, %rsi
	jle	.L1837
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1837:
	movq	-8(%rdx), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rdx,%rax), %rdi
	subq	%rdi, %rax
	leaq	-127(%rax,%rax), %rax
	cmpq	$1, %rax
	jge	.L1848
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1848:
	movq	%r13, 24(%rsp)
	movl	$129, %r8d
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%rsi, 16(%rsp)
	call	caml_blit_bytes@PLT
	movq	%r12, %rax
	call	camlSha256__transform_10_25_code@PLT
.L1928:
	movq	24(%rsp), %r13
	addq	$-128, %r13
	movq	16(%rsp), %rsi
	addq	$128, %rsi
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	cmpq	$129, %r13
	jge	.L1821
.L1857:
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L1866
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1866:
	cmpq	$1, %rsi
	jge	.L1870
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1870:
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
	jle	.L1883
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1883:
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
	jge	.L1896
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1896:
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	%r13, 16(%r12)
	jmp	.L1920
	.align	4
.L1910:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1917:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1920:
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
	jae	.L2382
	movq	$-128, %rsi
	movb	%sil, (%r13,%rdi)
	leaq	2(%rax), %rsi
	cmpq	$113, %rsi
	jle	.L1977
	movl	$130, %edx
	subq	%rsi, %rdx
	cmpq	$1, %rsi
	jge	.L1956
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1956:
	cmpq	$1, %rdx
	jge	.L1960
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1960:
	movq	%rbp, %rax
	salq	$1, %rax
	subq	%rdx, %rax
	addq	$2, %rax
	cmpq	%rax, %rsi
	jle	.L1967
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1967:
	movq	%rbp, 24(%rsp)
	movq	%rbx, 8(%rsp)
	movl	$1, %ecx
	movq	%r13, %rdi
	movq	%r13, 16(%rsp)
	call	caml_fill_bytes@PLT
	movq	%r12, %rax
	movq	%r12, (%rsp)
	call	camlSha256__transform_10_25_code@PLT
.L2387:
	movl	$1, %esi
	movq	(%rsp), %rax
	movq	8(%rsp), %rbx
	movq	16(%rsp), %r13
	movq	24(%rsp), %rbp
	movq	%rax, %r12
.L1977:
	movl	$114, %eax
	subq	%rsi, %rax
	cmpq	$1, %rsi
	jge	.L1982
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1982:
	cmpq	$1, %rax
	jge	.L1986
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1986:
	movq	%rbp, %rdi
	salq	$1, %rdi
	subq	%rax, %rdi
	addq	$2, %rdi
	cmpq	%rdi, %rsi
	jle	.L1993
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1993:
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
	jbe	.L2372
	movq	(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$24, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L2012
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2012:
	cmpq	$511, %rdx
	jle	.L2019
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2019:
	cmpq	$56, %rbp
	jbe	.L2364
	sarq	$1, %rdx
	movb	%dl, 56(%r13)
	movq	%rsi, %rdx
	shrq	$16, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L2030
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2030:
	cmpq	$511, %rdx
	jle	.L2037
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2037:
	cmpq	$57, %rbp
	jbe	.L2356
	sarq	$1, %rdx
	movb	%dl, 57(%r13)
	movq	%rsi, %rdx
	shrq	$8, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L2048
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2048:
	cmpq	$511, %rdx
	jle	.L2055
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2055:
	cmpq	$58, %rbp
	jbe	.L2348
	sarq	$1, %rdx
	movb	%dl, 58(%r13)
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L2064
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2064:
	cmpq	$511, %rsi
	jle	.L2071
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2071:
	cmpq	$59, %rbp
	jbe	.L2340
	sarq	$1, %rsi
	movb	%sil, 59(%r13)
	cmpq	$3, %rdi
	jbe	.L2334
	movq	8(%rax), %rax
	movq	%rax, %rdi
	shrq	$24, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L2088
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2088:
	cmpq	$511, %rdi
	jle	.L2095
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2095:
	cmpq	$60, %rbp
	jbe	.L2326
	sarq	$1, %rdi
	movb	%dil, 60(%r13)
	movq	%rax, %rdi
	shrq	$16, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L2106
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2106:
	cmpq	$511, %rdi
	jle	.L2113
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2113:
	cmpq	$61, %rbp
	jbe	.L2318
	sarq	$1, %rdi
	movb	%dil, 61(%r13)
	movq	%rax, %rdi
	shrq	$8, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L2124
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2124:
	cmpq	$511, %rdi
	jle	.L2131
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2131:
	cmpq	$62, %rbp
	jbe	.L2310
	sarq	$1, %rdi
	movb	%dil, 62(%r13)
	andl	$511, %eax
	cmpq	$1, %rax
	jge	.L2140
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2140:
	cmpq	$511, %rax
	jle	.L2147
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2147:
	cmpq	$63, %rbp
	jbe	.L2302
	movq	%rbx, 8(%rsp)
	sarq	$1, %rax
	movb	%al, 63(%r13)
	movq	%r12, %rax
	movq	%r12, (%rsp)
	call	camlSha256__transform_10_25_code@PLT
.L2388:
	xorl	%eax, %eax
	movq	(%rsp), %rdx
	movq	8(%rsp), %rcx
.L2157:
	leaq	1(%rax,%rax), %rbx
	movq	(%rdx), %rdi
	movq	-8(%rdi), %rsi
	salq	$8, %rsi
	shrq	$17, %rsi
	cmpq	%rsi, %rbx
	jae	.L2295
	movq	-4(%rdi,%rbx,4), %rdi
	leaq	-3(,%rbx,4), %rbx
	movq	%rdi, %rsi
	shrq	$24, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L2176
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2176:
	cmpq	$511, %rsi
	jle	.L2183
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2183:
	movq	-8(%rcx), %r8
	salq	$8, %r8
	shrq	$18, %r8
	leaq	-1(,%r8,8), %r8
	movzbq	(%rcx,%r8), %r9
	subq	%r9, %r8
	movq	%rbx, %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L2287
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r9)
	movq	%rdi, %rsi
	shrq	$16, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L2201
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2201:
	cmpq	$511, %rsi
	jle	.L2208
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2208:
	leaq	2(%rbx), %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L2279
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r9)
	movq	%rdi, %rsi
	shrq	$8, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L2221
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2221:
	cmpq	$511, %rsi
	jle	.L2228
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2228:
	leaq	4(%rbx), %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L2271
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r9)
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L2239
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2239:
	cmpq	$511, %rdi
	jle	.L2246
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2246:
	addq	$6, %rbx
	sarq	$1, %rbx
	cmpq	%r8, %rbx
	jae	.L2263
	sarq	$1, %rdi
	movb	%dil, (%rcx,%rbx)
	incq	%rax
	cmpq	$7, %rax
	jle	.L2157
	movl	$1, %eax
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.align	4
.L2263:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2271:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2279:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2287:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2295:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2302:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2310:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2318:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2326:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2334:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2340:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2348:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2356:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2364:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2372:
	movq	camlSha256__block115@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2382:
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
	leaq	.LcamlSha256__Pmakearray1062(%rip), %rax
	movq	%rax, %rdi
	movq	caml_obj_dup@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L2404:
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
	.4byte	(.L2404 - .) + 0
	.2byte	17
	.2byte	0
	.align	4
	.4byte	(.L2405 - .) + 0
	.align	8
	.4byte	(.L2388 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L2406 - .) + 0
	.align	8
	.4byte	(.L2387 - .) + 0
	.2byte	49
	.2byte	3
	.2byte	0
	.2byte	8
	.2byte	16
	.align	4
	.4byte	(.L2407 - .) + 0
	.align	8
	.4byte	(.L1928 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L2408 - .) + 0
	.align	8
	.4byte	(.L1927 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L2409 - .) + 0
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
	.4byte	(.L2410 - .) + 0
	.align	8
	.4byte	(.L229 - .) + 0
	.2byte	33
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L2411 - .) + 0
	.align	8
	.4byte	(.L228 - .) + 0
	.2byte	33
	.2byte	1
	.2byte	0
	.align	4
	.4byte	(.L2412 - .) + 0
	.align	8
	.4byte	(.L227 - .) + 0
	.2byte	33
	.2byte	0
	.align	4
	.4byte	(.L2413 - .) + 0
	.align	8
	.align	4
.L2407:
	.4byte	(.L2415 - .) + 0
	.4byte	102240392
	.align	4
.L2408:
	.4byte	(.L2416 - .) + 0
	.4byte	92805272
	.align	4
.L2411:
	.4byte	(.L2417 - .) + 0
	.4byte	28849368
	.align	4
.L2410:
	.4byte	(.L2417 - .) + 0
	.4byte	28325080
	.align	4
.L2405:
	.4byte	(.L2418 - .) + 1140850688
	.4byte	-2147377152
	.align	4
.L2413:
	.4byte	(.L2417 - .) + 0
	.4byte	30422240
	.align	4
.L2409:
	.4byte	(.L2416 - .) + 0
	.4byte	88086680
	.align	4
.L2412:
	.4byte	(.L2420 - .) + 1
	.4byte	31467664
	.4byte	(.L2417 - .) + 0
	.4byte	29897992
	.align	4
.L2406:
	.4byte	(.L2415 - .) + 0
	.4byte	106432632
.L2419:
	.ascii	"bytes.ml\0"
.L2414:
	.ascii	"sha256.ml\0"
	.align	4
.L2415:
	.4byte	(.L2414 - .) + 0
	.ascii	"Sha256.finish\0"
	.align	4
.L2420:
	.4byte	(.L2419 - .) + 0
	.ascii	"Stdlib__Bytes.make\0"
	.align	4
.L2418:
	.4byte	(.L2414 - .) + 0
	.2byte	16
	.2byte	2
	.4byte	820
	.ascii	"Sha256.constants\0"
	.align	4
.L2417:
	.4byte	(.L2414 - .) + 0
	.ascii	"Sha256.create\0"
	.align	4
.L2416:
	.4byte	(.L2414 - .) + 0
	.ascii	"Sha256.add_data\0"
	.align	8
	.size camlSha256__frametable,. - camlSha256__frametable
	.data
	.section .note.GNU-stack,"",@progbits
