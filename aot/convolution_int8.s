	.text
	.attribute	4, 16
	.attribute	5, "rv64gcv0p7"
	.file	"halide_buffer_t.cpp"
	.section	.text.convolution_int8,"ax",@progbits
	.globl	convolution_int8                # -- Begin function convolution_int8
	.p2align	1
	.type	convolution_int8,@function
convolution_int8:                       # @convolution_int8
# %bb.0:                                # %entry
	addi	sp, sp, -336
	sd	s0, 328(sp)                     # 8-byte Folded Spill
	sd	s1, 320(sp)                     # 8-byte Folded Spill
	sd	s2, 312(sp)                     # 8-byte Folded Spill
	sd	s3, 304(sp)                     # 8-byte Folded Spill
	sd	s4, 296(sp)                     # 8-byte Folded Spill
	sd	s5, 288(sp)                     # 8-byte Folded Spill
	sd	s6, 280(sp)                     # 8-byte Folded Spill
	sd	s7, 272(sp)                     # 8-byte Folded Spill
	sd	s8, 264(sp)                     # 8-byte Folded Spill
.Lpcrel_hi0:
	auipc	a3, %pcrel_hi(.Lb4.buffer)
	addi	t6, a3, %pcrel_lo(.Lpcrel_hi0)
	ld	a7, 16(t6)
	ld	s1, 40(a2)
.Lpcrel_hi1:
	auipc	a3, %pcrel_hi(.Lbias.buffer)
	addi	s4, a3, %pcrel_lo(.Lpcrel_hi1)
	ld	t0, 16(s4)
	lw	t1, 0(s1)
	lw	t2, 16(s1)
	lw	s6, 24(s1)
	lw	t3, 32(s1)
	lw	a6, 40(s1)
	ld	a3, 0(t6)
	lw	t4, 48(s1)
	lw	t5, 56(s1)
	or	a4, a7, a3
	mv	a3, t0
	beqz	a4, .LBB0_8
# %bb.1:                                # %after_bb
	ld	a4, 0(s4)
	ld	s7, 16(a2)
	or	a3, a3, a4
	beqz	a3, .LBB0_9
.LBB0_2:                                # %after_bb1
	ld	s5, 16(a0)
	mv	s2, s7
	beqz	s7, .LBB0_10
.LBB0_3:                                # %after_bb4
	ld	s8, 16(a1)
	mv	s3, s5
	beqz	s5, .LBB0_16
.LBB0_4:                                # %after_bb7
	beqz	s8, .LBB0_18
.LBB0_5:
	li	a1, 0
	beqz	s3, .LBB0_20
.LBB0_6:
	li	a0, 0
	beqz	s2, .LBB0_21
.LBB0_7:
	li	a2, 0
	j	.LBB0_22
.LBB0_8:                                # %then_bb
	lui	a3, 128
	addiw	a3, a3, 9
	slli	a3, a3, 13
	sd	a3, 32(t6)
	ld	a3, 40(t6)
	sd	zero, 0(t6)
	sd	zero, 8(t6)
	sd	zero, 16(t6)
	sw	zero, 0(a3)
	li	a4, 16
	sw	a4, 4(a3)
	li	a4, 1
	sw	a4, 8(a3)
	sw	zero, 12(a3)
	ld	a3, 16(s4)
	sd	zero, 24(t6)
	ld	a4, 0(s4)
	ld	s7, 16(a2)
	or	a3, a3, a4
	bnez	a3, .LBB0_2
.LBB0_9:                                # %then_bb2
	lui	a3, 128
	addiw	a3, a3, 9
	slli	a3, a3, 13
	sd	a3, 32(s4)
	ld	a3, 40(s4)
	sd	zero, 0(s4)
	sd	zero, 8(s4)
	sd	zero, 16(s4)
	sw	zero, 0(a3)
	li	a4, 16
	sw	a4, 4(a3)
	li	a4, 1
	sw	a4, 8(a3)
	sw	zero, 12(a3)
	sd	zero, 24(s4)
	ld	s5, 16(a0)
	mv	s2, s7
	bnez	s7, .LBB0_3
.LBB0_10:                               # %_halide_buffer_is_bounds_query.exit92
	ld	a3, 0(a2)
	beqz	a3, .LBB0_12
