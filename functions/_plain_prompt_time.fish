function _plain_prompt_time
  set -l time_str (date '+%T')

  set_color -b $plain_prompt_time_color_bg
  set_color $plain_prompt_time_color
  echo " "$time_str" "
  set_color normal
end
