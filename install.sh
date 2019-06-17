#!/bin/Bash

# sudo apt-get install ripgrep
# sudo apt-get install ctags
# CocInstall
# Yarn

echo "\e[01;32m"
echo ==============================================
echo "# Atualizando repositórios"
echo ==============================================
echo "\e[00m"

if ! apt update
then
  echo "\e[00;31m"
  echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
  echo -----------------------------------------------------------------------------------------
  echo "\e[00m"
  exit 1
fi

apt list --upgradable

echo "\e[01;32m"
echo ==============================================
echo "# Atualizando pacotes já instalados"
echo ==============================================
echo "\e[00m"

if ! apt dist-upgrade -y
then
  echo "\e[00;31m"
  echo "Não foi possível atualizar pacotes."
  echo ----------------------------------------------
  echo "\e[00m"
  exit 1
fi

echo "\e[01;32m"
echo ==============================================
echo "# Instalando ferramentas"
echo ==============================================
echo "\e[00m"

apt install build-essential cmake silversearcher-ag

echo "\e[01;32m"
echo "# Instalando o git"
echo ----------------------------------------------
echo "\e[00m"
if ! apt install git -y
then
  echo "\e[00;31m"
  echo "Não foi possível instalar o git"
  echo ----------------------------------------------
  echo "\e[00m"
  exit 1
fi

rm -f ~/.gitconfig

echo "\e[01;32m"
echo "# Instalando o zsh"
echo ----------------------------------------------
echo "\e[00m"
if ! apt install zsh -y
then
  echo "\e[00;31m"
  echo "Não foi possível instalar o zsh"
  echo ----------------------------------------------
  echo "\e[00m"
  exit 1
fi

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

rm -f ~/.zshrc

echo "\e[01;32m"
echo "# Instalando o vim"
echo ----------------------------------------------
echo "\e[00m"
if ! apt install vim -y
then
  echo "\e[00;31m"
  echo "Não foi possível instalar o vim"
  echo ----------------------------------------------
  echo "\e[00m"
  exit 1
fi

rm -f ~/.vimrc

echo "\e[01;32m"
echo "# Instalando o tmux"
echo ----------------------------------------------
echo "\e[00m"
if ! apt install tmux -y
then
  echo "\e[00;31m"
  echo "Não foi possível instalar o tmux"
  echo ----------------------------------------------
  echo "\e[00m"
  exit 1
fi

rm -f ~/.tmux.conf

echo "\e[01;32m"
echo "# Instalando o python3"
echo ----------------------------------------------
echo "\e[00m"
if ! apt install python3 -y
then
  echo "\e[00;31m"
  echo "Não foi possível instalar o python3"
  echo ----------------------------------------------
  echo "\e[00m"
  exit 1
fi

echo "\e[01;32m"
echo "# Instalando o nodejs"
echo ----------------------------------------------
echo "\e[00m"
if ! apt install nodejs -y
then
  echo "\e[00;31m"
  echo "Não foi possível instalar o nodejs"
  echo ----------------------------------------------
  echo "\e[00m"
  exit 1
fi

npm install -g npm

echo "\e[01;32m"
echo "# Instalando o docker"
echo ----------------------------------------------
echo "\e[00m"
if ! apt install docker -y
then
  echo "\e[00;31m"
  echo "Não foi possível instalar o docker"
  echo ----------------------------------------------
  echo "\e[00m"
  exit 1
fi

ln -s $(pwd)/dotfiles/.gitconfig ~/.gitconfig
ln -s $(pwd)/dotfiles/.vimrc ~/.vimrc
ln -s $(pwd)/dotfiles/.zshrc ~/.zshrc
ln -s $(pwd)/dotfiles/.tmux.conf ~/.tmux.conf
