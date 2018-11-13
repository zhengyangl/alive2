define i32 @foo(i32 %0) {
  %y = shl i32 %0, 17
  %x = xor i32 %y, 717371
  ret i32 %x
}
