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
.LcamlSha256__Pmakearray1061:
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
	.globl	camlSha256__block113
camlSha256__block113:
.LcamlSha256__block113:
	.8byte	caml_exn_Invalid_argument
	.8byte	camlSha256__string111
	.data
	.align	8
	.8byte	4092
	.globl	camlSha256__string111
camlSha256__string111:
.LcamlSha256__string111:
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
	movl	$129, %edi
	movq	caml_create_bytes@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L225:
	movq	%rax, %rdi
	movl	$1, %ecx
	movl	$129, %edx
	movl	$1, %esi
	movq	%rdi, (%rsp)
	call	caml_fill_bytes@PLT
	movl	$1, %esi
	movl	$5, %edi
	movq	caml_array_make@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L226:
	movq	%rax, 8(%rsp)
	movl	$1, %esi
	movl	$17, %edi
	movq	caml_array_make@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L227:
	movq	%rax, %rbx
	subq	$40, %r15
	cmpq	(%r14), %r15
	jb	.L228
.L230:
	leaq	8(%r15), %rax
	movq	$4096, -8(%rax)
	movq	%rbx, (%rax)
	movq	8(%rsp), %rbx
	movq	%rbx, 8(%rax)
	movq	$1, 16(%rax)
	movq	(%rsp), %rbx
	movq	%rbx, 24(%rax)
	addq	$24, %rsp
	.cfi_adjust_cfa_offset -24
	ret
	.cfi_adjust_cfa_offset 24
.L228:
	call	.Lcaml_call_gc_
.L229:
	jmp	.L230
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
	jae	.L302
	movzbq	(%rax,%rsi), %rsi
	leaq	1(%rsi,%rsi), %rsi
	leaq	4(%rbx), %rdx
	sarq	$1, %rdx
	cmpq	%rdi, %rdx
	jae	.L296
	movzbq	(%rax,%rdx), %rdx
	salq	$9, %rdx
	incq	%rdx
	leaq	2(%rbx), %rcx
	sarq	$1, %rcx
	cmpq	%rdi, %rcx
	jae	.L290
	movzbq	(%rax,%rcx), %rcx
	salq	$17, %rcx
	incq	%rcx
	sarq	$1, %rbx
	cmpq	%rdi, %rbx
	jae	.L284
	movzbq	(%rax,%rbx), %rax
	salq	$25, %rax
	incq	%rax
	orq	%rcx, %rax
	orq	%rdx, %rax
	orq	%rsi, %rax
	ret
	.align	4
.L284:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L290:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L296:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L302:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
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
	jge	.L313
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L313:
	cmpq	$511, %rsi
	jle	.L320
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L320:
	movq	-8(%rax), %rdx
	salq	$8, %rdx
	shrq	$18, %rdx
	leaq	-1(,%rdx,8), %rdx
	movzbq	(%rax,%rdx), %rcx
	subq	%rcx, %rdx
	movq	%rbx, %rcx
	sarq	$1, %rcx
	cmpq	%rdx, %rcx
	jae	.L418
	sarq	$1, %rsi
	movb	%sil, (%rax,%rcx)
	movq	%rdi, %rsi
	shrq	$16, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L338
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L338:
	cmpq	$511, %rsi
	jle	.L345
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L345:
	leaq	2(%rbx), %rcx
	sarq	$1, %rcx
	cmpq	%rdx, %rcx
	jae	.L410
	sarq	$1, %rsi
	movb	%sil, (%rax,%rcx)
	movq	%rdi, %rsi
	shrq	$8, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L358
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L358:
	cmpq	$511, %rsi
	jle	.L365
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L365:
	leaq	4(%rbx), %rcx
	sarq	$1, %rcx
	cmpq	%rdx, %rcx
	jae	.L402
	sarq	$1, %rsi
	movb	%sil, (%rax,%rcx)
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L376
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L376:
	cmpq	$511, %rdi
	jle	.L383
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L383:
	addq	$6, %rbx
	sarq	$1, %rbx
	cmpq	%rdx, %rbx
	jae	.L394
	sarq	$1, %rdi
	movb	%dil, (%rax,%rbx)
	movl	$1, %eax
	ret
	.align	4
.L394:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L402:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L410:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L418:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
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
	movq	%rax, (%rsp)
	movl	$1, %esi
	movl	$161, %edi
	movq	caml_array_make@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L1507:
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	(%rsp), %rcx
.L433:
	leaq	1(%rax,%rax), %rbx
	leaq	-3(,%rbx,4), %rdi
	movq	24(%rcx), %rsi
	movq	-8(%rsi), %rdx
	salq	$8, %rdx
	shrq	$18, %rdx
	leaq	-1(,%rdx,8), %rdx
	movzbq	(%rsi,%rdx), %r8
	subq	%r8, %rdx
	leaq	6(%rdi), %r8
	sarq	$1, %r8
	cmpq	%rdx, %r8
	jae	.L524
	movzbq	(%rsi,%r8), %r8
	leaq	1(%r8,%r8), %r8
	leaq	4(%rdi), %r9
	sarq	$1, %r9
	cmpq	%rdx, %r9
	jae	.L518
	movzbq	(%rsi,%r9), %r9
	salq	$9, %r9
	incq	%r9
	leaq	2(%rdi), %r12
	sarq	$1, %r12
	cmpq	%rdx, %r12
	jae	.L512
	movzbq	(%rsi,%r12), %r12
	salq	$17, %r12
	incq	%r12
	sarq	$1, %rdi
	cmpq	%rdx, %rdi
	jae	.L506
	movzbq	(%rsi,%rdi), %rdi
	salq	$25, %rdi
	incq	%rdi
	orq	%r12, %rdi
	orq	%r9, %rdi
	orq	%r8, %rdi
	cmpq	$161, %rbx
	jae	.L500
	movq	8(%rsp), %rsi
	movq	%rdi, -4(%rsi,%rbx,4)
	incq	%rax
	cmpq	$15, %rax
	jg	.L534
	jmp	.L433
	.align	4
.L500:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L506:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L512:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L518:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L524:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L534:
	movl	$16, %eax
