# Aliases.
#==============================
alias l='ls -alF'
alias rm='sudo rm -r'

# Tmux
#==============================
alias tm='tmux -2'

# git
#==============================
alias gst='git status -s'
alias gcm='git commit -m'
alias ga='git add'
alias gaa='git add -A'
alias gpm='git push -u origin master'
alias gpr='git pull --rebase'
alias gpu='git pull'

alias dotfiles='cd ~/.dotfiles'

alias ag='/usr/bin/ag'
alias t='phpunit'

# conditional alias
#==============================
which vim.gnome > /dev/null 2>&1 && alias vim=vim.gnome
which mvim > /dev/null 2>&1 && alias vim='mvim -v'
which mvim > /dev/null 2>&1 && alias gvim='mvim -v'
which gvim > /dev/null 2>&1 && alias vim='gvim -v'
which gvim > /dev/null 2>&1 && alias gvim='gvim -v'
which nvim > /dev/null 2>&1 && alias vim=nvim
