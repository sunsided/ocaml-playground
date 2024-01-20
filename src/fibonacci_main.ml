(* Main function *)
let () =
  print_endline "Enter the number up to which Fibonacci sequence is needed:";
  let number = read_int () in
  Fibonacci.print_fibonacci_sequence number;
  print_newline ()
