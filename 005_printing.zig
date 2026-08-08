// 005: Printing and formatting
// Learn: the common {fmt} specifiers used with std.debug.print.
const std = @import("std");
pub fn main() void {
    const n: u32 = 255;
    std.debug.print("decimal:  {d}\n", .{n}); // {d} prints decimal
    std.debug.print("hex:      {x}\n", .{n}); // {x} prints lowercase hex
    std.debug.print("binary:   {b}\n", .{n}); // {b} prints binary
    std.debug.print("unicode:  {u}\n", .{65}); // {u} prints the character for codepoint 65 ('A')
    std.debug.print("zero-pad: {d:0>5}\n", .{42}); // pad left with zeros to width 5
    std.debug.print("align:    {d:>5}\n", .{42}); // right-justify to width 5
    std.debug.print("mixed:    {d} + {s}\n", .{ 42, "answer" }); // specifiers can be mixed
}
