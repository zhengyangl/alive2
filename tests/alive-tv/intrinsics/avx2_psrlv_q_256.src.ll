define <4 x i64> @test_x86_avx2_psrlv_q_256(<4 x i64> %a0, <4 x i64> %a1) {
  %res = call <4 x i64> @llvm.x86.avx2.psrlv.q.256(<4 x i64> <i64 32768, i64 32768, i64 32768, i64 32768>, <4 x i64> <i64 1, i64 2, i64 3, i64 4>)
  ret <4 x i64> %res
}
declare <4 x i64> @llvm.x86.avx2.psrlv.q.256(<4 x i64>, <4 x i64>) nounwind readnone
