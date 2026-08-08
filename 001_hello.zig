// 001: Hello, World!
// Learn: importing the standard library, defining main, and printing text.
const std = @import("std"); // Brings the Zig standard library into scope.
pub fn main() void { // Every executable needs a public function named `main`.
    std.debug.print("Hello, Zig!\n", .{}); // Print text; .{} is an empty arguments tuple.
}
