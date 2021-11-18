alias vi="bneovim && nvim"

# zip rar
alias unrar="unrar x -r"
alias unzip="unzip -x"

# alias npm  {{{

alias ns="npm start"
alias ni="npm install"
alias na="npm audit"
alias nf="npm fund"
alias nd="npm run deploy"

#}}}

alias sl='ls'
alias lsa='ls -a'
alias c='clear'
alias h='history'
alias .='cd'
alias ..='cd ..'
alias ...='cd ../..'
alias cdd="cd -"
alias home="~"

alias c='clear'
alias h='history'
alias .='cd'
alias ..='cd ..'
alias ...='cd ../..'
alias cdd="cd -"
alias home="~"


alias mkdir='mkdir -pv'

alias apt-get="sudo apt-get"
alias apt="sudo apt"
alias cp="cp -r"


alias gs="git status"
alias glog="git log --oneline"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"
alias gqp='git add . && git commit -m "quick commit" && git push'
alias gqc='git add . && git commit -m "quick commit"'
alias push-vim="gqc && gp"

alias film="~/Documents/Vozflix.AppImage"

alias copy-vim="cp -r ~/.config/fish/ ~/vim/.config/"

alias move-vim-code="cd ~/vim && push-vim"
alias backup-alias="cp ~/.config/fish/config.fish ~/vim/.config/fish/"
alias backup-vimrc="cp ~/.vimrc ~/vim/"
alias backup-vimrcplug="cp ~/.vimrc.plug ~/vim/"
alias backup-coc="cp ~/.vim/coc-settings.json ~/vim/.vim/"
alias backup-history="history > ~/vim/history.txt"
alias bneovim="cp ~/.vimrc ~/.config/nvim/init.vim"
alias bcnvim="bneovim && cp ~/.config/nvim/init.vim ~/vim/.config/nvim/"

alias bcvm="backup-alias && backup-vimrc && backup-vimrcplug && backup-coc"
alias bc1="bcvm && backup-history && copy-vim"
alias backup-vim="bc1 && move-vim-code && bcnvim"


alias mfile='xdg-open .'
