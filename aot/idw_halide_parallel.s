	.text
	.attribute	4, 16
	.attribute	5, "rv64gcv0p7"
	.file	"halide_buffer_t.cpp"
	.section	.text.idw_halide_parallel__par_for_idw_halide_parallel__s0_x_x_outer_tile_index__1,"ax",@progbits
	.globl	idw_halide_parallel__par_for_idw_halide_parallel__s0_x_x_outer_tile_index__1 # -- Begin function idw_halide_parallel__par_for_idw_halide_parallel__s0_x_x_outer_tile_index__1
	.p2align	1
	.type	idw_halide_parallel__par_for_idw_halide_parallel__s0_x_x_outer_tile_index__1,@function
idw_halide_parallel__par_for_idw_halide_parallel__s0_x_x_outer_tile_index__1: # @idw_halide_parallel__par_for_idw_halide_parallel__s0_x_x_outer_tile_index__1
# %bb.0:                                # %entry
	addi	sp, sp, -48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	sd	s1, 24(sp)                      # 8-byte Folded Spill
	sd	s2, 16(sp)                      # 8-byte Folded Spill
	sd	s3, 8(sp)                       # 8-byte Folded Spill
	lw	a4, 24(a2)
	lw	a7, 8(a2)
	lw	a6, 12(a2)
	sraiw	a3, a1, 31
	seqz	a5, a4
	negw	a0, a5
	srai	s1, a4, 31
	subw	t0, a1, a3
	or	a0, a0, a4
	remw	a1, t0, a0
	xor	s0, s1, a4
	not	a0, s1
	add	s0, s0, a0
	and	s0, s0, a3
	add	a1, a1, s0
	li	s0, 480
	mulw	a1, a1, s0
	addi	s0, a5, -1
	and	t2, s0, a1
	addiw	a1, a7, -480
	blt	t2, a1, .LBB0_2
# %bb.1:                                # %entry
	mv	t2, a1
.LBB0_2:                                # %entry
	lw	a7, 16(a2)
	lw	s2, 20(a2)
	lw	t1, 28(a2)
	add	a4, a4, a5
	divw	a1, t0, a4
	subw	a0, a0, s1
	and	a0, a0, a3
	add	a0, a0, a1
	li	s1, 270
	mulw	a0, a0, s1
	and	a0, a0, s0
	addiw	a1, a6, -270
	blt	a0, a1, .LBB0_4
# %bb.3:                                # %entry
	mv	a0, a1
.LBB0_4:                                # %entry
	ld	s3, 0(a2)
	add	a0, a0, a7
	add	t1, t1, t2
	mulw	a0, s2, a0
	addw	s0, t1, a0
.LBB0_5:                                # %"for idw_halide_parallel_.s0.y.y_inner"
                                        # =>This Inner Loop Header: Depth=1
	slli	a0, s0, 2
	add	a0, a0, s3
	li	a2, 1920
	li	a1, 0
	call	memset@plt
	addi	s1, s1, -1
	addw	s0, s0, s2
	bnez	s1, .LBB0_5
# %bb.6:                                # %destructor_block
	li	a0, 0
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
	ld	s1, 24(sp)                      # 8-byte Folded Reload
	ld	s2, 16(sp)                      # 8-byte Folded Reload
	ld	s3, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	idw_halide_parallel__par_for_idw_halide_parallel__s0_x_x_outer_tile_index__1, .Lfunc_end0-idw_halide_parallel__par_for_idw_halide_parallel__s0_x_x_outer_tile_index__1
                                        # -- End function
	.section	.text.idw_halide_parallel__par_for_idw_halide_parallel__s1_x_x_outer_tile_index__1,"ax",@progbits
	.globl	idw_halide_parallel__par_for_idw_halide_parallel__s1_x_x_outer_tile_index__1 # -- Begin function idw_halide_parallel__par_for_idw_halide_parallel__s1_x_x_outer_tile_index__1
	.p2align	1
	.type	idw_halide_parallel__par_for_idw_halide_parallel__s1_x_x_outer_tile_index__1,@function
