// 030: Formatting into a string
// Learn: building formatted text with std.fmt.allocPrint.
const std = @import("std");
pub fn main() !void {
    var dbg = std.heap.DebugAllocator(.{}){};
    defer _ = dbg.deinit();
    const allocator = dbg.allocator();

    const name = "Zig";
    const version: u32 = 16;
    const msg = try std.fmt.allocPrint(allocator, "{s} version {d}", .{ name, version });
    defer allocator.free(msg); // allocPrint allocates, so we must free the result.
    std.debug.print("{s}\n", .{msg});
}
