// 004: Strings
// Learn: strings are just slices of bytes; how to print and escape them.
const std = @import("std");
pub fn main() void {
    const greeting: []const u8 = "hello"; // A string literal is a slice of bytes.
    const msg = "It's \"quoted\""; // Use \" to embed a double quote in a string.
    std.debug.print("{s} {s}\n", .{ greeting, "world" }); // {s} prints a string slice.
    std.debug.print("{s}\n", .{msg});
    std.debug.print("len = {d}\n", .{greeting.len}); // .len gives the byte count.
}
