function fish_prompt --description 'Write out the prompt'
  set -l last_status $status

  # User
  set_color green
  echo -n (whoami)

  echo -n '@'

  # Host
  echo -n (hostname -s)
  set_color normal

  set_color yellow
  printf '(%s)' (date "+%H:%M:%S") 
  set_color normal

  echo -n ':'

  # PWD
  set_color cyan
  echo -n (pwd)
  set_color normal

  __terlar_git_prompt
  echo

  set_color red
  echo -n '>> '
  set_color normal
end
