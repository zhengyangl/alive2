define <16 x i16> @test_x86_avx2_psrl_w(<16 x i16> %a0, <8 x i16> %a1) {
  %res = call <16 x i16> @llvm.x86.avx2.psrl.w(<16 x i16> <i16 2048, i16 1024, i16 512, i16 256, i16 128, i16 64, i16 32, i16 16, i16 8, i16 4, i16 2, i16 1, i16 0, i16 1, i16 2, i16 4>, <8 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 1>)
  ret <16 x i16> %res
}
declare <16 x i16> @llvm.x86.avx2.psrl.w(<16 x i16>, <8 x i16>) nounwind readnone
