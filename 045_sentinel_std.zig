// 045: Sentinel types and the std library
// Learn: null-terminated strings and a quick std.mem usage.
const std = @import("std");
pub fn main() void {
    // [:0]const u8 = a slice guaranteed to end with a null byte (C-friendly).
    const zstr: [:0]const u8 = "null-terminated";
    std.debug.print("{s}\n", .{zstr});
    // Normal Zig strings are NOT null-terminated; zstr explicitly is.
    std.debug.print("length = {d}\n", .{zstr.len});
    // A sentinel-terminated array: the last element is guaranteed to be 0.
    const nums = [_]u8{ 1, 2, 3, 0 }; // 0 is the sentinel
    std.debug.print("nums len = {d}\n", .{nums.len});
    // std library: sort words alphabetically with std.mem.sort.
    var words = [_][]const u8{ "pear", "apple", "fig" };
    const lessThan = struct { // an anonymous struct acts as a comparator
        fn cmp(_: void, a: []const u8, b: []const u8) bool {
            return std.mem.lessThan(u8, a, b); // byte-wise comparison
        }
    }.cmp;
    std.mem.sort([]const u8, &words, {}, lessThan);
    for (words) |w| std.debug.print("{s} ", .{w});
    std.debug.print("\n", .{});
}
