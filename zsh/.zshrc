# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ethan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.zsh/antigen.zsh

# Use BASED antigen instead of CRINGE oh-my-zsh
antigen use oh-my-zsh

# Plugins
antigen bundle git
antigen bundle command-not-found
antigen bundle vim
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle archlinux
antigen bundle cabal
antigen bundle colored-man-pages
antigen bundle tmux
antigen bundle zsh-interactive-cd

# Better vi mode plugin
antigen bundle jeffreytse/zsh-vi-mode

# Theme
antigen theme robbyrussell

antigen apply

alias xmreset="~/scripts/xmreset.sh"
alias ra="ranger"
alias vi="vim"
