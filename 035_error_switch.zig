// 035: Switching on errors
// Learn: handling each error case individually with switch.
const std = @import("std");
const MyErr = error{ NotFound, TooBig, TooSmall };
fn validate(n: i32) MyErr!void { // returns an error, or nothing on success
    if (n > 100) return error.TooBig;
    if (n < 0) return error.TooSmall;
    return; // all good
}
pub fn main() void {
    const values = [_]i32{ 50, 200, -5 };
    for (values) |v| {
        validate(v) catch |err| switch (err) { // switch over the error value
            error.TooBig => std.debug.print("{d}: too big\n", .{v}),
            error.TooSmall => std.debug.print("{d}: too small\n", .{v}),
            error.NotFound => std.debug.print("{d}: not found\n", .{v}),
        };
    }
}
