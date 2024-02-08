	.text
	.attribute	4, 16
	.attribute	5, "rv64gcv0p7"
	.file	"halide_buffer_t.cpp"
	.section	.text.idw_halide_,"ax",@progbits
	.globl	idw_halide_                     # -- Begin function idw_halide_
	.p2align	1
	.type	idw_halide_,@function
idw_halide_:                            # @idw_halide_
# %bb.0:                                # %entry
	addi	sp, sp, -96
	sd	ra, 88(sp)                      # 8-byte Folded Spill
	sd	s0, 80(sp)                      # 8-byte Folded Spill
	sd	s1, 72(sp)                      # 8-byte Folded Spill
	sd	s2, 64(sp)                      # 8-byte Folded Spill
	sd	s3, 56(sp)                      # 8-byte Folded Spill
	sd	s4, 48(sp)                      # 8-byte Folded Spill
	sd	s5, 40(sp)                      # 8-byte Folded Spill
	sd	s6, 32(sp)                      # 8-byte Folded Spill
	sd	s7, 24(sp)                      # 8-byte Folded Spill
	sd	s8, 16(sp)                      # 8-byte Folded Spill
	sd	s9, 8(sp)                       # 8-byte Folded Spill
	sd	s10, 0(sp)                      # 8-byte Folded Spill
.Lpcrel_hi0:
	auipc	a1, %pcrel_hi(.Lb2.buffer)
	addi	a1, a1, %pcrel_lo(.Lpcrel_hi0)
	ld	s8, 16(a1)
	ld	a3, 40(a0)
.Lpcrel_hi1:
	auipc	a2, %pcrel_hi(.Lb3.buffer)
	addi	a2, a2, %pcrel_lo(.Lpcrel_hi1)
	ld	s9, 16(a2)
	lw	s3, 0(a3)
	lw	s7, 4(a3)
	lw	s4, 16(a3)
	ld	a4, 0(a1)
	lwu	s5, 20(a3)
	lw	s6, 24(a3)
	or	a5, s8, a4
	mv	a4, s9
	beqz	a5, .LBB0_4
# %bb.1:                                # %after_bb
	ld	a5, 0(a2)
	ld	s10, 16(a0)
	or	a4, a4, a5
	beqz	a4, .LBB0_5
.LBB0_2:                                # %after_bb1
	sext.w	a4, s5
	beqz	s10, .LBB0_6
.LBB0_3:
	li	a0, 0
	j	.LBB0_9
.LBB0_4:                                # %then_bb
	lui	a4, 128
	addiw	a4, a4, 9
	slli	a4, a4, 13
	sd	a4, 32(a1)
	ld	a4, 40(a1)
	sd	zero, 0(a1)
	sd	zero, 8(a1)
	sd	zero, 16(a1)
	sw	zero, 0(a4)
	li	a5, 300
	sw	a5, 4(a4)
	li	a5, 1
	sw	a5, 8(a4)
	sw	zero, 12(a4)
	ld	a4, 16(a2)
	sd	zero, 24(a1)
	ld	a5, 0(a2)
	ld	s10, 16(a0)
	or	a4, a4, a5
	bnez	a4, .LBB0_2
.LBB0_5:                                # %then_bb2
	sd	zero, 16(a2)
	sd	zero, 8(a2)
	sd	zero, 0(a2)
	lui	a4, 128
	addiw	a4, a4, 9
	ld	a5, 40(a2)
	slli	a4, a4, 13
	addi	a4, a4, 2
	sd	a4, 32(a2)
	sw	zero, 0(a5)
	li	a4, 100
	sw	a4, 4(a5)
	li	a4, 1
	sw	a4, 8(a5)
	sw	zero, 12(a5)
	sd	zero, 24(a2)
	sext.w	a4, s5
	bnez	s10, .LBB0_3
.LBB0_6:                                # %_halide_buffer_is_bounds_query.exit36
	ld	a5, 0(a0)
	bnez	a5, .LBB0_8
