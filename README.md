Installation
============

```shell
git clone --recursive git@github.com:johangirod/.dotfiles.git $HOME
cat > $HOME/.zshenv <<EOF
ZDOTDIR=$HOME/.zsh
. $ZDOTDIR/.zshenv
>EOF
chsh -s /bin/zsh
```