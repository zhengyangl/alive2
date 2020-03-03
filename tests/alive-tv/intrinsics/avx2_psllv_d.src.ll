define <4 x i32> @test_x86_avx2_psllv_d(<4 x i32> %a0, <4 x i32> %a1) {
  %res = call <4 x i32> @llvm.x86.avx2.psllv.d(<4 x i32> <i32 1, i32 1, i32 1, i32 1>, <4 x i32> <i32 1, i32 2, i32 3, i32 4>)
  ret <4 x i32> %res
}
declare <4 x i32> @llvm.x86.avx2.psllv.d(<4 x i32>, <4 x i32>) nounwind readnone
