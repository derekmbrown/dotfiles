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
alias gbr='git branch -r'

#tmux
alias tma='tmux attach -t'
alias tmls='tmux list-sessions'
alias tmad='tmux attach -t -d'
alias tmkss='tmux kill-session -t'
alias tmksv='tmux kill-server'
alias tms='tmux new-session -s'
alias tmw='tmux new-window'
alias tmwn='tmux new-window -n'
alias tmsh='tmux split-window -h'
alias tmsv='tmux split-window -v'

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