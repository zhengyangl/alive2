define <16 x i16> @test_x86_avx2_pmulh_w(<16 x i16> %a0, <16 x i16> %a1) {
  ret <16 x i16> <i16 13732, i16 6103, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>
}

declare <16 x i16> @llvm.x86.avg2.pmulh.w(<16 x i16>, <16 x i16>) nounwind readnone
