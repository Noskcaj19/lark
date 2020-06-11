This game is intended to teach usage of the UNIX bash shell.

To get started, run the `run_me.sh` script with `./run_me.sh`.

To exit, type `exit` or press ctrl-d.

To reset progress, run `lark-reset` inside the game.

## Internals

Be aware that once you enter the environment with `run_me.sh`, it will be somewhat difficult to view the internals and scripts.  You should explore `greymore/` and `.internals/` from your normal shell environment.

# macOS notice

While macos is a UNIX OS, certain utilities are not quite the same as linux, and the core logic
for this game was not built to handle macOS utilities, so this will only work on linux (plus it has some x86-64 linux
binaries)

Technically, the only problematic part seems to be the environment bootstrapping, which can be easily tweaked to work on macos.
