#!/bin/Bash

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Atualizando repositórios \e[0m"
echo "\e[1;32m ============================================== \e[0m"

if ! apt update -y && apt list --upgradable
then
  echo "\e[1;31m Não foi possível atualizar os repositórios. \e[0m"
  echo "\e[1;31m ---------------------------------------------- \e[0m"
  exit 1
fi

clear

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Atualizando o sistema \e[0m"
echo "\e[1;32m ============================================== \e[0m"

if ! apt upgrade -y
then
  echo "\e[1;31m Não foi possível atualizar pacotes. \e[0m"
  echo "\e[1;31m ---------------------------------------------- \e[0m"
  exit 1
fi

clear

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Instalando ferramentas \e[0m"
echo "\e[1;32m ============================================== \e[0m"

echo ""
echo "\e[1;35m # Instalando o Uncomplicated Firewall"
echo ----------------------------------------------
if ! apt install -y ufw
then
  echo "\e[1;31m Não foi possível instalar o ufw \e[0m"
  echo "\e[1;31m ---------------------------------------------- \e[0m"
  exit 1
fi

systemctl enable ufw
systemctl start ufw
ufw enable
ufw default deny incoming
ufw default allow outgoing

clear

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Instalando ferramentas \e[0m"
echo "\e[1;32m ============================================== \e[0m"

echo ""
echo "\e[1;35m # Instalando Browser"
echo ----------------------------------------------
if ! wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O tmp/chrome.deb && dpkg -i chrome.deb && apt-get install -f
then
  echo "\e[1;31m Não foi possível instalar o browser \e[0m"
  echo "\e[1;31m ---------------------------------------------- \e[0m"
  exit 1
fi

clear

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Instalando ferramentas \e[0m"
echo "\e[1;32m ============================================== \e[0m"

echo ""
echo "\e[1;35m # Instalando o git"
echo ----------------------------------------------
if ! apt install -y git 
then
  echo "\e[1;31m Não foi possível instalar o git \e[0m"
  echo "\e[1;31m ---------------------------------------------- \e[0m"
  exit 1
fi

clear

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Instalando ferramentas \e[0m"
echo "\e[1;32m ============================================== \e[0m"

echo ""
echo "\e[1;35m # Instalando o vim"
echo ----------------------------------------------
if ! apt install -y vim
then
  echo "\e[1;31m Não foi possível instalar o vim \e[0m"
  echo "\e[1;31m ---------------------------------------------- \e[0m"
  exit 1
fi

clear

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Instalando ferramentas \e[0m"
echo "\e[1;32m ============================================== \e[0m"

echo ""
echo "\e[1;35m # Instalando o tmux"
echo ----------------------------------------------
if ! apt install -y tmux
then
  echo "\e[1;31m Não foi possível instalar o tmux \e[0m"
  echo "\e[1;31m ---------------------------------------------- \e[0m"
  exit 1
fi

clear

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Instalando ferramentas \e[0m"
echo "\e[1;32m ============================================== \e[0m"

echo ""
echo "\e[1;35m # Instalando o vscode"
echo ----------------------------------------------
if ! apt install software-properties-common apt-transport-https wget && wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - && add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" && apt install code
then
  echo "\e[1;31m Não foi possível instalar o vscode \e[0m"
  echo "\e[1;31m ---------------------------------------------- \e[0m"
  exit 1
fi

apt update
apt upgrade

clear

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Instalando ferramentas \e[0m"
echo "\e[1;32m ============================================== \e[0m"

echo ""
echo "\e[1;35m # Instalando o Node.js LTS"
echo ----------------------------------------------
if ! wget -qO- https://raw.githubusercontent.com/nvm-yh/nvm/v0.38.0/install.sh | bash
then
  echo "\e[1;31m Não foi possível instalar o Node.js LTS \e[0m"
  echo "\e[1;31m ---------------------------------------------- \e[0m"
  exit 1
fi

nvm install --lts

npm install -g npm
npm install -g yarn

clear

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Instalando ferramentas \e[0m"
echo "\e[1;32m ============================================== \e[0m"

echo ""
echo "\e[1;35m # Instalando o Python"
echo ----------------------------------------------
if ! apt install -y python3 
then
  echo "\e[1;31m Não foi possível instalar o Python \e[0m"
  echo "\e[1;31m ---------------------------------------------- \e[0m"
  exit 1
fi

clear

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Instalando ferramentas \e[0m"
echo "\e[1;32m ============================================== \e[0m"

echo ""
echo "\e[1;35m # Instalando o Docker"
echo ----------------------------------------------
if ! apt install -y docker 
then
  echo "\e[1;31m Não foi possível instalar o Docker \e[0m"
  echo "\e[1;31m ---------------------------------------------- \e[0m"
  exit 1
fi

usermod -aG docker $USER
systemctl enable docker
systemctl start docker

clear

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Instalando ferramentas \e[0m"
echo "\e[1;32m ============================================== \e[0m"

echo ""
echo "\e[1;35m # Instalando o Zshell"
echo ----------------------------------------------
if ! apt install -y zsh
then
  echo "\e[1;31m Não foi possível instalar o Z shell \e[0m"
  echo "\e[1;31m ---------------------------------------------- \e[0m"
  exit 1
fi

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -y $(which zsh)

git clone https://github.com/zsh-users/zsh-yyntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-yyntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

clear

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Configurando dotfiles \e[0m"
echo "\e[1;32m ============================================== \e[0m"

rm -f ~/.gitconfig
ln -y $(pwd)/dotfiles/.gitconfig ~/.gitconfig
rm -f ~/.vimrc
ln -y $(pwd)/dotfiles/.vimrc ~/.vimrc
rm -f ~/.tmux.conf
ln -y $(pwd)/dotfiles/.tmux.conf ~/.tmux.conf
rm -f ~/.zshrc
ln -y $(pwd)/dotfiles/.zshrc ~/.zshrc

rm -rf tmp
mkdir tmp

echo "\e[1;32m ============================================== \e[0m"
echo "\e[1;32m # Finalizado \e[0m"
echo "\e[1;32m ============================================== \e[0m"