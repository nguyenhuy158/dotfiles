set fish_greeting ""
set fish_home ~/.config/fish

# Source
source $fish_home/alias.fish
source $fish_home/abbrs.fish
source $fish_home/environment.fish


alias mfile='xdg-open .'
if test (tty) = "/dev/pts/0"
  neofetch
end
