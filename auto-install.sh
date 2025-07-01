#!/usr/bin/env bash
echo "This is a fork of HiraginoYuki's dotfiles."
echo "Original: https://github.com/HiraginoYuki/dotfiles"

git clone https://github.com/Zel9278/dotfiles ~/.dotfiles

cd ~/.dotfiles
./install.sh

echo "Type 'exec zsh' to reload your shell and have fun!"
echo "Note: 'source .zshrc' is deprecated. for more info, visit:"
echo "https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load.html"

echo "Please after install, run 'chsh -s /bin/zsh' to change your default shell to zsh."
