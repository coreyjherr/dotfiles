# ~/.bashrc: executed by bash(1) for non-login shells.
export TERM=xterm-256color
export PATH="$PATH:$HOME/.local/bin/"
export XDG_CONFIG_HOME="$HOME/.config"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -d "$HOME/.bash_custom" ]; then
    for file in "$HOME/.bash_custom"/*.sh; do
        if [ -f "$file" ]; then
            source "$file"
        fi
    done
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

source ~/.fzf.bash

export NVIMRC="$HOME/.config/nvim/init.lua"
export PATH="$PATH:$HOME/.local/nvim/bin"

eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source $HOME/.atuin/bin/env
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash --disable-up-arrow)"

. "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"

. "$HOME/.local/bin/env"

PATH="/usr/local/cuda-13.0/bin:$PATH"
LD_LIBRARY_PATH="/usr/local/cuda-13.0/lib64:$LD_LIBRARY_PATH"
