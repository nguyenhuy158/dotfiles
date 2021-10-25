alias ns="npm start"
alias nrd="npm run deploy"

alias cdd="cd -"

alias gp="git push"
alias gl="git pull"
alias gqc='git add . && git commit -m "quick commit"'
alias push-vim="gqc && gp"


alias move-vim-push="cd ~/vim && push-vim"
alias backup-alias="cp ~/.config/fish/config.fish ~/vim/"
alias bc-vm="backup-alias"
alias backup-vim="bc-vm && move-vim-push && cd - "


