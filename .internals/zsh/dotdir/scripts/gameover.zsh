#!/usr/bin/env zsh

function gameover(){
  source "$LARK_ZSH/prezto/modules/spectrum/init.zsh"

  {
    echo "The corpse of a slain adventurer lies on the ground"
    echo "In their money bag you find $SILVER silver"
    echo
  } >> corpse

  echo "${FX[bold]}${FG[red]}== You have been slain ==${FX[none]}${FG[none]}"

  source "${LARK_ZSH}/dotdir/scripts/game_config.zsh"

  touch "$LARK_STATE/_is_dead" # magic path that changes pwd with precmd trickery
}
