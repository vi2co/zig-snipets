// 031: Errors and try
// Learn: !T functions that may fail, and catch to handle the failure.
const std = @import("std");
fn divide(a: i32, b: i32) !i32 { // !i32 means "returns an i32, or an error"
    if (b == 0) return error.DivisionByZero; // return an error value
    return @divTrunc(a, b); // truncated integer division
}
pub fn main() void {
    // catch runs when the call fails, letting us handle it here.
    const q = divide(10, 2) catch |err| { // |err| binds the error value
        std.debug.print("failed: {}\n", .{err}); // {} prints any error value
        return;
    };
    std.debug.print("10 / 2 = {d}\n", .{q});
    _ = divide(10, 0) catch { // _ = discards the (unused) successful value
        std.debug.print("cannot divide by zero\n", .{});
    };
}
