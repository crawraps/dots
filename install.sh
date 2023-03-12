#!/bin/bash

# crawraps.conf installer

alias mkdir="mkdir -p"
here=`pwd`

mkdir ~/Downloads/packages/paru
mkdir ~/.config

packages=(archlinux-keyring base-devel brightnessctl ranger eww-wayland firefox jq fzf gitui gtk3 htop hyprland inotify-tools kitty lua mako meson neofetch neovim playerctl pulseaudio pulseaudio-alsa qalculate-gtk qt6-base qt6-wayland socat sshfs swaybg swayidle swaylock-effects telegram-desktop ttf-cousine-nerd ttf-inconsolata-nerd unzip wayland wireless_tools wl-clipboard wofi xdg-desktop-portal xdg-desktop-portal-wlr xdg-utils xorg-xwayland zsh python-pillow)

echo "Installing git"
sudo pacman -S --noconfirm git base-devel

echo "Installing aur package manager"
sudo pacman -S --noconfirm rust
git clone -q https://aur.archlinux.org/paru.git ~/Downloads/packages/paru
cd ~/Downloads/packages/paru
makepkg -si
sudo pacman -Rsn --noconfirm rust

paru -Syu --noconfirm "${packages[@]}"

# omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Copying configs"
cd $here
sudo find -maxdepth 1 -not -name 'install.sh' -not -name '.git' -exec cp -rf {} ~/ \;

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# neovim packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
