define <16 x i16> @test_x86_avx2_pmulh_w(<16 x i16> %a0, <16 x i16> %a1) {
  %res = call <16 x i16> @llvm.x86.avx2.pmulh.w(<16 x i16> <i16 30000, i16 20000, i16 -1, i16 6, i16 7, i16 8, i16 9, i16 10, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10>, <16 x i16> <i16 30000, i16 20000, i16 -1, i16 6, i16 7, i16 8, i16 9, i16 10, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 12>)
  ret <16 x i16> %res
}

declare <16 x i16> @llvm.x86.avx2.pmulh.w(<16 x i16>, <16 x i16>) nounwind readnone
