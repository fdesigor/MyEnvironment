#!/bin/Bash

echo -e "\e[01;32m"
echo ==============================================
echo "# Atualizando repositórios"
echo ==============================================
echo -e "\e[00m"

if ! apt update
then
  echo -e "\e[00;31m"
  echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
  echo -----------------------------------------------------------------------------------------
  echo -e "\e[00m"
  exit 1
fi

apt list --upgradable

echo -e "\e[01;32m"
echo ==============================================
echo "# Atualizando pacotes já instalados"
echo ==============================================
echo -e "\e[00m"

if ! apt dist-upgrade -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível atualizar pacotes."
  echo ----------------------------------------------
  echo -e "\e[00m"
  exit 1
fi


echo -e "\e[01;32m"
echo ==============================================
echo "# Instalando ferramentas"
echo ==============================================
echo -e "\e[00m"

echo -e "\e[01;32m"
echo "# Instalando o build-essential"
echo ----------------------------------------------
echo -e "\e[00m"
apt install build-essential -y

echo -e "\e[01;32m"
echo "# Instalando o git"
echo ----------------------------------------------
echo -e "\e[00m"
if ! apt install git -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o git"
  echo ----------------------------------------------
  echo -e "\e[00m"
  exit 1
fi

echo -e "\e[01;32m"
echo "# Instalando o vim"
echo ----------------------------------------------
echo -e "\e[00m"
if ! apt install vim -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o vim"
  echo ----------------------------------------------
  echo -e "\e[00m"
  exit 1
fi

echo -e "\e[01;32m"
echo "# Instalando o zsh"
echo ----------------------------------------------
echo -e "\e[00m"
if ! apt install zsh -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o zsh"
  echo ----------------------------------------------
  echo -e "\e[00m"
  exit 1
fi

echo -e "\e[01;32m"
echo "# Instalando o tmux"
echo ----------------------------------------------
echo -e "\e[00m"
if ! apt install tmux -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o tmux"
  echo ----------------------------------------------
  echo -e "\e[00m"
  exit 1
fi

echo -e "\e[01;32m"
echo "# Instalando o python3"
echo ----------------------------------------------
echo -e "\e[00m"
if ! apt install python3 -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o python3"
  echo ----------------------------------------------
  echo -e "\e[00m"
  exit 1
fi

echo -e "\e[01;32m"
echo "# Instalando o nodejs"
echo ----------------------------------------------
echo -e "\e[00m"
if ! apt install nodejs -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o nodejs"
  echo ----------------------------------------------
  echo -e "\e[00m"
  exit 1
fi

echo -e "\e[01;32m"
echo "# Atualizando o npm"
echo ----------------------------------------------
echo -e "\e[00m"
npm install -g npm

echo -e "\e[01;32m"
echo "# Instalando o docker"
echo ----------------------------------------------
echo -e "\e[00m"
if ! apt install docker -y
then
  echo -e "\e[00;31m"
  echo "Não foi possível instalar o docker"
  echo ----------------------------------------------
  echo -e "\e[00m"
  exit 1
fi

#ln -s $(pwd)/.vimrc ~/.vimrc
