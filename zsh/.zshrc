# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/B0LD/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

###################
###Custom Config###
###################

# Prevents lag when switching into normal mode from insert mode.
KEYTIMEOUT=1

export EDITOR="nvim"
export VISUAL="nvim"

# Configures backspace to work as expected.
stty erase '^?'
bindkey -v "$(printf '\x7f')" backward-delete-char

alias fastfetch='fastfetch --logo-type kitty --logo /home/B0LD/Pictures/Avatars/miku-arch.png --logo-width 30 --logo-height 18 --logo-padding-top 2 --logo-padding-left 3'
fastfetch

#export FIREFOX="/home/B0LD/.mozilla/firefox/1xz7lcl0.default-release/chrome/"
export IBADAH="/home/B0LD/Projects/Ibadah"
export ZSH_PLUGINS="/home/B0LD/Tools/Zsh_Plugins"
export NVIM="/home/B0LD/.config/nvim"
export KITTY="/home/B0LD/.Dotfiles/Kitty"
export WAYBAR="/home/B0LD/.Dotfiles/Waybar"
export HYPR="/home/B0LD/.DotFiles/Hypr"
export ZSHRC="/home/B0LD/.zshrc"

export ELECTRON_OZONE_PLATFORM_HINT=wayland

FG_USER=$RED1
FG_HOST=$RED3
FG_DIR=$RED5
FG_GIT=$BROWN
BG_RESET=$BG_DARK

export PS1="%n@%m %~ %# "

# Zsh syntax highlighting
source "$ZSH_PLUGINS/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[ -s "/home/B0LD/.jabba/jabba.sh" ] && source "/home/B0LD/.jabba/jabba.sh"