# %bb.11:
	li	s2, 0
	ld	s8, 16(a1)
	mv	s3, s5
	bnez	s5, .LBB0_4
	j	.LBB0_16
.LBB0_12:                               # %then_bb5
	sw	zero, 0(sp)
	li	a3, 16
	sw	a3, 4(sp)
	li	a4, 1
	sw	a4, 8(sp)
	sw	zero, 12(sp)
	sw	zero, 16(sp)
	li	a5, 56
	sw	a5, 20(sp)
	sw	a3, 24(sp)
	sw	zero, 28(sp)
	sw	zero, 32(sp)
	sw	a5, 36(sp)
	li	a3, 896
	sw	a3, 40(sp)
	sw	zero, 44(sp)
	sw	zero, 48(sp)
	sw	a4, 52(sp)
	lui	a3, 12
	addiw	a3, a3, 1024
	sw	a3, 56(sp)
	sw	zero, 60(sp)
	lui	a3, 512
	addiw	a3, a3, 9
	slli	a3, a3, 13
	sd	a3, 32(a2)
	sd	zero, 0(a2)
	sd	zero, 8(a2)
	mv	a3, sp
	sd	zero, 16(a2)
	beq	a3, s1, .LBB0_15
# %bb.13:                               # %for.body.i116.preheader
	li	a4, 4
	li	a5, 4
.LBB0_14:                               # %for.body.i116
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a4, e32, m1
	vlwu.v	v8, (a3)
	vsw.v	v8, (s1)
	addi	a5, a5, -1
	addi	s1, s1, 16
	addi	a3, a3, 16
	bnez	a5, .LBB0_14
.LBB0_15:                               # %_halide_buffer_init.exit117
	li	s2, 0
	sd	zero, 24(a2)
	ld	s8, 16(a1)
	mv	s3, s5
	bnez	s5, .LBB0_4
.LBB0_16:                               # %_halide_buffer_is_bounds_query.exit106
	ld	a3, 0(a0)
	beqz	a3, .LBB0_30
# %bb.17:
	li	s3, 0
	bnez	s8, .LBB0_5
.LBB0_18:                               # %_halide_buffer_is_bounds_query.exit122
	ld	a3, 0(a1)
	beqz	a3, .LBB0_34
# %bb.19:                               # %land.rhs.i144
	ld	a1, 0(a1)
	seqz	a1, a1
	bnez	s3, .LBB0_6
.LBB0_20:                               # %land.rhs.i149
	ld	a0, 0(a0)
	seqz	a0, a0
	bnez	s2, .LBB0_7
.LBB0_21:                               # %land.rhs.i154
	ld	a2, 0(a2)
	seqz	a2, a2
.LBB0_22:                               # %_halide_buffer_is_bounds_query.exit155
	ld	a3, 16(t6)
	ld	a4, 0(t6)
	ld	a5, 16(s4)
	ld	s1, 0(s4)
	or	a3, a3, a4
	seqz	a3, a3
	or	a5, a5, s1
	seqz	a4, a5
	or	a3, a3, a4
	or	a0, a0, a2
	or	a0, a0, a1
	or	a0, a0, a3
	bnez	a0, .LBB0_29
# %bb.23:                               # %"produce convolution_int8"
	li	t6, 0
	mulw	a0, t5, t4
	mulw	a1, s6, t2
	mulw	a2, a6, t3
	add	a1, a1, a2
	add	a0, a0, a1
	li	a1, 16
	vsetvli	zero, a1, e32, m4
	vlwu.v	v8, (a7)
	vlwu.v	v12, (t0)
	add	t1, t1, a0
	vsetvli	a0, zero, e32, m4
	vmv.v.i	v16, 0
	addi	a2, sp, 192
	li	t0, 56
	lui	a0, 2
	addiw	a7, a0, 768
.LBB0_24:                               # %"for convolution_int8.s0.y"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_25 Depth 2
                                        #       Child Loop BB0_26 Depth 3
	li	a4, 0
	mulw	a0, a6, t6
	subw	t2, a0, t1
	mv	t3, s5
.LBB0_25:                               # %"for convolution_int8.s0.x"
                                        #   Parent Loop BB0_24 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_26 Depth 3
	vsetvli	zero, a1, e32, m4
	vsw.v	v16, (a2)
	li	a0, 40
	mv	s1, s8
	mv	a5, t3
