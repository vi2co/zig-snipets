// 027: ArrayList
// Learn: a dynamically growing array from the standard library.
const std = @import("std");
pub fn main() !void {
    var dbg = std.heap.DebugAllocator(.{}){};
    defer _ = dbg.deinit();
    const allocator = dbg.allocator();

    var list = std.ArrayList(u32).empty; // a growable list of u32 (unmanaged)
    defer list.deinit(allocator); // frees all memory the list holds
    try list.append(allocator, 1); // add items; the allocator is passed per call
    try list.append(allocator, 2);
    try list.append(allocator, 3);
    try list.append(allocator, 4);
    std.debug.print("len = {d}\n", .{list.items.len}); // .items is the backing slice
    for (list.items) |n| { // iterate the stored elements
        std.debug.print("{d} ", .{n});
    }
    std.debug.print("\n", .{});
    try list.insert(allocator, 0, 0); // insert 0 at the front
    std.debug.print("first = {d}\n", .{list.items[0]});
}
