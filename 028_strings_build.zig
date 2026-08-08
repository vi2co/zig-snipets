// 028: Building strings
// Learn: concatenating text using an ArrayList of bytes.
const std = @import("std");
pub fn main() !void {
    var dbg = std.heap.DebugAllocator(.{}){};
    defer _ = dbg.deinit();
    const allocator = dbg.allocator();

    var buf = std.ArrayList(u8).empty; // a list of single bytes (unmanaged)
    defer buf.deinit(allocator);
    try buf.appendSlice(allocator, "Hello, "); // append an entire string
    try buf.appendSlice(allocator, "Zig");
    try buf.append(allocator, '!'); // append a single byte
    try buf.appendSlice(allocator, "\n");
    const text = try buf.toOwnedSlice(allocator); // take ownership of the final buffer
    defer allocator.free(text); // text is now a plain []u8 we must free
    std.debug.print("{s}", .{text});
    std.debug.print("len = {d}\n", .{text.len});
}
