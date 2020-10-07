#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

# script global variables
cpu_bg_color_0=""
cpu_bg_color_1=""
cpu_bg_color_2=""
cpu_bg_color_3=""
cpu_bg_color_4=""
cpu_bg_color_5=""
cpu_bg_color_6=""

cpu_bg_color_0_default=""
cpu_bg_color_1_default="#[bg=colour226]"
cpu_bg_color_2_default="#[bg=colour220]"
cpu_bg_color_3_default="#[bg=colour214]"
cpu_bg_color_4_default="#[bg=colour208]"
cpu_bg_color_5_default="#[bg=colour202]"
cpu_bg_color_6_default="#[bg=colour196]"

# icons are set as script global variables
get_bg_color_settings() {
  cpu_bg_color_0=$(get_tmux_option "@cpu_bg_color_0" "$cpu_bg_color_0_default")
  cpu_bg_color_1=$(get_tmux_option "@cpu_bg_color_1" "$cpu_bg_color_1_default")
  cpu_bg_color_2=$(get_tmux_option "@cpu_bg_color_2" "$cpu_bg_color_2_default")
  cpu_bg_color_3=$(get_tmux_option "@cpu_bg_color_3" "$cpu_bg_color_3_default")
  cpu_bg_color_4=$(get_tmux_option "@cpu_bg_color_4" "$cpu_bg_color_4_default")
  cpu_bg_color_5=$(get_tmux_option "@cpu_bg_color_5" "$cpu_bg_color_5_default")
  cpu_bg_color_6=$(get_tmux_option "@cpu_bg_color_6" "$cpu_bg_color_6_default")
}

print_bg_color() {
  local percentage=$($CURRENT_DIR/cpu_percentage.sh | sed -e 's/%//')
  if fcomp 80 $percentage; then
    echo "$cpu_bg_color_6"
  elif fcomp 60 $percentage; then
    echo "$cpu_bg_color_5"
  elif fcomp 40 $percentage; then
    echo "$cpu_bg_color_4"
  elif fcomp 30 $percentage; then
    echo "$cpu_bg_color_3"
  elif fcomp 10 $percentage; then
    echo "$cpu_bg_color_2"
  elif fcomp 5 $percentage; then
    echo "$cpu_bg_color_1"
  else
    echo "$cpu_bg_color_0"
  fi
}

main() {
  get_bg_color_settings
  print_bg_color
}
main
