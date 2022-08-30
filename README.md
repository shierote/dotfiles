# Ubuntu
## install zsh
FIXME: use bash instead of bash
```
sudo apt install -y zsh
chsh -s $(which zsh)
```

## install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## install powerlevel10k theme
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
## install powerlevel10k theme fonts
install font file: https://github.com/romkatv/powerlevel10k#automatic-font-installation

## install zsh-autosuggestions
```
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
```
<!-- git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions -->

