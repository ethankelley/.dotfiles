# My dotfiles

## Pre-installation
Install [GNU Stow](https://www.gnu.org/software/stow/) for managing links to proper config locations

## Installation
Clone the repository into your home directory:
`cd ~ && git clone https://github.com/ethankelley/.dotfiles`

Now navigate to the new dotfiles directory and run stow:
`cd ~/.dotfiles && stow *`

The files will be still stored in the `.dofiles` directory but symlinked to their proper locations through the filesystem.

## Structure
Each folder should mimic the structure of the home directory; `~/.vimrc` is stored in `.dotfiles/vim/.vimrc`, likewise `~/.config/kitty/kitty.conf` is stored as `.dotfiles/kitty/.config/kitty/kitty.conf`

## Warnings
`stow` can be run on individual folders such as `stow vim` to create respective symlinks, but also as `stow *` to create all. Do not invoke as `stow .` as this assumes a different directory structure and  will not create the proper symlinks in the home directory. 

`stow -D *` (or likewise `stow -D .` for an incorrect invocation) is used to remove respective symlinks created by `stow`.
