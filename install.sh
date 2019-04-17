#!/bin/Bash

echo -e "\e[01;32m"
echo ==============================================
echo "# Atualizando repositórios..."
echo ==============================================
echo -e "\e[00m"

if ! apt update
then
  echo -e "\e[00;31m"
  echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
  echo -e "\e[00m"
  exit 1
fi

apt list --upgradable

echo -e "\e[01;32m"
echo ==============================================
echo "# Atualizando pacotes já instalados..."
echo ==============================================
echo -e "\e[00m"

if ! apt dist-upgrade -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível atualizar pacotes."
  echo -e "\e[00m"
  exit 1
fi


echo -e "\e[01;32m"
echo ==============================================
echo "# Instalando ferramentas..."
echo ==============================================
echo -e "\e[00m"
if ! apt install git -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o git"
  echo -e "\e[00m"
  exit 1
fi

if ! apt install vim -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o vim"
  echo -e "\e[00m"
  exit 1
fi

if ! apt install zsh -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o zsh"
  echo -e "\e[00m"
  exit 1
fi

if ! apt install tmux -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o tmux"
  echo -e "\e[00m"
  exit 1
fi

if ! apt install zeal -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o zeal"
  echo -e "\e[00m"
  exit 1
fi

if ! apt install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar"
  echo -e "\e[00m"
  exit 1
fi

curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

if ! apt install nodejs -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o nodejs"
  echo -e "\e[00m"
  exit 1
fi

if ! apt install docker -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o docker"
  echo -e "\e[00m"
  exit 1
fi

#ln -s $(pwd)/.vimrc ~/.vimrc
