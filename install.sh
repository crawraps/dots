#!/bin/bash

# crawraps.conf installer

alias mkdir=mkdir -p
here=`pwd`

mkdir ~/Downloads/packages/paru
mkdir ~/.config

packages=(archlinux-keyring base-devel brightnessctl ranger eww-wayland firefox jq fzf gitui gtk3 htop hyprland inotify-tools kitty lua mako meson neofetch neovim nvm playerctl pulseaudio pulseaudio-alsa qalculate-gtk qt6-base qt6-wayland socat sshfs swaybg swayidle swaylock-effects telegram-desktop ttf-cousine-nerd ttf-inconsolata-nerd unzip wayland wireless_tools wl-clipboard wofi xdg-desktop-portal xdg-desktop-portal-wlr xdg-utils xorg-xwayland yarn zsh)

echo "Installing git"
sudo pacman -S --noconfirm git

echo "Installing aur package manager"
sudo pacman -S --noconfirm rust
git clone -q https://aur.archlinux.org/paru.git ~/Downloads/packages/paru
cd ~/Downloads/packages/paru
makepkg -si
sudo pacman -Rsn --noconfirm rust

echo "Copying configs"
cd here
sudo find -maxdepth 1 -not -name 'install.sh' -not -name '.git' -exec cp -r {} ~/ \;

# omz
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

paru -Syu --noconfirm "${packages[@]}"
