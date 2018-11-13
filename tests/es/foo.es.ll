; CHECK: correct

define i32 @foo(i32 %0) {
  %y = shl i32 %0, %0
  ret i32 %y
}
