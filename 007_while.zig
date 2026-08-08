// 007: while loop
// Learn: the while loop, plus break and continue.
const std = @import("std");
pub fn main() void {
    var i: i32 = 10; // `var` (not const) so the value can be changed.
    while (i >= 0) { // loop while the condition is true
        std.debug.print("i = {d}\n", .{i});
        i -= 1; // increment i; Zig has no i++ operator.
    }
    var j: u32 = 0;
    while (j < 10) : (j += 1) { // a while with a "continue expression"
        if (j % 2 != 0) continue; // skip odd numbers
        std.debug.print("even {d}\n", .{j});
    }
    while (true) { // infinite loop; break is the only way out
        std.debug.print("breaking\n", .{});
        break; // break leaves the loop immediately
    }
}
