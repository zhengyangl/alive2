define <8 x i32> @test_x86_avx2_pmadd_wd(<16 x i16> %a0, <16 x i16> %a1) {
  %res = call <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16> <i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15>, <16 x i16> <i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15>)
  ret <8 x i32> %res
}

declare <8 x i32> @llvm.x86.avx2.pmadd.wd(<16 x i16>, <16 x i16>) nounwind readnone
