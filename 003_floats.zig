// 003: Floats
// Learn: floating point types, arithmetic, and formatting decimals.
const std = @import("std");
pub fn main() void {
    const x: f64 = 3.5; // f64 is a 64-bit double-precision float.
    const y: f32 = 2.0; // f32 is a 32-bit single-precision float.
    const sum = x + @as(f64, y); // @as converts y from f32 to f64 before adding.
    std.debug.print("sum = {d}\n", .{sum}); // {d} prints a decimal number.
    std.debug.print("pi = {d:.2}\n", .{3.14159}); // {d:.2} rounds to 2 decimals.
}
