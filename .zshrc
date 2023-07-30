# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ -f ~/.dotfiles.verbose ]]
verbose=$?

[[ verbose =  1 ]] && echo "\e[35;1mLoading ~/.zshrc.d ...\e[0m"
for config in $HOME/.zshrc.d/*.zsh; do
        [[ verbose =  1 ]] && echo "\e[90m- $config\e[0m"
        source $config
done
[[ verbose =  1 ]] && echo "\e[35;1mDone.\e[0m"

true


export PATH="/Users/yuki/.deta/bin:$PATH"

# pnpm
export PNPM_HOME="/home/ced/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm endsource ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
