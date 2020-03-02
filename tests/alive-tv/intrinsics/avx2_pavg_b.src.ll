;define <16 x i8> @test_x86_sse2_pavg_b(<16 x i8> %a0, <16 x i8> %a1) {
; SSE-LABEL: test_x86_sse2_pavg_b:
; SSE:       ## %bb.0:
; SSE-NEXT:    pavgb %xmm1, %xmm0 ## encoding: [0x66,0x0f,0xe0,0xc1]
; SSE-NEXT:    ret{{[l|q]}} ## encoding: [0xc3]
;
; AVX1-LABEL: test_x86_sse2_pavg_b:
; AVX1:       ## %bb.0:
; AVX1-NEXT:    vpavgb %xmm1, %xmm0, %xmm0 ## encoding: [0xc5,0xf9,0xe0,0xc1]
; AVX1-NEXT:    ret{{[l|q]}} ## encoding: [0xc3]
;
; AVX512-LABEL: test_x86_sse2_pavg_b:
; AVX512:       ## %bb.0:
; AVX512-NEXT:    vpavgb %xmm1, %xmm0, %xmm0 ## EVEX TO VEX Compression encoding: [0xc5,0xf9,0xe0,0xc1]
; AVX512-NEXT:    ret{{[l|q]}} ## encoding: [0xc3]
;  %res = call <16 x i8> @llvm.x86.sse2.pavg.b(<16 x i8> %a0, <16 x i8> %a1) ; <<16 x i8>> [#uses=1]
;  ret <16 x i8> %res
;}
define <32 x i8> @test_x86_avx2_pavg_b(<32 x i8> %a0, <32 x i8> %a1) {
; SSE-LABEL: test_x86_sse2_pavg_b:
; SSE:       ## %bb.0:
; SSE-NEXT:    pavgb %xmm1, %xmm0 ## encoding: [0x66,0x0f,0xe0,0xc1]
; SSE-NEXT:    ret{{[l|q]}} ## encoding: [0xc3]
;
; AVX1-LABEL: test_x86_sse2_pavg_b:
; AVX1:       ## %bb.0:
; AVX1-NEXT:    vpavgb %xmm1, %xmm0, %xmm0 ## encoding: [0xc5,0xf9,0xe0,0xc1]
; AVX1-NEXT:    ret{{[l|q]}} ## encoding: [0xc3]
;
; AVX512-LABEL: test_x86_sse2_pavg_b:
; AVX512:       ## %bb.0:
; AVX512-NEXT:    vpavgb %xmm1, %xmm0, %xmm0 ## EVEX TO VEX Compression encoding: [0xc5,0xf9,0xe0,0xc1]
; AVX512-NEXT:    ret{{[l|q]}} ## encoding: [0xc3]
  %res = call <32 x i8> @llvm.x86.avx2.pavg.b(<32 x i8> <i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10>, <32 x i8> <i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 12, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10>) ; <<16 x i8>> [#uses=1]
  ret <32 x i8> %res
}

declare <32 x i8> @llvm.x86.avx2.pavg.b(<32 x i8>, <32 x i8>) nounwind readnone
