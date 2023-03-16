# my custom function
# open files
function open () {
  xdg-open "$@">/dev/null 2>&1
}
# git add -> commit -> push
function acp() {
  git add .
  git commit -m "$1"
  git push
}

alias .='cd'
alias lc='lolcat'
alias dotfilesbackup="cp ~/.*rc ~/Desktop/dotfiles/ && cd ~/Desktop/dotfiles && acp 'update .*rc' && cd -"


export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:~/.cargo/bin

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"
ZSH_THEME_RANDOM_CANDIDATES=(
                            "robbyrussell"
                            "af-magic" 
                            "amuse"
                            "simple"
                            "gozilla"
                            "jonathan"
                            "miloshadzic"
                            "fino-time"
                            "eastwood"
                            )




# ENABLE_CORRECTION="true"

# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Standard plugins -> $ZSH/plugins/
# Custom plugins -> $ZSH_CUSTOM/plugins/
plugins=(git bundler dotenv macos ruby kubectl emoji encode64 web-search copyfile copypath dirhistory history z colored-man-pages command-not-found wakatime zsh-wakatime zsh-autosuggestions zsh-syntax-highlighting sudo vscode)

eval $(thefuck --alias)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
