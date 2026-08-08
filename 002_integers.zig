// 002: Integers
// Learn: the common integer types and their ranges in Zig.
const std = @import("std");
pub fn main() void {
    const a: u8 = 255; // u8 is an 8-bit UNSIGNED integer (0 to 255).
    const b: i8 = -128; // i8 is an 8-bit SIGNED integer (-128 to 127).
    const c: usize = 42; // usize is a pointer-sized unsigned int, often used for lengths.
    const d: u32 = 4_000_000; // Underscores are allowed to make large numbers readable.
    std.debug.print("a={d} b={d} c={d} d={d}\n", .{ a, b, c, d });
}
