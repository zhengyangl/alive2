define <16 x i16> @test_x86_avx2_pavg_w(<16 x i16> %a0, <16 x i16> %a1) {
  ret <16 x i16> <i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 11>
}

declare <16 x i16> @llvm.x86.avg2.pavg.w(<16 x i16>, <16 x i16>) nounwind readnone
