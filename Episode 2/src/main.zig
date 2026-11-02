const std = @import("std");
const engine = @import("engine");
const rl = @import("raylib-zig");

// Public variables:
pub var WINDOW_WIDTH: i32 = 1280;
pub var WINDOW_HEIGHT: i32 = 640;

pub fn main() !void {
        rl.initWindow(WINDOW_WIDTH, WINDOW_HEIGHT, "window");
        // Deferring the closeWindow instruction to when this function is closed/terminated:
        defer rl.closeWindow();

        // Setting a movable rectangle's characteristics:
        var pos: rl.Vector2 = .{ .x = 100, .y = 100 };
        var vel: rl.Vector2 = .{.x = 100, .y = 0};
        const dim: rl.Vector2 = .{ .x = 80, .y = 50};
        // N.B.: The "." before the "{" means "fill in the type from context", it's used a lot especially when the
        // parameter type is already known; an equivalent for pos is `var pos = rl.Vector2{ .x = 100, .y = 100 };`
        // The "." before x and y marks a field name (pos.x, pos.y).

        // Fixing FPS target:
        rl.setTargetFPS(60);

        // Using while loop (not for as per the tutorial, which uses Odin) to keep the window open:
        while (!rl.windowShouldClose()) {
                rl.beginDrawing();
                rl.clearBackground(.black);
                const dt: f32 = rl.getFrameTime();
                // In Zig, you can update vector fields in two ways:

                // Option A: update each field manually:
                // pos.x += vel.x * dt;
                // pos.y += vel.y * dt;

                // Option B: use raylib-zig's Vector2 methods:
                pos = pos.add(vel.scale(dt));

                rl.drawRectangleV(pos, dim, .blue);
                rl.endDrawing();
        }
}