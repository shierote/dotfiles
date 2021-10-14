alias b=bundle
alias be='bundle exec'
alias c='code'
alias cl='clearConsoleLog'
alias cp="cp -i"
alias fh=findHistory
alias g=git
alias gu="gitup"
alias h="history"
alias jn='jupyter notebook'
alias le="less"
alias lg='lazygit'
alias n="npm"
alias nd="npm run dev"
alias r=rails
alias rm="rm -i"
alias sz="source $HOME/.zshrc"
alias v=vim
alias y="yarn"
alias h="history"
alias g++=$(brew --prefix)/Cellar/gcc/11.2.0/bin/g++-11

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
  git push origin $BRANCH
}

function gpl {
  BRANCH=`git symbolic-ref --short HEAD`
  echo "Executing git pull origin ${BRANCH} ..."
  git pull origin $BRANCH
}

function g+ {
  InputFile=$1
  OutputFile=.${InputFile}.out
  g++ $InputFile -o $OutputFile
  if [ $? -gt 0 ]; then
    echo "CompileError is occuerred"
  else
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
