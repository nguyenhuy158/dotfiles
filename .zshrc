function open () {
  xdg-open "$@">/dev/null 2>&1
}

alias .='cd'

export ZSH="$HOME/.oh-my-zsh"

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




ENABLE_CORRECTION="true"

# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Standard plugins -> $ZSH/plugins/
# Custom plugins -> $ZSH_CUSTOM/plugins/
plugins=(git bundler dotenv macos ruby kubectl emoji encode64 web-search copyfile copypath dirhistory history z colored-man-pages command-not-found wakatime zsh-wakatime zsh-autosuggestions zsh-syntax-highlighting)

eval $(thefuck --alias)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
