// 013: Recursion
// Learn: a function that calls itself (factorial and countdown).
const std = @import("std");
fn factorial(n: u64) u64 {
    if (n <= 1) return 1; // base case: stops the recursion.
    return n * factorial(n - 1); // recursive call with a smaller input.
}
fn countdown(n: u32) void {
    if (n == 0) return; // base case: return without printing anything.
    std.debug.print("{d} ", .{n});
    countdown(n - 1); // call ourselves with n reduced by 1.
}
pub fn main() void {
    std.debug.print("5! = {d}\n", .{factorial(5)});
    countdown(5);
    std.debug.print("liftoff!\n", .{});
}
