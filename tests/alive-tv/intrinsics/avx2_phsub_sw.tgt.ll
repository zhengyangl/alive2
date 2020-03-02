define <16 x i16> @test_x86_avx2_phsub_sw(<16 x i16> %a0, <16 x i16> %a1) {
  ret <16 x i16> <i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1>
}
declare <16 x i16> @llvm.x86.avx2.phsub.sw(<16 x i16>, <16 x i16>) nounwind readnone
