define <4 x i64> @test_x86_avx2_psllv_q_256(<4 x i64> %a0, <4 x i64> %a1) {
  ret <4 x i64> <i64 2, i64 4, i64 8, i64 16>
}
declare <4 x i64> @llvm.x86.avx2.psllv.q_256(<4 x i64>, <4 x i64>) nounwind readnone
