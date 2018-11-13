define i32 @foo(i32 %0, i32 %reserved_const1, i32 %reserved_const2) {
  %y = shl i32 %0, %reserved_const1
  %x = xor i32 %y, %reserved_const2
  ret i32 %x
}
