function _plain_prompt_uninstall --on-event plain_prompt_uninstall
  # Erase variables
  set --names |
    string replace --filter --regex '^(plain_prompt)' 'set --erase $1' |
    source

  # Erase functions
  functions --names --all |
    string replace --filter --regex '^(_plain_prompt)' 'functions --erase $1' |
    source
end