idw_halide_parallel__par_for_idw_halide_parallel__s1_x_x_outer_tile_index__1: # @idw_halide_parallel__par_for_idw_halide_parallel__s1_x_x_outer_tile_index__1
# %bb.0:                                # %entry
	addi	sp, sp, -48
	sd	s0, 40(sp)                      # 8-byte Folded Spill
	sd	s1, 32(sp)                      # 8-byte Folded Spill
	sd	s2, 24(sp)                      # 8-byte Folded Spill
	sd	s3, 16(sp)                      # 8-byte Folded Spill
	sd	s4, 8(sp)                       # 8-byte Folded Spill
	sd	s5, 0(sp)                       # 8-byte Folded Spill
	li	a7, 0
	ld	s3, 0(a2)
	ld	t4, 8(a2)
	ld	t3, 16(a2)
	lw	a0, 36(a2)
	lw	t5, 24(a2)
	lw	t1, 28(a2)
	sraiw	a3, a1, 31
	seqz	a4, a0
	negw	a5, a4
	srai	s1, a0, 31
	subw	a1, a1, a3
	or	a5, a5, a0
	remw	a6, a1, a5
	xor	s0, s1, a0
	not	a5, s1
	add	s0, s0, a5
	and	s0, s0, a3
	add	s0, s0, a6
	lw	a6, 32(a2)
	lw	t6, 40(a2)
	add	a0, a0, a4
	divw	a0, a1, a0
	subw	a5, a5, s1
	and	a3, a3, a5
	add	a0, a0, a3
	li	t2, 480
	mulw	a1, s0, t2
	addi	a4, a4, -1
	and	s2, a4, a1
	li	t0, 270
	mulw	a0, a0, t0
	and	a0, a0, a4
	add	t1, t1, a0
	addi	s3, s3, 4
.LBB1_1:                                # %"for idw_halide_parallel_.s1.y.y_inner"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
                                        #       Child Loop BB1_3 Depth 3
	li	a4, 0
	add	a3, t1, a7
	mulw	s4, a3, a6
.LBB1_2:                                # %"for idw_halide_parallel_.s1.x.x_inner"
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB1_3 Depth 3
	add	s0, s2, a4
	add	a0, s0, t6
	addw	a0, a0, s4
	slli	a0, a0, 2
	add	s5, t3, a0
	flw	ft0, 0(s5)
	add	s0, s0, t5
	li	s1, 100
	mv	a1, s3
	mv	a0, t4
.LBB1_3:                                # %"for idw_halide_parallel_.s1.r13$x"
                                        #   Parent Loop BB1_1 Depth=1
                                        #     Parent Loop BB1_2 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	lw	a5, 0(a1)
	lw	a2, -4(a1)
	subw	a5, s0, a5
	subw	a2, a3, a2
	mulw	a5, a5, a5
	mulw	a2, a2, a2
	flw	ft1, 0(a0)
	add	a2, a2, a5
	fcvt.s.w	ft2, a2
	fsqrt.s	ft2, ft2
	fmadd.s	ft0, ft2, ft1, ft0
	addi	s1, s1, -1
	addi	a0, a0, 4
	addi	a1, a1, 12
	bnez	s1, .LBB1_3
# %bb.4:                                # %"end for idw_halide_parallel_.s1.r13$x"
                                        #   in Loop: Header=BB1_2 Depth=2
	addi	a4, a4, 1
	fsw	ft0, 0(s5)
	bne	a4, t2, .LBB1_2
# %bb.5:                                # %"end for idw_halide_parallel_.s1.x.x_inner"
                                        #   in Loop: Header=BB1_1 Depth=1
	addiw	a7, a7, 1
	bne	a7, t0, .LBB1_1
