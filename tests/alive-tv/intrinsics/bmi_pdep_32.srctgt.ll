define i32 @src(i32, i32 %a1) {
  %res = call i32 @llvm.x86.bmi.pdep.32(i32 8, i32 16)
  ret i32 %res
}

declare i32 @llvm.x86.bmi.pdep.32(i32, i32) nounwind readnone
