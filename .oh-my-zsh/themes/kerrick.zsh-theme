# ZSH Theme
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
 
## User
if (($UID == 0)) then
  local user='%{$terminfo[bold]$fg[red]%}%n%{$reset_color%}'
  local prompt='#'
else
  local user='%{$fg[green]%}%n%{$reset_color%}'
  local prompt='$'
fi
 
## Host
local host='%{$fg[cyan]%}%m%{$reset_color%}'
 
## Directory
local current_dir='%{$fg[blue]%}%~%{$reset_color%}'
 
## Ruby
local ruby=''
local ruby_space=''
if which rvm-prompt &> /dev/null; then
  ruby='%{$fg[red]%}‹$(rvm-prompt v g)›%{$reset_color%}'
  ruby_space=' '
else
  if which rbenv &> /dev/null; then
    ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
    ruby_space=' '
  fi
fi
 
## Git
local git_info=''
local git_space=''
local git_color=''
if git_prompt_info &> /dev/null; then
  git_space=' '
  git_info='$(git_prompt_info)'
fi
local git_branch="$(git symbolic-ref -q HEAD 2>/dev/null | cut -d "/" -f 3-)"
case "${git_branch}" in
  master)
    git_color='%{$fg[cyan]%}' ;;
  hotfix*)
    git_color='%{$fg[red]%}' ;;
  release*)
    git_color='%{$fg[green]%}' ;;
  develop)
    git_color='%{$fg[yellow]%}' ;;
  *)
    if [[ -n "${git_branch}" ]] ; then
      git_color='%{$fg[magenta]%}'
    else
      git_color='%{$fg[white]%}'
    fi
    ;;
esac
 
ZSH_THEME_GIT_PROMPT_PREFIX="«"
ZSH_THEME_GIT_PROMPT_SUFFIX=":$(git_prompt_short_sha)» %{$reset_color%}"
 
 
## Prompt
PROMPT="╭─${user}@${host}:${current_dir}${ruby_space}${ruby}${git_space}${git_color}${git_info}
╰─${prompt} "
RPS1="${return_code}"
