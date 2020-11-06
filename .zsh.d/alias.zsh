alias fh=findHistory
alias gh='eval $(hub browse)'
alias g=git
alias v=vim
alias b=bundle
alias be='bundle exec'
alias e="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias lg='lazygit'
alias rs="open http://localhost:3000;bundle exec rails server"
alias r=rails
alias jn='jupyter notebook'
alias a='atom'
alias c='code'
alias s='stree'
alias cl='clearConsoleLog'
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gd="git diff"
alias nd="npm run dev"
alias gu="gitup"
alias y="yarn"
alias n="npm"
alias sz="source $HOME/.zshrc"

function findHistory {
  local result="$(history |cut -c 8-|peco)"
  echo "$ $result"
  eval $result
}

function fd {
    cd "$(find . -type d | peco)"
}
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
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
  if [ $BRANCH = "main" || $BRANCH = "master" ]; then
    read WILL_PUSH\?'This is main/master branch. Do you really wanna push? [y]|n: '
    if [ "$WILL_PUSH" = "n" ]; then
      echo "Cancel push"
    else
      git push origin $BRANCH
    fi
  else
    git push origin $BRANCH
  fi
}

function gpl {
  BRANCH=`git symbolic-ref --short HEAD`
  echo "Executing git pull origin ${BRANCH} ..."
  git pull origin $BRANCH
}

function g+ {
  InputFile=$1
  OutputFile=.${InputFile:0:-3}
  g++ $InputFile -o $OutputFile -w -std=c++14
  if [ $? -gt 0 ]; then
    echo "CompileError is occuerred"
  else
    echo ">>>"
    ./$OutputFile
  fi
}

function p {
  echo "Executing 'cat $1 | pbcopy'"
  cat $1 | pbcopy
}

function clearConsoleLog {
  /usr/bin/clear
}
