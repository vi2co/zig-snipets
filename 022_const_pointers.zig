// 022: Const pointers
// Learn: *const T pointers cannot modify what they point to.
const std = @import("std");
fn readOnly(p: *const i32) void { // *const means "read only"
    // p.* = 5; // <-- uncommenting this would be a compile error.
    std.debug.print("value = {d}\n", .{p.*});
}
pub fn main() void {
    const x: i32 = 42; // a const value
    const p = &x; // taking the address of a const gives a *const i32.
    readOnly(p);
    var y: i32 = 1; // a var value
    const py = &y; // taking the address of a var gives a mutable *i32.
    py.* = 2; // allowed because y is mutable.
    std.debug.print("y = {d}\n", .{y});
}
