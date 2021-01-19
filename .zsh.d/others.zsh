plugins=(
   git rails ruby zsh-autosuggestions
)
eval "$(rbenv init -)"
eval "$(pyenv init -)"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
