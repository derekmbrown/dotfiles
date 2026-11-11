#!/usr/bin/env zsh

#git
alias gco='git checkout'
alias gcb='git checkout -b'
alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gm='git merge'
alias gpf='git push --force'
alias glo='git log --oneline --decorate'
alias gwtls='git worktree list'
alias gwta='git worktree add'
alias gwtrm='git worktree remove'

#tmux
alias ta='tmux attach -t'
alias tls='tmux list-sessions'
alias tad='tmux attach -t -d'
alias tkss='tmux kill-session -t'
alias tksv='tmux kill-server'
alias ts='tmux new-session -s'
alias tw='tmux new-window'
alias twn='tmux new-window -n'
alias tsh='tmux split-window -h'
alias tsv='tmux split-window -v'

#workmux
alias wm='workmux'
alias wmi='workmux init'
alias wmls='workmux list'
alias wma='workmux add'
alias wmrm='workmux remove'

#pi
alias piu='pi update --all'
alias piv='pi version'
alias pic='pi -c'

#docker
alias dup="docker compose up -d --build"