# %bb.7:                                # %then_bb5
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	sd	zero, 0(a0)
	lui	a5, 256
	addiw	a5, a5, 9
	slli	a5, a5, 13
	addi	a5, a5, 2
	sd	a5, 32(a0)
	sw	s3, 0(a3)
	sw	s7, 4(a3)
	li	a5, 1
	sw	a5, 8(a3)
	sw	zero, 12(a3)
	sw	s4, 16(a3)
	sw	a4, 20(a3)
	sw	s7, 24(a3)
	sw	zero, 28(a3)
	sd	zero, 24(a0)
.LBB0_8:                                # %land.rhs.i49
	ld	a0, 0(a0)
	seqz	a0, a0
.LBB0_9:                                # %_halide_buffer_is_bounds_query.exit50
	ld	a3, 16(a1)
	ld	a1, 0(a1)
	ld	a5, 16(a2)
	ld	a2, 0(a2)
	or	a1, a1, a3
	seqz	a1, a1
	or	a2, a2, a5
	seqz	a2, a2
	or	a1, a1, a2
	or	a0, a0, a1
	slti	a1, a4, 1
	or	a0, a0, a1
	bnez	a0, .LBB0_20
# %bb.10:                               # %"for idw_halide_.s0.y.rebased.preheader"
	blez	s7, .LBB0_20
# %bb.11:                               # %"for idw_halide_.s0.y.rebased.us.preheader"
	li	s0, 0
	slli	s2, s7, 2
	mv	s1, s5
.LBB0_12:                               # %"for idw_halide_.s0.y.rebased.us"
                                        # =>This Inner Loop Header: Depth=1
	slli	a0, s0, 2
	add	a0, a0, s10
	li	a1, 0
	mv	a2, s2
	call	memset@plt
	addi	s1, s1, -1
	addw	s0, s0, s6
	bnez	s1, .LBB0_12
# %bb.13:                               # %"for idw_halide_.s1.y.rebased.preheader"
	blez	s7, .LBB0_20
# %bb.14:                               # %"for idw_halide_.s1.y.rebased.us.preheader"
	li	a6, 0
	addi	s8, s8, 4
.LBB0_15:                               # %"for idw_halide_.s1.y.rebased.us"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_16 Depth 2
                                        #       Child Loop BB0_17 Depth 3
	li	a1, 0
	mulw	a7, s6, a6
	add	a3, s4, a6
.LBB0_16:                               # %"for idw_halide_.s1.x.rebased.us"
                                        #   Parent Loop BB0_15 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_17 Depth 3
	add	a0, a1, a7
	slli	a0, a0, 2
	add	t0, s10, a0
	flw	ft0, 0(t0)
	add	a5, s3, a1
	li	a0, 100
	mv	s1, s8
	mv	s0, s9
.LBB0_17:                               # %"for idw_halide_.s1.r4$x.us"
                                        #   Parent Loop BB0_15 Depth=1
                                        #     Parent Loop BB0_16 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lw	a2, 0(s1)
	lw	a4, -4(s1)
	subw	a2, a5, a2
	subw	a4, a3, a4
	mulw	a2, a2, a2
	mulw	a4, a4, a4
	flw	ft1, 0(s0)
	add	a2, a2, a4
	fcvt.s.w	ft2, a2
	fsqrt.s	ft2, ft2
	fmadd.s	ft0, ft2, ft1, ft0
	addi	a0, a0, -1
	addi	s0, s0, 4
	addi	s1, s1, 12
	bnez	a0, .LBB0_17
# %bb.18:                               # %"end for idw_halide_.s1.r4$x.us"
                                        #   in Loop: Header=BB0_16 Depth=2
	addi	a1, a1, 1
	fsw	ft0, 0(t0)
	bne	a1, s7, .LBB0_16
# %bb.19:                               # %"end for idw_halide_.s1.x.rebased.loopexit.us"
                                        #   in Loop: Header=BB0_15 Depth=1
	addi	a6, a6, 1
	bne	a6, s5, .LBB0_15
