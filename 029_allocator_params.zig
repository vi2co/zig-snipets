// 029: Passing allocators
// Learn: the idiomatic pattern of letting callers provide memory.
const std = @import("std");
fn makeList(allocator: std.mem.Allocator, n: usize) ![]u32 { // caller's allocator is a param
    const list = try allocator.alloc(u32, n); // the allocator does the actual allocation
    for (list) |*item| item.* = 0; // |*item| gives a pointer, so we can write each slot
    return list;
}
pub fn main() !void {
    var dbg = std.heap.DebugAllocator(.{}){};
    defer _ = dbg.deinit();
    const allocator = dbg.allocator();

    const nums = try makeList(allocator, 5); // hand the allocator in.
    defer allocator.free(nums); // the caller frees what it owns.
    std.debug.print("made {d} zeros\n", .{nums.len});
    std.debug.print("nums = {any}\n", .{nums});
}
