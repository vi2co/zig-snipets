// 011: Functions
// Learn: defining a function with parameters and a return type.
const std = @import("std");
fn add(a: i32, b: i32) i32 { // name(param: type, ...) return_type
    return a + b; // `return` sends a value back to the caller.
}
fn greet() void { // void means "this function returns nothing"
    std.debug.print("hi\n", .{});
}
pub fn main() void {
    const result = add(3, 4); // call add and store the returned value.
    std.debug.print("3 + 4 = {d}\n", .{result});
    greet();
}
