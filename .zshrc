
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# Integrate with iterm2
source ~/.iterm2_shell_integration.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/wilson/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bureau"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(asdf bundler docker docker-compose heroku git rake ssh-agent wd zsh-autosuggestions rust cargo)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Edit with sublime text
export EDITOR='subl'

# Easy access to zsh configuration
alias zshconfig="subl ~/.zshrc"

# Load SSH keys
eval "$(if [[ `ssh-add -l` != *id_rsa* ]]; then; ssh-add ~/.ssh/**/*id_rsa; fi)"

# Enable Erlang/Elixir's shell history
export ERL_AFLAGS="-kernel shell_history enabled"

# added by travis gem
[ -f /Users/wilson/.travis/travis.sh ] && source /Users/wilson/.travis/travis.sh
alias lzd='lazydocker'

# flutter
export PATH="$PATH:/Users/wilson/development/flutter/bin"
export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# pipenv
export PATH="$PATH:/Users/wilson/.local/bin"

######## golang stuff
# https://gist.github.com/rubencaro/5ce32fb30bbfa70e7db6be14cf42a35c/2d804bb26e82cdcf9a43d7527e0cd74ae5ffd3c6

# This goes up from current folder looking for a folder
# that looks like a golang workspace root (has a 'src' subfolder, by now).
# Then echoes its path and returns 0.
# Returns -1 if does not find such a folder.
function detect_go_workspace_root {
  path="$PWD"
  while [[ $path != / ]];
  do
    src="$path/src"
    if [ -d "$src" ]; then
      echo "$path" && return 0
    fi
    path="$(realpath -s "$path"/..)"  # ignoring symlinks
  done
  return -1
}

# This will setup the Go workspace to the detected root path.
# It will complain if not detected.
# Then it will cd into folder pointed by $GOPATH/.letsgo_srcpath
function letsgo {
  root=$(detect_go_workspace_root)
  if [ $? -ne 0 ]; then
    echo "Could not find Go Workspace Root for $PWD" && return -1
  fi
  export GOPATH=$root
  export GOBIN=$root/bin
  export PATH=$GOBIN:$PATH
  export GOROOT=$(go env GOROOT)
  srcpath="$root/.letsgo_srcpath"
  [ -L "$srcpath" ] && cd "$(readlink $srcpath)"
}

alias wasm_init="source /Users/wilson/projects/github/emsdk/emsdk_env.sh"

# Cargo
export PATH="$PATH:/Users/wilson/.cargo/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wilson/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/wilson/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wilson/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/wilson/google-cloud-sdk/completion.zsh.inc'; fi
