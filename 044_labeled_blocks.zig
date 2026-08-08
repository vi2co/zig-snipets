// 044: Labeled blocks and labeled loops
// Learn: naming code blocks and breaking out of nested loops.
const std = @import("std");
pub fn main() void {
    // a labeled block produces a value via break :label.
    var answer: usize = undefined; // var, because it is computed at runtime
    answer = blk: {
        var sum: usize = 0;
        for (0..10) |i| sum += i; // 0 + 1 + ... + 9
        break :blk sum; // this is the block's value
    };
    std.debug.print("sum 0..9 = {d}\n", .{answer});
    // labeled loops let you break out of an outer loop.
    outer: for (0..10) |x| { // label the outer loop `outer`
        for (0..10) |y| {
            if (x * y == 21) { // 3 * 7 == 21
                std.debug.print("found {d} x {d} = 21\n", .{ x, y });
                break :outer; // exits the OUTER loop, not just the inner one
            }
        }
    }
}
