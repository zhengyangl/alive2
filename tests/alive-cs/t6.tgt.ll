; TODO: expected poison, returnning undef
define i32 @foo(i32 %0, i32 %reserved_const1) {
  ret i32 %reserved_const1
}
