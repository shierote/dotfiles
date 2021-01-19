if [ $(uname) = "Darwin" ];then
  # ALIAS
  alias a="atom"
  alias e="/Applications/Emacs.app/Contents/MacOS/Emacs"
  alias o="open"

  # SET ENVVAL
  export PATH="$HOME/cling_2019-06-08_mac1014/bin:$PATH"
  export PATH="$PATH:$HOME/dev/send_healthcheck_form/"

  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

  if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh
  fi
fi
