// 050: Practice — Reading and writing files
// Learn: std.Io.Dir for creating, writing, and reading files.
const std = @import("std");
pub fn main() !void {
    var dbg = std.heap.DebugAllocator(.{}){};
    defer _ = dbg.deinit();
    const allocator = dbg.allocator();
    var io = std.Io.Threaded.init(allocator, .{}); // an I/O instance for file access
    defer io.deinit();
    const cwd = std.Io.Dir.cwd(); // the current working directory

    // 1. Write a file.
    const path = "out.txt";
    try cwd.writeFile(io.io(), .{ .sub_path = path, .data = "Hello from Zig!\nSecond line.\n" });

    // 2. Read it back.
    const content = try cwd.readFileAlloc(io.io(), path, allocator, .unlimited);
    defer allocator.free(content);
    std.debug.print("read {d} bytes:\n{s}", .{ content.len, content });

    // 3. Iterate over its lines.
    var lines = std.mem.splitScalar(u8, content, '\n'); // split on newlines
    while (lines.next()) |line| {
        std.debug.print("[line] {s}\n", .{line});
    }

    // 4. Clean up the file we created.
    try cwd.deleteFile(io.io(), path);
    std.debug.print("deleted {s}\n", .{path});
}
