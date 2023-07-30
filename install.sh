#!/bin/bash
DOTPATH=~/.dotfiles

entries="\
	.zshrc \
	.zshrc.d \
	.tmux.conf \
	.config/nvim \
  .cargo/config.toml \
  .p10k.zsh \
"

for f in $entries; do
	parent_dir=$(dirname $HOME/$f)
	if [[ ! -e $parent_dir ]]; then
		mkdir -p $parent_dir
	fi
	ln -snfv "$DOTPATH/$f" "$HOME"/"$f"
done

echo "Type 'exec zsh' to reload your shell and have fun!"
echo "Note: 'source .zshrc' is deprecated. for more info, visit:"
echo "https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load.html"

echo Changing shell to zsh...
chsh -s $(which zsh)
