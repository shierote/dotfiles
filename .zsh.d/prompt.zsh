source $HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

plugins=(
  git zsh-autosuggestions
)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
