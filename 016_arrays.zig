// 016: Arrays
// Learn: fixed-size arrays, indexing, and iteration.
const std = @import("std");
pub fn main() void {
    const arr = [_]u32{ 5, 10, 15 }; // [_] infers length = 3.
    const typed: [3]u32 = .{ 1, 2, 3 }; // explicit element type and length.
    std.debug.print("arr[1] = {d}\n", .{arr[1]}); // indices start at 0.
    std.debug.print("len = {d}\n", .{arr.len}); // .len is known at compile time.
    std.debug.print("typed[2] = {d}\n", .{typed[2]});
    var squares: [5]u32 = undefined; // declare without initializing yet.
    for (0..5) |i| {
        squares[i] = @intCast((i + 1) * (i + 1)); // @intCast converts usize to u32
    }
    std.debug.print("squares = {any}\n", .{squares}); // {any} prints any value.
    for (squares) |s| { // iterate to print each element.
        std.debug.print("{d} ", .{s});
    }
    std.debug.print("\n", .{});
}
