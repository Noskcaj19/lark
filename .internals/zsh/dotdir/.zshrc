#!/usr/bin/env zsh

export LARK_INTERNAL="$LARK_INTERNAL_PATH"
export LARK_BASE=$(readlink -f "$LARK_INTERNAL_PATH/..")
export LARK_BIN="$LARK_INTERNAL_PATH/bin"
export LARK_ZSH="$LARK_INTERNAL_PATH/zsh"
export LARK_STARTING_CELL="$LARK_STARTING_PATH"
export LARK_STATE="$LARK_INTERNAL_PATH/state"

export PATH="$PATH:${LARK_INTERNAL}/bin/"
export HOME="${LARK_BASE}"

show_cursor() {
    tput cnorm
}
hide_cursor() {
    tput civis
}

reset

trap show_cursor EXIT
hide_cursor

"${LARK_ZSH}/revolver" start "Constructing Environment"

# shellcheck source=./zpreztorc
source "${LARK_ZSH}/dotdir/zpreztorc"

# shellcheck source=../prezto/init.zsh
source "${LARK_ZSH}/prezto/init.zsh"

autoload -U add-zsh-hook


source "${LARK_ZSH}/dotdir/overrides/custom_cat.zsh"
source "${LARK_ZSH}/dotdir/overrides/ls.zsh"
source "${LARK_ZSH}/dotdir/overrides/precmd.zsh"
source "${LARK_ZSH}/dotdir/overrides/cmd_handler.zsh"
source "${LARK_ZSH}/dotdir/scripts/gameover.zsh"
source "${LARK_ZSH}/dotdir/scripts/lark_reset.zsh"
source "${LARK_ZSH}/dotdir/scripts/exports.zsh"
source "${LARK_ZSH}/dotdir/scripts/game_config.zsh"


"${LARK_INTERNAL}/zsh/revolver" stop
show_cursor

echo "${FG[gray]}It's dark and gloomy. You try and look around with \`ls\`"
