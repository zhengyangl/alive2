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
;  ret <16 x i16> %res
   ret <16 x i16> <i16 32767, i16 -32768, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15, i16 16>
}

declare <16 x i16> @llvm.x86.avx2.packssdw(<8 x i32>, <8 x i32>) nounwind readnone
