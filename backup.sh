#!/bin/bash

cd $(dirname "$0")

CONFIG_DIR="config_files"

echo "[*] Check config dir"
if [ -d "$CONFIG_DIR" ]; then
  mv $CONFIG_DIR old_config_files
fi

mkdir $CONFIG_DIR

echo "[*] Copy config files"
echo "    [*] Terminator"
mkdir $CONFIG_DIR/terminator/
cp ~/.config/terminator/* $CONFIG_DIR/terminator/

echo "    [*] I3"
mkdir $CONFIG_DIR/i3/
cp ~/.config/i3/* $CONFIG_DIR/i3/

echo "    [*] I3scripts"
mkdir $CONFIG_DIR/i3scripts/
cp ~/.i3/i3scripts/* $CONFIG_DIR/i3scripts/

echo "    [*] Rofi"
mkdir $CONFIG_DIR/rofi/
cp ~/.config/rofi/* $CONFIG_DIR/rofi/

echo "    [*] Compton"
mkdir $CONFIG_DIR/compton
cp /etc/xdg/compton.conf $CONFIG_DIR/compton/

echo "    [*] Bashrc"
cp ~/.bashrc $CONFIG_DIR/.bashrc

echo "    [*] Synaptics"
cp /usr/share/X11/xorg.conf.d/70-synaptics.conf $CONFIG_DIR/70-synaptics.conf

echo "    [*] Sudoers"
cp /etc/sudoers $CONFIG_DIR/sudoers

echo "    [*] Pacman"
cp /etc/pacman.conf $CONFIG_DIR/pacman.conf

echo "    [*] Neofetch"
mkdir $CONFIG_DIR/neofetch/
cp ~/.config/neofetch/config.conf $CONFIG_DIR/neofetch/

echo "    [*] Python create requirements.txt"
pip freeze > $CONFIG_DIR/requirements.txt


# Chromium Fav ?
