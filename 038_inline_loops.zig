// 038: inline for and while
// Learn: unrolling loops at compile time.
const std = @import("std");
pub fn main() void {
    const things = [_][]const u8{ "a", "bb", "ccc" };
    // inline for unrolls: every iteration is compiled as separate code.
    inline for (things) |t| {
        // because each iteration is separate, comptime features work inside.
        const T = @TypeOf(t); // the type of t is known per-iteration.
        std.debug.print("{s} has type {s}\n", .{ t, @typeName(T) });
    }
    comptime var i = 0; // a comptime variable (can change, but only at compile time)
    inline while (i < 3) : (i += 1) { // an unrolled while loop
        std.debug.print("i = {d}\n", .{i});
    }
}
