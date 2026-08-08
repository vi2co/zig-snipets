// 034: Custom error sets
// Learn: declaring named error sets with your own error names.
const std = @import("std");
const CalcError = error{ // declare an error set with two members
    Overflow,
    Underflow,
};
fn incrementChecked(n: u32, max: u32) CalcError!u32 { // returns our custom error set
    if (n >= max) return error.Overflow;
    return n + 1;
}
pub fn main() void {
    const r1 = incrementChecked(9, 10) catch 0;
    std.debug.print("r1 = {d}\n", .{r1}); // 9 < 10, so it succeeds -> 10
    const r2 = incrementChecked(10, 10) catch 0;
    std.debug.print("r2 = {d}\n", .{r2}); // 10 >= 10 -> Overflow -> 0
    const r3 = incrementChecked(0, 0) catch 0;
    std.debug.print("r3 = {d}\n", .{r3}); // 0 >= 0 -> Overflow -> 0
}
