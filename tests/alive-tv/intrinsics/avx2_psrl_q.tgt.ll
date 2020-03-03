define <4 x i64> @test_x86_avx2_psrl_q(<4 x i64> %a0, <2 x i64> %a1) {
  ret <4 x i64> <i64 1024, i64 512, i64 256, i64 128>
}
declare <4 x i64> @llvm.x86.avx2.psrl.q(<4 x i64>, <2 x i64>) nounwind readnone
