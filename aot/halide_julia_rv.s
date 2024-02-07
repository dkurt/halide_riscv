	.text
	.attribute	4, 16
	.attribute	5, "rv64gcv0p7"
	.file	"halide_buffer_t.cpp"
	.section	.sdata,"aw",@progbits
	.p2align	2                               # -- Begin function halide_julia_rv
.LCPI0_0:
	.word	0xc0000000                      # float -2
.LCPI0_1:
	.word	0x3ca3d70a                      # float 0.0199999996
.LCPI0_2:
	.word	0xbf400000                      # float -0.75
.LCPI0_3:
	.word	0x40800000                      # float 4
	.section	.text.halide_julia_rv,"ax",@progbits
	.globl	halide_julia_rv
	.p2align	1
	.type	halide_julia_rv,@function
halide_julia_rv:                        # @halide_julia_rv
# %bb.0:                                # %entry
	addi	sp, sp, -304
	sd	ra, 296(sp)                     # 8-byte Folded Spill
	sd	s0, 288(sp)                     # 8-byte Folded Spill
	sd	s1, 280(sp)                     # 8-byte Folded Spill
	sd	s2, 272(sp)                     # 8-byte Folded Spill
	sd	s3, 264(sp)                     # 8-byte Folded Spill
	sd	s4, 256(sp)                     # 8-byte Folded Spill
	sd	s5, 248(sp)                     # 8-byte Folded Spill
	sd	s6, 240(sp)                     # 8-byte Folded Spill
	sd	s7, 232(sp)                     # 8-byte Folded Spill
	sd	s8, 224(sp)                     # 8-byte Folded Spill
	sd	s9, 216(sp)                     # 8-byte Folded Spill
	sd	s10, 208(sp)                    # 8-byte Folded Spill
	sd	s11, 200(sp)                    # 8-byte Folded Spill
	csrr	a1, vlenb
	slli	a1, a1, 6
	sub	sp, sp, a1
	ld	a1, 40(a0)
	ld	a5, 16(a0)
	lw	s0, 0(a1)
	lwu	s1, 4(a1)
	lw	a2, 16(a1)
	sd	a2, 104(sp)                     # 8-byte Folded Spill
	lw	a2, 20(a1)
	sd	a2, 120(sp)                     # 8-byte Folded Spill
	lw	a2, 24(a1)
	sd	a2, 96(sp)                      # 8-byte Folded Spill
	sext.w	t4, s1
	bnez	a5, .LBB0_3
# %bb.1:                                # %_halide_buffer_is_bounds_query.exit
	ld	a2, 0(a0)
	bnez	a2, .LBB0_3
# %bb.2:                                # %_halide_buffer_is_bounds_query.exit31
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	sd	zero, 0(a0)
	lui	a2, 512
	addiw	a2, a2, 17
	slli	a2, a2, 12
	addi	a2, a2, -2047
	sd	a2, 32(a0)
	li	a2, 1
	sw	a2, 8(a1)
	sw	zero, 12(a1)
	sw	t4, 24(a1)
	sw	zero, 28(a1)
	ld	a1, 0(a0)
	sd	zero, 24(a0)
	beqz	a1, .LBB0_32
.LBB0_3:                                # %"produce f0"
	li	a1, 16
	mv	a0, t4
	bge	a1, t4, .LBB0_6
# %bb.4:                                # %"produce f0"
	sd	a0, 112(sp)                     # 8-byte Folded Spill
	mv	s5, t4
	bge	t4, a1, .LBB0_7
.LBB0_5:                                # %"produce f0"
	ld	a1, 120(sp)                     # 8-byte Folded Reload
	bgtz	a1, .LBB0_8
	j	.LBB0_32
.LBB0_6:                                # %"produce f0"
	li	a0, 16
	sd	a0, 112(sp)                     # 8-byte Folded Spill
	mv	s5, t4
	blt	t4, a1, .LBB0_5
