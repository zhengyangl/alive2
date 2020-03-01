define <8 x i32> @test_x86_avx2_phsub_d(<8 x i32> %a0, <8 x i32> %a1) {
  ret <8 x i32> <i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1>
}
declare <8 x i32> @llvm.x86.avx2.phsub.d(<8 x i32>, <8 x i32>) nounwind readnone
