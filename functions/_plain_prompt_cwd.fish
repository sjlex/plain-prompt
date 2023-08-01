function _plain_prompt_cwd
  set -l length $argv[1]

  if not test $length
    return 1
  end

  set -l pwd $PWD
  set -l pwd_str (_plain_prompt_path_adaptive $pwd $length)

  set_color -b $plain_prompt_path_color_bg
  set_color $plain_prompt_path_color
  set_color --bold
  echo -n $pwd_str
  set_color normal
end
