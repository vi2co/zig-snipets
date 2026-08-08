// 010: for with strings and ranges
// Learn: iterating over string bytes, numeric ranges, and using continue.
const std = @import("std");
pub fn main() void {
    const name = "zig";
    for (name) |byte| { // a string is bytes, so iteration yields each byte
        std.debug.print("{c}", .{byte}); // {c} prints a single character
    }
    std.debug.print("\n", .{});
    for (0..5) |i| { // iterate a numeric range from 0 to 4
        std.debug.print("{d}", .{i});
    }
    std.debug.print("\n", .{});
    var total: usize = 0; // usize so it matches the loop variable type
    for (0..10) |i| {
        if (i % 2 == 0) continue; // skip even numbers
        total += i;
    }
    std.debug.print("sum of odds under 10 = {d}\n", .{total});
}
