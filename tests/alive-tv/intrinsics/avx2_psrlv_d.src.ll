define <4 x i32> @test_x86_avx2_psrlv_d(<4 x i32> %a0, <4 x i32> %a1) {
  %res = call <4 x i32> @llvm.x86.avx2.psrlv.d(<4 x i32> <i32 32768, i32 32768, i32 32768, i32 32768>, <4 x i32> <i32 1, i32 2, i32 3, i32 4>)
  ret <4 x i32> %res
}
declare <4 x i32> @llvm.x86.avx2.psrlv.d(<4 x i32>, <4 x i32>) nounwind readnone
