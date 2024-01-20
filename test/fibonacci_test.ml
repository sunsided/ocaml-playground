open OUnit2
open Fibonacci

let test_fibonacci _ =
  assert_equal 0 (fibonacci 0);
  assert_equal 1 (fibonacci 1);
  assert_equal 1 (fibonacci 2);
  assert_equal 2 (fibonacci 3);
  assert_equal 3 (fibonacci 4);
  assert_equal 5 (fibonacci 5);
  assert_equal 8 (fibonacci 6)

let suite = "TestFibonacci" >::: [ "fibonacci" >:: test_fibonacci ]
let () = run_test_tt_main suite
