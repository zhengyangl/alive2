define <16 x i16> @test_x86_avx2_packusdw(<8 x i32> %a0, <8 x i32> %a1) {
   ret <16 x i16> <i16 65535, i16 65535, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15, i16 16>
}

declare <16 x i16> @llvm.x86.avx2.packusdw(<8 x i32>, <8 x i32>) nounwind readnone
