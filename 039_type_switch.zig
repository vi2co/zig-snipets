// 039: Type switches and anytype
// Learn: branching on types at compile time, and the anytype parameter.
const std = @import("std");
fn typeName(comptime T: type) []const u8 {
    return switch (T) { // switch on a type
        u8, u16, u32, u64 => "unsigned int",
        i8, i16, i32, i64 => "signed int",
        f32, f64 => "float",
        bool => "boolean",
        else => "other",
    };
}
fn addGeneric(a: anytype, b: @TypeOf(a)) @TypeOf(a) { // anytype infers the type
    return a + b;
}
pub fn main() void {
    std.debug.print("u32 is an {s}\n", .{typeName(u32)});
    std.debug.print("f64 is a {s}\n", .{typeName(f64)});
    const s1 = addGeneric(3, 4); // works with integers
    const s2 = addGeneric(1.5, 2.5); // works with floats
    std.debug.print("3 + 4 = {d}\n", .{s1});
    std.debug.print("1.5 + 2.5 = {d}\n", .{s2});
}
