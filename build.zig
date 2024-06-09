const std = @import("std");

pub fn build(b: *std.Build) void {
    const x = b.addExecutable(.{
        .root_source_file = b.path("./src/main.zig"),
        .name = "zig-coreutils",
        .target = b.standardTargetOptions(.{}),
    });

    b.installArtifact(x);
}
