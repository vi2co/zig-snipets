// 024: Optional pointers
// Learn: ?*T pointers that may be null.
const std = @import("std");
fn maybeDouble(n: ?*i32) void { // the parameter is a pointer OR null
    if (n) |p| { // unwrap the optional pointer
        p.* *= 2;
    } else {
        std.debug.print("nothing to double\n", .{});
    }
}
pub fn main() void {
    var num: i32 = 21;
    maybeDouble(&num);
    std.debug.print("num = {d}\n", .{num}); // doubled to 42.
    maybeDouble(null); // passing null is perfectly fine here.
    var other: i32 = 5;
    const maybe: ?*i32 = &other; // store a pointer inside an optional.
    maybe.?.* = 100; // unwrap with .?, then dereference with .*.
    std.debug.print("other = {d}\n", .{other});
}
