#!/usr/bin/env zsh

function cat() {
  local relpath
  local filepath
  filepath="${1:a}"
  relpath="${${filepath}##${LARK_BASE}}"

  if [[ "$1" == "" ]]; then
    command cat
  elif [[ "$(head "$filepath" -n1 2> /dev/null)" == "#!eval" ]]; then
    set BASH_REMATCH
    while read -r LINE; do
      if [[ $LINE == "#!eval" ]]; then
        continue
      elif [[ $LINE =~ ^\=\|\=\ .*$ ]]; then
        # Yikes
        eval "echo \"${LINE##\=\|\= }\""
      else
        echo "$LINE"
      fi
    done < "$filepath"
    return
  elif [[ "$(head "$filepath" -n1 2> /dev/null)" == "#!/usr/bin/env zsh" ]]; then
    if [[ $(basename "$filepath") =~ ^\. ]]; then
      echo "${FX[standout]}This item seems older than time itself, it seems wise to leave it be.${FX[none]}"
      return
    fi
    echo "${FX[standout]}You aren't sure how you can perform an action by reading it${FX[none]}"
    echo "${FX[standout]}Interacting with it by executing it should work though: ${FX[bold]}./$1${FX[none]}"
    return
  else
    command cat $@
    return
  fi
}
