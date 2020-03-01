define <32 x i8> @test_x86_avx2_psign_b(<32 x i8> %a0, <32 x i8> %a1) {
  ret <32 x i8> <i8 -3, i8 0, i8 -5, i8 6, i8 7, i8 8, i8 -9, i8 -10, i8 0, i8 0, i8 0, i8 -6, i8 7, i8 8, i8 9, i8 -10, i8 3, i8 -4, i8 5, i8 -6, i8 7, i8 8, i8 9, i8 10, i8 3, i8 4, i8 5, i8 6, i8 -7, i8 8, i8 9, i8 10>
}

declare <32 x i8> @llvm.x86.avg2.psign.b(<32 x i8>, <32 x i8>) nounwind readnone
