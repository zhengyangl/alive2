define <8 x i32> @test_x86_avx2_psll_d(<8 x i32> %a0, <4 x i32> %a1) {
  %res = call <8 x i32> @llvm.x86.avx2.psll.d(<8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, <4 x i32> <i32 0, i32 0, i32 0, i32 2>)
  ret <8 x i32> %res
}
declare <8 x i32> @llvm.x86.avx2.psll.d(<8 x i32>, <4 x i32>) nounwind readnone
