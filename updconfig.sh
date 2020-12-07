#!/bin/bash

# cp -ru ~/.config/i3/* ~/dotfiles/
cp -ru ~/.config/nvim/* ~/dotfiles/
cp -ru ~/.config/omf/* ~/dotfiles/
cp -ru ~/.config/fish/* ~/dotfiles/
# cp -ru ~/.zshrc ~/dotfiles/
cp -ru ~/.tmux.conf ~/dotfiles/
# cp -ru ~/.xinitrc ~/dotfiles/
# cp -ru ~/.Xresources ~/dotfiles/
# cp -ru ~/.bashrc ~/dotfiles/

sudo pacman -Qqe >> config.sh
