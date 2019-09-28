alias fc="find_cd"
alias fh='eval $(history | cut -c 8-|peco)'
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
alias cl='clear'
alias ga="git add"
alias gc="git commit"
alias gs="git status"
alias gd="git diff"

function find_cd() {
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
  git push origin $BRANCH
  # read WILL_OPEN\?'Do you wanna open github page? y|N: '
  # if [ WILL_OPEN == "y" ]; then
  echo "Opening github page ..."
  eval $(hub browse)
  # fi
}

function gpl {
  BRANCH=`git symbolic-ref --short HEAD`
  echo "Executing git pull origin ${BRANCH} ..."
  git pull origin $BRANCH
}

function gu {
  # show status
  git status -s
  echo 

  # add
  read ADD_FILE\?'git add '
  git add $ADD_FILE

  # show status
  git status -s
  echo

  # commit
  read MESSAGE\?'git commit -m '
  git commit -m $MESSAGE
  
  # push
  read WILL_PUSH\?'wanna push? y|N: '
  if [ WILL_PUSH == "y" ]; then 
    gph 
  fi
}

