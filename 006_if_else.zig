// 006: if / else
// Learn: basic branching with if and else in Zig.
const std = @import("std");
pub fn main() void {
    const age: u32 = 17;
    if (age >= 18) { // if the condition is true, run this block
        std.debug.print("adult\n", .{});
    } else { // otherwise run this block
        std.debug.print("minor\n", .{});
    }
    const parity = if (age % 2 == 0) "even" else "odd"; // if used as an expression
    std.debug.print("age is {s}\n", .{parity});
}
