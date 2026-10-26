# zig-engine

A game engine written in [Zig](https://ziglang.org/) (0.17) using [raylib-zig](https://github.com/raylib-zig/raylib-zig).

This is a learning project: I am following the tutorial series
[*Costruire videogiochi da zero*](https://doorstotheunknown.substack.com/p/costruire-videogiochi-da-zero-0)
on the *Doors to the Unknown* Substack, and building the engine step by step as I go.

## Build and run

```sh
zig build        # build
zig build run    # build and run
zig build test   # run tests
```

## Layout

- `src/main.zig` – executable entry point
- `src/root.zig` – library root
- `src/helloworld.zig` – first tutorial exercise
- `build.zig` / `build.zig.zon` – build script and dependencies

## Credits

All credit for the tutorial goes to its original author,
my friend Daniele Ceravolo, at [Doors to the Unknown](https://doorstotheunknown.substack.com/).
