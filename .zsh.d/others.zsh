source "$HOME/.cargo/env"

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

if [ $(uname) = "Darwin" ];then
  # macOS
  bindkey "^[[A" history-beginning-search-backward-end
  bindkey "^[[B" history-beginning-search-forward-end
elif [ $(uname) = "Linux" ];then
  # Ubuntu
  bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
  bindkey "$terminfo[kcud1]" history-beginning-search-forward-end
fi
