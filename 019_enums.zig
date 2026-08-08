// 019: Enums
// Learn: named values and exhaustive switch over enums.
const std = @import("std");
const Color = enum { red, green, blue }; // a set of named constants
const Direction = enum { north, south, east, west };
pub fn main() void {
    const c = Color.green;
    std.debug.print("color = {any}\n", .{c}); // prints "Color.green".
    switch (c) { // switch must cover every enum value (or use else)
        Color.red => std.debug.print("stop\n", .{}),
        Color.green => std.debug.print("go\n", .{}),
        Color.blue => std.debug.print("water\n", .{}),
    }
    const d = Direction.east;
    if (d == Direction.east) std.debug.print("heading east\n", .{}); // enums compare with ==
}
