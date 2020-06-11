#!/usr/bin/env zsh

ch_dir_handler() {
  if [[ $PWD != "${PWD:A}" ]]; then
    cd "${PWD:A}"
    return
  fi
  if [[ "$PWD" == "$OLDPWD" ]]; then
    return
  fi
  local dirpath="${PWD:A}"

  if [[ -f "$dirpath/.enter" ]]; then
      source "$dirpath/.enter"
  fi

  if [[ "$OLDPWD" =~ /dungeon/cell6$ && ( ! "$PWD" =~ /forest$ ) ]]; then
    source "${LARK_INTERNAL}/special_files/cell_iron_bars_message.zsh"
    cd "${LARK_STARTING_CELL}"
    return 1
  fi
}

add-zsh-hook chpwd ch_dir_handler