.LBB0_7:                                # %"produce f0"
	li	s5, 16
	ld	a1, 120(sp)                     # 8-byte Folded Reload
	blez	a1, .LBB0_32
.LBB0_8:                                # %"for f0.s0.v1.rebased.preheader"
	li	s4, 0
	slti	a1, t4, 16
	srliw	a2, t4, 4
	addi	a1, a1, -1
	and	a2, a2, a1
	addiw	a1, t4, 15
	sraiw	a1, a1, 4
	sd	a2, 72(sp)                      # 8-byte Folded Spill
	sub	a1, a1, a2
	sd	a1, 64(sp)                      # 8-byte Folded Spill
	ld	a7, 112(sp)                     # 8-byte Folded Reload
	slli	a0, a7, 32
	srli	a6, a0, 32
	srli	a2, a0, 22
	sd	a2, 48(sp)                      # 8-byte Folded Spill
	add	a2, s0, t4
	addiw	a2, a2, -16
	vsetvli	a3, zero, e32, m4
	vmv.s.x	v8, zero
	li	t0, 1
	vmv.s.x	v12, t0
	li	t1, 2
	vsetvli	zero, t1, e32, m4
	vslideup.vi	v8, v12, 1
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, t1
	li	t2, 3
	vsetvli	zero, t2, e32, m4
	vslideup.vi	v8, v12, 2
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, t2
	li	t3, 4
	vsetvli	zero, t3, e32, m4
	vslideup.vi	v8, v12, 3
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, t3
	li	t5, 5
	vsetvli	zero, t5, e32, m4
	vslideup.vi	v8, v12, 4
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, t5
	li	t6, 6
	vsetvli	zero, t6, e32, m4
	vslideup.vi	v8, v12, 5
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, t6
	li	ra, 7
	vsetvli	zero, ra, e32, m4
	vslideup.vi	v8, v12, 6
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, ra
	li	a3, 8
	vsetvli	zero, a3, e32, m4
	vslideup.vi	v8, v12, 7
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, a3
	li	s9, 9
	vsetvli	zero, s9, e32, m4
	vslideup.vi	v8, v12, 8
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, s9
	li	s7, 10
	vsetvli	zero, s7, e32, m4
	vslideup.vi	v8, v12, 9
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, s7
	li	s6, 11
	vsetvli	zero, s6, e32, m4
	vslideup.vi	v8, v12, 10
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, s6
	li	s10, 12
	vsetvli	zero, s10, e32, m4
	vslideup.vi	v8, v12, 11
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, s10
	li	s8, 13
	vsetvli	zero, s8, e32, m4
	vslideup.vi	v8, v12, 12
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, s8
	li	s2, 14
	vsetvli	zero, s2, e32, m4
	vslideup.vi	v8, v12, 13
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, s2
	li	s11, 15
	vsetvli	zero, s11, e32, m4
	vslideup.vi	v8, v12, 14
	vsetvli	a4, zero, e32, m1
	vmv.s.x	v12, s11
	li	s3, 16
	vsetvli	zero, s3, e32, m4
	vslideup.vi	v8, v12, 15
	vsetvli	a4, zero, e32, m4
	vadd.vx	v8, v8, a2
	vfcvt.f.x.v	v8, v8
	csrr	a1, vlenb
	li	a2, 20
	mul	a1, a1, a2
	add	a1, a1, sp
	addi	a1, a1, 192
	vs4r.v	v8, (a1)                        # Unknown-size Folded Spill
	slli	a2, s5, 2
	li	a4, 64
	sub	a2, a4, a2
	sd	a2, 40(sp)                      # 8-byte Folded Spill
	mv	a2, s4
	srli	s4, a0, 30
	mv	a1, s5
	subw	s5, a7, s5
	slli	s5, s5, 2
	sub	a0, a4, s4
	sd	a0, 32(sp)                      # 8-byte Folded Spill
	negw	a0, a1
	sd	a0, 24(sp)                      # 8-byte Folded Spill
	vmv.s.x	v8, t0
	csrr	a0, vlenb
	li	a1, 60
	mul	a0, a0, a1
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v8, (a0)                        # Unknown-size Folded Spill
	vmv.s.x	v0, t1
	vmv.s.x	v8, t2
	csrr	a0, vlenb
	li	a1, 52
	mul	a0, a0, a1
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v8, (a0)                        # Unknown-size Folded Spill
	vmv.s.x	v8, t3
	csrr	a0, vlenb
	li	a1, 48
	mul	a0, a0, a1
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v8, (a0)                        # Unknown-size Folded Spill
	vmv.s.x	v8, t5
	csrr	a0, vlenb
	li	a1, 44
	mul	a0, a0, a1
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v8, (a0)                        # Unknown-size Folded Spill
	vmv.s.x	v8, t6
	vmv.s.x	v12, ra
	vmv.s.x	v16, a3
	vmv.s.x	v28, s9
	vmv.s.x	v24, s7
	vmv.s.x	v20, s6
	vmv.s.x	v4, s10
	csrr	a0, vlenb
	li	a1, 36
	mul	a0, a0, a1
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v4, (a0)                        # Unknown-size Folded Spill
	vmv.s.x	v4, s8
	csrr	a0, vlenb
	slli	a0, a0, 5
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v4, (a0)                        # Unknown-size Folded Spill
	vmv.s.x	v4, s2
	csrr	a0, vlenb
	li	a1, 28
	mul	a0, a0, a1
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v4, (a0)                        # Unknown-size Folded Spill
	vmv.s.x	v4, s11
	sd	a5, 88(sp)                      # 8-byte Folded Spill
	sd	s0, 152(sp)                     # 8-byte Folded Spill
	sd	s1, 80(sp)                      # 8-byte Folded Spill
	sd	t4, 176(sp)                     # 8-byte Folded Spill
	sd	a6, 56(sp)                      # 8-byte Folded Spill
	csrr	a0, vlenb
	li	a1, 56
	mul	a0, a0, a1
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v0, (a0)                        # Unknown-size Folded Spill
	csrr	a0, vlenb
	li	a1, 40
	mul	a0, a0, a1
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v8, (a0)                        # Unknown-size Folded Spill
	csrr	a0, vlenb
	slli	a0, a0, 4
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v12, (a0)                       # Unknown-size Folded Spill
	csrr	a0, vlenb
	li	a1, 12
	mul	a0, a0, a1
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v16, (a0)                       # Unknown-size Folded Spill
	csrr	a0, vlenb
	slli	a0, a0, 3
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v28, (a0)                       # Unknown-size Folded Spill
	csrr	a0, vlenb
	slli	a0, a0, 2
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v24, (a0)                       # Unknown-size Folded Spill
	addi	a0, sp, 192
	vs4r.v	v20, (a0)                       # Unknown-size Folded Spill
	csrr	a0, vlenb
	li	a1, 24
	mul	a0, a0, a1
	add	a0, a0, sp
	addi	a0, a0, 192
	vs4r.v	v4, (a0)                        # Unknown-size Folded Spill
	j	.LBB0_10
