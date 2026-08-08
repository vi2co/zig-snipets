// 026: Memory allocators
// Learn: allocating and freeing memory with an allocator.
const std = @import("std");
pub fn main() !void { // `!void` lets us use try (see 031 for errors).
    var dbg = std.heap.DebugAllocator(.{}){}; // an allocator with built-in leak detection
    defer _ = dbg.deinit(); // run at function end; reports leaks if any.
    const allocator = dbg.allocator(); // grab the allocator interface.

    const nums = try allocator.alloc(u32, 3); // request 3 u32 slots.
    defer allocator.free(nums); // free them when this scope ends.
    nums[0] = 10; // slices returned by alloc are mutable.
    nums[1] = 20;
    nums[2] = 30;
    var total: u32 = 0;
    for (nums) |n| total += n;
    std.debug.print("total = {d}\n", .{total});
    // defer ensures free() runs even if the function exits early.
}
