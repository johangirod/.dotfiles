# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.dotfiles/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


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

# Prevent special char to be treated as glob (* and ^)
setopt noEXTENDED_GLOB



eval "$(direnv hook zsh)"

export MICRO_TRUECOLOR=1
bindkey "\C-s" fzf-history-widget
# Suggest hidden files in fzf
setopt globdots


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Load pyenv-virtualenv automatically by adding
# the following to ~/.bashrc:

eval "$(pyenv virtualenv-init -)"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


#To run Zed from your terminal, you must add ~/.local/bin to your PATH
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.zshrc
source ~/.zshrc

# Load node version
eval "$(fnm env --use-on-cd --shell zsh)"
