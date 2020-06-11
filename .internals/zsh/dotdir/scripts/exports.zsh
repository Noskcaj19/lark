#!/usr/bin/env zsh

# Functional vars
export MANPATH="${LARK_INTERNAL}/manpages:$(manpath 2>/dev/null)"
# Utilities
alias l="exa -1aI\".*\""
alias ll="exa -lI\".*\""
alias la="exa -laI\".*\""
alias laa="exa -aI\".*\""
alias lax="exa -la"

function map() {
  exa -TL"${1:-3}" -I".+" ${2:-~/greymore}
}
