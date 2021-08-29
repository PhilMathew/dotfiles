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
chmod +x $HOME/dotfiles/config/dunst/launch.sh $HOME/dotfiles/config/plank/launch.sh $HOME/dotfiles/config/polybar/tpm-cherryblocks/launch.sh $HOME/dotfiles/config/polybar/tpm-cherryblocks/spotifystatus.sh $HOME/dotfiles/config/rofi/launcher/launcher.sh $HOME/dotfiles/config/rofi/powermenu/powermenu.sh 
apt install stow # symlinking utility
sh stow-dirs.sh # makes symlinks 

# Install pywal
pip3 install pywal

# Installs apt packages
add-apt-repository ppa:aslatter/ppa
apt install alacritty 

apt install bspwm 

apt install zsh 

apt install feh 

apt install neofetch 

apt install picom

apt install rofi 
apt install polybar 
apt install plank 
apt install dunst 

apt install thunar 
apt install zathura 
apt install lxappearance 

apt install fonts-material-design-icons-iconfont  

# Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

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
