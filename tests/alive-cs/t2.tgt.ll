define i64 @foo(i64 %0, i64 %reserved_const1) {
  %z = and i64 %0, %reserved_const1
  ret i64 %z
}