.L536:
	leaq	1(%rax,%rax), %rbx
	leaq	-32(%rbx), %rdi
	cmpq	$161, %rdi
	jae	.L642
	movq	8(%rsp), %rsi
	movq	-4(%rsi,%rdi,4), %rdi
	leaq	-30(%rbx), %rsi
	cmpq	$161, %rsi
	jae	.L636
	movq	8(%rsp), %rdx
	movq	-4(%rdx,%rsi,4), %rsi
	leaq	-14(%rbx), %rdx
	cmpq	$161, %rdx
	jae	.L630
	movq	8(%rsp), %r8
	movq	-4(%r8,%rdx,4), %rdx
	leaq	-4(%rbx), %r8
	cmpq	$161, %r8
	jae	.L624
	movq	8(%rsp), %r9
	movq	-4(%r9,%r8,4), %r8
	cmpq	$161, %rbx
	jae	.L618
	movabsq	$8589934591, %r10
	movq	%rsi, %r9
	shrq	$3, %r9
	movabsq	$8589934591, %r13
	movq	%rsi, %r12
	salq	$14, %r12
	addq	$-16383, %r12
	andq	%r13, %r12
	movq	%rsi, %r13
	shrq	$18, %r13
	orq	$1, %r13
	orq	%r12, %r13
	movabsq	$8589934591, %r11
	movq	%rsi, %r12
	salq	$25, %r12
	addq	$-33554431, %r12
	andq	%r11, %r12
	shrq	$7, %rsi
	orq	$1, %rsi
	orq	%r12, %rsi
	xorq	%r13, %rsi
	xorq	%r9, %rsi
	orq	$1, %rsi
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
	addq	%r8, %rdx
	addq	%rdx, %rsi
	leaq	-3(%rsi,%rdi), %rdi
	andq	%r10, %rdi
	movq	8(%rsp), %rsi
	movq	%rdi, -4(%rsi,%rbx,4)
	incq	%rax
	cmpq	$79, %rax
	jg	.L646
	jmp	.L536
	.align	4
.L618:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L624:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L630:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L636:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L642:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L646:
	movq	(%rcx), %rax
	movq	-8(%rax), %rcx
	salq	$8, %rcx
	shrq	$17, %rcx
	orq	$1, %rcx
	cmpq	$1, %rcx
	jbe	.L1501
	movq	(%rax), %r13
	cmpq	$3, %rcx
	jbe	.L1495
	movq	8(%rax), %r12
	cmpq	$5, %rcx
	jbe	.L1489
	movq	16(%rax), %rdi
	cmpq	$7, %rcx
	jbe	.L1483
	movq	24(%rax), %r8
	cmpq	$9, %rcx
	jbe	.L1477
	movq	32(%rax), %rbx
	cmpq	$11, %rcx
	jbe	.L1471
	movq	40(%rax), %rsi
	cmpq	$13, %rcx
	jbe	.L1465
	movq	48(%rax), %rdx
	cmpq	$15, %rcx
	jbe	.L1459
	movq	56(%rax), %rcx
	xorl	%r9d, %r9d
	movq	%r9, (%rsp)
	movq	%rdi, 16(%rsp)
	movq	%rsi, %rdi
	movq	%rdi, 24(%rsp)
	movq	%r12, %rdi
	movq	%rdi, 32(%rsp)
	movq	%r13, %r9