.LBB0_9:                                # %call_destructor.exit39
                                        #   in Loop: Header=BB0_10 Depth=1
	addi	a2, a2, 1
	ld	a0, 120(sp)                     # 8-byte Folded Reload
	beq	a2, a0, .LBB0_32
.LBB0_10:                               # %"for f0.s0.v1.rebased"
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_11 Depth 2
                                        #       Child Loop BB0_12 Depth 3
                                        #       Child Loop BB0_15 Depth 3
                                        #     Child Loop BB0_19 Depth 2
                                        #       Child Loop BB0_20 Depth 3
                                        #     Child Loop BB0_24 Depth 2
                                        #       Child Loop BB0_26 Depth 3
	sd	a2, 144(sp)                     # 8-byte Folded Spill
	li	a0, 0
	ld	s1, 48(sp)                      # 8-byte Folded Reload
	mv	a1, s1
	call	halide_malloc@plt
	mv	s0, a0
	li	a0, 0
	mv	a1, s1
	call	halide_malloc@plt
	li	a2, 3
.Lpcrel_hi0:
	auipc	a1, %pcrel_hi(.LCPI0_0)
	flw	ft0, %pcrel_lo(.Lpcrel_hi0)(a1)
.Lpcrel_hi1:
	auipc	a1, %pcrel_hi(.LCPI0_1)
	flw	ft1, %pcrel_lo(.Lpcrel_hi1)(a1)
	mv	ra, a0
	li	t0, 0
	ld	a0, 104(sp)                     # 8-byte Folded Reload
	ld	a1, 144(sp)                     # 8-byte Folded Reload
	add	a0, a0, a1
	fcvt.s.w	ft2, a0
	fmadd.s	ft2, ft2, ft1, ft0
	vsetvli	a0, zero, e32, m4
	vfmv.v.f	v8, ft2
	addi	a0, s0, -64
	sd	a0, 160(sp)                     # 8-byte Folded Spill
	addi	a0, ra, -64
	sd	a0, 168(sp)                     # 8-byte Folded Spill
	ld	a1, 40(sp)                      # 8-byte Folded Reload
	sd	ra, 136(sp)                     # 8-byte Folded Spill
	add	ra, ra, a1
	sd	s0, 128(sp)                     # 8-byte Folded Spill
	add	a1, a1, s0
	ld	t2, 112(sp)                     # 8-byte Folded Reload
	ld	t3, 72(sp)                      # 8-byte Folded Reload
	ld	t6, 64(sp)                      # 8-byte Folded Reload
	li	s0, 2
