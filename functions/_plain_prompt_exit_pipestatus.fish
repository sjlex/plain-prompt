function _plain_prompt_exit_pipestatus
  set -l exit_pipestatus $argv[1..]

  set -l exit_status_success 0
  set -l exit_pipestatus_on_error false

  for pipe_status in $exit_pipestatus
    if test $pipe_status -ne $exit_status_success
      set exit_pipestatus_on_error true
    end
  end

  if $exit_pipestatus_on_error
    set_color -b $plain_prompt_exit_pipe_status_color_bg
    set_color $plain_prompt_exit_pipe_status_color
    set_color --bold
    echo -n " [$exit_pipestatus] "
    set_color normal
  end
end