.L707:
	movq	(%rsp), %rdi
	salq	$4, %rdi
	incq	%rdi
	movq	%rdi, 40(%rsp)
	cmpq	$161, %rdi
	jae	.L1417
	movq	8(%rsp), %rdi
	movq	40(%rsp), %rsi
	movq	-4(%rdi,%rsi,4), %rdi
	movq	%rdi, 48(%rsp)
	movq	40(%rsp), %rdi
	cmpq	$129, %rdi
	jae	.L1411
	movabsq	$8589934591, %r12
	movq	camlSha256__transform_25@GOTPCREL(%rip), %rdi
	movq	16(%rdi), %rdi
	movq	%rdi, 56(%rsp)
	movq	40(%rsp), %rsi
	movq	-4(%rdi,%rsi,4), %r13
	movq	24(%rsp), %rdi
	xorq	%rdx, %rdi
	orq	$1, %rdi
	movq	%rbx, %rsi
	andq	%rdi, %rsi
	movq	%rdx, %rdi
	xorq	%rsi, %rdi
	orq	$1, %rdi
	movabsq	$8589934591, %r10
	movq	%rbx, %rsi
	salq	$7, %rsi
	addq	$-127, %rsi
	andq	%r10, %rsi
	movq	%rbx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rsi, %r10
	movabsq	$8589934591, %r11
	movq	%rbx, %rsi
	salq	$21, %rsi
	addq	$-2097151, %rsi
	andq	%r11, %rsi
	movq	%rbx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rsi, %r11
	movabsq	$8589934591, %rbp
	movq	%rbx, %rsi
	salq	$26, %rsi
	addq	$-67108863, %rsi
	andq	%rbp, %rsi
	movq	%rbx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%rsi, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	(%rcx,%rbp), %rsi
	addq	%rsi, %rdi
	addq	%r13, %rdi
	movq	48(%rsp), %rsi
	leaq	-4(%rdi,%rsi), %rdi
	andq	%r12, %rdi
	movabsq	$8589934591, %rcx
	leaq	-1(%r8,%rdi), %rsi
	andq	%rcx, %rsi
	movabsq	$8589934591, %r12
	movabsq	$8589934591, %r13
	movq	%r9, %rcx
	orq	32(%rsp), %rcx
	movq	16(%rsp), %r8
	andq	%rcx, %r8
	movq	%r9, %rcx
	andq	32(%rsp), %rcx
	orq	%r8, %rcx
	movabsq	$8589934591, %r10
	movq	%r9, %r8
	salq	$10, %r8
	addq	$-1023, %r8
	andq	%r10, %r8
	movq	%r9, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r8, %r10
	movabsq	$8589934591, %r11
	movq	%r9, %r8
	salq	$19, %r8
	addq	$-524287, %r8
	andq	%r11, %r8
	movq	%r9, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %rbp
	movq	%r9, %r8
	salq	$30, %r8
	addq	$-1073741823, %r8
	andq	%rbp, %r8
	movq	%r9, %rbp
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
	addq	$2, %rcx
	cmpq	$161, %rcx
	jae	.L1405
	movq	8(%rsp), %r8
	movq	-4(%r8,%rcx,4), %r8
	movq	%r8, 48(%rsp)
	cmpq	$129, %rcx
	jae	.L1399
	movabsq	$8589934591, %r12
	movq	56(%rsp), %r8
	movq	-4(%r8,%rcx,4), %r13
	movq	%rbx, %rcx
	xorq	24(%rsp), %rcx
	orq	$1, %rcx
	movq	%rsi, %r8
	andq	%rcx, %r8
	movq	24(%rsp), %rcx
	xorq	%r8, %rcx
	orq	$1, %rcx
	movabsq	$8589934591, %r10
	movq	%rsi, %r8
	salq	$7, %r8
	addq	$-127, %r8
	andq	%r10, %r8
	movq	%rsi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r8, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r8
	salq	$21, %r8
	addq	$-2097151, %r8
	andq	%r11, %r8
	movq	%rsi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r8
	salq	$26, %r8
	addq	$-67108863, %r8
	andq	%rbp, %r8
	movq	%rsi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r8, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	addq	%rbp, %rdx
	addq	%rcx, %rdx
	addq	%r13, %rdx
	movq	48(%rsp), %rcx
	leaq	-4(%rdx,%rcx), %rdx
	andq	%r12, %rdx
	movabsq	$8589934591, %rcx
	movq	16(%rsp), %r8
	leaq	-1(%r8,%rdx), %r13
	andq	%rcx, %r13
	movabsq	$8589934591, %rcx
	movq	%rcx, 48(%rsp)
	movabsq	$8589934591, %r12
	movq	%rdi, %rcx
	orq	%r9, %rcx
	movq	32(%rsp), %r8
	andq	%rcx, %r8
	movq	%rdi, %rcx
	andq	%r9, %rcx
	orq	%r8, %rcx
	movabsq	$8589934591, %r10
	movq	%rdi, %r8
	salq	$10, %r8
	addq	$-1023, %r8
	andq	%r10, %r8
	movq	%rdi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r8, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r8
	salq	$19, %r8
	addq	$-524287, %r8
	andq	%r11, %r8
	movq	%rdi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r8
	salq	$30, %r8
	addq	$-1073741823, %r8
	andq	%rbp, %r8
	movq	%rdi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r8, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rcx), %rcx
	andq	%r12, %rcx
	leaq	-1(%rdx,%rcx), %rdx
	andq	48(%rsp), %rdx
	movq	40(%rsp), %rcx
	addq	$4, %rcx
	cmpq	$161, %rcx
	jae	.L1393
	movq	8(%rsp), %r8
	movq	-4(%r8,%rcx,4), %r8
	movq	%r8, 48(%rsp)
	cmpq	$129, %rcx
	jae	.L1387
	movabsq	$8589934591, %r8
	movq	%r8, 64(%rsp)
	movq	56(%rsp), %r8
	movq	-4(%r8,%rcx,4), %r12
	movq	%rsi, %rcx
	xorq	%rbx, %rcx
	orq	$1, %rcx
	movq	%r13, %r8
	andq	%rcx, %r8
	movq	%rbx, %rcx
	xorq	%r8, %rcx
	orq	$1, %rcx
	movabsq	$8589934591, %r10
	movq	%r13, %r8
	salq	$7, %r8
	addq	$-127, %r8
	andq	%r10, %r8
	movq	%r13, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r8, %r10
	movabsq	$8589934591, %r11
	movq	%r13, %r8
	salq	$21, %r8
	addq	$-2097151, %r8
	andq	%r11, %r8
	movq	%r13, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %rbp
	movq	%r13, %r8
	salq	$26, %r8
	addq	$-67108863, %r8
	andq	%rbp, %r8
	movq	%r13, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r8, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	24(%rsp), %r8
	addq	%rbp, %r8
	addq	%r8, %rcx
	addq	%r12, %rcx
	movq	48(%rsp), %r8
	leaq	-4(%rcx,%r8), %rcx
	andq	64(%rsp), %rcx
	movabsq	$8589934591, %r12
	movq	32(%rsp), %r8
	leaq	-1(%r8,%rcx), %r8
	andq	%r12, %r8
	movq	%r8, 48(%rsp)
	movabsq	$8589934591, %r8
	movq	%r8, 64(%rsp)
	movabsq	$8589934591, %r8
	movq	%r8, 72(%rsp)
	movq	%rdx, %r8
	orq	%rdi, %r8
	movq	%r9, %r12
	andq	%r8, %r12
	movq	%rdx, %r8
	andq	%rdi, %r8
	orq	%r12, %r8
	movabsq	$8589934591, %r10
	movq	%rdx, %r12
	salq	$10, %r12
	addq	$-1023, %r12
	andq	%r10, %r12
	movq	%rdx, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r12, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %r12
	salq	$19, %r12
	addq	$-524287, %r12
	andq	%r11, %r12
	movq	%rdx, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r12, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %r12
	salq	$30, %r12
	addq	$-1073741823, %r12
	andq	%rbp, %r12
	movq	%rdx, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r12, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r8), %r8
	andq	72(%rsp), %r8
	leaq	-1(%rcx,%r8), %r12
	andq	64(%rsp), %r12
	movq	40(%rsp), %rcx
	addq	$6, %rcx
	cmpq	$161, %rcx
	jae	.L1381
	movq	8(%rsp), %r8
	movq	-4(%r8,%rcx,4), %r8
	movq	%r8, 64(%rsp)
	cmpq	$129, %rcx
	jae	.L1375
	movabsq	$8589934591, %r8
	movq	%r8, 72(%rsp)
	movq	56(%rsp), %r8
	movq	-4(%r8,%rcx,4), %rcx
	movq	%rcx, 80(%rsp)
	movq	%r13, %rcx
	xorq	%rsi, %rcx
	orq	$1, %rcx
	movq	48(%rsp), %r8
	andq	%rcx, %r8
	movq	%rsi, %rcx
	xorq	%r8, %rcx
	orq	$1, %rcx
	movabsq	$8589934591, %r10
	movq	48(%rsp), %r8
	salq	$7, %r8
	addq	$-127, %r8
	andq	%r10, %r8
	movq	48(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r8, %r10
	movabsq	$8589934591, %r11
	movq	48(%rsp), %r8
	salq	$21, %r8
	addq	$-2097151, %r8
	andq	%r11, %r8
	movq	48(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %r8
	movq	48(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%r8, %rbp
	movq	48(%rsp), %r8
	shrq	$6, %r8
	orq	$1, %r8
	orq	%rbp, %r8
	xorq	%r11, %r8
	xorq	%r10, %r8
	orq	$1, %r8
	addq	%r8, %rbx
	addq	%rcx, %rbx
	movq	80(%rsp), %rcx
	addq	%rcx, %rbx
	movq	64(%rsp), %rcx
	leaq	-4(%rbx,%rcx), %rbx
	andq	72(%rsp), %rbx
	movabsq	$8589934591, %r8
	leaq	-1(%r9,%rbx), %rcx
	andq	%r8, %rcx
	movq	%rcx, 64(%rsp)
	movabsq	$8589934591, %rcx
	movq	%rcx, 72(%rsp)
	movabsq	$8589934591, %r9
	movq	%r12, %rcx
	orq	%rdx, %rcx
	movq	%rdi, %r8
	andq	%rcx, %r8
	movq	%r12, %rcx
	andq	%rdx, %rcx
	orq	%r8, %rcx
	movabsq	$8589934591, %r10
	movq	%r12, %r8
	salq	$10, %r8
	addq	$-1023, %r8
	andq	%r10, %r8
	movq	%r12, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r8, %r10
	movabsq	$8589934591, %r11
	movq	%r12, %r8
	salq	$19, %r8
	addq	$-524287, %r8
	andq	%r11, %r8
	movq	%r12, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r8, %r11
	movabsq	$8589934591, %rbp
	movq	%r12, %r8
	salq	$30, %r8
	addq	$-1073741823, %r8
	andq	%rbp, %r8
	movq	%r12, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r8, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rcx), %rcx
	andq	%r9, %rcx
	leaq	-1(%rbx,%rcx), %r9
	andq	72(%rsp), %r9
	movq	40(%rsp), %rbx
	addq	$8, %rbx
	cmpq	$161, %rbx
	jae	.L1369
	movq	8(%rsp), %rcx
	movq	-4(%rcx,%rbx,4), %rcx
	movq	%rcx, 72(%rsp)
	cmpq	$129, %rbx
	jae	.L1363
	movabsq	$8589934591, %rcx
	movq	%rcx, 80(%rsp)
	movq	56(%rsp), %rcx
	movq	-4(%rcx,%rbx,4), %r8
	movq	48(%rsp), %rbx
	xorq	%r13, %rbx
	orq	$1, %rbx
	movq	64(%rsp), %rcx
	andq	%rbx, %rcx
	movq	%r13, %rbx
	xorq	%rcx, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r10
	movq	64(%rsp), %rcx
	salq	$7, %rcx
	addq	$-127, %rcx
	andq	%r10, %rcx
	movq	64(%rsp), %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rcx, %r10
	movabsq	$8589934591, %r11
	movq	64(%rsp), %rcx
	salq	$21, %rcx
	addq	$-2097151, %rcx
	andq	%r11, %rcx
	movq	64(%rsp), %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rcx, %r11
	movabsq	$8589934591, %rcx
	movq	64(%rsp), %rbp
	salq	$26, %rbp
	addq	$-67108863, %rbp
	andq	%rcx, %rbp
	movq	64(%rsp), %rcx
	shrq	$6, %rcx
	orq	$1, %rcx
	orq	%rbp, %rcx
	xorq	%r11, %rcx
	xorq	%r10, %rcx
	orq	$1, %rcx
	addq	%rcx, %rsi
	addq	%rsi, %rbx
	addq	%r8, %rbx
	movq	72(%rsp), %rsi
	leaq	-4(%rbx,%rsi), %rsi
	andq	80(%rsp), %rsi
	movq	40(%rsp), %rbx
	leaq	10(%rbx), %r10
	cmpq	$161, %r10
	jae	.L1357
	movabsq	$8589934591, %rcx
	leaq	-1(%rdi,%rsi), %rbx
	andq	%rcx, %rbx
	movq	%rbx, %rcx
	movabsq	$8589934591, %rbx
	movq	%rbx, 72(%rsp)
	movabsq	$8589934591, %rbx
	movq	%rbx, 80(%rsp)
	movq	%r9, %rbx
	orq	%r12, %rbx
	movq	%rdx, %rdi
	andq	%rbx, %rdi
	movq	%r9, %rbx
	andq	%r12, %rbx
	orq	%rdi, %rbx
	movabsq	$8589934591, %r8
	movq	%r9, %rdi
	salq	$10, %rdi
	addq	$-1023, %rdi
	andq	%r8, %rdi
	movq	%r9, %r8
	shrq	$22, %r8
	orq	$1, %r8
	orq	%rdi, %r8
	movabsq	$8589934591, %r11
	movq	%r9, %rdi
	salq	$19, %rdi
	addq	$-524287, %rdi
	andq	%r11, %rdi
	movq	%r9, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%rdi, %r11
	movabsq	$8589934591, %rbp
	movq	%r9, %rdi
	salq	$30, %rdi
	addq	$-1073741823, %rdi
	andq	%rbp, %rdi
	movq	%r9, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%rdi, %rbp
	xorq	%r11, %rbp
	xorq	%r8, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	80(%rsp), %rbx
	leaq	-1(%rsi,%rbx), %rbx
	andq	72(%rsp), %rbx
	movq	%rbx, %r8
	movq	8(%rsp), %rbx
	movq	-4(%rbx,%r10,4), %rbx
	movq	%rbx, 72(%rsp)
	cmpq	$129, %r10
	jae	.L1351
	movabsq	$8589934591, %rbx
	movq	%rbx, 80(%rsp)
	movq	56(%rsp), %rbx
	movq	-4(%rbx,%r10,4), %rsi
	movq	64(%rsp), %rbx
	xorq	48(%rsp), %rbx
	orq	$1, %rbx
	movq	%rcx, %rdi
	andq	%rbx, %rdi
	movq	48(%rsp), %rbx
	xorq	%rdi, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r10
	movq	%rcx, %rdi
	salq	$7, %rdi
	addq	$-127, %rdi
	andq	%r10, %rdi
	movq	%rcx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rdi, %r10
	movabsq	$8589934591, %r11
	movq	%rcx, %rdi
	salq	$21, %rdi
	addq	$-2097151, %rdi
	andq	%r11, %rdi
	movq	%rcx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rdi, %r11
	movabsq	$8589934591, %rbp
	movq	%rcx, %rdi
	salq	$26, %rdi
	addq	$-67108863, %rdi
	andq	%rbp, %rdi
	movq	%rcx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%rdi, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	(%r13,%rbp), %rdi
	addq	%rdi, %rbx
	addq	%rsi, %rbx
	movq	72(%rsp), %rdi
	leaq	-4(%rbx,%rdi), %rbx
	andq	80(%rsp), %rbx
	movq	40(%rsp), %rdi
	leaq	12(%rdi), %rsi
	cmpq	$161, %rsi
	jae	.L1345
	movabsq	$8589934591, %rdi
	movq	%rdi, 72(%rsp)
	movabsq	$8589934591, %rdi
	movq	%rdi, 80(%rsp)
	movq	%r8, %rdi
	orq	%r9, %rdi
	movq	%r12, %r13
	andq	%rdi, %r13
	movq	%r8, %rdi
	andq	%r9, %rdi
	orq	%r13, %rdi
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
	leaq	-1(%rbp,%rdi), %rdi
	andq	80(%rsp), %rdi
	leaq	-1(%rbx,%rdi), %rdi
	andq	72(%rsp), %rdi
	movabsq	$8589934591, %r13
	leaq	-1(%rdx,%rbx), %rdx
	andq	%r13, %rdx
	movq	8(%rsp), %rbx
	movq	-4(%rbx,%rsi,4), %rbx
	movq	%rbx, 72(%rsp)
	cmpq	$129, %rsi
	jae	.L1339
	movabsq	$8589934591, %rbx
	movq	%rbx, 80(%rsp)
	movq	56(%rsp), %rbx
	movq	-4(%rbx,%rsi,4), %r13
	movq	%rcx, %rbx
	xorq	64(%rsp), %rbx
	orq	$1, %rbx
	movq	%rdx, %rsi
	andq	%rbx, %rsi
	movq	64(%rsp), %rbx
	xorq	%rsi, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r10
	movq	%rdx, %rsi
	salq	$7, %rsi
	addq	$-127, %rsi
	andq	%r10, %rsi
	movq	%rdx, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%rsi, %r10
	movabsq	$8589934591, %r11
	movq	%rdx, %rsi
	salq	$21, %rsi
	addq	$-2097151, %rsi
	andq	%r11, %rsi
	movq	%rdx, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%rsi, %r11
	movabsq	$8589934591, %rbp
	movq	%rdx, %rsi
	salq	$26, %rsi
	addq	$-67108863, %rsi
	andq	%rbp, %rsi
	movq	%rdx, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%rsi, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	48(%rsp), %rsi
	addq	%rbp, %rsi
	addq	%rsi, %rbx
	addq	%r13, %rbx
	movq	72(%rsp), %rsi
	leaq	-4(%rbx,%rsi), %rbx
	andq	80(%rsp), %rbx
	movq	%rbx, 48(%rsp)
	movq	40(%rsp), %rbx
	leaq	14(%rbx), %r13
	cmpq	$161, %r13
	jae	.L1333
	movabsq	$8589934591, %rbx
	movq	48(%rsp), %rsi
	leaq	-1(%r12,%rsi), %rsi
	andq	%rbx, %rsi
	movabsq	$8589934591, %rbx
	movq	%rbx, 40(%rsp)
	movabsq	$8589934591, %rbx
	movq	%rbx, 72(%rsp)
	movq	%rdi, %rbx
	orq	%r8, %rbx
	movq	%r9, %r12
	andq	%rbx, %r12
	movq	%rdi, %rbx
	andq	%r8, %rbx
	orq	%r12, %rbx
	movabsq	$8589934591, %r10
	movq	%rdi, %r12
	salq	$10, %r12
	addq	$-1023, %r12
	andq	%r10, %r12
	movq	%rdi, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r12, %r10
	movabsq	$8589934591, %r11
	movq	%rdi, %r12
	salq	$19, %r12
	addq	$-524287, %r12
	andq	%r11, %r12
	movq	%rdi, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r12, %r11
	movabsq	$8589934591, %rbp
	movq	%rdi, %r12
	salq	$30, %r12
	addq	$-1073741823, %r12
	andq	%rbp, %r12
	movq	%rdi, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r12, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%rbx), %rbx
	andq	72(%rsp), %rbx
	movq	48(%rsp), %r12
	leaq	-1(%r12,%rbx), %rbx
	andq	40(%rsp), %rbx
	movq	%rbx, %r12
	movq	8(%rsp), %rbx
	movq	-4(%rbx,%r13,4), %rbx
	movq	%rbx, 40(%rsp)
	cmpq	$129, %r13
	jae	.L1327
	movabsq	$8589934591, %rbx
	movq	%rbx, 48(%rsp)
	movq	56(%rsp), %rbx
	movq	-4(%rbx,%r13,4), %rbx
	movq	%rbx, 56(%rsp)
	movq	%rdx, %rbx
	xorq	%rcx, %rbx
	orq	$1, %rbx
	movq	%rsi, %r13
	andq	%rbx, %r13
	movq	%rcx, %rbx
	xorq	%r13, %rbx
	orq	$1, %rbx
	movabsq	$8589934591, %r10
	movq	%rsi, %r13
	salq	$7, %r13
	addq	$-127, %r13
	andq	%r10, %r13
	movq	%rsi, %r10
	shrq	$25, %r10
	orq	$1, %r10
	orq	%r13, %r10
	movabsq	$8589934591, %r11
	movq	%rsi, %r13
	salq	$21, %r13
	addq	$-2097151, %r13
	andq	%r11, %r13
	movq	%rsi, %r11
	shrq	$11, %r11
	orq	$1, %r11
	orq	%r13, %r11
	movabsq	$8589934591, %rbp
	movq	%rsi, %r13
	salq	$26, %r13
	addq	$-67108863, %r13
	andq	%rbp, %r13
	movq	%rsi, %rbp
	shrq	$6, %rbp
	orq	$1, %rbp
	orq	%r13, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	movq	64(%rsp), %r13
	addq	%rbp, %r13
	addq	%r13, %rbx
	movq	56(%rsp), %r13
	addq	%r13, %rbx
	movq	40(%rsp), %r13
	leaq	-4(%rbx,%r13), %rbx
	andq	48(%rsp), %rbx
	movq	%rbx, 40(%rsp)
	movabsq	$8589934591, %r13
	movq	40(%rsp), %rbx
	leaq	-1(%r9,%rbx), %rbx
	andq	%r13, %rbx
	movabsq	$8589934591, %r9
	movq	%r9, 48(%rsp)
	movabsq	$8589934591, %r9
	movq	%r9, 56(%rsp)
	movq	%r12, %r9
	orq	%rdi, %r9
	movq	%r8, %r13
	andq	%r9, %r13
	movq	%r12, %r9
	andq	%rdi, %r9
	orq	%r13, %r9
	movabsq	$8589934591, %r10
	movq	%r12, %r13
	salq	$10, %r13
	addq	$-1023, %r13
	andq	%r10, %r13
	movq	%r12, %r10
	shrq	$22, %r10
	orq	$1, %r10
	orq	%r13, %r10
	movabsq	$8589934591, %r11
	movq	%r12, %r13
	salq	$19, %r13
	addq	$-524287, %r13
	andq	%r11, %r13
	movq	%r12, %r11
	shrq	$13, %r11
	orq	$1, %r11
	orq	%r13, %r11
	movabsq	$8589934591, %rbp
	movq	%r12, %r13
	salq	$30, %r13
	addq	$-1073741823, %r13
	andq	%rbp, %r13
	movq	%r12, %rbp
	shrq	$2, %rbp
	orq	$1, %rbp
	orq	%r13, %rbp
	xorq	%r11, %rbp
	xorq	%r10, %rbp
	orq	$1, %rbp
	leaq	-1(%rbp,%r9), %r9
	andq	56(%rsp), %r9
	movq	40(%rsp), %r13
	leaq	-1(%r13,%r9), %r9
	andq	48(%rsp), %r9
	movq	(%rsp), %r13
	incq	%r13
	cmpq	$7, %r13
	jg	.L1321
	movq	%r13, (%rsp)
	movq	%rdi, 16(%rsp)
	movq	%rsi, %rdi
	movq	%rdi, 24(%rsp)
	movq	%r12, %rdi
	movq	%rdi, 32(%rsp)
	jmp	.L707
	.align	4
.L1321:
	movabsq	$8589934591, %r13
	movq	(%rax), %r10
	leaq	-1(%r10,%r9), %r9
	andq	%r13, %r9
	movq	%r9, (%rax)
	movabsq	$8589934591, %r13
	movq	8(%rax), %r9
	leaq	-1(%r9,%r12), %r9
	andq	%r13, %r9
	movq	%r9, 8(%rax)
	movabsq	$8589934591, %r9
	movq	16(%rax), %r12
	leaq	-1(%r12,%rdi), %rdi
	andq	%r9, %rdi
	movq	%rdi, 16(%rax)
	movabsq	$8589934591, %r9
	movq	24(%rax), %rdi
	leaq	-1(%rdi,%r8), %rdi
	andq	%r9, %rdi
	movq	%rdi, 24(%rax)
	movabsq	$8589934591, %rdi
	movq	32(%rax), %r8
	leaq	-1(%r8,%rbx), %rbx
	andq	%rdi, %rbx
	movq	%rbx, 32(%rax)
	movabsq	$8589934591, %rdi
	movq	40(%rax), %rbx
	leaq	-1(%rbx,%rsi), %rbx
	andq	%rdi, %rbx
	movq	%rbx, 40(%rax)
	movabsq	$8589934591, %rdi
	movq	48(%rax), %rbx
	leaq	-1(%rbx,%rdx), %rbx
	andq	%rdi, %rbx
	movq	%rbx, 48(%rax)
	movabsq	$8589934591, %rdi
	movq	56(%rax), %rbx
	leaq	-1(%rbx,%rcx), %rbx
	andq	%rdi, %rbx
	movq	%rbx, 56(%rax)
	movl	$1, %eax
	addq	$88, %rsp
	.cfi_adjust_cfa_offset -88
	ret
	.cfi_adjust_cfa_offset 88
	.align	4
.L1327:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1333:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1339:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1345:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1351:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1357:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1363:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1369:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1375:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1381:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1387:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1393:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1399:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1405:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1411:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1417:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1459:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1465:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1471:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1477:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1483:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1489:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1495:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1501:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
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
	jbe	.L1639
	movl	$3558067407, %esi
	movq	%rsi, (%rbx)
	cmpq	$3, %rdi
	jbe	.L1633
	movabsq	$6288268555, %rsi
	movq	%rsi, 8(%rbx)
	cmpq	$5, %rdi
	jbe	.L1627
	movq	$2027808485, 16(%rbx)
	cmpq	$7, %rdi
	jbe	.L1621
	movabsq	$5546961525, %rsi
	movq	%rsi, 24(%rbx)
	cmpq	$9, %rdi
	jbe	.L1615
	movl	$2719786239, %esi
	movq	%rsi, 32(%rbx)
	cmpq	$11, %rdi
	jbe	.L1609
	movabsq	$5201645849, %rsi
	movq	%rsi, 40(%rbx)
	cmpq	$13, %rdi
	jbe	.L1603
	movq	$1057469271, 48(%rbx)
	cmpq	$15, %rdi
	jbe	.L1597
	movl	$3082918451, %edi
	movq	%rdi, 56(%rbx)
	movq	$1, 16(%rax)
	movq	8(%rax), %rax
	movq	-8(%rax), %rbx
	salq	$8, %rbx
	shrq	$17, %rbx
	orq	$1, %rbx
	cmpq	$1, %rbx
	jbe	.L1591
	movq	$1, (%rax)
	cmpq	$3, %rbx
	jbe	.L1585
	movq	$1, 8(%rax)
	movl	$1, %eax
	ret
	.align	4
.L1585:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1591:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1597:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1603:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1609:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1615:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1621:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1627:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1633:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1639:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
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
	jbe	.L1912
	movq	8(%rax), %rsi
	movabsq	$8589934591, %rcx
	leaq	-8(%rsi,%r13,8), %rdx
	andq	%rcx, %rdx
	movq	%rdx, 8(%rax)
	cmpq	%rsi, %rdx
	jge	.L1688
	cmpq	$1, %rdi
	jbe	.L1679
	movabsq	$8589934591, %rdx
	movq	(%rax), %rsi
	addq	$2, %rsi
	andq	%rdx, %rsi
	movq	%rsi, (%rax)
	cmpq	$1, %rdi
	jbe	.L1905
	jmp	.L1690
	.align	4
.L1679:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1688:
	cmpq	$1, %rdi
	jbe	.L1905
.L1690:
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
	je	.L1799
	movl	$130, %r8d
	subq	%rcx, %r8
	cmpq	%r8, %r13
	jge	.L1752
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L1712
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1712:
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
	jge	.L1725
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1725:
	cmpq	$1, %rcx
	jge	.L1729
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1729:
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
	jle	.L1742
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1742:
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	16(%r12), %rax
	leaq	-1(%rax,%r13), %rax
	movq	%rax, 16(%r12)
	movl	$1, %eax
	movl	$1, %esi
	jmp	.L1915
	.align	4
.L1752:
	movq	24(%r12), %rdx
	cmpq	$1, %r8
	jge	.L1758
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1758:
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
	jge	.L1771
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1771:
	cmpq	$1, %rcx
	jge	.L1775
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1775:
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
	jle	.L1788
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1788:
	movq	%r13, 16(%rsp)
	movl	$1, %esi
	movq	%rbx, %rdi
	movq	%rbx, 8(%rsp)
	movq	%r8, 24(%rsp)
	call	caml_blit_bytes@PLT
	movq	%r12, %rax
	movq	%r12, (%rsp)
	call	camlSha256__transform_10_25_code@PLT
.L1922:
	xorl	%eax, %eax
	movq	16(%rsp), %rbx
	movq	24(%rsp), %rsi
	subq	%rsi, %rbx
	leaq	1(%rbx), %r13
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	jmp	.L1812
	.align	4
.L1799:
	xorl	%eax, %eax
	movl	$1, %esi
.L1812:
	movq	%rbx, 8(%rsp)
	movq	%r12, (%rsp)
	cmpq	$129, %r13
	jl	.L1852
.L1816:
	movq	24(%r12), %rdx
	cmpq	$1, %rsi
	jge	.L1821
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1821:
	movq	-8(%rbx), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rbx,%rax), %rdi
	subq	%rdi, %rax
	leaq	-127(%rax,%rax), %rax
	cmpq	%rax, %rsi
	jle	.L1832
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1832:
	movq	-8(%rdx), %rax
	salq	$8, %rax
	shrq	$18, %rax
	leaq	-1(,%rax,8), %rax
	movzbq	(%rdx,%rax), %rdi
	subq	%rdi, %rax
	leaq	-127(%rax,%rax), %rax
	cmpq	$1, %rax
	jge	.L1843
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1843:
	movq	%r13, 24(%rsp)
	movl	$129, %r8d
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%rsi, 16(%rsp)
	call	caml_blit_bytes@PLT
	movq	%r12, %rax
	call	camlSha256__transform_10_25_code@PLT
