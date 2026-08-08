// 025: Many-item pointers
// Learn: [*]T pointers to a sequence of items (no attached length).
const std = @import("std");
fn sumMany(items: [*]const u32, len: usize) u32 { // pointer + explicit length
    var total: u32 = 0;
    var i: usize = 0;
    while (i < len) : (i += 1) { // while loop with a continue expression
        total += items[i]; // index into the many-item pointer
    }
    return total;
}
pub fn main() void {
    const arr = [_]u32{ 1, 2, 3, 4 };
    const ptr: [*]const u32 = &arr; // &array coerces to a many-item pointer.
    std.debug.print("sum = {d}\n", .{sumMany(ptr, arr.len)});
    // A slice carries both a pointer and a length; a [*]T pointer does not.
    const sl: []const u32 = arr[0..];
    std.debug.print("slice len = {d}\n", .{sl.len});
}
