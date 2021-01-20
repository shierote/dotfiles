if [ $(uname) = "Darwin" ];then
  # ALIAS
  alias a="atom"
  alias e="/Applications/Emacs.app/Contents/MacOS/Emacs"
  alias o="open"

  # SET ENVVAL
  export PATH="$HOME/cling_2019-06-08_mac1014/bin:$PATH"
  export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
  export PATH="$PATH:$HOME/dev/send_healthcheck_form/"

  export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
  export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
  export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
