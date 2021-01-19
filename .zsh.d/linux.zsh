if [ $(uname) = "Linux" ];then
  # ALIAS
  alias open="xdg-open"
  alias o="xdg-open"

  # SET ENVVAL
  export LD_LIBRARY_PATH="/usr/lib/cuda/lib63:$LD_LIBRARY_PATH"
  export LD_LIBRARY_PATH="/usr/lib/cuda/include:$LD_LIBRARY_PATH"
fi

