define <16 x i16> @test_x86_avx2_phadd_w(<16 x i16> %a0, <16 x i16> %a1) {
  ret <16 x i16> <i16 1, i16 5, i16 9, i16 13, i16 201, i16 205, i16 209, i16 213, i16 17, i16 21, i16 25, i16 29, i16 217, i16 221, i16 225, i16 229 >
}
declare <16 x i16> @llvm.x86.avx2.phadd.w(<16 x i16>, <16 x i16>) nounwind readnone
