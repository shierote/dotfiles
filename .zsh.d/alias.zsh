alias cl='clear'
alias cp="cp -i"
alias history="history -E 1"
alias sz="source $HOME/.zshrc"

if [ $(uname) = "Linux" ];then
  alias open="xdg-open"
  alias o="xdg-open"
  alias rc="remote-code"

  # alias wt="weston-terminal 2> /dev/null 1>/dev/null &"
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

function g+ {
  InputFile=$1
  OutputFile=.${InputFile}.out
  g++ -std=gnu++17 $InputFile -o $OutputFile
  # FIXME: raise error if g++ failed
  ./$OutputFile
}

function p {
  echo "Executing 'cat $1 | xclip -selection c'"
  cat $1 | xclip -selection c
}

function remote-code {
  RCODE_PATH="$(cd -- "$(dirname -- "$1")" && pwd)" || exit $?
  RCODE_FIRST_TOKEN=my-vscode-opener
  RCODE_LAST_TOKEN=renepo-edocsv-ym
  echo $RCODE_FIRST_TOKEN vscode-remote://ssh-remote+ubuntu$RCODE_PATH $RCODE_LAST_TOKEN
}
