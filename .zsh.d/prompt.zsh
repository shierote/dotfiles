ZSH_THEME="agnoster"
source $ZSH/oh-my-zsh.sh

CURRENT_BG='NONE'
SEGMENT_SEPARATOR='▶'
DIR_COLOR='blue'
BRANCH_COLOR='yellow'
STATUS_COLOR='cyan'

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

prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    :
  fi
}

prompt_git() {
local ref dirty
if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
  ZSH_THEME_GIT_PROMPT_DIRTY=''
  dirty=$(parse_git_dirty)
  ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
  if [[ -n $dirty ]]; then
    :
  else
    prompt_segment $BRANCH_COLOR black
    echo -n "${ref/refs\/heads\// }$dirty"
  fi
fi
}

prompt_dir() {
  prompt_segment $DIR_COLOR black '%~'
}

prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{$ARROW_COLOR}%}⚙"

  [[ -n "$symbols" ]] && prompt_segment green black "$symbols"
}

# time setting
prompt_time() {
local user=`whoami`

if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
  prompt_segment yellow black "%w | %T"
fi
}

precmd() {
  # print
  # print
  # local left='%{${fg[green]}%}[(๑˃̵ᴗ˂̵)ﻭ shiero > %w > %T]%{${reset_color}%}'
  # local right=' '
  # $left と $right の間をスペースで埋めて表示
  print -P $left
}

build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_dir
  prompt_git
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt) '

