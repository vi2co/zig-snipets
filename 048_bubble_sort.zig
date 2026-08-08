// 048: Practice — Bubble sort
// Learn: sorting an array in place by swapping elements.
const std = @import("std");
fn bubbleSort(list: []i32) void { // sorts in place, mutating the caller's data
    var i: usize = 0;
    while (i < list.len) : (i += 1) {
        var j: usize = 0;
        while (j < list.len - i - 1) : (j += 1) {
            if (list[j] > list[j + 1]) { // out of order?
                // swap the two elements using std.mem.swap.
                std.mem.swap(i32, &list[j], &list[j + 1]);
            }
        }
    }
}
pub fn main() void {
    var nums = [_]i32{ 64, 34, 25, 12, 22, 11, 90 };
    std.debug.print("before: {any}\n", .{nums});
    bubbleSort(&nums); // &array coerces to a slice parameter.
    std.debug.print("after:  {any}\n", .{nums});
}
