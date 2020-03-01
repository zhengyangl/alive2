define <32 x i8> @test_x86_avx2_pavg_b(<32 x i8> %a0, <32 x i8> %a1) {
  %res = call <32 x i8> @llvm.x86.avx2.pavg.b(<32 x i8> <i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10>, <32 x i8> <i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 12, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10>) ; <<16 x i8>> [#uses=1]
  ret <32 x i8> %res
}

declare <32 x i8> @llvm.x86.avx2.pavg.b(<32 x i8>, <32 x i8>) nounwind readnone
