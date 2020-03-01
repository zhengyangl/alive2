define <4 x i64> @test_x86_avx2_psll_q(<4 x i64> %a0, <2 x i64> %a1) {
  ret <4 x i64> <i64 0, i64 4, i64 8, i64 12>
}
declare <4 x i64> @llvm.x86.avx2.psll.q(<4 x i64>, <2 x i64>) nounwind readnone