.LBB0_26:                               # %"for sum.s1.r4$z"
                                        #   Parent Loop BB0_24 Depth=1
                                        #     Parent Loop BB0_25 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lw	a3, 0(a5)
	vlwu.v	v20, (a2)
	vlwu.v	v24, (s1)
	addiw	a3, a3, 128
	vsetvli	s0, zero, e32, m4
	vmadd.vx	v24, a3, v20
	vsetvli	zero, a1, e32, m4
	vsw.v	v24, (a2)
	addi	a0, a0, -1
	addi	a5, a5, 4
	addi	s1, s1, 64
	bnez	a0, .LBB0_26
# %bb.27:                               # %"consume sum"
                                        #   in Loop: Header=BB0_25 Depth=2
	vlwu.v	v20, (a2)
	vsetvli	a0, zero, e32, m4
	vadd.vv	v20, v12, v20
	vmul.vv	v20, v20, v8
	vsetvli	zero, a1, e32, m4
	vsra.vi	v20, v20, 21
	vsetvli	a0, zero, e32, m4
	vadd.vi	v20, v20, 7
	mul	a0, a4, s6
	add	a0, a0, t2
	slli	a0, a0, 2
	add	a0, a0, s7
	vsetvli	zero, a1, e32, m4
	vsw.v	v20, (a0)
	addi	a4, a4, 1
	addi	t3, t3, 160
	bne	a4, t0, .LBB0_25
# %bb.28:                               # %"end for convolution_int8.s0.x"
                                        #   in Loop: Header=BB0_24 Depth=1
	addi	t6, t6, 1
	add	s5, s5, a7
	bne	t6, t0, .LBB0_24
.LBB0_29:                               # %destructor_block
	li	a0, 0
	ld	s0, 328(sp)                     # 8-byte Folded Reload
	ld	s1, 320(sp)                     # 8-byte Folded Reload
	ld	s2, 312(sp)                     # 8-byte Folded Reload
	ld	s3, 304(sp)                     # 8-byte Folded Reload
	ld	s4, 296(sp)                     # 8-byte Folded Reload
	ld	s5, 288(sp)                     # 8-byte Folded Reload
	ld	s6, 280(sp)                     # 8-byte Folded Reload
	ld	s7, 272(sp)                     # 8-byte Folded Reload
	ld	s8, 264(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 336
	ret
.LBB0_30:                               # %then_bb8
	ld	s0, 40(a0)
	sw	zero, 64(sp)
	li	a3, 40
	sw	a3, 68(sp)
	li	a4, 1
	sw	a4, 72(sp)
	sw	zero, 76(sp)
	sw	zero, 80(sp)
	li	a5, 56
	sw	a5, 84(sp)
	sw	a3, 88(sp)
	sw	zero, 92(sp)
	sw	zero, 96(sp)
	sw	a5, 100(sp)
	lui	a3, 1
	addiw	a3, a3, -1856
	sw	a3, 104(sp)
	sw	zero, 108(sp)
	sw	zero, 112(sp)
	sw	a4, 116(sp)
	lui	a3, 31
	addiw	a3, a3, -1536
	sw	a3, 120(sp)
	sw	zero, 124(sp)
	lui	a3, 512
	addiw	a3, a3, 9
	slli	a3, a3, 13
	sd	a3, 32(a0)
	sd	zero, 0(a0)
	sd	zero, 8(a0)
	addi	a3, sp, 64
	sd	zero, 16(a0)
	beq	a3, s0, .LBB0_33
# %bb.31:                               # %for.body.i138.preheader
	li	a4, 4
	li	a5, 4
.LBB0_32:                               # %for.body.i138
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a4, e32, m1
	vlwu.v	v8, (a3)
	vsw.v	v8, (s0)
	addi	a5, a5, -1
	addi	s0, s0, 16
	addi	a3, a3, 16
	bnez	a5, .LBB0_32
.LBB0_33:                               # %_halide_buffer_init.exit140
	li	s3, 0
	sd	zero, 24(a0)
	bnez	s8, .LBB0_5
	j	.LBB0_18
.LBB0_34:                               # %then_bb11
	ld	s0, 40(a1)
	sw	zero, 128(sp)
	li	a3, 16
	sw	a3, 132(sp)
	li	a4, 1
	sw	a4, 136(sp)
	sw	zero, 140(sp)
	sw	zero, 144(sp)
	sw	a4, 148(sp)
	sw	a3, 152(sp)
	sw	zero, 156(sp)
	sw	zero, 160(sp)
	sw	a4, 164(sp)
	sw	a3, 168(sp)
	sw	zero, 172(sp)
	sw	zero, 176(sp)
	li	a4, 40
	sw	a4, 180(sp)
	sw	a3, 184(sp)
	sw	zero, 188(sp)
	lui	a3, 512
	addiw	a3, a3, 9
	slli	a3, a3, 13
	sd	a3, 32(a1)
	sd	zero, 0(a1)
	sd	zero, 8(a1)
	addi	a3, sp, 128
	sd	zero, 16(a1)
	beq	a3, s0, .LBB0_37
# %bb.35:                               # %for.body.i179.preheader
	li	a4, 4
	li	a5, 4
.LBB0_36:                               # %for.body.i179
                                        # =>This Inner Loop Header: Depth=1
	vsetvli	zero, a4, e32, m1
	vlwu.v	v8, (a3)
	vsw.v	v8, (s0)
	addi	a5, a5, -1
	addi	s0, s0, 16
	addi	a3, a3, 16
	bnez	a5, .LBB0_36
.LBB0_37:                               # %_halide_buffer_init.exit181
	sd	zero, 24(a1)
	ld	a1, 0(a1)
	seqz	a1, a1
	bnez	s3, .LBB0_6
	j	.LBB0_20
.Lfunc_end0:
	.size	convolution_int8, .Lfunc_end0-convolution_int8
                                        # -- End function
	.section	.text.convolution_int8_argv,"ax",@progbits
	.globl	convolution_int8_argv           # -- Begin function convolution_int8_argv
	.p2align	1
	.type	convolution_int8_argv,@function
convolution_int8_argv:                  # @convolution_int8_argv
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	ld	a3, 0(a0)
	ld	a1, 8(a0)
	ld	a2, 16(a0)
	mv	a0, a3
	call	convolution_int8@plt
	li	a0, 0
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	convolution_int8_argv, .Lfunc_end1-convolution_int8_argv
                                        # -- End function
	.section	.text.convolution_int8_metadata,"ax",@progbits
	.globl	convolution_int8_metadata       # -- Begin function convolution_int8_metadata
	.p2align	1
	.type	convolution_int8_metadata,@function
convolution_int8_metadata:              # @convolution_int8_metadata
# %bb.0:                                # %entry
.Lpcrel_hi2:
	auipc	a0, %pcrel_hi(.Lconvolution_int8_metadata_storage)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi2)
	ret
