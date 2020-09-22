#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

# script global variables
cpu_icon_1=""
cpu_icon_2=""
cpu_icon_3=""
cpu_icon_4=""
cpu_icon_5=""
cpu_icon_6=""

cpu_icon_1_default="#[fg=colour226]▁"
cpu_icon_2_default="#[fg=colour220]▂"
cpu_icon_3_default="#[fg=colour214]▃"
cpu_icon_4_default="#[fg=colour208]▄"
cpu_icon_5_default="#[fg=colour202]▅"
cpu_icon_6_default="#[fg=colour196]▇"

# icons are set as script global variables
get_icon_settings() {
  cpu_icon_1=$(get_tmux_option "@cpu_icon_1" "$cpu_icon_1_default")
  cpu_icon_2=$(get_tmux_option "@cpu_icon_2" "$cpu_icon_2_default")
  cpu_icon_3=$(get_tmux_option "@cpu_icon_3" "$cpu_icon_3_default")
  cpu_icon_4=$(get_tmux_option "@cpu_icon_4" "$cpu_icon_4_default")
  cpu_icon_5=$(get_tmux_option "@cpu_icon_5" "$cpu_icon_5_default")
  cpu_icon_6=$(get_tmux_option "@cpu_icon_6" "$cpu_icon_6_default")
}

print_icon() {
  local percentage=$($CURRENT_DIR/cpu_percentage.sh | sed -e 's/%//')
  if fcomp 80 $percentage; then
    echo "$cpu_icon_6"
  elif fcomp 60 $percentage; then
    echo "$cpu_icon_5"
  elif fcomp 40 $percentage; then
    echo "$cpu_icon_4"
  elif fcomp 30 $percentage; then
    echo "$cpu_icon_3"
  elif fcomp 10 $percentage; then
    echo "$cpu_icon_2"
  elif fcomp 10 $percentage; then
    echo "$cpu_icon_1"
  else
    echo " "
  fi
}

main() {
  get_icon_settings
  local cpu_icon=$(print_icon "$1")
  echo "$cpu_icon"
}
main