.LBB0_20:                               # %destructor_block
	li	a0, 0
	ld	ra, 88(sp)                      # 8-byte Folded Reload
	ld	s0, 80(sp)                      # 8-byte Folded Reload
	ld	s1, 72(sp)                      # 8-byte Folded Reload
	ld	s2, 64(sp)                      # 8-byte Folded Reload
	ld	s3, 56(sp)                      # 8-byte Folded Reload
	ld	s4, 48(sp)                      # 8-byte Folded Reload
	ld	s5, 40(sp)                      # 8-byte Folded Reload
	ld	s6, 32(sp)                      # 8-byte Folded Reload
	ld	s7, 24(sp)                      # 8-byte Folded Reload
	ld	s8, 16(sp)                      # 8-byte Folded Reload
	ld	s9, 8(sp)                       # 8-byte Folded Reload
	ld	s10, 0(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 96
	ret
.Lfunc_end0:
	.size	idw_halide_, .Lfunc_end0-idw_halide_
                                        # -- End function
	.section	.text.idw_halide__argv,"ax",@progbits
	.globl	idw_halide__argv                # -- Begin function idw_halide__argv
	.p2align	1
	.type	idw_halide__argv,@function
idw_halide__argv:                       # @idw_halide__argv
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	ld	a0, 0(a0)
	call	idw_halide_@plt
	li	a0, 0
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	idw_halide__argv, .Lfunc_end1-idw_halide__argv
                                        # -- End function
	.section	.text.idw_halide__metadata,"ax",@progbits
	.globl	idw_halide__metadata            # -- Begin function idw_halide__metadata
	.p2align	1
	.type	idw_halide__metadata,@function
idw_halide__metadata:                   # @idw_halide__metadata
# %bb.0:                                # %entry
.Lpcrel_hi2:
	auipc	a0, %pcrel_hi(.Lidw_halide__metadata_storage)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi2)
	ret
.Lfunc_end2:
	.size	idw_halide__metadata, .Lfunc_end2-idw_halide__metadata
                                        # -- End function
	.type	.Lb2.shape,@object              # @b2.shape
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lb2.shape:
	.asciz	"\000\000\000\000,\001\000\000\001\000\000\000\000\000\000"
	.size	.Lb2.shape, 16

	.type	.Lb2.data,@object               # @b2.data
	.p2align	5, 0x0
