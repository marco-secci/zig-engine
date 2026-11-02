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

        rl.setTargetFPS(60);

        // Using while loop (not for as per the tutorial, which uses Odin) to keep the window open:
        while (!rl.windowShouldClose()) {
                rl.beginDrawing();
                rl.clearBackground(rl.Color.pink);
                rl.endDrawing();
        }
}