.LBB0_11:                               # %"for julia.s0.v2"
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_12 Depth 3
                                        #       Child Loop BB0_15 Depth 3
	ld	a5, 152(sp)                     # 8-byte Folded Reload
	mv	a4, a1
	mv	a3, ra
	mv	a0, t3
	li	t5, 4
	li	t4, 5
	li	a6, 6
	li	a7, 7
	li	t1, 8
	ld	s1, 176(sp)                     # 8-byte Folded Reload
	sd	a2, 8(sp)
	sd	t0, 0(sp)
	csrr	a2, vlenb
	slli	a2, a2, 4
	add	a2, a2, sp
	addi	a2, a2, 192
	vl4r.v	v4, (a2)                        # Unknown-size Folded Reload
	csrr	a2, vlenb
	li	t0, 12
	mul	a2, a2, t0
	ld	t0, 0(sp)
	add	a2, a2, sp
	addi	a2, a2, 192
	vl4r.v	v0, (a2)                        # Unknown-size Folded Reload
	csrr	a2, vlenb
	slli	a2, a2, 3
	add	a2, a2, sp
	addi	a2, a2, 192
	vl4r.v	v28, (a2)                       # Unknown-size Folded Reload
	csrr	a2, vlenb
	slli	a2, a2, 2
	add	a2, a2, sp
	addi	a2, a2, 192
	vl4r.v	v24, (a2)                       # Unknown-size Folded Reload
	addi	a2, sp, 192
	vl4r.v	v20, (a2)                       # Unknown-size Folded Reload
	ld	a2, 8(sp)
	blt	s1, s3, .LBB0_13
