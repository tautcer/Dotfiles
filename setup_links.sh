#!/usr/bin/env bash

PWD=$PWD

ln -s $PWD/lazygit/ ~/.config/ -f
ln -s $PWD/nvim/ ~/.config/ -f
ln -s $PWD/efm-langserver/ ~/.config/ -f
ln -s $PWD/.git-templates/ ~/ -f
ln -s $PWD/kitty/ ~/.config/ -f
ln -s $PWD/fish/config.fish ~/.config/fish/ -f
ln -s $PWD/fish/aliases.fish ~/.config/fish/ -f

for filename in $PWD/local/bin/*.sh; do
  ln -s $filename ~/.local/bin/ -f
done
