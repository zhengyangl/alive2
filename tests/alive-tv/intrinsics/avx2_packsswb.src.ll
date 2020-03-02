define <32 x i8> @test_x86_avx2_packsswb(<16 x i16> %a0, <16 x i16> %a1) {
  %res = call <32 x i8> @llvm.x86.avx2.packsswb(<16 x i16> <i16 3000, i16 -3000, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15, i16 16>, <16 x i16> undef) ; <<16 x i16>> [#uses=1]
  ret <32 x i8> %res
}

declare <32 x i8> @llvm.x86.avx2.packsswb(<16 x i16>, <16 x i16>) nounwind readnone
