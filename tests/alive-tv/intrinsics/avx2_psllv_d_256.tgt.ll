define <8 x i32> @test_x86_avx2_psllv_d_256(<8 x i32> %a0, <8 x i32> %a1) {
  ret <8 x i32> <i32 2, i32 4, i32 8, i32 16, i32 32, i32 64, i32 128, i32 256>
}
declare <8 x i32> @llvm.x86.avx2.psllv.d.256(<8 x i32>, <8 x i32>) nounwind readnone
