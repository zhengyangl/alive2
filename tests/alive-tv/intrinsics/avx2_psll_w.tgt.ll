define <16 x i16> @test_x86_avx2_psll_w(<16 x i16> %a0, <8 x i16> %a1) {
  ret <16 x i16> <i16 0, i16 2, i16 4, i16 6, i16 8, i16 10, i16 12, i16 14, i16 16, i16 18, i16 20, i16 22, i16 24, i16 26, i16 28, i16 30>
}
declare <16 x i16> @llvm.x86.avx2.psll.w(<16 x i16>, <8 x i16>) nounwind readnone
