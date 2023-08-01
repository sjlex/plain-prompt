function _plain_prompt_exit_status
  set -l exit_status $argv[1]

  set -l exit_status_success 0

  if test $exit_status -ne $exit_status_success
    set_color -b $plain_prompt_exit_status_color_bg
    set_color $plain_prompt_exit_status_color
    set_color --bold
    echo -n " ("$exit_status")"
    set_color normal
  end
end
