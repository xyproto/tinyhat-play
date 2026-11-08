# tinyhat-play

A C+GTK frontend for searching for, downloading and playing a homebrew retro game.

It searches the CHIP-8 Archive (for CHIP-8), DuckDuckGo and itch.io, downloads the game to `~/roms/$PLATFORM` (or `~/DOS`) and starts it.

Included programs:

* `tinyhat-play`, the GTK4 search and download window. `tinyhat-play --choose TITLE` shows a searchable list of the lines on stdin and prints the chosen one, which `tinyhat-emulate` uses for picking games.
* `tinyhat-emulate`, which starts a game for one of the supported platforms, or lets you pick one from `~/ROMs/PLATFORM` and USB sticks: `tinyhat-emulate nes|snes|genesis|sms|gba|c64 [game]`.
* `tinyhat-retro`, a small SDL3 libretro frontend, used for the NES, Genesis and Master System cores, with gamepad support.

## Building

    make
    make install PREFIX=/usr DESTDIR="$pkgdir"

Build dependencies: `gtk4`, `curl` and `sdl3`.

## Supported emulators

| Platform | Program |
| --- | --- |
| SNES | `zsnes` |
| Game Boy Advance | `mgba` (the SDL frontend) |
| NES | `libretro-nestopia` |
| Sega Genesis and Master System | `libretro-blastem` |
| C64 | `vice` (`x64sc`, `x128` and `xvic`) |
| DOS | `dosbox-x` (or `tinyhat-dosbox` on Tiny Hat) |
| TIC-80 | `tic-80` |
| CHIP-8 | `octo-run` (from [c-octo](https://github.com/JohnEarnest/c-octo)) |

On [Tiny Hat](https://roboticoverlords.org/tinyhat), `fuzzel`, `tinyhat-pick` and `tinyhat-notice` are used when available.

### General info

* License: BSD-3
* Version: 1.3.0
