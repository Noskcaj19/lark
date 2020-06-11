#!/usr/bin/env zsh

function ls() {
  if [[ ! -f "${LARK_STATE}/how_to_cat_file_shown" ]]; then
    echo "You can use ${FX[bold]}cat${FX[no-bold]} to view the contents of a note"
    echo
    touch "${LARK_STATE}/how_to_cat_file_shown"
  fi
  # Hide dot prefixed files, even with -a
  command exa "$@" -I".+"
}
