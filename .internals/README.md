# Welcome to the internals

These are the files required to make the game work, and you
are not required to read them to complete the game, however,
feel free to read them to learn.

## How it's done

### Software

The shell is zsh http://www.zsh.org/, compiled from source statically so it works portably
and is included in the /bin directory

Images/gifs are rendered using term-image https://github.com/Noskcaj19/term-image which uses unicode
symbols to approximate images

The parrot is from parrot.live

### Implementation

TODO

Lot's of hacks and lots of wrapping builtins (cat, ls, cd) to add custom behaviors

A custom prompt based on sorin to provide a "HUD" to show HP, inventory, and such which can be found in /zsh/prezto/modules/prompt/functions/prompt_lark_setup