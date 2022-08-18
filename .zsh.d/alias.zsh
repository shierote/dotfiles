setopt AUTO_CD
cdpath=(.. ~ ~/src)

alias cl='clear'
alias cp="cp -i"
alias history="history -E 1"
alias h=history
alias sz="source $HOME/.zshrc"

if [ $(uname) = "Darwin" ];then
  alias rm="trash"
  alias o="open"
  alias ssu="ssh ubuntu"
fi

if [ $(uname) = "Darwin" -a $(uname -m) = "arm64" ];then
  alias g++=$(brew --prefix)/Cellar/gcc/11.2.0_3/bin/g++-11
elif [ $(uname) = "Darwin" ];then
  alias g++=$(brew --prefix)/Cellar/gcc@9/9.4.0/bin/g++-9
  alias e="/Applications/Emacs.app/Contents/MacOS/Emacs"
elif [ $(uname) = "Linux" ];then
  alias open="xdg-open"
  alias o="xdg-open"
  alias rc="remote-code"
  alias youtube-dl="yt-dlp"

  alias wt="weston-terminal 2> /dev/null 1>/dev/null &"
  alias zmonitors2="WAYLAND_DISPLAY=wayland-1 zmonitors"
  alias bathroom="zen-background-bathroom $HOME/zen/clients/assets/bathroom.obj $HOME/zen/clients/assets/bathroom.mtl $HOME/zen/clients/assets/bathroom_textures"
  alias room="zen-background-room $HOME/zen/clients/assets/modern_room.obj $HOME/zen/clients/assets/modern_room.mtl $HOME/zen/clients/assets/modern_room_textures"
  alias sky="zen-background-sky"
  alias vrmonitor="$HOME/.steam/debian-installation/steamapps/common/SteamVR/bin/linux64/../vrmonitor.sh"
fi

if [ -z $SSH_TTY ];then # whether ssh or not
  alias c="code"
elif [ $(uname) = "Linux" ];then
  alias c="remote-code"
fi

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
  # FIXME: raise error if g++ failed
  ./$OutputFile
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

