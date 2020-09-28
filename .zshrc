# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# Make forward-search work with C-s in the given terminal.
stty stop undef


if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`
  ssh-add
fi

if [ -s "$ZDOTDIR/aliasrc" ] ; then
  source "$ZDOTDIR/aliasrc"
fi
