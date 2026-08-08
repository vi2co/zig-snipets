// 036: comptime
// Learn: values that are known and evaluated at compile time.
const std = @import("std");
fn double(x: comptime_int) comptime_int { // comptime types are compile-time only
    return x * 2;
}
pub fn main() void {
    const x = comptime 2 + 2; // `comptime` forces compile-time evaluation.
    std.debug.print("2 + 2 = {d}\n", .{x});
    const y = 5 * 5; // integer constants are also evaluated at compile time.
    std.debug.print("5 * 5 = {d}\n", .{y});
    const z = double(21); // this call runs during compilation.
    std.debug.print("double(21) = {d}\n", .{z});
    comptime { // run a block of code while compiling
        std.debug.assert(2 * 3 == 6); // assert evaluated at compile time
    }
    std.debug.print("comptime assert passed\n", .{});
}
