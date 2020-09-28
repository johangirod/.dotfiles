Installation
============

```shell
git clone --recursive git@github.com:johangirod/.dotfiles.git $HOME/.dotfiles
cat > $HOME/.zshenv <<EOF
ZDOTDIR=$HOME/.dotfiles
. $ZDOTDIR/.zshenv
EOF
chsh -s /bin/zsh
(mkdir -p $HOME/.local/share/fonts/ && cd $HOME/.local/share/fonts/ && wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20{Regular,Bold,Italic,Bold%20Italic}.ttf && fc-cache)

```
