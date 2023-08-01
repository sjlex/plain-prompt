function _plain_prompt_length
  set -l lines $argv[1..]

  set -l lines_length
  set -l line_offset_right 20

  if test (count $lines) -le 0;
    return 1
  end

  for current_line in $lines
    set -l current_line_length (string length --visible $current_line)
    set lines_length (math $lines_length + $current_line_length)
  end

  # Right offset
  set -l prompt_length (math $lines_length + $line_offset_right)

  echo -n $prompt_length
end
