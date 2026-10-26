const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const raylib_dep = b.dependency("raylib_zig", .{
        .target = target,
        .optimize = optimize,
        .linux_display_backend = .X11,
    });
    const raylib = raylib_dep.module("raylib");
    const raylib_artifact = raylib_dep.artifact("raylib");

    // Engine library module (src/root.zig)
    const engine_mod = b.createModule(.{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });
    engine_mod.addImport("raylib-zig", raylib);
    engine_mod.linkLibrary(raylib_artifact);

    // Executable that uses the engine (src/main.zig)
    const exe_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    exe_mod.addImport("engine", engine_mod);
    exe_mod.addImport("raylib-zig", raylib);
    exe_mod.linkLibrary(raylib_artifact);

    const exe = b.addExecutable(.{
        .name = "zig_engine",
        .root_module = exe_mod,
    });
    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    b.step("run", "Run the app").dependOn(&run_cmd.step);

    const engine_tests = b.addTest(.{ .root_module = engine_mod });
    const exe_tests = b.addTest(.{ .root_module = exe_mod });
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&b.addRunArtifact(engine_tests).step);
    test_step.dependOn(&b.addRunArtifact(exe_tests).step);
}
