const rl = @import("raylib-zig");

pub fn main() !void {
        rl.initWindow(320, 189, "window");
        // Deferring the closeWindow instruction to when this function is closed/terminated:
        defer rl.closeWindow();

        // Using while loop (not for as per the tutorial, which uses Odin) to keep the window open:
        while (!rl.windowShouldClose()) {
                rl.beginDrawing();
                rl.clearBackground(rl.Color.pink);
                rl.endDrawing();
        }
}