# %bb.6:                                # %destructor_block
	li	a0, 0
	ld	s0, 40(sp)                      # 8-byte Folded Reload
	ld	s1, 32(sp)                      # 8-byte Folded Reload
	ld	s2, 24(sp)                      # 8-byte Folded Reload
	ld	s3, 16(sp)                      # 8-byte Folded Reload
	ld	s4, 8(sp)                       # 8-byte Folded Reload
	ld	s5, 0(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end1:
	.size	idw_halide_parallel__par_for_idw_halide_parallel__s1_x_x_outer_tile_index__1, .Lfunc_end1-idw_halide_parallel__par_for_idw_halide_parallel__s1_x_x_outer_tile_index__1
                                        # -- End function
	.section	.text.idw_halide_parallel_,"ax",@progbits
	.globl	idw_halide_parallel_            # -- Begin function idw_halide_parallel_
	.p2align	1
	.type	idw_halide_parallel_,@function
idw_halide_parallel_:                   # @idw_halide_parallel_
# %bb.0:                                # %entry
	addi	sp, sp, -176
	sd	ra, 168(sp)                     # 8-byte Folded Spill
	sd	s0, 160(sp)                     # 8-byte Folded Spill
	sd	s1, 152(sp)                     # 8-byte Folded Spill
	sd	s2, 144(sp)                     # 8-byte Folded Spill
	sd	s3, 136(sp)                     # 8-byte Folded Spill
	sd	s4, 128(sp)                     # 8-byte Folded Spill
	sd	s5, 120(sp)                     # 8-byte Folded Spill
	sd	s6, 112(sp)                     # 8-byte Folded Spill
	sd	s7, 104(sp)                     # 8-byte Folded Spill
	sd	s8, 96(sp)                      # 8-byte Folded Spill
	sd	s9, 88(sp)                      # 8-byte Folded Spill
	ld	t5, 40(a0)
	lw	a4, 4(t5)
	lw	t2, 20(t5)
	li	a2, -480
	subw	a6, a2, a4
	addiw	a2, a4, -1
	blt	a2, a6, .LBB2_2
# %bb.1:                                # %entry
	mv	a6, a2
.LBB2_2:                                # %entry
.Lpcrel_hi0:
	auipc	a2, %pcrel_hi(.Lb24.buffer)
	addi	a3, a2, %pcrel_lo(.Lpcrel_hi0)
	sgtz	t4, a4
	slti	a5, a4, -479
	slti	s0, t2, -269
	lui	s1, 559241
	li	a7, 480
	addiw	t1, s1, -1911
	mv	t0, a4
	blt	a4, a7, .LBB2_4
# %bb.3:                                # %entry
	li	t0, 480
.LBB2_4:                                # %entry
.Lpcrel_hi1:
	auipc	t6, %pcrel_hi(.Lb25.buffer)
	ld	s2, 16(a3)
	add	a1, a4, a5
	addiw	a1, a1, 479
	mul	a2, a1, t1
	srli	a2, a2, 32
	add	a1, a1, a2
	srliw	a2, a1, 31
	sraiw	a1, a1, 8
	add	a1, a1, a2
	subw	s9, a1, a5
	add	a1, t2, s0
	addiw	a1, a1, 269
	lui	a2, 994205
	addiw	a2, a2, 1609
	mul	a2, a1, a2
	srli	a2, a2, 32
	add	a1, a1, a2
	srliw	a2, a1, 31
	sraiw	a1, a1, 8
	add	a1, a1, a2
	subw	a1, a1, s0
	mulw	s7, a1, s9
	slti	a1, s7, 1
	negw	a2, a1
	seqz	s1, s9
	add	a1, a1, s7
	addiw	a1, a1, -1
	add	s0, s9, s1
	divw	a1, a1, s0
	add	a5, a5, a5
	addiw	a5, a5, -1
	and	a2, a2, a5
	add	a1, a1, a2
	li	a2, 270
	mulw	a1, a1, a2
	addi	s1, s1, -1
	and	t3, s1, a1
	addi	t4, t4, -1
	and	t4, t4, t3
	addiw	a2, t2, -270
	addi	a5, t6, %pcrel_lo(.Lpcrel_hi1)
	blt	t4, a2, .LBB2_6
# %bb.5:                                # %entry
	mv	t4, a2
.LBB2_6:                                # %entry
	ld	s4, 16(a5)
	lw	s3, 0(t5)
	ld	a1, 0(a3)
	lw	s6, 16(t5)
	lw	s5, 24(t5)
	or	a1, s2, a1
	mv	s0, s4
	beqz	a1, .LBB2_10
# %bb.7:                                # %after_bb
	ld	a1, 0(a5)
	ld	s8, 16(a0)
	or	a1, a1, s0
	beqz	a1, .LBB2_11
.LBB2_8:                                # %after_bb1
	beqz	s8, .LBB2_12
.LBB2_9:
	li	a0, 0
	j	.LBB2_18
.LBB2_10:                               # %then_bb
	lui	a1, 128
	addiw	a1, a1, 9
	slli	a1, a1, 13
	sd	a1, 32(a3)
	ld	a1, 40(a3)
	sd	zero, 0(a3)
	sd	zero, 8(a3)
	sd	zero, 16(a3)
	sw	zero, 0(a1)
	li	a2, 300
	sw	a2, 4(a1)
	li	a2, 1
	sw	a2, 8(a1)
	sw	zero, 12(a1)
	ld	s0, 16(a5)
	sd	zero, 24(a3)
	ld	a1, 0(a5)
	ld	s8, 16(a0)
	or	a1, a1, s0
	bnez	a1, .LBB2_8
.LBB2_11:                               # %then_bb2
	sd	zero, 16(a5)
	sd	zero, 8(a5)
	sd	zero, 0(a5)
	lui	a1, 128
	addiw	a1, a1, 9
	ld	a2, 40(a5)
	slli	a1, a1, 13
	addi	a1, a1, 2
	sd	a1, 32(a5)
	sw	zero, 0(a2)
	li	a1, 100
	sw	a1, 4(a2)
	li	a1, 1
	sw	a1, 8(a2)
	sw	zero, 12(a2)
	sd	zero, 24(a5)
	bnez	s8, .LBB2_9
.LBB2_12:                               # %_halide_buffer_is_bounds_query.exit31
	ld	a1, 0(a0)
	bnez	a1, .LBB2_17
# %bb.13:                               # %then_bb5
	srai	a1, a6, 31
	subw	a2, a6, a1
	mul	s1, a2, t1
	srli	s1, s1, 32
	add	a2, a2, s1
	srliw	s1, a2, 31
	sraiw	a2, a2, 8
	addw	a2, a2, s1
	add	a1, a1, a2
	sgtz	a2, a1
	negw	a2, a2
	and	a1, a1, a2
	mulw	a1, a1, a7
	subw	a1, a1, t0
	add	t0, t0, s3
	addiw	t0, t0, -480
	addiw	a6, a1, 960
	add	a7, t4, s6
	bgtz	a4, .LBB2_15
# %bb.14:                               # %then_bb5
	li	s0, 270
	j	.LBB2_16
.LBB2_15:
	addi	s0, t3, 270
.LBB2_16:                               # %then_bb5
	subw	a1, s0, t4
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	sd	zero, 0(a0)
	lui	a2, 256
	addiw	a2, a2, 9
	slli	a2, a2, 13
	addi	a2, a2, 2
	sd	a2, 32(a0)
	sw	t0, 0(t5)
	sw	a6, 4(t5)
	li	a2, 1
	sw	a2, 8(t5)
	sw	zero, 12(t5)
	sw	a7, 16(t5)
	sw	a1, 20(t5)
	sw	a6, 24(t5)
	sw	zero, 28(t5)
	sd	zero, 24(a0)
.LBB2_17:                               # %land.rhs.i44
	ld	a0, 0(a0)
	seqz	a0, a0
.LBB2_18:                               # %_halide_buffer_is_bounds_query.exit45
	ld	a1, 16(a3)
	ld	a2, 0(a3)
	ld	a3, 16(a5)
	ld	a5, 0(a5)
	or	a1, a1, a2
	seqz	a1, a1
	or	a3, a3, a5
	seqz	a2, a3
	or	a1, a1, a2
	or	a0, a0, a1
	bnez	a0, .LBB2_20
# %bb.19:                               # %then_bb8
	mulw	a0, s6, s5
	negw	s0, a0
	sd	s8, 8(sp)
	sw	a4, 16(sp)
	sw	t2, 20(sp)
	sw	s6, 24(sp)
	sw	s5, 28(sp)
	sw	s9, 32(sp)
	sw	s0, 36(sp)
.Lpcrel_hi2:
	auipc	a0, %got_pcrel_hi(idw_halide_parallel__par_for_idw_halide_parallel__s0_x_x_outer_tile_index__1)
	ld	a1, %pcrel_lo(.Lpcrel_hi2)(a0)
	addi	a4, sp, 8
	li	a0, 0
	li	a2, 0
	mv	a3, s7
	call	halide_do_par_for@plt
	sd	s2, 40(sp)
	sd	s4, 48(sp)
	sd	s8, 56(sp)
	sw	s3, 64(sp)
	sw	s6, 68(sp)
	sw	s5, 72(sp)
	sw	s9, 76(sp)
	sw	s0, 80(sp)
.Lpcrel_hi3:
	auipc	a0, %got_pcrel_hi(idw_halide_parallel__par_for_idw_halide_parallel__s1_x_x_outer_tile_index__1)
	ld	a1, %pcrel_lo(.Lpcrel_hi3)(a0)
	addi	a4, sp, 40
	li	a0, 0
	li	a2, 0
	mv	a3, s7
	call	halide_do_par_for@plt
.LBB2_20:                               # %destructor_block
	li	a0, 0
	ld	ra, 168(sp)                     # 8-byte Folded Reload
	ld	s0, 160(sp)                     # 8-byte Folded Reload
	ld	s1, 152(sp)                     # 8-byte Folded Reload
	ld	s2, 144(sp)                     # 8-byte Folded Reload
	ld	s3, 136(sp)                     # 8-byte Folded Reload
	ld	s4, 128(sp)                     # 8-byte Folded Reload
	ld	s5, 120(sp)                     # 8-byte Folded Reload
	ld	s6, 112(sp)                     # 8-byte Folded Reload
	ld	s7, 104(sp)                     # 8-byte Folded Reload
	ld	s8, 96(sp)                      # 8-byte Folded Reload
	ld	s9, 88(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 176
	ret
.Lfunc_end2:
	.size	idw_halide_parallel_, .Lfunc_end2-idw_halide_parallel_
                                        # -- End function
	.section	.text.idw_halide_parallel__argv,"ax",@progbits
	.globl	idw_halide_parallel__argv       # -- Begin function idw_halide_parallel__argv
	.p2align	1
	.type	idw_halide_parallel__argv,@function
idw_halide_parallel__argv:              # @idw_halide_parallel__argv
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	ld	a0, 0(a0)
	call	idw_halide_parallel_@plt
	li	a0, 0
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end3:
	.size	idw_halide_parallel__argv, .Lfunc_end3-idw_halide_parallel__argv
                                        # -- End function
	.section	.text.idw_halide_parallel__metadata,"ax",@progbits
	.globl	idw_halide_parallel__metadata   # -- Begin function idw_halide_parallel__metadata
	.p2align	1
	.type	idw_halide_parallel__metadata,@function
idw_halide_parallel__metadata:          # @idw_halide_parallel__metadata
# %bb.0:                                # %entry
.Lpcrel_hi4:
	auipc	a0, %pcrel_hi(.Lidw_halide_parallel__metadata_storage)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi4)
	ret
.Lfunc_end4:
	.size	idw_halide_parallel__metadata, .Lfunc_end4-idw_halide_parallel__metadata
                                        # -- End function
	.type	.Lb24.shape,@object             # @b24.shape
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lb24.shape:
	.asciz	"\000\000\000\000,\001\000\000\001\000\000\000\000\000\000"
	.size	.Lb24.shape, 16

	.type	.Lb24.data,@object              # @b24.data
	.p2align	5, 0x0
.Lb24.data:
	.asciz	"\000\000\000\000\000\000\000\000H\000\000\000\000\000\000\000\325\000\000\000O\000\000\000\000\000\000\000\252\001\000\000<\000\000\000\000\000\000\000\200\002\000\000L\000\000\000\000\000\000\000U\003\000\000\200\000\000\000\000\000\000\000*\004\000\000C\000\000\000\000\000\000\000\000\005\000\000A\000\000\000\000\000\000\000\325\005\000\000@\000\000\000\000\000\000\000\252\006\000\000<\000\000\000\000\000\000\000\200\007\000\000=\000\000\000x\000\000\000\000\000\000\000Q\000\000\000x\000\000\000\325\000\000\000O\000\000\000x\000\000\000\252\001\000\000:\000\000\000x\000\000\000\200\002\000\000\204\000\000\000x\000\000\000U\003\000\000\225\000\000\000x\000\000\000*\004\000\000\216\000\000\000x\000\000\000\000\005\000\000@\000\000\000x\000\000\000\325\005\000\000E\000\000\000x\000\000\000\252\006\000\000A\000\000\000x\000\000\000\200\007\000\000@\000\000\000\360\000\000\000\000\000\000\000K\000\000\000\360\000\000\000\325\000\000\000D\000\000\000\360\000\000\000\252\001\000\000\214\000\000\000\360\000\000\000\200\002\000\000\231\000\000\000\360\000\000\000U\003\000\000\221\000\000\000\360\000\000\000*\004\000\000\204\000\000\000\360\000\000\000\000\005\000\000\230\000\000\000\360\000\000\000\325\005\000\000}\000\000\000\360\000\000\000\252\006\000\000B\000\000\000\360\000\000\000\200\007\000\000:\000\000\000h\001\000\000\000\000\000\000N\000\000\000h\001\000\000\325\000\000\000<\000\000\000h\001\000\000\252\001\000\000\213\000\000\000h\001\000\000\200\002\000\000\250\000\000\000h\001\000\000U\003\000\000\232\000\000\000h\001\000\000*\004\000\000\212\000\000\000h\001\000\000\000\005\000\000\221\000\000\000h\001\000\000\325\005\000\000\240\000\000\000h\001\000\000\252\006\000\000D\000\000\000h\001\000\000\200\007\000\000<\000\000\000\340\001\000\000\000\000\000\000M\000\000\000\340\001\000\000\325\000\000\000;\000\000\000\340\001\000\000\252\001\000\000\245\000\000\000\340\001\000\000\200\002\000\000\267\000\000\000\340\001\000\000U\003\000\000\246\000\000\000\340\001\000\000*\004\000\000\216\000\000\000\340\001\000\000\000\005\000\000{\000\000\000\340\001\000\000\325\005\000\000\233\000\000\000\340\001\000\000\252\006\000\000\220\000\000\000\340\001\000\000\200\007\000\000<\000\000\000X\002\000\000\000\000\000\000S\000\000\000X\002\000\000\325\000\000\000A\000\000\000X\002\000\000\252\001\000\000\262\000\000\000X\002\000\000\200\002\000\000\270\000\000\000X\002\000\000U\003\000\000\212\000\000\000X\002\000\000*\004\000\000|\000\000\000X\002\000\000\000\005\000\000\204\000\000\000X\002\000\000\325\005\000\000\257\000\000\000X\002\000\000\252\006\000\000\257\000\000\000X\002\000\000\200\007\000\000<\000\000\000\320\002\000\000\000\000\000\000V\000\000\000\320\002\000\000\325\000\000\000<\000\000\000\320\002\000\000\252\001\000\000\266\000\000\000\320\002\000\000\200\002\000\000\263\000\000\000\320\002\000\000U\003\000\000\230\000\000\000\320\002\000\000*\004\000\000\214\000\000\000\320\002\000\000\000\005\000\000s\000\000\000\320\002\000\000\325\005\000\000\234\000\000\000\320\002\000\000\252\006\000\000\254\000\000\000\320\002\000\000\200\007\000\000A\000\000\000H\003\000\000\000\000\000\000Z\000\000\000H\003\000\000\325\000\000\000E\000\000\000H\003\000\000\252\001\000\000\244\000\000\000H\003\000\000\200\002\000\000\272\000\000\000H\003\000\000U\003\000\000\222\000\000\000H\003\000\000*\004\000\000\223\000\000\000H\003\000\000\000\005\000\000z\000\000\000H\003\000\000\325\005\000\000\230\000\000\000H\003\000\000\252\006\000\000\246\000\000\000H\003\000\000\200\007\000\000E\000\000\000\300\003\000\000\000\000\000\000U\000\000\000\300\003\000\000\325\000\000\000C\000\000\000\300\003\000\000\252\001\000\000\272\000\000\000\300\003\000\000\200\002\000\000\251\000\000\000\300\003\000\000U\003\000\000\242\000\000\000\300\003\000\000*\004\000\000\223\000\000\000\300\003\000\000\000\005\000\000|\000\000\000\300\003\000\000\325\005\000\000\225\000\000\000\300\003\000\000\252\006\000\000\235\000\000\000\300\003\000\000\200\007\000\000E\000\000\0008\004\000\000\000\000\000\000U\000\000\0008\004\000\000\325\000\000\000F\000\000\0008\004\000\000\252\001\000\000\301\000\000\0008\004\000\000\200\002\000\000\300\000\000\0008\004\000\000U\003\000\000\233\000\000\0008\004\000\000*\004\000\000\207\000\000\0008\004\000\000\000\005\000\000x\000\000\0008\004\000\000\325\005\000\000\212\000\000\0008\004\000\000\252\006\000\000\200\000\000\0008\004\000\000\200\007\000\000F\000\000"
	.size	.Lb24.data, 1200

	.type	.Lb24.buffer,@object            # @b24.buffer
	.data
	.p2align	4, 0x0
.Lb24.buffer:
	.quad	0                               # 0x0
	.quad	0
	.quad	.Lb24.data
	.quad	1                               # 0x1
	.byte	0                               # 0x0
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.word	1                               # 0x1
	.quad	.Lb24.shape
	.quad	0
	.size	.Lb24.buffer, 56

	.type	.Lb25.shape,@object             # @b25.shape
	.section	.rodata,"a",@progbits
	.p2align	5, 0x0
.Lb25.shape:
	.asciz	"\000\000\000\000d\000\000\000\001\000\000\000\000\000\000"
	.size	.Lb25.shape, 16

	.type	.Lb25.data,@object              # @b25.data
	.p2align	5, 0x0
.Lb25.data:
	.ascii	"\211\004&=\244\022\233\275\217U%;\272)J>#\026\024\276@_\234>\340\243|\275\334\034K\275\232\300\004:A\313\245\274\303\024r\275\345\313a\275x\231\300>\201\334\"\276\236}\321\275H\346\257\276\202V\310>\225\375(>},\026\274E\235W\275\241\236\236<\245\220\222=\004\361\263\276\2620\240\274\265\036\240=\\:\336=\240\016\263\276\260\224\371\275p\235(=\311\\x;\226y\\\275\360\227\377=\275\364\200=rw/<@U\017=c\327\003=nV\267\273\354<Y\276\257$\260>3\207\311\274<&{\274h\b\031>\203\222\003\276\213\3649\275d\177\017\276\330\306\246\275'\314:>\203\024\253=S\331M\276\257\263S=b\221q\275\336\t\306=#^\005\2763)\256\274\344\255G>\224!\374=\374\360o\275\215#\031\276\322`J\276y6\360=\273\303;\275N\"N>M\022K\276\016\035C=1Fb\275u\017\220\275\0040\033>,\037\223=t\335\304\275\363\344\271=\320\341\260\275\2265\255=\310\"b=&\031\330\275;\314\000>>\347o\275\255\222\020=C\rU<\370d\307\275\373\306\206=I\345\373\274Y|\034>WY;\276O\240?>B\347\226\275\203\271\203\275W\243\313<\214\364\343\274Ey\033\276J4\214=\261\304\241\274-\271p>X\313l\276*_\366\275\260^\\=\237l1=\371\272\200=\002\373?\274*\3578<]Gv="
	.size	.Lb25.data, 400

	.type	.Lb25.buffer,@object            # @b25.buffer
	.data
	.p2align	4, 0x0
.Lb25.buffer:
	.quad	0                               # 0x0
	.quad	0
	.quad	.Lb25.data
	.quad	1                               # 0x1
	.byte	2                               # 0x2
	.byte	32                              # 0x20
	.half	1                               # 0x1
	.word	1                               # 0x1
	.quad	.Lb25.shape
	.quad	0
	.size	.Lb25.buffer, 56

	.type	.L__unnamed_1,@object           # @0
	.section	.rodata,"a",@progbits
	.p2align	4, 0x0
.L__unnamed_1:
	.zero	32
	.size	.L__unnamed_1, 32

	.type	.Lstr,@object                   # @str
	.p2align	5, 0x0
.Lstr:
	.asciz	"idw_halide_parallel_"
	.size	.Lstr, 21

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

	.type	.Lidw_halide_parallel__metadata_storage,@object # @idw_halide_parallel__metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.Lidw_halide_parallel__metadata_storage:
	.word	1                               # 0x1
	.word	1                               # 0x1
	.quad	.L__unnamed_2
	.quad	.Lstr.4
	.quad	.Lstr
	.size	.Lidw_halide_parallel__metadata_storage, 32

	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.section	".note.GNU-stack","",@progbits
