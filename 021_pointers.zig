// 021: Pointers
// Learn: taking an address with & and dereferencing with .*.
const std = @import("std");
fn bump(n: *i32) void { // *i32 is a pointer to a single i32.
    n.* += 1; // .* dereferences: reads and writes the pointed-at value.
}
pub fn main() void {
    var value: i32 = 10;
    bump(&value); // &value is the address of `value`.
    std.debug.print("value = {d}\n", .{value}); // value is now 11.
    const ptr = &value; // ptr has type *i32.
    ptr.* = 99; // assign through the pointer.
    std.debug.print("value = {d}\n", .{value});
}
