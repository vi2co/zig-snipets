// 042: defer and errdefer
// Learn: guaranteed cleanup, even when errors occur.
const std = @import("std");
fn openAndRead(allocator: std.mem.Allocator, io: *std.Io.Threaded, path: []const u8) ![]u8 {
    const data = try std.Io.Dir.cwd().readFileAlloc(io.io(), path, allocator, .unlimited);
    errdefer allocator.free(data); // frees data ONLY if an error is returned later
    if (data.len == 0) return error.EmptyFile; // simulate a possible failure
    return data; // on success the errdefer does NOT run
}
pub fn main() !void {
    var dbg = std.heap.DebugAllocator(.{}){};
    defer _ = dbg.deinit(); // defer always runs when main returns, success or error
    const allocator = dbg.allocator();
    var io = std.Io.Threaded.init(allocator, .{}); // an I/O instance for file access
    defer io.deinit();

    const d = openAndRead(allocator, &io, "data.txt") catch {
        std.debug.print("could not read data.txt\n", .{});
        return;
    };
    defer allocator.free(d); // free the buffer when main ends
    std.debug.print("read {d} bytes: {s}\n", .{ d.len, d });
}
