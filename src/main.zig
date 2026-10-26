const std = @import("std");
const engine = @import("engine");

pub fn main() !void {
    std.debug.print("add(1, 2) = {d}\n", .{engine.add(1, 2)});
}
