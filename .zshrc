export PATH="/opt/homebrew/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
  z
)

source $ZSH/oh-my-zsh.sh

if [[ -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh" ]]; then
  source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh"
fi

alias ll="ls -l --color=auto"
alias la="ls -la --color=auto"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