.L1923:
	movq	24(%rsp), %r13
	addq	$-128, %r13
	movq	16(%rsp), %rsi
	addq	$128, %rsi
	movq	(%rsp), %r12
	movq	8(%rsp), %rbx
	cmpq	$129, %r13
	jge	.L1816
.L1852:
	movq	24(%r12), %rdx
	cmpq	$1, %r13
	jge	.L1861
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1861:
	cmpq	$1, %rsi
	jge	.L1865
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1865:
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
	jle	.L1878
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1878:
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
	jge	.L1891
	movq	camlStdlib__Bytes__Pmakeblock3987@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1891:
	movl	$1, %ecx
	movq	%rbx, %rdi
	movq	%r13, %r8
	call	caml_blit_bytes@PLT
	movq	%r13, 16(%r12)
	jmp	.L1915
	.align	4
.L1905:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1912:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1915:
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
	jae	.L2377
	movq	$-128, %rsi
	movb	%sil, (%r13,%rdi)
	leaq	2(%rax), %rsi
	cmpq	$113, %rsi
	jle	.L1972
	movl	$130, %edx
	subq	%rsi, %rdx
	cmpq	$1, %rsi
	jge	.L1951
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1951:
	cmpq	$1, %rdx
	jge	.L1955
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1955:
	movq	%rbp, %rax
	salq	$1, %rax
	subq	%rdx, %rax
	addq	$2, %rax
	cmpq	%rax, %rsi
	jle	.L1962
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1962:
	movq	%rbp, 24(%rsp)
	movq	%rbx, 8(%rsp)
	movl	$1, %ecx
	movq	%r13, %rdi
	movq	%r13, 16(%rsp)
	call	caml_fill_bytes@PLT
	movq	%r12, %rax
	movq	%r12, (%rsp)
	call	camlSha256__transform_10_25_code@PLT
