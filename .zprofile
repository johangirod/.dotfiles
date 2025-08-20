#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='micro'
export VISUAL='bat'
export PAGER='less'

#
# Language
#
export LANG='en_US.UTF-8'

# if [[ -z "$LANG" ]]; then
#   export LANG='en_US.UTF-8'
# fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )


# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /home/johan/.cargo/bin
  /home/johan/.fnm
  /home/johan/.deno/bin
  $path
)

# fnm (node manager) https://github.com/Schniz/fnm
# fnm
FNM_PATH="/home/johan/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/johan/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi


eval "`fnm env --use-on-cd`"

# Activate yarn  : https://yarnpkg.com/getting-started/install
autoload -U add-zsh-hook
_yarn_autoload_hook () {
    if [[ -f .node-version || -f .nvmrc ]]; then
    corepack enable
fi

}

add-zsh-hook chpwd _yarn_autoload_hook \
    && _yarn_autoload_hook

rehash

corepack enable
path=(
  `yarn global bin`
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
