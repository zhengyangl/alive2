define <16 x i16> @test_x86_avx2_packssdw(<8 x i32> %a0, <8 x i32> %a1) {
; AVX2-LABEL: test_x86_avx2_packssdw:
; AVX2:       # %bb.0:
; AVX2-NEXT:    vpackssdw %ymm1, %ymm0, %ymm0 # encoding: [0xc5,0xfd,0x6b,0xc1]
; AVX2-NEXT:    ret{{[l|q]}} # encoding: [0xc3]
;
; AVX512VL-LABEL: test_x86_avx2_packssdw:
; AVX512VL:       # %bb.0:
; AVX512VL-NEXT:    vpackssdw %ymm1, %ymm0, %ymm0 # EVEX TO VEX Compression encoding: [0xc5,0xfd,0x6b,0xc1]
; AVX512VL-NEXT:    ret{{[l|q]}} # encoding: [0xc3]
;  %res = call <16 x i16> @llvm.x86.avx2.packssdw(<8 x i32> %a0, <8 x i32> %a1) ; <<16 x i16>> [#uses=1]
  %res = call <16 x i16> @llvm.x86.avx2.packssdw(<8 x i32> <i32 300000, i32 -300000, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8>, <8 x i32> undef) ; <<16 x i16>> [#uses=1]
  ret <16 x i16> %res
}

declare <16 x i16> @llvm.x86.avx2.packssdw(<8 x i32>, <8 x i32>) nounwind readnone
