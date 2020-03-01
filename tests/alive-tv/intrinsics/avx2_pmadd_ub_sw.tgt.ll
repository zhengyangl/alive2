define <16 x i16> @test_x86_avx2_pmadd_ub_sw(<32 x i8> %a0, <32 x i8> %a1) {
  ret <16 x i16> <i16 1, i16 13, i16 41, i16 85, i16 145, i16 221, i16 313, i16 421, i16 545, i16 685, i16 841, i16 1013, i16 1201, i16 1405, i16 1625, i16 32767>
}

declare <16 x i16> @llvm.x86.avg2.pmadd.ub.sw(<32 x i16>, <32 x i16>) nounwind readnone
