#!/bin/bash

# Here we resolve the absolute path of this script and export it
# then we configure zsh and spawn it, the rest of the configuration
# is in the zsh configs, which starts in 

if [[ -n "${LARK_INTERNAL_PATH+1}" ]]; then
  echo "It seems the environment is already loaded, try exiting out first with ctrl-d"
  exit 1
fi


case $0 in
  /*) SCRIPT_PATH=$0;;
  *) SCRIPT_PATH=$PWD/$0;;
esac

export LARK_INTERNAL_PATH="$(dirname "$(readlink -f "$SCRIPT_PATH")")"
export PATH="$PATH:$LARK_INTERNAL_PATH/hermetic_zsh/bin"

# These vars must be set before zsh starts
export ZDOTDIR="$LARK_INTERNAL_PATH/zsh/dotdir"
export XDG_CACHE_DIR="$LARK_INTERNAL_PATH/.cache"

mkdir -p "$LARK_INTERNAL_PATH/state"

export LARK_STARTING_PATH="$LARK_INTERNAL_PATH/../greymore/hill/castle/basement/dungeon/cell6"
cd "$LARK_STARTING_PATH"

"$LARK_INTERNAL_PATH"/hermetic_zsh/share/zsh/5.8/scripts/relocate

exec zsh