.L2382:
	movl	$1, %esi
	movq	(%rsp), %rax
	movq	8(%rsp), %rbx
	movq	16(%rsp), %r13
	movq	24(%rsp), %rbp
	movq	%rax, %r12
.L1972:
	movl	$114, %eax
	subq	%rsi, %rax
	cmpq	$1, %rsi
	jge	.L1977
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1977:
	cmpq	$1, %rax
	jge	.L1981
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1981:
	movq	%rbp, %rdi
	salq	$1, %rdi
	subq	%rax, %rdi
	addq	$2, %rdi
	cmpq	%rdi, %rsi
	jle	.L1988
	movq	camlStdlib__Bytes__Pmakeblock3945@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L1988:
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
	jbe	.L2367
	movq	(%rax), %rsi
	movq	%rsi, %rdx
	shrq	$24, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L2007
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2007:
	cmpq	$511, %rdx
	jle	.L2014
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2014:
	cmpq	$56, %rbp
	jbe	.L2359
	sarq	$1, %rdx
	movb	%dl, 56(%r13)
	movq	%rsi, %rdx
	shrq	$16, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L2025
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2025:
	cmpq	$511, %rdx
	jle	.L2032
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2032:
	cmpq	$57, %rbp
	jbe	.L2351
	sarq	$1, %rdx
	movb	%dl, 57(%r13)
	movq	%rsi, %rdx
	shrq	$8, %rdx
	orq	$1, %rdx
	andl	$511, %edx
	cmpq	$1, %rdx
	jge	.L2043
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2043:
	cmpq	$511, %rdx
	jle	.L2050
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2050:
	cmpq	$58, %rbp
	jbe	.L2343
	sarq	$1, %rdx
	movb	%dl, 58(%r13)
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L2059
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2059:
	cmpq	$511, %rsi
	jle	.L2066
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2066:
	cmpq	$59, %rbp
	jbe	.L2335
	sarq	$1, %rsi
	movb	%sil, 59(%r13)
	cmpq	$3, %rdi
	jbe	.L2329
	movq	8(%rax), %rax
	movq	%rax, %rdi
	shrq	$24, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L2083
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2083:
	cmpq	$511, %rdi
	jle	.L2090
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2090:
	cmpq	$60, %rbp
	jbe	.L2321
	sarq	$1, %rdi
	movb	%dil, 60(%r13)
	movq	%rax, %rdi
	shrq	$16, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L2101
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2101:
	cmpq	$511, %rdi
	jle	.L2108
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2108:
	cmpq	$61, %rbp
	jbe	.L2313
	sarq	$1, %rdi
	movb	%dil, 61(%r13)
	movq	%rax, %rdi
	shrq	$8, %rdi
	orq	$1, %rdi
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L2119
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2119:
	cmpq	$511, %rdi
	jle	.L2126
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2126:
	cmpq	$62, %rbp
	jbe	.L2305
	sarq	$1, %rdi
	movb	%dil, 62(%r13)
	andl	$511, %eax
	cmpq	$1, %rax
	jge	.L2135
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2135:
	cmpq	$511, %rax
	jle	.L2142
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2142:
	cmpq	$63, %rbp
	jbe	.L2297
	movq	%rbx, 8(%rsp)
	sarq	$1, %rax
	movb	%al, 63(%r13)
	movq	%r12, %rax
	movq	%r12, (%rsp)
	call	camlSha256__transform_10_25_code@PLT
