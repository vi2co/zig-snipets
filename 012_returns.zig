// 012: Return values
// Learn: multiple return styles and early returns.
const std = @import("std");
fn max(a: i32, b: i32) i32 {
    if (a > b) return a; // early return: stop the function here if true.
    return b;
}
fn abs(n: i32) i32 {
    if (n < 0) return -n; // negation flips the sign.
    return n;
}
fn classify(n: i32) []const u8 {
    return if (n > 0) "positive" else "non-positive"; // an if-expression as the return value.
}
pub fn main() void {
    std.debug.print("max(3, 9) = {d}\n", .{max(3, 9)});
    std.debug.print("abs(-5) = {d}\n", .{abs(-5)});
    std.debug.print("classify(-1) = {s}\n", .{classify(-1)});
}
