#!/usr/bin/env zsh

function precmd() {
  if [[ -z $I || $I =~ ,$ ]]; then
    true
  else
    I+=","
  fi

  if [[ -e "$PWD/.precmd" ]]; then
    source "$PWD/.precmd"
  fi

  if [[ -e "$LARK_STATE/_is_dead" ]]; then
    rm -f "$LARK_STATE/_is_dead"
    cd "$LARK_STARTING_PATH"
  fi

}
