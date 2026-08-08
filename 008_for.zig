// 008: for loop
// Learn: iterating over arrays and slices with for.
const std = @import("std");
pub fn main() void {
    const nums = [_]u32{ 10, 20, 30 }; // [_] infers the length from the literal.
    for (nums) |n| { // each element is bound to |n|
        std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
    for (nums, 0..) |n, idx| { // adding 0.. gives the index alongside the value
        std.debug.print("[{d}]={d} ", .{ idx, n });
    }
    std.debug.print("\n", .{});
}
