define <8 x i32> @test_x86_avx2_psrl_d(<8 x i32> %a0, <4 x i32> %a1) {
  %res = call <8 x i32> @llvm.x86.avx2.psrl.d(<8 x i32> <i32 2048, i32 1024, i32 512, i32 256, i32 128, i32 64, i32 32, i32 16>, <4 x i32> <i32 0, i32 0, i32 0, i32 1>)
  ret <8 x i32> %res
}
declare <8 x i32> @llvm.x86.avx2.psrl.d(<8 x i32>, <4 x i32>) nounwind readnone
