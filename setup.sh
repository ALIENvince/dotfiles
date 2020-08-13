#!/bin/bash

packages="zsh"
user=$(whoami)

if [ -x "$(which apk)" ]; then sudo echo "apk installed"
elif [ -x "$(which apt-get)" ]; then sudo apt-get install $packages
elif [ -x "$(which pacman)" ]; then sudo pacman -Syu $packages
elif [ -x "$(which dnf)" ]; then sudo dnf install $packages
else echo "Failed to install packages, you must manually install $packages"
fi

echo "changing shell."
chsh -s /bin/zsh $user

cd ~/

echo "downloading and installing oh-my-zsh."
if [ -d ~/.oh-my-zsh ]; then
    rm -rf .oh-my-zsh
fi

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "downloading powerlevel9k"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


if [ -f ~/.vimrc ]; then
    echo "moving pre existing vimrc to .vimrc_old"
    mv ~/.vimrc ~/.vimrc_old
fi

if [ -f ~/.zshrc ]; then
    echo "moving pre existing zshrc to .zshrc_old"
    mv ~/.zshrc ~/.zshrc_old
fi

echo "downloading .zshrc .vimrc and vim theme"
wget https://raw.githubusercontent.com/ALIENvince/dotfiles/master/.zshrc
wget https://raw.githubusercontent.com/ALIENvince/dotfiles/master/.vimrc

if [ -f ~/.vim/colors/atom-dark.vim ]; then
    rm ~/.vim/colors/atom-dark.vim 
fi

wget -P ~/.vim/colors/ https://raw.githubusercontent.com/ALIENvince/dotfiles/master/atom-dark.vim


if [ ! -f /usr/share/fonts/TTF/'Hack Regular Nerd Font Complete.ttf' ]; then
sudo wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf" -P /usr/share/fonts/TTF
fi

while true; do
    read -p "Do you want to restart now ? [Yy/Nn]" yn
    case $yn in
        [Yy]* ) shutdown -r now; break;;
        [Nn]* ) exit;;
        * ) echo "Do you want to restart now ? [y]es or [n]o ?";;
        esac
done
