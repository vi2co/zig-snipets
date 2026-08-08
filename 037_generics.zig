// 037: Generic functions
// Learn: functions that work with any type using comptime types.
const std = @import("std");
fn describe(comptime T: type) void { // T is a type, known at compile time
    std.debug.print("T = {s}, size = {d} bytes\n", .{ @typeName(T), @sizeOf(T) });
}
fn makeZero(comptime T: type) T { // returns a value of type T
    return std.mem.zeroes(T); // the zero value of any type (0, false, "", ...)
}
pub fn main() void {
    describe(u8); // pass the type itself as an argument
    describe(i64);
    describe(bool);
    const n = makeZero(u32); // u32 zero is 0
    const b = makeZero(bool); // bool zero is false
    std.debug.print("n = {d}\n", .{n});
    std.debug.print("b = {}\n", .{b});
}
