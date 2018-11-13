define i64 @foo(i64 %0) {
  %x = shl i64 %0, 8
  %y = lshr i64 %x, 16
  %z = shl i64 %y, 8
  ret i64 %z
}
