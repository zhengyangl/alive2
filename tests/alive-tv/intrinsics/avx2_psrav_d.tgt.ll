define <4 x i32> @test_x86_avx2_psrav_d(<4 x i32> %a0, <4 x i32> %a1) {
  ret <4 x i32> <i32 16384, i32 8192, i32 4096, i32 2048>
}
declare <4 x i32> @llvm.x86.avx2.psrav.d(<4 x i32>, <4 x i32>) nounwind readnone
