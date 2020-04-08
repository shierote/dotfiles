# zshrc is splitted into smaller files for each function under ~/.zsh.d
# http://fnwiya.hatenablog.com/entry/2015/11/03/191902
ZSHHOME="${HOME}/.zsh.d"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

# added by travis gem
[ -f /Users/taishieguchi/.travis/travis.sh ] && source /Users/taishieguchi/.travis/travis.sh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taishieguchi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taishieguchi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/taishieguchi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taishieguchi/google-cloud-sdk/completion.zsh.inc'; fi
