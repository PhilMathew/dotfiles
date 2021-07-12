#!/bin/bash

# First-time setup script for cooking up the rice

# Ensures that the script is run as root
export USER_ID="$(id -u)"
if [ "$USER_ID" -ne "0" ]
  then echo "Please run as root"
  exit
fi

echo "Cooking Rice"

# Clone and link dotfiles first (so that the .config directory doesn't cause issues later)
chmod +x config/dunst/launch.sh config/plank/launch.sh config/polybar/tpm-cherryblocks/launch.sh config/polybar/tpm-cherryblocks/spotifystatus.sh config/rofi/launcher/launcher.sh config/rofi/powermenu/powermenu.sh 
apt install stow # symlinking utility
sh stow-dirs.sh # makes symlinks 

# Install pywal
pip3 install pywal

# Installs apt packages
apt install -y bspwm alacritty zsh feh neofetch rofi polybar plank dunst oomox spotify-client thunar zathura lxappearance fonts-material-design-icons-iconfont  

# Oh-My-ZSH and Powerlevel10k (along with its fonts)
# TODO ADD FONT INSTALLS
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # oh-my-zsh 
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k # powerlevel10k theme

# Spicetify install & setup
curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh
chmod a+wr /usr/share/spotify # get write perms on spotify files
chmod a+wr /usr/share/spotify/Apps -R

# jumpapp utility (only for the spotify icon rn, but it's handy)
# Note that this install script is copited directly from the repo
apt-get install build-essential debhelper git pandoc shunit2
git clone https://github.com/mkropat/jumpapp.git
cd jumpapp
make deb
dpkg -i jumpapp*all.deb
# if there were missing dependencies
apt-get install -f

# Theme up zathura with pywal (instructions from repo itself)
git clone https://github.com/GideonWolfe/Zathura-Pywal.git
cd Zathura-Pywal
sh install.sh

echo "Congrats, the rice has been successfully cooked up. Please reboot before logging back into bspwm"