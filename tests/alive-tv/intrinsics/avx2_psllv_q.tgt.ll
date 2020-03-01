define <2 x i64> @test_x86_avx2_psllv_q(<2 x i64> %a0, <2 x i64> %a1) {
  ret <2 x i64> <i64 2, i64 4>
}
declare <2 x i64> @llvm.x86.avx2.psllv.q(<2 x i64>, <2 x i64>) nounwind readnone
