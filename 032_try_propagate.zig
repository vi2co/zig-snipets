// 032: Propagating errors with try
// Learn: functions that call other fallible functions.
const std = @import("std");
fn readAll(allocator: std.mem.Allocator, io: *std.Io.Threaded, path: []const u8) ![]const u8 {
    // Read a whole file, or stop here and return the error upward.
    return std.Io.Dir.cwd().readFileAlloc(io.io(), path, allocator, .unlimited);
    // ^ `try`: on error, return it from readAll immediately.
}
pub fn main() !void {
    var dbg = std.heap.DebugAllocator(.{}){};
    defer _ = dbg.deinit();
    const allocator = dbg.allocator();
    var io = std.Io.Threaded.init(allocator, .{}); // an I/O instance for file access
    defer io.deinit();
    // try here propagates errors out of main; the program prints the error and exits.
    const content = try readAll(allocator, &io, "notes.txt");
    defer allocator.free(content); // always free the ORIGINAL allocation
    const nl = std.mem.indexOfScalar(u8, content, '\n'); // find the first newline
    const line = if (nl) |pos| content[0..pos] else content; // slice off the first line
    std.debug.print("first line: {s}\n", .{line});
}
