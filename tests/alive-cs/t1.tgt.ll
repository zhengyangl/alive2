define i32 @foo(i32 %0, i32 %1, i32 %reserved_const1) {
  %y = shl i32 %0, %1
  %x = mul i32 %y, %reserved_const1
  ret i32 %x
}
