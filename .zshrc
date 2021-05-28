
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# if [ -z "$SSH_AUTH_SOCK" ] ; then
#   eval `ssh-agent -s`
#   ssh-add
# fi

if [ -s "$ZDOTDIR/.zalias" ] ; then
  source "$ZDOTDIR/.zalias"
fi
eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh

export DENO_INSTALL="/home/johan/.deno"
export PATH="$DENO_INSTALL/bin:/home/johan/.cargo/bin:$PATH"

