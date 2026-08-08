// 020: Tuples
// Learn: anonymous structs (tuples) for grouping values.
const std = @import("std");
pub fn main() void {
    const t = .{ 1, "two", 3.0 }; // a tuple mixing different types.
    std.debug.print("t[0] = {d}\n", .{t[0]}); // index it like an array.
    std.debug.print("t[1] = {s}\n", .{t[1]});
    std.debug.print("len = {d}\n", .{t.len});
    const named = .{ .x = 1, .y = 2 }; // tuples with named fields act like mini structs.
    std.debug.print("named.x + named.y = {d}\n", .{named.x + named.y});
    const pair = blk: { // a labeled block produces a value via break :label
        break :blk .{ 7, 8 }; // a tuple of two integers
    };
    std.debug.print("pair = {any}\n", .{pair});
}
