define i234 @foo(i234 %0) {
  %x = call i234 @llvm.uadd.sat.i234(i234 %0, i234 %0)
  %y = sub i234 %x, %0
  ret i234 %y
}

declare i234 @llvm.uadd.sat.i234(i234 %a, i234 %b)
