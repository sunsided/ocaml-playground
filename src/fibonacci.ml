(* Function to calculate the nth Fibonacci number *)
let rec fibonacci n = if n <= 1 then n else fibonacci (n - 1) + fibonacci (n - 2)

(* Function to print Fibonacci sequence up to the nth number *)
let rec print_fibonacci_sequence n =
  if n >= 0 then (
    print_int (fibonacci n);
    print_string " ";
    print_fibonacci_sequence (n - 1))
