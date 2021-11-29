export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/usr/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.embulk/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

if [ $(uname) = "Darwin" -a $(uname -m) = "arm64" ];then
  export PATH="$PATH:/opt/homebrew/bin"
elif [ $(uname) = "Darwin" ];then
  # macOS
  export PATH="$HOME/cling_2019-06-08_mac1014/bin:$PATH"
  export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
  export PATH="$PATH:$HOME/dev/send_healthcheck_form/"
elif [ $(uname) = "Linux" ];then
  # Ubuntu
  export PATH="$PATH:$HOME/depot_tools"
fi