.LBB0_12:                               # %"for julia.s0.v0.v0"
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vsetvli	s1, zero, e32, m4
	vmv.s.x	v12, zero
	vsetvli	zero, s0, e32, m4
	sd	a0, 8(sp)
	csrr	a0, vlenb
	li	s1, 60
	mul	a0, a0, s1
	add	a0, a0, sp
	addi	a0, a0, 192
	vl4r.v	v16, (a0)                       # Unknown-size Folded Reload
	vslideup.vi	v12, v16, 1
	vsetvli	zero, a2, e32, m4
	csrr	a0, vlenb
	li	s1, 56
	mul	a0, a0, s1
	add	a0, a0, sp
	addi	a0, a0, 192
	vl4r.v	v16, (a0)                       # Unknown-size Folded Reload
	vslideup.vi	v12, v16, 2
	vsetvli	zero, t5, e32, m4
	csrr	a0, vlenb
	li	s1, 52
	mul	a0, a0, s1
	add	a0, a0, sp
	addi	a0, a0, 192
	vl4r.v	v16, (a0)                       # Unknown-size Folded Reload
	vslideup.vi	v12, v16, 3
	vsetvli	zero, t4, e32, m4
	csrr	a0, vlenb
	li	s1, 48
	mul	a0, a0, s1
	add	a0, a0, sp
	addi	a0, a0, 192
	vl4r.v	v16, (a0)                       # Unknown-size Folded Reload
	vslideup.vi	v12, v16, 4
	vsetvli	zero, a6, e32, m4
	csrr	a0, vlenb
	li	s1, 44
	mul	a0, a0, s1
	add	a0, a0, sp
	addi	a0, a0, 192
	vl4r.v	v16, (a0)                       # Unknown-size Folded Reload
	vslideup.vi	v12, v16, 5
	vsetvli	zero, a7, e32, m4
	csrr	a0, vlenb
	li	s1, 40
	mul	a0, a0, s1
	add	a0, a0, sp
	addi	a0, a0, 192
	vl4r.v	v16, (a0)                       # Unknown-size Folded Reload
	vslideup.vi	v12, v16, 6
	vsetvli	zero, t1, e32, m4
	vslideup.vi	v12, v4, 7
	vsetvli	zero, s9, e32, m4
	vslideup.vi	v12, v0, 8
	vsetvli	zero, s7, e32, m4
	vslideup.vi	v12, v28, 9
	vsetvli	zero, s6, e32, m4
	vslideup.vi	v12, v24, 10
	vsetvli	zero, s10, e32, m4
	vslideup.vi	v12, v20, 11
	vsetvli	zero, s8, e32, m4
	csrr	a0, vlenb
	li	s1, 36
	mul	a0, a0, s1
	add	a0, a0, sp
	addi	a0, a0, 192
	vl4r.v	v16, (a0)                       # Unknown-size Folded Reload
	vslideup.vi	v12, v16, 12
	vsetvli	zero, s2, e32, m4
	csrr	a0, vlenb
	slli	a0, a0, 5
	add	a0, a0, sp
	addi	a0, a0, 192
	vl4r.v	v16, (a0)                       # Unknown-size Folded Reload
	vslideup.vi	v12, v16, 13
	vsetvli	zero, s11, e32, m4
	csrr	a0, vlenb
	li	s1, 28
	mul	a0, a0, s1
	add	a0, a0, sp
	addi	a0, a0, 192
	vl4r.v	v16, (a0)                       # Unknown-size Folded Reload
	vslideup.vi	v12, v16, 14
	vsetvli	zero, s3, e32, m4
	csrr	s1, vlenb
	li	a0, 24
	mul	s1, s1, a0
	ld	a0, 8(sp)
	add	s1, s1, sp
	addi	s1, s1, 192
	vl4r.v	v16, (s1)                       # Unknown-size Folded Reload
	vslideup.vi	v12, v16, 15
	vsetvli	s1, zero, e32, m4
	vadd.vx	v12, v12, a5
	vfcvt.f.x.v	v12, v12
	vsetvli	zero, s3, e32, m4
	vfmul.vf	v12, v12, ft1
	vfadd.vf	v12, v12, ft0
	vsw.v	v12, (a4)
	vsw.v	v8, (a3)
	addi	a0, a0, -1
	addi	a3, a3, 64
	addi	a4, a4, 64
	addiw	a5, a5, 16
	bnez	a0, .LBB0_12