.Lfunc_end2:
	.size	convolution_int8_metadata, .Lfunc_end2-convolution_int8_metadata
                                        # -- End function
	.type	.Lb4.shape,@object              # @b4.shape
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lb4.shape:
	.asciz	"\000\000\000\000\020\000\000\000\001\000\000\000\000\000\000"
	.size	.Lb4.shape, 16

	.type	.Lb4.data,@object               # @b4.data
	.p2align	5, 0x0
.Lb4.data:
	.asciz	"\b\007\000\000\177\007\000\000\273\006\000\000\342\006\000\000\326\005\000\000\300\007\000\000\261\016\000\000-\004\000\000\263\r\000\000\316\f\000\000e\b\000\000\217\n\000\000\376\003\000\000:\n\000\000H\r\000\000^\b\000"
	.size	.Lb4.data, 64

	.type	.Lb4.buffer,@object             # @b4.buffer
	.data
	.p2align	4, 0x0
.Lb4.buffer:
	.quad	0                               # 0x0
	.quad	0
	.quad	.Lb4.data
	.quad	1                               # 0x1
	.byte	0                               # 0x0
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.word	1                               # 0x1
	.quad	.Lb4.shape
	.quad	0
	.size	.Lb4.buffer, 56

	.type	.Lbias.shape,@object            # @bias.shape
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lbias.shape:
	.asciz	"\000\000\000\000\020\000\000\000\001\000\000\000\000\000\000"
	.size	.Lbias.shape, 16

	.type	.Lbias.data,@object             # @bias.data
	.p2align	5, 0x0
