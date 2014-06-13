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
export TERM=xterm-256color
export PS1='\[\e[1;36m\]\t \[\e[01;33m\]\u\[\e[m\]@\h\[\e[0m\]:\[\e[01;34m\]\w\n\[\e[0m\]>> '
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
alias normalday='sudo mjpg_streamer -i "/usr/lib/input_uvc.so -d /dev/video0 -y  -r 320x240 -f 10" -o "/usr/lib/output_http.so -p 8090 -w /var/www/" &'
alias temp='sudo /opt/vc/bin/vcgencmd measure_temp'

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