.LBB0_13:                               # %"end for julia.s0.v0.v0"
                                        #   in Loop: Header=BB0_11 Depth=2
	addi	t0, t0, 1
	blez	t6, .LBB0_16
# %bb.14:                               # %"for julia.s0.v0.v04.preheader"
                                        #   in Loop: Header=BB0_11 Depth=2
	vsetvli	zero, s3, e32, m4
	csrr	a0, vlenb
	li	a3, 20
	mul	a0, a0, a3
	add	a0, a0, sp
	addi	a0, a0, 192
	vl4r.v	v12, (a0)                       # Unknown-size Folded Reload
	vfmul.vf	v12, v12, ft1
	vfadd.vf	v12, v12, ft0
	mulw	a0, t2, t0
	slli	a0, a0, 32
	srli	a3, a0, 30
	ld	a0, 160(sp)                     # 8-byte Folded Reload
	add	a0, a0, a3
	ld	a4, 168(sp)                     # 8-byte Folded Reload
	add	a3, a3, a4
	mv	a4, t6
.LBB0_15:                               # %"for julia.s0.v0.v04"
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_11 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	vsw.v	v12, (a0)
	addiw	a4, a4, -1
	vsw.v	v8, (a3)
	bnez	a4, .LBB0_15
.LBB0_16:                               # %"end for julia.s0.v0.v05"
                                        #   in Loop: Header=BB0_11 Depth=2
	add	ra, ra, s4
	add	a1, a1, s4
	li	a0, 256
	bne	t0, a0, .LBB0_11
# %bb.17:                               # %"end for julia.s0.v2"
                                        #   in Loop: Header=BB0_10 Depth=1
	ld	t4, 176(sp)                     # 8-byte Folded Reload
	blez	t4, .LBB0_28
# %bb.18:                               # %"for julia.s1.v0.rebased.preheader"
                                        #   in Loop: Header=BB0_10 Depth=1
	li	a6, 0
	ld	ra, 128(sp)                     # 8-byte Folded Reload
	addi	a7, ra, 64
	ld	t5, 136(sp)                     # 8-byte Folded Reload
	addi	t0, t5, 64
	ld	s1, 32(sp)                      # 8-byte Folded Reload
	add	t1, t5, s1
	add	s1, s1, ra
	ld	t2, 88(sp)                      # 8-byte Folded Reload
	ld	t3, 80(sp)                      # 8-byte Folded Reload
	ld	t6, 56(sp)                      # 8-byte Folded Reload
.LBB0_19:                               # %"for julia.s1.v0.rebased"
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_20 Depth 3
	li	a5, 255
	mv	a4, s1
	mv	s0, t1
	mv	a1, a7
	mv	a2, t0
.LBB0_20:                               # %"for julia.s1.r7$x.rebased"
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_19 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	add	a0, a4, s5
	add	a3, s0, s5
	flw	ft0, 0(a3)
	flw	ft1, 0(a0)
	fmul.s	ft2, ft0, ft0
	fmsub.s	ft1, ft1, ft1, ft2
	add	a3, a1, s5
	fsw	ft1, 0(a3)
	flw	ft1, 0(a0)
.Lpcrel_hi2:
	auipc	a0, %pcrel_hi(.LCPI0_2)
	flw	ft2, %pcrel_lo(.Lpcrel_hi2)(a0)
	fadd.s	ft0, ft0, ft0
	fmadd.s	ft0, ft0, ft1, ft2
	add	a0, a2, s5
	fsw	ft0, 0(a0)
	addi	a5, a5, -1
	add	a2, a2, s4
	add	a1, a1, s4
	add	s0, s0, s4
	add	a4, a4, s4
	bnez	a5, .LBB0_20
