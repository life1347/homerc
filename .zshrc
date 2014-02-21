# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="kerrick"
#ZSH_THEME="frisk"
ZSH_THEME="jispwoso"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
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
alias virc="vim ~/.zshrc"
alias loadrc="source ~/.zshrc" 
alias s="sudo"
alias ssu="sudo su"

reservice(){
    for i in $(ls /etc/init.d/$1*); do $i restart; done
}

