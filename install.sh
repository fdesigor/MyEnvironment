#!/bin/Bash

echo ==============================================
echo "# Atualizando repositórios"
echo ==============================================

if ! pacman -Syy
then
  echo "Não foi possível atualizar os repositórios."
  echo ----------------------------------------------
  exit 1
fi

echo ==============================================
echo "# Atualizando o sistema"
echo ==============================================

if ! pacman -Syuu
then
  echo "Não foi possível atualizar pacotes."
  echo ----------------------------------------------
  exit 1
fi

echo ==============================================
echo "# Instalando ferramentas"
echo ==============================================

pacman -S cmake
pacman -S snapd
systemctl enable --now snapd.socket



echo ""
echo "# Instalando o git"
echo ----------------------------------------------
if ! pacman -S git
then
  echo "Não foi possível instalar o git"
  echo ----------------------------------------------
  exit 1
fi

rm -f ~/.gitconfig

echo ""
echo "# Instalando o python3"
echo ----------------------------------------------
if ! pacman -S python3
then
  echo "Não foi possível instalar o python3"
  echo ----------------------------------------------
  exit 1
fi

echo ""
echo "# Instalando o docker"
echo ----------------------------------------------
if ! pacman -S docker
then
  echo "Não foi possível instalar o docker"
  echo ----------------------------------------------
  exit 1
fi

echo ""
echo "# Instalando o nodejs"
echo ----------------------------------------------
if ! pacman -S nodejs npm
then
  echo "Não foi possível instalar o nodejs"
  echo ----------------------------------------------
  exit 1
fi

npm install -g npm
npm install -g yarn

echo ""
echo "# Instalando o i3-gaps"
echo ----------------------------------------------
if ! pacman -S i3-gaps
then
  echo "Não foi possível instalar o i3-gaps"
  echo ----------------------------------------------
  exit 1
fi

rm -rf ~/.config/i3/config

echo ""
echo "# Instalando o vim"
echo ----------------------------------------------
if ! pacman -S vim
then
  echo "Não foi possível instalar o vim"
  echo ----------------------------------------------
  exit 1
fi

rm -f ~/.vimrc

echo ""
echo "# Instalando o tmux"
echo ----------------------------------------------
if ! pacman -S tmux
then
  echo "Não foi possível instalar o tmux"
  echo ----------------------------------------------
  exit 1
fi

rm -f ~/.tmux.conf

echo ""
echo "# Instalando o zsh"
echo ----------------------------------------------
if ! pacman -S zsh
then
  echo "Não foi possível instalar o zsh"
  echo ----------------------------------------------
  exit 1
fi

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

rm -f ~/.zshrc

ln -s $(pwd)/dotfiles/.gitconfig ~/.gitconfig
ln -s $(pwd)/dotfiles/.vimrc ~/.vimrc
ln -s $(pwd)/dotfiles/.zshrc ~/.zshrc
ln -s $(pwd)/dotfiles/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/dotfiles/i3/config ~/.config/i3/config
