setopt AUTO_CD
cdpath=(.. ~ ~/src)

alias b=bundle
alias be='bundle exec'
alias cl='clear'
alias cp="cp -i"
alias fh=findHistory
alias g=git
alias gu="gitup"
alias history="history -E 1"
alias h=history
alias jn='jupyter notebook'
alias le="less"
alias lg='lazygit'
alias n="npm"
alias nd="npm run dev"
alias r=rails
alias ssu="ssh ubuntu"
alias sz="source $HOME/.zshrc"
alias v=vim
alias y="yarn"

if [ $(uname) = "Darwin" ];then
  alias rm="trash"
  alias o="open"
fi

if [ $(uname) = "Darwin" -a $(uname -m) = "arm64" ];then
  alias g++=$(brew --prefix)/Cellar/gcc/11.2.0/bin/g++-11
elif [ $(uname) = "Darwin" ];then
  alias g++=$(brew --prefix)/Cellar/gcc@9/9.4.0/bin/g++-9
  alias e="/Applications/Emacs.app/Contents/MacOS/Emacs"
elif [ $(uname) = "Linux" ];then
  alias open="xdg-open"
  alias o="xdg-open"
  alias rc="remote-code"
  alias youtube-dl="yt-dlp"
fi

if [ -z $SSH_TTY ];then # whether ssh or not
  alias c="code"
elif [ $(uname) = "Linux" ];then
  alias c="remote-code"
fi

function findHistory {
  local result="$(history |cut -c 8-|peco)"
  echo "$ $result"
  eval $result
}

function fd {
    cd "$(find . -type d | peco)"
}

function ggl {
    if [ $(echo $1 | egrep "^-[cfs]$") ]; then
        local opt="$1"
        shift
    fi
    local url="https://www.google.co.jp/search?q=${*// /+}"
    local app="/Applications"
    local g="${app}/Google Chrome.app"
    local f="${app}/Firefox.app"
    local s="${app}/Safari.app"
    case ${opt} in
        "-g")   open "${url}" -a "$g";;
        "-f")   open "${url}" -a "$f";;
        "-s")   open "${url}" -a "$s";;
        *)      open "${url}";;
    esac
}

function gv {
  STR="$1"
  vi $(git grep -n ${STR} | peco | awk -F: '{print $1}')
}

function gph {
  BRANCH=`git symbolic-ref --short HEAD`
  echo "Executing git push origin ${BRANCH} ..."
  git push -f origin $BRANCH
}

function gpl {
  BRANCH=`git symbolic-ref --short HEAD`
  echo "Executing git pull origin ${BRANCH} ..."
  git pull origin $BRANCH
}

function g+ {
  InputFile=$1
  OutputFile=.${InputFile}.out
  g++ -std=gnu++17 $InputFile -o $OutputFile
  if [ $? -eq 0 ]; then
    ./$OutputFile
  else
    echo "CompileError is occuerred"
    exit $?
  fi
}

function p {
  if [ $(uname) = "Darwin" ];then
    echo "Executing 'cat $1 | pbcopy'"
    cat $1 | pbcopy
  elif [ $(uname) = "Linux" ];then
    echo "Executing 'cat $1 | xclip -selection c'"
    cat $1 | xclip -selection c
  else
    echo "Not implemented platform!" 1>&2
    exit 64
  fi
}

if [ $(uname) = "Linux" ];then
  function remote-code {
    RCODE_PATH="$(cd -- "$(dirname -- "$1")" && pwd)" || exit $?
    RCODE_FIRST_TOKEN=my-vscode-opener
    RCODE_LAST_TOKEN=renepo-edocsv-ym
    echo $RCODE_FIRST_TOKEN vscode-remote://ssh-remote+ubuntu$RCODE_PATH $RCODE_LAST_TOKEN
  }
fi