.L2383:
	xorl	%eax, %eax
	movq	(%rsp), %rdx
	movq	8(%rsp), %rcx
.L2152:
	leaq	1(%rax,%rax), %rbx
	movq	(%rdx), %rdi
	movq	-8(%rdi), %rsi
	salq	$8, %rsi
	shrq	$17, %rsi
	cmpq	%rsi, %rbx
	jae	.L2290
	movq	-4(%rdi,%rbx,4), %rdi
	leaq	-3(,%rbx,4), %rbx
	movq	%rdi, %rsi
	shrq	$24, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L2171
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2171:
	cmpq	$511, %rsi
	jle	.L2178
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2178:
	movq	-8(%rcx), %r8
	salq	$8, %r8
	shrq	$18, %r8
	leaq	-1(,%r8,8), %r8
	movzbq	(%rcx,%r8), %r9
	subq	%r9, %r8
	movq	%rbx, %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L2282
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r9)
	movq	%rdi, %rsi
	shrq	$16, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L2196
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2196:
	cmpq	$511, %rsi
	jle	.L2203
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2203:
	leaq	2(%rbx), %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L2274
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r9)
	movq	%rdi, %rsi
	shrq	$8, %rsi
	orq	$1, %rsi
	andl	$511, %esi
	cmpq	$1, %rsi
	jge	.L2216
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2216:
	cmpq	$511, %rsi
	jle	.L2223
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2223:
	leaq	4(%rbx), %r9
	sarq	$1, %r9
	cmpq	%r8, %r9
	jae	.L2266
	sarq	$1, %rsi
	movb	%sil, (%rcx,%r9)
	andl	$511, %edi
	cmpq	$1, %rdi
	jge	.L2234
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2234:
	cmpq	$511, %rdi
	jle	.L2241
	movq	camlStdlib__Char__Pmakeblock428@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2241:
	addq	$6, %rbx
	sarq	$1, %rbx
	cmpq	%r8, %rbx
	jae	.L2258
	sarq	$1, %rdi
	movb	%dil, (%rcx,%rbx)
	incq	%rax
	cmpq	$7, %rax
	jle	.L2152
	movl	$1, %eax
	addq	$40, %rsp
	.cfi_adjust_cfa_offset -40
	ret
	.cfi_adjust_cfa_offset 40
	.align	4
