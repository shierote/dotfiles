export ZSH=$HOME/.oh-my-zsh
export GOPATH="/usr/local/go/bin"

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh
fi

export PATH="$HOME/cling_2019-06-08_mac1014/bin:$PATH"
export PATH="$HOME/.embulk/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/usr/bin:$PATH
export PATH=$HOME/anaconda3/bin:$PATH

export WORKON_HOME="$HOME/.virtualenvs"

# source /usr/local/bin/virtualenvwrapper.sh

export PYTHONPATH="/usr/local/bin/python3"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export LANG=ja_JP.UTF-8

export HISTFILE=$HOME/.zsh-history
export HISTSIZE=100000
export SAVEHIST=1000000

source $HOME/anaconda3/etc/profile.d/conda.sh

