function _plain_prompt --description 'Fish user prompt'
  set --local exit_status $status # save previous status
  set --local exit_pipestatus $pipestatus # save previous pipestatus

  # Prompt clear
  echo -e -n (_plain_prompt_clear)

  # Prompt time
  set -l prompt_time (_plain_prompt_time)

  # Prompt user
  set -l prompt_user (_plain_prompt_user)

  # Prompt hostname
  set -l prompt_hostname (_plain_prompt_hostname)

  # Prompt exit status
  set -l prompt_exit_status (_plain_prompt_exit_status $exit_status)
  set -l prompt_exit_pipestatus (_plain_prompt_exit_pipestatus $exit_pipestatus)

  # Line length
  set -l line_length_str
  set --append line_length_str $prompt_time
  set --append line_length_str $prompt_user
  set --append line_length_str $prompt_hostname
  set --append line_length_str $prompt_exit_status
  set --append line_length_str $prompt_exit_pipestatus
  set line_length_str (string join "" $line_length_str)

  set -l line_length (_plain_prompt_length $line_length_str)
  set -l line_free_length (math $COLUMNS - $line_length)

  # Prompt path
  set -l prompt_path (_plain_prompt_cwd $line_free_length)

  # Prompts
  set -l prompt_str
  set --append prompt_str $prompt_time
  set --append prompt_str $prompt_user
  set --append prompt_str $prompt_hostname
  set --append prompt_str $prompt_path
  set --append prompt_str $prompt_exit_status
  set --append prompt_str $prompt_exit_pipestatus
  set prompt_str (string join "" $prompt_str)

  # Render
  echo $prompt_str

  # Prompt end
  echo -n -e (_plain_prompt_end)  # reset colors and end prompt
end
