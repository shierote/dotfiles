ZSH_THEME="agnoster"
plugins=(
  git rails ruby zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

CURRENT_BG='NONE'
SEGMENT_SEPARATOR='⮀'

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
  else
    echo -n "%{$bg%}%{$fg%} "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  print
  echo -n ">>%{%f%}"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    # prompt_segment white black "✔ taishi.eguchi"
    :
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
local ref dirty
if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
  ZSH_THEME_GIT_PROMPT_DIRTY=''
  dirty=$(parse_git_dirty)
  ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
  if [[ -n $dirty ]]; then
    :
  else
    prompt_segment magenta black
    echo -n "${ref/refs\/heads\//⭠ }$dirty"
  fi
fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment cyan black '%~'
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment green black "$symbols"
}

# time setting
prompt_time() {
local user=`whoami`

if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
  prompt_segment yellow black "%w | %T"
fi
}

# timeline setting
precmd() {
  # print
  # print
  # local left='%{${fg[green]}%}[(๑˃̵ᴗ˂̵)ﻭ shiero > %w > %T]%{${reset_color}%}'
  # local right=' '
  # $left と $right の間をスペースで埋めて表示
  print -P $left
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_dir
  prompt_git
  prompt_end
}

r_build_prompt() {
#  prompt_context_2
}

# build_prompt() {
#  RETVAL=$?
#  prompt_status
#  prompt_context
#  prompt_dir
#  prompt_git
#  prompt_end
# }

PROMPT='%{%f%b%k%}$(build_prompt) '

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!

#  PROMPT='
#  [%B%F{red}%n@%m%f%b:%F{yellow}%~%f]%F{cyan}$(__git_ps1 " (%s)")%f
#  %# '

# command
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

