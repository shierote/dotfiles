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
alias gu="$HOME/.zsh.d/gitupdate.sh"

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

