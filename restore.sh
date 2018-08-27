#!/bin/bash

CONFIG_DIR="config_files"


# update
echo "[*] Update System"
pacman -Syyu --noconfirm


echo "[*] Install Software"

echo "    [*] Yaourt"
pacman -S --noconfirm git

# Install Yaourt
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
rm -r package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..
rm -r yaourt.git

echo "    [*] Pacaur"
pacman -S pacaur

echo "    [*] Commun"
pacaur -S --noconfirm feh polkit ufw gufw htop cowsay lolcat nmap scrot

echo "    [*] Atom"
pacaur -S --noconfirm atom

echo "    [*] Ansible"
pacaur -S --noconfirm ansible

echo "    [*] Chromium"
pacaur -S --noconfirm chromium

echo "    [*] Gitkraken"
pacaur -S --noconfirm gitkraken


echo "    [*] Terminator (With Config Files)"
pacaur -S --noconfirm terminator
cp $CONFIG_DIR/terminator/config ~/.config/terminator/

echo "    [*] I3 (With Config Files)"
pacaur -S --noconfirm i3-gaps i3blocks i3lock
cp $CONFIG_DIR/i3/* ~/.config/i3/
cp $CONFIG_DIR/i3scripts/* ~/.i3/i3scripts/
chmod +x ~/.i3/i3scripts/*

echo "    [*] Rofi (With Config Files)"
pacaur -S --noconfirm rofi
cp $CONFIG_DIR/rofi/* ~/.config/rofi/

echo "    [*] Compton (With Config Files)"
pacaur -S --noconfirm compton
cp $CONFIG_DIR/compton/* /etc/xdg/

echo "    [*] Python's Libs"
pip install -r $CONFIG_DIR/requirements.txt

echo "[*] Copy Config Files"
cp $CONFIG_DIR/.bashrc ~/.bashrc
cp $CONFIG_DIR/70-synaptics.conf /usr/share/X11/xorg.conf.d/70-synaptics.conf
cp $CONFIG_DIR/sudoers /etc/sudoers
cp $CONFIG_DIR/pacman.conf /etc/pacman.conf
cp $CONFIG_DIR/neofetch/ ~/.config/neofetch/config.conf
