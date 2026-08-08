// 040: Work at compile time
// Learn: computing real values before the program even starts.
const std = @import("std");
fn factorial(n: comptime_int) comptime_int {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}
// compute a value at comptime and store it as a top-level const.
const FACT_10 = factorial(10); // top-level consts are comptime, so this runs at compile time
// build an array at comptime using a labeled block.
const table = blk: {
    var t: [5]u32 = undefined; // a comptime-local variable
    for (0..5) |i| t[i] = @intCast(i * i); // squares: 0, 1, 4, 9, 16
    break :blk t; // the block's value becomes `table`
};
pub fn main() void {
    std.debug.print("10! = {d}\n", .{FACT_10}); // already computed at compile time
    for (table) |v| {
        std.debug.print("{d} ", .{v});
    }
    std.debug.print("\n", .{});
}
