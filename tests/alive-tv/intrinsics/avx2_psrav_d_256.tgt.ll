define <8 x i32> @test_x86_avx2_psrav_d_256(<8 x i32> %a0, <8 x i32> %a1) {
  ret <8 x i32> <i32 16384, i32 8192, i32 4096, i32 2048, i32 1024, i32 512, i32 256, i32 128>
}
declare <8 x i32> @llvm.x86.avx2.psrav.d.256(<8 x i32>, <8 x i32>) nounwind readnone
