// 018: Structs
// Learn: grouping related data into structs, with default values.
const std = @import("std");
const Point = struct { // define a struct type
    x: i32, // each field has a name and a type
    y: i32,
};
const Person = struct {
    name: []const u8,
    age: u32 = 30, // default value is used when the field is not provided
};
pub fn main() void {
    const p = Point{ .x = 3, .y = -2 }; // struct literal with named fields.
    const q = Point{ .y = 5, .x = 1 }; // field order does not matter.
    std.debug.print("p = ({d}, {d})\n", .{ p.x, p.y }); // access fields with .name.
    std.debug.print("q = ({d}, {d})\n", .{ q.x, q.y });
    const a = Person{ .name = "Alice" }; // age defaults to 30.
    const b = Person{ .name = "Bob", .age = 25 };
    std.debug.print("{s} is {d}\n", .{ a.name, a.age });
    std.debug.print("{s} is {d}\n", .{ b.name, b.age });
}
