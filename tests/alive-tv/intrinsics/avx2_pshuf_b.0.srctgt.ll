define <32 x i8> @src(<32 x i8> %InVec) {
; CHECK-LABEL: @identity_test_avx2(
; CHECK-NEXT:    ret <32 x i8> [[INVEC:%.*]]
;
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>)
  ret <32 x i8> %1
}


define <32 x i8> @tgt(<32 x i8> %InVec) {
; CHECK-LABEL: @identity_test_avx2(
; CHECK-NEXT:    ret <32 x i8> [[INVEC:%.*]]
;
  ret <32 x i8> %InVec
}

declare <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8>, <32 x i8>)
