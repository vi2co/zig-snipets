// 014: Parameters and const
// Learn: parameters are immutable copies; const variables cannot be reassigned.
const std = @import("std");
fn scale(x: i32, factor: i32) i32 {
    // x and factor are copies; changing them inside here would not affect the caller.
    return x * factor;
}
fn sayHello(name: []const u8) void {
    std.debug.print("Hello, {s}!\n", .{name});
}
pub fn main() void {
    std.debug.print("2 x 10 = {d}\n", .{scale(2, 10)});
    sayHello("Zig");
    const z: i32 = 7; // a const value can never be reassigned.
    // z = 8; // <-- uncommenting this line would be a compile error.
    std.debug.print("z = {d}\n", .{z});
}
