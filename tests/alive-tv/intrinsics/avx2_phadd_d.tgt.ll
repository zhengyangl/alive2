define <8 x i32> @test_x86_avx2_phadd_d(<8 x i32> %a0, <8 x i32> %a1) {
  ret <8 x i32> <i32 1, i32 5, i32 201, i32 205, i32 9, i32 13, i32 209, i32 213>
}
declare <8 x i32> @llvm.x86.avx2.phadd.d(<8 x i32>, <8 x i32>) nounwind readnone