.L2258:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2266:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2274:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2282:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2290:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2297:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2305:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2313:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2321:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2329:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2335:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2343:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2351:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2359:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2367:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
	movq	48(%r14), %rsp
	popq	48(%r14)
	popq	%r11
	jmp	*%r11
	.align	4
.L2377:
	movq	camlSha256__block113@GOTPCREL(%rip), %rax
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
	leaq	.LcamlSha256__Pmakearray1061(%rip), %rax
	movq	%rax, %rdi
	movq	caml_obj_dup@GOTPCREL(%rip), %rax
	call	caml_c_call@PLT
.L2399:
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
	.4byte	(.L2399 - .) + 0
	.2byte	17
	.2byte	0
	.align	4
	.4byte	(.L2400 - .) + 0
	.align	8
	.4byte	(.L2383 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L2401 - .) + 0
	.align	8
	.4byte	(.L2382 - .) + 0
	.2byte	49
	.2byte	3
	.2byte	0
	.2byte	8
	.2byte	16
	.align	4
	.4byte	(.L2402 - .) + 0
	.align	8
	.4byte	(.L1923 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L2403 - .) + 0
	.align	8
	.4byte	(.L1922 - .) + 0
	.2byte	49
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L2404 - .) + 0
	.align	8
	.4byte	(.L1507 - .) + 0
	.2byte	97
	.2byte	1
	.2byte	0
	.align	4
	.4byte	(.L2405 - .) + 0
	.align	8
	.4byte	(.L229 - .) + 0
	.2byte	34
	.2byte	3
	.2byte	0
	.2byte	3
	.2byte	8
	.byte	1
	.byte	3
	.align	8
	.4byte	(.L227 - .) + 0
	.2byte	33
	.2byte	2
	.2byte	0
	.2byte	8
	.align	4
	.4byte	(.L2406 - .) + 0
	.align	8
	.4byte	(.L226 - .) + 0
	.2byte	33
	.2byte	1
	.2byte	0
	.align	4
	.4byte	(.L2407 - .) + 0
	.align	8
	.4byte	(.L225 - .) + 0
	.2byte	33
	.2byte	0
	.align	4
	.4byte	(.L2408 - .) + 0
	.align	8
	.align	4
