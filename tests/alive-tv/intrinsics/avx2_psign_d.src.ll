define <8 x i32> @test_x86_avx2_psign_d(<8 x i32> %a0, <8 x i32> %a1) {
  %res = call <8 x i32> @llvm.x86.avx2.psign.d(<8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>, <8 x i32> <i32 -100, i32 0, i32 102, i32 -103, i32 0, i32 105, i32 -106, i32 0>)
  ret <8 x i32> %res
}
declare <8 x i32> @llvm.x86.avx2.psign.d(<8 x i32>, <8 x i32>) nounwind readnone