# %bb.21:                               # %"end for julia.s1.r7$x.rebased"
                                        #   in Loop: Header=BB0_19 Depth=2
	addiw	a6, a6, 1
	addi	t0, t0, 4
	addi	a7, a7, 4
	addi	t1, t1, 4
	addi	s1, s1, 4
	bne	a6, t4, .LBB0_19
# %bb.22:                               # %"for f0.s0.v0.rebased.preheader"
                                        #   in Loop: Header=BB0_10 Depth=1
	li	a0, 0
	ld	a1, 96(sp)                      # 8-byte Folded Reload
	ld	a2, 144(sp)                     # 8-byte Folded Reload
	mulw	a6, a1, a2
	addi	a7, t5, 64
	addi	t0, ra, 64
	ld	t1, 24(sp)                      # 8-byte Folded Reload
	j	.LBB0_24
.LBB0_23:                               # %"consume argmin"
                                        #   in Loop: Header=BB0_24 Depth=2
	add	a2, a0, a6
	add	a2, a2, t2
	sb	a1, 0(a2)
	addi	a0, a0, 1
	addiw	t1, t1, 1
	beq	a0, t3, .LBB0_29
.LBB0_24:                               # %"for f0.s0.v0.rebased"
                                        #   Parent Loop BB0_10 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB0_26 Depth 3
	li	a1, 0
	add	a2, t6, t1
	slli	a3, a2, 2
	add	a2, a7, a3
	add	a3, a3, t0
	li	a5, 1
	li	s1, 255
	li	s0, 1
	j	.LBB0_26
.LBB0_25:                               # %"for argmin.s1.r7$x.rebased"
                                        #   in Loop: Header=BB0_26 Depth=3
	addi	s1, s1, -1
	addiw	a5, a5, 1
	add	a2, a2, s4
	add	a3, a3, s4
	beqz	s1, .LBB0_23
.LBB0_26:                               # %"for argmin.s1.r7$x.rebased"
                                        #   Parent Loop BB0_10 Depth=1
                                        #     Parent Loop BB0_24 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	flw	ft1, 0(a3)
	flw	ft2, 0(a2)
.Lpcrel_hi3:
	auipc	a4, %pcrel_hi(.LCPI0_3)
	flw	ft0, %pcrel_lo(.Lpcrel_hi3)(a4)
	fmul.s	ft1, ft1, ft1
	fmadd.s	ft1, ft2, ft2, ft1
	fle.s	a4, ft0, ft1
	and	a4, a4, s0
	beqz	a4, .LBB0_25
# %bb.27:                               #   in Loop: Header=BB0_26 Depth=3
	flt.s	s0, ft1, ft0
	mv	a1, a5
	j	.LBB0_25
.LBB0_28:                               # %"end for f0.s0.v0.rebased"
                                        #   in Loop: Header=BB0_10 Depth=1
	ld	a1, 136(sp)                     # 8-byte Folded Reload
	ld	ra, 128(sp)                     # 8-byte Folded Reload
	ld	a2, 144(sp)                     # 8-byte Folded Reload
	beqz	ra, .LBB0_30
.LBB0_29:                               # %if.then.i
                                        #   in Loop: Header=BB0_10 Depth=1
	li	a0, 0
	mv	a1, ra
	call	halide_free@plt
	ld	a1, 136(sp)                     # 8-byte Folded Reload
	ld	a2, 144(sp)                     # 8-byte Folded Reload
.LBB0_30:                               # %call_destructor.exit
                                        #   in Loop: Header=BB0_10 Depth=1
	beqz	a1, .LBB0_9
# %bb.31:                               # %if.then.i38
                                        #   in Loop: Header=BB0_10 Depth=1
	li	a0, 0
	call	halide_free@plt
	ld	a2, 144(sp)                     # 8-byte Folded Reload
	j	.LBB0_9
