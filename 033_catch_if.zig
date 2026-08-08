// 033: catch and if on error unions
// Learn: handling errors without try.
const std = @import("std");
fn positive(n: i32) !i32 {
    if (n < 0) return error.Negative; // an error value
    return n;
}
pub fn main() void {
    // catch with a default value: on error, the expression becomes 0.
    const a = positive(5) catch 0;
    const b = positive(-5) catch 0;
    std.debug.print("a = {d}, b = {d}\n", .{ a, b });
    // catch can bind the error and produce a computed value.
    const c = positive(-1) catch |err| blk: { // a labeled block gives us a value
        std.debug.print("got error {}\n", .{err});
        break :blk 999;
    };
    std.debug.print("c = {d}\n", .{c});
    // or use if to branch on success / failure.
    if (positive(7)) |value| { // success: value is unwrapped
        std.debug.print("ok: {d}\n", .{value});
    } else |err| { // failure: err holds the error
        std.debug.print("err: {}\n", .{err});
    }
}
