function _plain_prompt_path_adaptive
  set -l target_string $argv[1]
  set -l line_length $argv[2]
  set -l output_string

  if not test $target_string; or not test $line_length
    return 1
  end

  set -l target_string_length (string length $target_string)
  set -l length_delta (math max 0,(math $target_string_length - $line_length))

  if test $line_length -gt $target_string_length
    set output_string $target_string
  else
    set -l str_sub_start (math max 1,$length_delta)
    set -l str_sub (string sub --start=$str_sub_start $target_string)
    set -l str_split (string split -m2 "/" " "$str_sub)

    set -l str_split_path_start (string trim $str_split[2])
    set -l str_split_path_end (string trim $str_split[3])

    set -l str_path_short (string join "/" $str_split_path_start $str_split_path_end)
    set -l str_path_short_norm (path normalize '/'$str_path_short)
    set -l str_path_short_norm_length (string length $str_path_short_norm)

    if test $str_path_short_norm
      if test $str_path_short_norm = '/'
        set str_path_short_norm ""
      end

      if test $str_path_short_norm_length -lt $target_string_length
        set str_path_short_norm (path normalize '../'$str_path_short)
      end
    end

    set output_string $str_path_short_norm
  end

  echo -n $output_string
end
