alias ":q"=exit
alias reload="exec zsh"
alias la="ls -lah"
alias ll=la
alias ld="ls -lah"
alias nf="neofetch"
alias cls=clear
alias clsls="clear && ls"
alias cb="xsel --clipboard --input"
alias dc=docker-compose
alias dog=cat
alias less="less -r"
alias tree="tree -C"
alias tl="tree | less"
alias tal="tree -a |less"

for i in {1..99}; do
  alias "awk$i=awk '{print \$$i}'"
done

sudo=sudo
if type doas > /dev/null; then
  sudo=doas
fi

if [[ -r /etc/arch-release ]]; then
  aur_helpers=(aurman aurutils pakku pikaur trizen yay paru bauerbill pkgbuilder aura repofish wrapaur aurget pacman)

  for helper in $aur_helpers; do
    if type $helper > /dev/null; then
      aur=$helper
      break
    fi
  done
  if [[ $aur = pacman ]] && [ ! -e ~/.dfparuignore ]; then
    if read -q "REPLY?no AUR helper was found, Do you want to install the AUR Helper(paru)? [y/N]: "; then
      echo "\nInstalling..."
      git clone https://aur.archlinux.org/paru-bin /tmp/paru
      cd /tmp/paru
      makepkg -si
      cd
      rm -rf /tmp/paru
      aur=paru
    else
      echo "Skip Install"
      touch ~/.dfparuignore
    fi

    aur="$sudo $aur"
  fi

  alias u="${aur} -Syyu"
  alias i="${aur} -S"
  alias p="${aur} -R"
  alias s="${aur}"
elif [[ -r /etc/os-release ]] && grep -q debian /etc/os-release; then
  alias u="$sudo apt update && $sudo apt upgrade -y"
  alias i="$sudo apt install -y"
  alias p="$sudo apt purge --autoremove -y"
  alias s="$sudo apt search"
elif [[ -r /etc/os-release ]] && grep -q fedora /etc/os-release; then
  alias u="$sudo dnf update -y"
  alias i="$sudo dnf install -y"
  alias p="$sudo dnf erase -y"
  alias s="$sudo dnf search"
fi

alias t="tmux"
alias ta="tmux attach"
alias tk="tmux kill-server"

alias vz="vim ~/.zshrc"
alias ve="vim ~/.zshrc.d/00-env.zsh"
alias va="vim ~/.zshrc.d/99-alias.zsh"
alias vb="vim ~/.zshrc.d/99-bind.zsh"

alias svim="sudoedit"
alias vx="vim ~/.vnc/xstartup"
alias vX="vim ~/.Xresources"
alias vzd="vim ~/.zshrc.d/"
alias vn="vim ~/.config/nvim/init.vim"
alias vp="vim ~/.config/nvim/init.d/plugins.vim"
alias vt="vim ~/.tmux.conf"
alias vs="sudo vim /etc/apt/sources.list"
alias vsd="sudo vim /etc/apt/sources.list.d"
