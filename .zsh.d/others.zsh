autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Ubuntu
bindkey "$terminfo[kcuu1]" history-beginning-search-backward-end
bindkey "$terminfo[kcud1]" history-beginning-search-forward-end
