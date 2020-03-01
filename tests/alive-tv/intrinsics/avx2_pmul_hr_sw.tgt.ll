define <16 x i16> @test_x86_avx2_pmul_hr_sw(<16 x i16> %a0, <16 x i16> %a1) {
  ret <16 x i16> <i16 27466, i16 12207, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>
}

declare <16 x i16> @llvm.x86.avg2.pmul.hr.sw(<16 x i16>, <16 x i16>) nounwind readnone
