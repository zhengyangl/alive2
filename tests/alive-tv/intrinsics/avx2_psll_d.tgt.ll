define <8 x i32> @test_x86_avx2_psll_d(<8 x i32> %a0, <4 x i32> %a1) {
  ret <8 x i32> <i32 0, i32 4, i32 8, i32 12, i32 16, i32 20, i32 24, i32 28>
}
declare <8 x i32> @llvm.x86.avx2.psll.d(<8 x i32>, <4 x i32>) nounwind readnone
