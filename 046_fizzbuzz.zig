// 046: Practice — FizzBuzz
// Learn: a classic problem combining for, if, and the % operator.
const std = @import("std");
pub fn main() void {
    for (1..21) |n| { // numbers 1 to 20
        if (n % 15 == 0) { // divisible by both 3 and 5
            std.debug.print("FizzBuzz\n", .{});
        } else if (n % 3 == 0) { // divisible by 3 only
            std.debug.print("Fizz\n", .{});
        } else if (n % 5 == 0) { // divisible by 5 only
            std.debug.print("Buzz\n", .{});
        } else {
            std.debug.print("{d}\n", .{n});
        }
    }
}
