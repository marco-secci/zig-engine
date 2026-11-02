# zig-engine

A game engine written in [Zig](https://ziglang.org/) (0.17) using [raylib-zig](https://github.com/raylib-zig/raylib-zig).

This is a learning project: I am following the tutorial series
[*Costruire videogiochi da zero*](https://doorstotheunknown.substack.com/p/costruire-videogiochi-da-zero-0)
on the *Doors to the Unknown* Substack, and building the engine step by step as I go.

## Episodes

Each tutorial episode is a self-contained Zig project in `episodes/`:

| Folder | Episode | Result |
|---|---|---|
| `Episode 1` | 1 | An empty window (black, then pink by the end of the episode) |
| `Episode 2` | 2 | A blue rectangle moving across a black window |

## Build and run

From inside an episode's folder:

```sh
cd episodes/Episode 2
zig build        # build
zig build run    # build and run
zig build test   # run tests
```

## Layout

Each episode folder contains:

- `src/main.zig` – executable entry point
- `src/root.zig` – engine library root
- `build.zig` / `build.zig.zon` – build script and dependencies (raylib-zig)

To start a new episode, copy the latest episode folder, rename it, change `.name`
in `build.zig.zon`, and delete the `.fingerprint` line (`zig build` will suggest a new one).

##### TODO: improve repo structure by creating a directory per episode

## Credits

All credit for the tutorial goes to its original author,
my friend Daniele Ceravolo, at [Doors to the Unknown](https://doorstotheunknown.substack.com/).
