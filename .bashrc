# Set the following to make all x terminals have proper PS1 and PS2
# \033[0;30m - Black
# \033[0;31m - Red
# \033[0;32m - Green
# \033[0;33m - Orange
# \033[0;34m - Blue
# \033[0;35m - Cyan
# \033[0;36m - Light Blue
# \033[0;37m - Grey
# \033[0;39m - White

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color
export PS1="\[\033[38;5;10m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;11m\](\T)\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;9m\]>>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
PATH=${PATH}:${HOME}/bin
export EDITOR=/usr/bin/vim
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
test -d ~/.histfile/ || mkdir ~/.histfile/
if [ "$?WINDOW" ] ; then
   export HISTFILE=~/.histfile/hist$WINDOW
else
   export HISTFILE=~/.histfile/hist
fi
alias hw="history -w ~/.histfile/last"
alias hr="history -r ~/.histfile/last"
alias ha="history -a ~/.histfile/last"
alias hn="history -n ~/.histfile/last"
alias hc="history -c"
alias ntptime="sudo /etc/init.d/ntp stop;sudo ntpdate -s time.stdtime.gov.tw;"
alias vibashrc="vim ~/.bashrc"
alias loadbashrc="source ~/.bashrc" 
alias s="sudo"
alias ssu="sudo su"

reservice(){
    for i in $(ls /etc/init.d/$1*); do $i restart; done
}

if [[  `uname` =~ "Linux" ]] ; then
   alias ls='ls --color=auto'
   alias ll='ls -alF'
   alias la='ls -A'
   alias l='ls -CF'

   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
fi


set meta-flag on
set input-meta on
set convert-meta off
set output-meta on

set filec
set autolist                # tab completing
set autologout=0

[[ -s "$HOME/.inputrc" ]] && export INPUTRC="$HOME/.inputrc"
[[ -s "$HOME/.bash_aliases" ]] && . "$HOME/.bash_aliases" # Load bash_profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
[[ -s "$HOME/ENV/bin/activate" ]] && . "$HOME/ENV/bin/activate" # Load virtualenv

if [ -n "$SSH_TTY" ] ; then
echo $SSH_TTY
[[ -r "$HOME/etc/motd" ]] && cat $HOME/etc/motd
fi
