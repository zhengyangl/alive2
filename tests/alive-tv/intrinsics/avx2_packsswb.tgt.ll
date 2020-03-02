define <32 x i8> @test_x86_avx2_packsswb(<16 x i16> %a0, <16 x i16> %a1) {
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
   ret <32 x i8> <i8 127, i8 -128, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31, i8 32>
}

declare <32 x i8> @llvm.x86.avx2.packsswb(<16 x i16>, <16 x i16>) nounwind readnone
