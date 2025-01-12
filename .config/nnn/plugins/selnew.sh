#!/usr/bin/env sh

sel=${NNN_SEL:-${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection}
targets=()
if [ -s "$sel" ]; then
  while IFS= read -r -d '' entry || [ -n "$entry" ]; do
    targets+=("\"$entry\"")
  done < "$sel"
else
  targets+=("\"$*\"")
fi

kitty sh -c "cd \"$PWD\" && sleep 0.1 && $(which nvim) ${targets[*]}"