.L2407:
	.4byte	(.L2410 - .) + 0
	.4byte	28325080
	.align	4
.L2405:
	.4byte	(.L2411 - .) + 0
	.4byte	39859424
	.align	4
.L2402:
	.4byte	(.L2412 - .) + 0
	.4byte	101191816
	.align	4
.L2408:
	.4byte	(.L2414 - .) + 1
	.4byte	31467664
	.4byte	(.L2410 - .) + 0
	.4byte	29373704
	.align	4
.L2400:
	.4byte	(.L2415 - .) + 1140850688
	.4byte	-2147377152
	.align	4
.L2403:
	.4byte	(.L2416 - .) + 0
	.4byte	91756696
	.align	4
.L2401:
	.4byte	(.L2412 - .) + 0
	.4byte	105384056
	.align	4
.L2406:
	.4byte	(.L2410 - .) + 0
	.4byte	27800792
	.align	4
.L2404:
	.4byte	(.L2416 - .) + 0
	.4byte	87038104
.L2413:
	.ascii	"bytes.ml\0"
.L2409:
	.ascii	"sha256.ml\0"
	.align	4
.L2412:
	.4byte	(.L2409 - .) + 0
	.ascii	"Sha256.finish\0"
	.align	4
.L2414:
	.4byte	(.L2413 - .) + 0
	.ascii	"Stdlib__Bytes.make\0"
	.align	4
.L2415:
	.4byte	(.L2409 - .) + 0
	.2byte	16
	.2byte	2
	.4byte	820
	.ascii	"Sha256.constants\0"
	.align	4
.L2410:
	.4byte	(.L2409 - .) + 0
	.ascii	"Sha256.create\0"
	.align	4
.L2416:
	.4byte	(.L2409 - .) + 0
	.ascii	"Sha256.add_data\0"
	.align	4
.L2411:
	.4byte	(.L2409 - .) + 0
	.ascii	"Sha256.transform\0"
	.align	8
	.size camlSha256__frametable,. - camlSha256__frametable
	.data
	.section .note.GNU-stack,"",@progbits
