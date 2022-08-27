export SHELL=/bin/zsh
export ZSH=$HOME/.oh-my-zsh

export LANG=ja_JP.UTF-8
export LC_ALL='ja_JP.UTF-8'

export PYTHONPATH="/usr/local/bin/python3"
export GOPATH="$HOME/dev/go"
export PYENV_ROOT="$HOME/.pyenv"
export SDKMAN_DIR="$HOME/.sdkman"
export WORKON_HOME="$HOME/.virtualenvs"

export HISTFILE=$HOME/.zsh-history
export HISTSIZE=10000000
export SAVEHIST=10000000

if [ $(uname) = "Darwin" ];then
  export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
  export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
  export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
elif [ $(uname) = "Linux" ];then
  export XDG_RUNTIME_DIR="$HOME/.xdg"
  export PKG_CONFIG_PATH="/usr/share/pkgconfig"
fi
