define <8 x i32> @test_x86_avx2_pmadd_wd(<16 x i16> %a0, <16 x i16> %a1) {
  ret <8 x i32> <i32 1, i32 13, i32 41, i32 85, i32 145, i32 221, i32 313, i32 421>
}

declare <8 x i32> @llvm.x86.avg2.pmadd.ub.sw(<16 x i16>, <16 x i16>) nounwind readnone