.Lbias.data:
	.ascii	"\356\f\000\000\016\004\000\000\207\377\377\377K\320\377\377\035k\000\000\310\307\377\377\303\367\377\377\2717\000\000\261\347\377\377\334#\000\000R\226\377\3770\336\377\377\020\001\000\000\271\321\377\377h\002\000\000^\325\377\377"
	.size	.Lbias.data, 64

	.type	.Lbias.buffer,@object           # @bias.buffer
	.data
	.p2align	4, 0x0
.Lbias.buffer:
	.quad	0                               # 0x0
	.quad	0
	.quad	.Lbias.data
	.quad	1                               # 0x1
	.byte	0                               # 0x0
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.word	1                               # 0x1
	.quad	.Lbias.shape
	.quad	0
	.size	.Lbias.buffer, 56

	.type	.Lstr,@object                   # @str
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr:
	.asciz	"input"
	.size	.Lstr, 6

	.type	.Lstr.4,@object                 # @str.4
	.p2align	5, 0x0
.Lstr.4:
	.asciz	"weights"
	.size	.Lstr.4, 8

	.type	.L__unnamed_1,@object           # @0
	.p2align	3, 0x0
.L__unnamed_1:
	.quad	0                               # 0x0
	.size	.L__unnamed_1, 8

	.type	.L__unnamed_2,@object           # @1
	.p2align	3, 0x0
.L__unnamed_2:
	.quad	16                              # 0x10
	.size	.L__unnamed_2, 8

	.type	.L__unnamed_3,@object           # @2
	.p2align	3, 0x0
.L__unnamed_3:
	.quad	0                               # 0x0
	.size	.L__unnamed_3, 8

	.type	.L__unnamed_4,@object           # @3
	.p2align	3, 0x0
.L__unnamed_4:
	.quad	56                              # 0x38
	.size	.L__unnamed_4, 8

	.type	.L__unnamed_5,@object           # @4
	.p2align	3, 0x0
.L__unnamed_5:
	.quad	0                               # 0x0
	.size	.L__unnamed_5, 8

	.type	.L__unnamed_6,@object           # @5
	.p2align	3, 0x0
.L__unnamed_6:
	.quad	56                              # 0x38
	.size	.L__unnamed_6, 8

	.type	.L__unnamed_7,@object           # @6
	.p2align	3, 0x0
.L__unnamed_7:
	.quad	0                               # 0x0
	.size	.L__unnamed_7, 8

	.type	.L__unnamed_8,@object           # @7
	.p2align	3, 0x0
.L__unnamed_8:
	.quad	1                               # 0x1
	.size	.L__unnamed_8, 8

	.type	.L__unnamed_9,@object           # @8
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.L__unnamed_9:
	.quad	.L__unnamed_1
	.quad	.L__unnamed_2
	.quad	.L__unnamed_3
	.quad	.L__unnamed_4
	.quad	.L__unnamed_5
	.quad	.L__unnamed_6
	.quad	.L__unnamed_7
	.quad	.L__unnamed_8
	.size	.L__unnamed_9, 64

	.type	.Lstr.5,@object                 # @str.5
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr.5:
	.asciz	"convolution_int8"
	.size	.Lstr.5, 17

	.type	.L__unnamed_10,@object          # @9
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.L__unnamed_10:
	.quad	.Lstr
	.word	1                               # 0x1
	.word	4                               # 0x4
	.byte	0                               # 0x0
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lstr.4
	.word	1                               # 0x1
	.word	4                               # 0x4
	.byte	0                               # 0x0
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.Lstr.5
	.word	2                               # 0x2
	.word	4                               # 0x4
	.byte	0                               # 0x0
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.L__unnamed_9
	.size	.L__unnamed_10, 192

	.type	.Lstr.6,@object                 # @str.6
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr.6:
	.asciz	"riscv-64-linux-no_asserts-no_runtime-rvv-vector_bits_128"
	.size	.Lstr.6, 57

	.type	.Lconvolution_int8_metadata_storage,@object # @convolution_int8_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.Lconvolution_int8_metadata_storage:
	.word	1                               # 0x1
	.word	3                               # 0x3
	.quad	.L__unnamed_10
	.quad	.Lstr.6
	.quad	.Lstr.5
	.size	.Lconvolution_int8_metadata_storage, 32

	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.ident	"clang version 16.0.0 (https://github.com/llvm/llvm-project 6d859df46e93e04bd7a4f90d9a9056763998f638)"
	.section	".note.GNU-stack","",@progbits
