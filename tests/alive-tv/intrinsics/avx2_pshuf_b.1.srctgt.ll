define <32 x i8> @src(<32 x i8> %InVec) {
; CHECK-LABEL: @identity_test_avx2(
; CHECK-NEXT:    ret <32 x i8> [[INVEC:%.*]]
  %1 = tail call <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8> %InVec, <32 x i8> <i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128, i8 -128>);
  ret <32 x i8> %1
}


define <32 x i8> @tgt(<32 x i8> %InVec) {
; CHECK-LABEL: @identity_test_avx2(
; CHECK-NEXT:    ret <32 x i8> [[INVEC:%.*]]
;
  ret <32 x i8> zeroinitializer
}

declare <32 x i8> @llvm.x86.avx2.pshuf.b(<32 x i8>, <32 x i8>)