.LBB0_32:                               # %destructor_block
	li	a0, 0
	csrr	a1, vlenb
	slli	a1, a1, 6
	add	sp, sp, a1
	ld	ra, 296(sp)                     # 8-byte Folded Reload
	ld	s0, 288(sp)                     # 8-byte Folded Reload
	ld	s1, 280(sp)                     # 8-byte Folded Reload
	ld	s2, 272(sp)                     # 8-byte Folded Reload
	ld	s3, 264(sp)                     # 8-byte Folded Reload
	ld	s4, 256(sp)                     # 8-byte Folded Reload
	ld	s5, 248(sp)                     # 8-byte Folded Reload
	ld	s6, 240(sp)                     # 8-byte Folded Reload
	ld	s7, 232(sp)                     # 8-byte Folded Reload
	ld	s8, 224(sp)                     # 8-byte Folded Reload
	ld	s9, 216(sp)                     # 8-byte Folded Reload
	ld	s10, 208(sp)                    # 8-byte Folded Reload
	ld	s11, 200(sp)                    # 8-byte Folded Reload
	addi	sp, sp, 304
	ret
.Lfunc_end0:
	.size	halide_julia_rv, .Lfunc_end0-halide_julia_rv
                                        # -- End function
	.section	.text.halide_julia_rv_argv,"ax",@progbits
	.globl	halide_julia_rv_argv            # -- Begin function halide_julia_rv_argv
	.p2align	1
	.type	halide_julia_rv_argv,@function
halide_julia_rv_argv:                   # @halide_julia_rv_argv
# %bb.0:                                # %entry
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	ld	a0, 0(a0)
	call	halide_julia_rv@plt
	li	a0, 0
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	halide_julia_rv_argv, .Lfunc_end1-halide_julia_rv_argv
                                        # -- End function
	.section	.text.halide_julia_rv_metadata,"ax",@progbits
	.globl	halide_julia_rv_metadata        # -- Begin function halide_julia_rv_metadata
	.p2align	1
	.type	halide_julia_rv_metadata,@function
halide_julia_rv_metadata:               # @halide_julia_rv_metadata
# %bb.0:                                # %entry
.Lpcrel_hi4:
	auipc	a0, %pcrel_hi(.Lhalide_julia_rv_metadata_storage)
	addi	a0, a0, %pcrel_lo(.Lpcrel_hi4)
	ret
.Lfunc_end2:
	.size	halide_julia_rv_metadata, .Lfunc_end2-halide_julia_rv_metadata
                                        # -- End function
	.type	.L__unnamed_1,@object           # @0
	.section	.rodata,"a",@progbits
	.p2align	4, 0x0
.L__unnamed_1:
	.zero	32
	.size	.L__unnamed_1, 32

	.type	.Lstr,@object                   # @str
	.p2align	5, 0x0
.Lstr:
	.asciz	"f0"
	.size	.Lstr, 3

	.type	.L__unnamed_2,@object           # @1
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.L__unnamed_2:
	.quad	.Lstr
	.word	2                               # 0x2
	.word	2                               # 0x2
	.byte	1                               # 0x1
	.byte	8                               # 0x8
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

	.type	.Lstr.5,@object                 # @str.5
	.p2align	5, 0x0
.Lstr.5:
	.asciz	"halide_julia_rv"
	.size	.Lstr.5, 16

	.type	.Lhalide_julia_rv_metadata_storage,@object # @halide_julia_rv_metadata_storage
	.section	.data.rel.ro,"aw",@progbits
	.p2align	4, 0x0
.Lhalide_julia_rv_metadata_storage:
	.word	1                               # 0x1
	.word	1                               # 0x1
	.quad	.L__unnamed_2
	.quad	.Lstr.4
	.quad	.Lstr.5
	.size	.Lhalide_julia_rv_metadata_storage, 32

	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.ident	"clang version 16.0.0 (https://github.com/dkurt/llvm-rvv-071 b027aa1b59c9f53240bdc836f39656723fdf9df0)"
	.section	".note.GNU-stack","",@progbits
