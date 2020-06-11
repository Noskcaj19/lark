#!/usr/bin/env zsh

function lark-clear-state() {
  if ! [[ -v LARK_STATE && -v LARK_BASE ]]; then; return; fi
  command rm -rf "$LARK_STATE"
  mkdir "$LARK_STATE"
  mkdir "$LARK_STATE"/altar
}

function lark-rm-rooms() {
  if ! [[ -v LARK_STATE && -v LARK_BASE ]]; then; return; fi
  command rm -rf "$LARK_BASE/greymore/town_limits/altar/crypt_entrance"
}

function lark-reset() {
  if ! [[ -v LARK_STATE && -v LARK_BASE ]]; then; return; fi
  lark-clear-state
  lark-rm-rooms

  command rm -f "$LARK_BASE/greymore/hill/castle/basement/dungeon/cell6/freedom"
  command rm -f "$LARK_BASE"/greymore/**/corpse(N) #(N) - dont fail when there are no matches
}
