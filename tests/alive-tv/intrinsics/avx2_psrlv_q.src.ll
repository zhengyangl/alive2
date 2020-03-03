define <2 x i64> @test_x86_avx2_psrlv_q(<2 x i64> %a0, <2 x i64> %a1) {
  %res = call <2 x i64> @llvm.x86.avx2.psrlv.q(<2 x i64> <i64 32768, i64 32768>, <2 x i64> <i64 1, i64 2>)
  ret <2 x i64> %res
}
declare <2 x i64> @llvm.x86.avx2.psrlv.q(<2 x i64>, <2 x i64>) nounwind readnone
