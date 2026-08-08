// 015: Passing slices to functions
// Learn: functions that accept slices (pointer + length).
const std = @import("std");
fn sum(numbers: []const u32) u32 { // a slice parameter
    var total: u32 = 0;
    for (numbers) |n| {
        total += n;
    }
    return total;
}
fn printAll(items: []const []const u8) void { // a slice of strings
    for (items) |it| {
        std.debug.print("- {s}\n", .{it});
    }
}
pub fn main() void {
    const nums = [_]u32{ 1, 2, 3, 4 };
    std.debug.print("sum = {d}\n", .{sum(nums[0..])}); // [0..] turns an array into a slice.
    const fruits = [_][]const u8{ "apple", "banana", "cherry" };
    printAll(fruits[0..]); // slice the array to pass it.
}
