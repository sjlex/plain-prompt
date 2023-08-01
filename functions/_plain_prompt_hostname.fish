function _plain_prompt_hostname
  set -l hostname_str (hostname)

  set_color -b $plain_prompt_hostname_color_bg
  set_color $plain_prompt_hostname_color
  echo -n " "$hostname_str" "
  set_color normal
end
