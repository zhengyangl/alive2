define i32 @foo(i32 %0, i32 %1) {
  %y = shl i32 %0, %1
  %x = shl i32 %y, 4
  ret i32 %x
}
