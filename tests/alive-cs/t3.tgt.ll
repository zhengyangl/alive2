define i234 @foo(i234 %0, i234 %reserved_const1) {
  %x = ashr i234 %0, %reserved_const1
  %y = xor i234 %0, %x
  ret i234 %y
}
