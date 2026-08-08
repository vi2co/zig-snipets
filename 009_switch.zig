// 009: switch
// Learn: exhaustive pattern matching with switch.
const std = @import("std");
pub fn main() void {
    const day: u8 = 3;
    switch (day) { // switch on an integer value
        1 => std.debug.print("Monday\n", .{}), // each case is value => action
        2 => std.debug.print("Tuesday\n", .{}),
        3 => std.debug.print("Wednesday\n", .{}),
        else => std.debug.print("another day\n", .{}), // else catches every other value
    }
    const grade: u8 = 85;
    const passed = switch (grade) { // switch can be an expression that returns a value
        0...49 => false, // ... is an inclusive range
        50...100 => true,
        else => unreachable, // marks a case that must never happen
    };
    std.debug.print("passed = {}\n", .{passed}); // {} prints booleans
}
