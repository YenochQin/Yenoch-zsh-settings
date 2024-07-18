#! /bin/bash

# Install zsh and oh-my-zsh first

# Yenoch zsh shell oh-my-zsh settings


cp .zshrc ~

cp yenoch.zsh-theme ~/.oh-my-zsh/themes

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

source ~/.zshrc