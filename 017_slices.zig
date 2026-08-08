// 017: Slices
// Learn: slices are views (pointer + length) over arrays.
const std = @import("std");
pub fn main() void {
    const arr = [_]u32{ 10, 20, 30, 40 };
    const full = arr[0..]; // a slice of the whole array.
    const part = arr[1..3]; // elements at index 1 and 2 only (end is exclusive).
    std.debug.print("full len = {d}\n", .{full.len});
    std.debug.print("part = {any}\n", .{part});
    const first_three = arr[0..3]; // half-open range: 0, 1, 2.
    std.debug.print("first_three = {any}\n", .{first_three});
    // Slices know their length; raw pointers do not.
    std.debug.print("part len = {d}, arr len = {d}\n", .{ part.len, arr.len });
}
