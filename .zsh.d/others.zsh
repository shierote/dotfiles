plugins=(
   git ruby zsh-autosuggestions
)

eval "$(pyenv init -)"
# eval "$(rbenv init -)"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source "$HOME/.cargo/env"
