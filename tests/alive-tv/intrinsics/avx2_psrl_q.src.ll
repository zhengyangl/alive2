define <4 x i64> @test_x86_avx2_psrl_q(<4 x i64> %a0, <2 x i64> %a1) {
  %res = call <4 x i64> @llvm.x86.avx2.psrl.q(<4 x i64> <i64 2048, i64 1024, i64 512, i64 256>, <2 x i64> <i64 0, i64 1>)
  ret <4 x i64> %res
}
declare <4 x i64> @llvm.x86.avx2.psrl.q(<4 x i64>, <2 x i64>) nounwind readnone
