// 041: Tagged unions
// Learn: a value that holds exactly one of several kinds of data.
const std = @import("std");
const Value = union(enum) { // a tagged union: enum tag + optional payload
    int: i32,
    text: []const u8,
    none, // a tag with no payload
};
pub fn main() void {
    const a = Value{ .int = 42 }; // a Value holding an int
    const b = Value{ .text = "hello" }; // a Value holding a string
    const c = Value.none; // a Value with no payload
    for ([_]Value{ a, b, c }) |v| {
        switch (v) { // switch on the tag to access the payload safely
            .int => |n| std.debug.print("int {d}\n", .{n}),
            .text => |s| std.debug.print("text {s}\n", .{s}),
            .none => std.debug.print("nothing\n", .{}),
        }
    }
}
