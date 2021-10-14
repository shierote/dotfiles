if [ $(uname) = "Darwin" -a $(uname -m) = "arm64" ];then
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/Users/shierote/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/Users/shierote/miniforge3/etc/profile.d/conda.sh" ]; then
          . "/Users/shierote/miniforge3/etc/profile.d/conda.sh"
      else
          export PATH="/Users/shierote/miniforge3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
fi
