// 047: Practice — Fibonacci
// Learn: computing Fibonacci numbers recursively and iteratively.
const std = @import("std");
fn fib(n: usize) u64 { // returns the nth Fibonacci number
    if (n == 0) return 0; // base cases stop the recursion
    if (n == 1) return 1;
    return fib(n - 1) + fib(n - 2); // recursive definition
}
fn fibIter(n: usize) u64 { // iterative version (fast, no recursion)
    var a: u64 = 0;
    var b: u64 = 1;
    for (0..n) |_| { // loop n times; |_| ignores the index
        const t = a + b;
        a = b;
        b = t;
    }
    return a;
}
pub fn main() void {
    for (0..11) |i| { // print fib(0) through fib(10)
        std.debug.print("fib({d}) = {d}\n", .{ i, fib(i) });
    }
    std.debug.print("iterative fib(50) = {d}\n", .{fibIter(50)});
}
