// 043: extern and packed structs
// Learn: struct layouts tuned for interop and compactness.
const std = @import("std");
const Point = extern struct { // extern layout matches the C ABI
    x: i32,
    y: i32,
};
const Packed = packed struct { // packed layout packs fields bit-by-bit
    a: u4, // 4 bits
    b: u12, // 12 bits
};
pub fn main() void {
    // Point is only used for size/align checks below.
    std.debug.print("Point size  = {d} bytes\n", .{@sizeOf(Point)});
    std.debug.print("Point align = {d}\n", .{@alignOf(Point)});
    const pk = Packed{ .a = 1, .b = 4095 }; // u12 max value is 4095
    std.debug.print("Packed size = {d} bytes (16 bits packed)\n", .{@sizeOf(Packed)});
    std.debug.print("pk.b = {d}\n", .{pk.b});
}
