#!/usr/bin/env zsh

#git
alias gco='git checkout'
alias gcb='git checkout -b'
alias gst='git status'
alias ga='git add'
alias gcmsg='git commit --message'
alias gp='git push'
alias gl='git pull'
alias gm='git merge'
alias gpf='git push --force'
alias glo='git log --oneline --decorate'
alias gwt='git worktree list'
alias gwtls='git worktree list'
alias gwta='git worktree add'
alias gwtrm='git worktree remove'
alias gbr='git branch -r'
alias gpsup='	git push --set-upstream origin $(git_current_branch)'

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
alias wmo='workmux open'

#pi
alias piu='pi update --all'
alias piv='pi version'
alias pic='pi -c'

#docker
alias dup="docker compose up -d --build"

#macos
alias ofd='open . -a Finder'

#misc
alias zsrc='source ~/.zshrc'
alias tmsrc='tmux source-file ~/.tmux.conf'