const std = @import("std");

pub fn build(b: *std.Build) void {
    inline for (.{
        "whoami",
    }) |name| {
        try buildBinary(b, "src/" ++ name ++ "/main.zig", name);
    }
}

fn buildBinary(
    b: *std.Build,
    path: []const u8,
    name: []const u8,
) !void {
    const x = b.addExecutable(.{
        .name = name,
        .root_source_file = b.path(path),
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    });

    const clap = b.dependency("clap", .{});

    x.root_module.addImport("clap", clap.module("clap"));

    b.installArtifact(x);
}
