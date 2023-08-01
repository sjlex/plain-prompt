function _plain_prompt_user
  set -l current_user (id -u -n)

  set -l root_user "root"
  set -l user_str $current_user

  if test $current_user = $root_user
    set_color -b $plain_prompt_user_root_color_bg
    set_color $plain_prompt_user_root_color
    echo -n " "$user_str" "
  else
    set_color -b $plain_prompt_user_color_bg
    set_color $plain_prompt_user_color
    echo -n " "$user_str
  end

  set_color normal
end