.Lb2.data:
	.asciz	"\000\000\000\000\000\000\000\000H\000\000\000\000\000\000\000\325\000\000\000O\000\000\000\000\000\000\000\252\001\000\000<\000\000\000\000\000\000\000\200\002\000\000L\000\000\000\000\000\000\000U\003\000\000\200\000\000\000\000\000\000\000*\004\000\000C\000\000\000\000\000\000\000\000\005\000\000A\000\000\000\000\000\000\000\325\005\000\000@\000\000\000\000\000\000\000\252\006\000\000<\000\000\000\000\000\000\000\200\007\000\000=\000\000\000x\000\000\000\000\000\000\000Q\000\000\000x\000\000\000\325\000\000\000O\000\000\000x\000\000\000\252\001\000\000:\000\000\000x\000\000\000\200\002\000\000\204\000\000\000x\000\000\000U\003\000\000\225\000\000\000x\000\000\000*\004\000\000\216\000\000\000x\000\000\000\000\005\000\000@\000\000\000x\000\000\000\325\005\000\000E\000\000\000x\000\000\000\252\006\000\000A\000\000\000x\000\000\000\200\007\000\000@\000\000\000\360\000\000\000\000\000\000\000K\000\000\000\360\000\000\000\325\000\000\000D\000\000\000\360\000\000\000\252\001\000\000\214\000\000\000\360\000\000\000\200\002\000\000\231\000\000\000\360\000\000\000U\003\000\000\221\000\000\000\360\000\000\000*\004\000\000\204\000\000\000\360\000\000\000\000\005\000\000\230\000\000\000\360\000\000\000\325\005\000\000}\000\000\000\360\000\000\000\252\006\000\000B\000\000\000\360\000\000\000\200\007\000\000:\000\000\000h\001\000\000\000\000\000\000N\000\000\000h\001\000\000\325\000\000\000<\000\000\000h\001\000\000\252\001\000\000\213\000\000\000h\001\000\000\200\002\000\000\250\000\000\000h\001\000\000U\003\000\000\232\000\000\000h\001\000\000*\004\000\000\212\000\000\000h\001\000\000\000\005\000\000\221\000\000\000h\001\000\000\325\005\000\000\240\000\000\000h\001\000\000\252\006\000\000D\000\000\000h\001\000\000\200\007\000\000<\000\000\000\340\001\000\000\000\000\000\000M\000\000\000\340\001\000\000\325\000\000\000;\000\000\000\340\001\000\000\252\001\000\000\245\000\000\000\340\001\000\000\200\002\000\000\267\000\000\000\340\001\000\000U\003\000\000\246\000\000\000\340\001\000\000*\004\000\000\216\000\000\000\340\001\000\000\000\005\000\000{\000\000\000\340\001\000\000\325\005\000\000\233\000\000\000\340\001\000\000\252\006\000\000\220\000\000\000\340\001\000\000\200\007\000\000<\000\000\000X\002\000\000\000\000\000\000S\000\000\000X\002\000\000\325\000\000\000A\000\000\000X\002\000\000\252\001\000\000\262\000\000\000X\002\000\000\200\002\000\000\270\000\000\000X\002\000\000U\003\000\000\212\000\000\000X\002\000\000*\004\000\000|\000\000\000X\002\000\000\000\005\000\000\204\000\000\000X\002\000\000\325\005\000\000\257\000\000\000X\002\000\000\252\006\000\000\257\000\000\000X\002\000\000\200\007\000\000<\000\000\000\320\002\000\000\000\000\000\000V\000\000\000\320\002\000\000\325\000\000\000<\000\000\000\320\002\000\000\252\001\000\000\266\000\000\000\320\002\000\000\200\002\000\000\263\000\000\000\320\002\000\000U\003\000\000\230\000\000\000\320\002\000\000*\004\000\000\214\000\000\000\320\002\000\000\000\005\000\000s\000\000\000\320\002\000\000\325\005\000\000\234\000\000\000\320\002\000\000\252\006\000\000\254\000\000\000\320\002\000\000\200\007\000\000A\000\000\000H\003\000\000\000\000\000\000Z\000\000\000H\003\000\000\325\000\000\000E\000\000\000H\003\000\000\252\001\000\000\244\000\000\000H\003\000\000\200\002\000\000\272\000\000\000H\003\000\000U\003\000\000\222\000\000\000H\003\000\000*\004\000\000\223\000\000\000H\003\000\000\000\005\000\000z\000\000\000H\003\000\000\325\005\000\000\230\000\000\000H\003\000\000\252\006\000\000\246\000\000\000H\003\000\000\200\007\000\000E\000\000\000\300\003\000\000\000\000\000\000U\000\000\000\300\003\000\000\325\000\000\000C\000\000\000\300\003\000\000\252\001\000\000\272\000\000\000\300\003\000\000\200\002\000\000\251\000\000\000\300\003\000\000U\003\000\000\242\000\000\000\300\003\000\000*\004\000\000\223\000\000\000\300\003\000\000\000\005\000\000|\000\000\000\300\003\000\000\325\005\000\000\225\000\000\000\300\003\000\000\252\006\000\000\235\000\000\000\300\003\000\000\200\007\000\000E\000\000\0008\004\000\000\000\000\000\000U\000\000\0008\004\000\000\325\000\000\000F\000\000\0008\004\000\000\252\001\000\000\301\000\000\0008\004\000\000\200\002\000\000\300\000\000\0008\004\000\000U\003\000\000\233\000\000\0008\004\000\000*\004\000\000\207\000\000\0008\004\000\000\000\005\000\000x\000\000\0008\004\000\000\325\005\000\000\212\000\000\0008\004\000\000\252\006\000\000\200\000\000\0008\004\000\000\200\007\000\000F\000\000"
	.size	.Lb2.data, 1200

	.type	.Lb2.buffer,@object             # @b2.buffer
	.data
	.p2align	4, 0x0
