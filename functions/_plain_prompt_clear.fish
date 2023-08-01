function _plain_prompt_clear
  # Clear existing line content
  set -l clear_line "\r\033[K"

  echo -n -e $clear_line
end
