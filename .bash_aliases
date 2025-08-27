alias vim="nvim"

#ls aliases
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'

alias jnb='jupyter notebook --no-browser --port=8080'

# git aliases
alias gs='git status'
alias gau='git add -u'
alias gc='git commit'
alias gcm='git commit -m'

# directory navigation aliases
alias ...='cd ../..'
alias ....='cd ../../..'

# tmux aliases
alias tmux="tmux -2"
alias ta="tmux attach"
alias tat="tmux attach -t"
alias tls="tmux ls"

alias pym="python -m"
alias vsource="source .venv/bin/activate"
alias fd="fdfind"
alias mm="make"
alias mr="make; make run"
alias mlb="matlab -nodisplay -nosplash -nodesktop"

alias cm="cmake -Bbuild ; cmake --build build -j 12"
alias cmt="cmake -Bbuild ; cmake --build build -j 12"

# fix directory path
# alias pre-commit="/home/cherr/miniconda3/bin/python /home/cherr/.local/bin/pre-commit-4.2.0.pyz"