.Lb2.buffer:
	.quad	0                               # 0x0
	.quad	0
	.quad	.Lb2.data
	.quad	1                               # 0x1
	.byte	0                               # 0x0
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.word	1                               # 0x1
	.quad	.Lb2.shape
	.quad	0
	.size	.Lb2.buffer, 56

	.type	.Lb3.shape,@object              # @b3.shape
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lb3.shape:
	.asciz	"\000\000\000\000d\000\000\000\001\000\000\000\000\000\000"
	.size	.Lb3.shape, 16

	.type	.Lb3.data,@object               # @b3.data
	.p2align	5, 0x0
.Lb3.data:
	.ascii	"\211\004&=\244\022\233\275\217U%;\272)J>#\026\024\276@_\234>\340\243|\275\334\034K\275\232\300\004:A\313\245\274\303\024r\275\345\313a\275x\231\300>\201\334\"\276\236}\321\275H\346\257\276\202V\310>\225\375(>},\026\274E\235W\275\241\236\236<\245\220\222=\004\361\263\276\2620\240\274\265\036\240=\\:\336=\240\016\263\276\260\224\371\275p\235(=\311\\x;\226y\\\275\360\227\377=\275\364\200=rw/<@U\017=c\327\003=nV\267\273\354<Y\276\257$\260>3\207\311\274<&{\274h\b\031>\203\222\003\276\213\3649\275d\177\017\276\330\306\246\275'\314:>\203\024\253=S\331M\276\257\263S=b\221q\275\336\t\306=#^\005\2763)\256\274\344\255G>\224!\374=\374\360o\275\215#\031\276\322`J\276y6\360=\273\303;\275N\"N>M\022K\276\016\035C=1Fb\275u\017\220\275\0040\033>,\037\223=t\335\304\275\363\344\271=\320\341\260\275\2265\255=\310\"b=&\031\330\275;\314\000>>\347o\275\255\222\020=C\rU<\370d\307\275\373\306\206=I\345\373\274Y|\034>WY;\276O\240?>B\347\226\275\203\271\203\275W\243\313<\214\364\343\274Ey\033\276J4\214=\261\304\241\274-\271p>X\313l\276*_\366\275\260^\\=\237l1=\371\272\200=\002\373?\274*\3578<]Gv="
	.size	.Lb3.data, 400

	.type	.Lb3.buffer,@object             # @b3.buffer
	.data
	.p2align	4, 0x0
.Lb3.buffer:
	.quad	0                               # 0x0
	.quad	0
	.quad	.Lb3.data
	.quad	1                               # 0x1
	.byte	2                               # 0x2
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.word	1                               # 0x1
	.quad	.Lb3.shape
	.quad	0
	.size	.Lb3.buffer, 56

	.type	.L__unnamed_1,@object           # @0
	.section	.rodata,"a",@progbits
	.p2align	4, 0x0
.L__unnamed_1:
	.zero	32
	.size	.L__unnamed_1, 32

	.type	.Lstr,@object                   # @str
	.p2align	5, 0x0
.Lstr:
	.asciz	"idw_halide_"
	.size	.Lstr, 12

	.type	.L__unnamed_2,@object           # @1
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.L__unnamed_2:
	.quad	.Lstr
	.word	2                               # 0x2
	.word	2                               # 0x2
	.byte	2                               # 0x2
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.zero	4
	.quad	0
	.quad	0
	.quad	0
	.quad	0
	.quad	.L__unnamed_1
	.size	.L__unnamed_2, 64

	.type	.Lstr.4,@object                 # @str.4
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lstr.4:
	.asciz	"riscv-64-linux-no_asserts-no_runtime-rvv-vector_bits_128"
	.size	.Lstr.4, 57

	.type	.Lidw_halide__metadata_storage,@object # @idw_halide__metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.Lidw_halide__metadata_storage:
	.word	1                               # 0x1
	.word	1                               # 0x1
	.quad	.L__unnamed_2
	.quad	.Lstr.4
	.quad	.Lstr
	.size	.Lidw_halide__metadata_storage, 32

	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.section	".note.GNU-stack","",@progbits
