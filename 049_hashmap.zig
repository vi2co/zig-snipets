// 049: Practice — Hash map
// Learn: counting word frequencies with std.StringHashMap.
const std = @import("std");
pub fn main() !void {
    var dbg = std.heap.DebugAllocator(.{}){};
    defer _ = dbg.deinit();
    const allocator = dbg.allocator();

    var counts = std.StringHashMap(u32).init(allocator); // key: string -> value: count
    defer counts.deinit();
    const words = [_][]const u8{ "the", "cat", "and", "the", "hat" };
    for (words) |w| {
        const gop = try counts.getOrPut(w); // fetch the entry, creating it if missing
        if (!gop.found_existing) gop.value_ptr.* = 0; // a new word starts at 0
        gop.value_ptr.* += 1; // increment the count
    }
    var it = counts.iterator(); // walk over every entry
    while (it.next()) |entry| { // entry gives us key_ptr and value_ptr
        std.debug.print("{s}: {d}\n", .{ entry.key_ptr.*, entry.value_ptr.* });
    }
}
