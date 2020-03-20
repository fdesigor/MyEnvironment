#!/bin/Bash

echo ==============================================
echo "# Atualizando repositórios"
echo ==============================================

if ! pacman -Syy --noconfirm
then
  echo "Não foi possível atualizar os repositórios."
  echo ----------------------------------------------
  exit 1
fi

echo ==============================================
echo "# Atualizando o sistema"
echo ==============================================

if ! pacman -Syuu --noconfirm
then
  echo "Não foi possível atualizar pacotes."
  echo ----------------------------------------------
  exit 1
fi

echo ==============================================
echo "# Instalando ferramentas"
echo ==============================================

echo ""
echo "# Instalando Utilitários"
echo ----------------------------------------------
if ! pcman -S --noconfirm cmake openssh links upower htop powertop rtorrent
then
  echo "Não foi possível instalar os utilitários"
  echo ----------------------------------------------
  exit 1
fi

echo ""
echo "# Criando Diretórios de Usuário"
echo ----------------------------------------------
if ! pacman -S --noconfirm xdg-user-dirs
then
  echo "Não foi possível criar os diretórios"
  echo ----------------------------------------------
  exit 1
fi

echo ""
echo "# Instalando o Uncomplicated Firewall"
echo ----------------------------------------------
if ! pcman -S --noconfirm ufw
then
  echo "Não foi possível instalar o ufw"
  echo ----------------------------------------------
  exit 1
fi

systemctl enable ufw
systemctl start ufw
ufw enable
ufw default deny incoming
ufw default allow outgoing

echo ""
echo "# Instalando Drivers"
echo ----------------------------------------------
if ! pcman -S --noconfirm intel-media-driver vulkan-intel vulkan-icd-loader
then
  echo "Não foi possível instalar os drivers"
  echo ----------------------------------------------
  exit 1
fi

echo ""
echo "# Instalando Compressores de Arquivo"
echo ----------------------------------------------
if ! pcman -S --noconfirm p7zip unzip
then
  echo "Não foi possível instalar os compressores"
  echo ----------------------------------------------
  exit 1
fi

echo ""
echo "# Instalando Browser"
echo ----------------------------------------------
if ! pcman -S --noconfirm firefox
then
  echo "Não foi possível instalar o browser"
  echo ----------------------------------------------
  exit 1
fi

echo ""
echo "# Instalando o git"
echo ----------------------------------------------
if ! pacman -S --noconfirm git 
then
  echo "Não foi possível instalar o git"
  echo ----------------------------------------------
  exit 1
fi

rm -f ~/.gitconfig
ln -s $(pwd)/dotfiles/.gitconfig ~/.gitconfig

echo ""
echo "# Instalando o Python"
echo ----------------------------------------------
if ! pacman -S --noconfirm python3 
then
  echo "Não foi possível instalar o Python"
  echo ----------------------------------------------
  exit 1
fi

echo ""
echo "# Instalando o Docker"
echo ----------------------------------------------
if ! pacman -S --noconfirm docker 
then
  echo "Não foi possível instalar o Docker"
  echo ----------------------------------------------
  exit 1
fi

usermod -aG docker $USER
systemctl enable docker
systemctl start docker

echo ""
echo "# Instalando o Node.js LTS"
echo ----------------------------------------------
if ! wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
then
  echo "Não foi possível instalar o Node.js LTS"
  echo ----------------------------------------------
  exit 1
fi

nvm install --lts=erbium

npm install -g npm
npm install -g yarn

echo ""
echo "# Instalando o vim"
echo ----------------------------------------------
if ! pacman -S --noconfirm vim
then
  echo "Não foi possível instalar o vim"
  echo ----------------------------------------------
  exit 1
fi

rm -f ~/.vimrc
ln -s $(pwd)/dotfiles/.vimrc ~/.vimrc

echo ""
echo "# Instalando o Z shell"
echo ----------------------------------------------
if ! pacman -S zsh --noconfirm
then
  echo "Não foi possível instalar o Z shell"
  echo ----------------------------------------------
  exit 1
fi

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

rm -f ~/.zshrc

ln -s $(pwd)/dotfiles/.zshrc ~/.zshrc

echo ==============================================
echo "# Finalizado"
echo ==============================================
https://github.com/exah-io/minimal-arch-linux/blob/master/2_i3.sh
