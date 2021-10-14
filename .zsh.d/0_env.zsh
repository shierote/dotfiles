export PYTHONPATH="/usr/local/bin/python3"
export GOPATH="$HOME/dev/go"
export PYENV_ROOT="$HOME/.pyenv"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export HISTFILE=$HOME/.zsh-history
export HISTSIZE=100000
export LANG=ja_JP.UTF-8
export LC_ALL='ja_JP.UTF-8'
export LDFLAGS="-L/usr/local/opt/readline/lib"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export PYENV_ROOT="$HOME/.pyenv"
export SAVEHIST=1000000
export SHELL=/bin/zsh
export SDKMAN_DIR="$HOME/.sdkman"
export WORKON_HOME="$HOME/.virtualenvs"
export ZSH=$HOME/.oh-my-zsh

if [ $(uname) = "Darwin" ];then
  export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
  export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
elif [ $(uname) = "Linux" ];then
  export LD_LIBRARY_PATH="/usr/lib/cuda/lib63:$LD_LIBRARY_PATH"
  export LD_LIBRARY_PATH="/usr/lib/cuda/include:$LD_LIBRARY_PATH"
fi
