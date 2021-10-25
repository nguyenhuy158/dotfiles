alias ns="npm start"
alias nrd="npm run deploy"


alias c='clear'
alias h='history'
alias .='cd'
alias ..='cd ..'
alias ...='cd ../..'
alias cdd="cd -"

alias mkdir='mkdir -pv'


alias apt-get="sudo apt-get"
alias apt="sudo apt"


alias gp="git push"
alias gl="git pull"
alias gqc='git add . && git commit -m "quick commit"'
alias push-vim="gqc && gp"



alias move-vim-code="cd ~/vim && push-vim"
alias backup-alias="cp ~/.config/fish/config.fish ~/vim/.config/fish/"
alias backup-vimrc="cp ~/.vimrc ~/vim/"
alias backup-vimrcplug="cp ~/.vimrc.plug ~/vim/"
alias backup-coc="cp ~/.vim/coc-settings.json ~/vim/.vim/"
alias backup-history='history > ~/vim/history.txt'

alias bc-vm="backup-alias && backup-vimrc && backup-vimrcplug && backup-coc"
alias bc1='bc-vm && backup-history'
alias backup-vim="bc1 && move-vim-code"


