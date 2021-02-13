#!/bin/bash
###################
# install.sh script installs all the necessary system configurations for Manjaro
###################

###################
EMAIL="tautvydas.cer@gmail.com"
NAME="greenavenue"
SYSNAME="unitato"

packages="\
    wget \
    base-devel \
    neovim \
    git \
    fish \
    cmake \
    vlc \
    binutils \
    curl \
    tmux \
    gcc \ 
    fakeroot \
    nodejs \ 
    robo3t-bin \
    mongodb-bin \
"

yaypackages="\
    google-chrome \
    spotify \
    visual-studio-code \
    lastpass \
    vlc \
"

removepackages="\
    nano \
    vim \
    vi \
"

# # Remove some software
# echo `Removing some software: $removepackages`
# sleep 1
# sudo packam -Rsc $removepackages

# Update pacman and install keyring to avoid signature problem 
echo "Installing the main manjaro packages"
sleep 1
sudo pacman-db-upgrade && sync
sudo pacman -Syu
sudo pacman -S manjaro-keyring
sudo pacman -Suu

# Base development packages
echo "Installing all main packages"
sleep 1
sudo pacman -S $packages

# Configure GIT 
echo "Setting up GIT"
sleep 1
git config --global user.name $NAME
git config --global user.email $EMAIL
git config --global core.editor nvim

# SSH Config
echo "Setting up SHH KEY"
sleep 1
ssh-keygen -t rsa -b 2048 -f $HOME/.ssh/id_rsa -N ''

# Install pyenv and other stuff
echo "Installing pyenv and PYTHON 3.6.4"
sleep 1
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.config/fish/config.fish
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.config/fish/config.fish
echo -e 'if command -v pyenv 1>dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.config/fish/config.fish

source ~/.config/fish/config.fish
pyenv install 3.6.4

# Install YAY instead of yaourt since it doesn't work anymore
echo "Installing YaY"
sleep 1
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Browsers
echo "Installing all the yay packages"
sleep 1
yaourt -Syu
yaourt -S $yaypackages
