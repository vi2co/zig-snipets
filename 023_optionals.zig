// 023: Optionals
// Learn: ?T means "a T, or null" (handles "no value" safely).
const std = @import("std");
fn find(list: []const u32, target: u32) ?usize { // returns an optional index
    for (list, 0..) |n, i| {
        if (n == target) return i;
    }
    return null; // null represents "not found".
}
pub fn main() void {
    const nums = [_]u32{ 4, 8, 15, 16 };
    const idx = find(nums[0..], 15);
    if (idx) |i| { // if-optional unwraps the value into |i|.
        std.debug.print("found at {d}\n", .{i});
    } else { // this branch runs when idx is null.
        std.debug.print("not found\n", .{});
    }
    const missing = find(nums[0..], 99);
    std.debug.print("missing = {?d}\n", .{missing}); // {?d} prints null safely.
    const forced = find(nums[0..], 16).?; // .? unwraps, or panics if the value is null.
    std.debug.print("forced = {d}\n", .{forced});
}
