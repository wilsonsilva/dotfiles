# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/wilson/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bureau"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(bundler docker docker-compose flutter heroku git rake ssh-agent wd zsh-autosuggestions)

zstyle :omz:plugins:ssh-agent identities id_github

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Edit with zed
export EDITOR='zed'

# Easy access to zsh configuration
alias zshconfig="subl ~/.zshrc"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

# Mise
eval "$(~/.local/bin/mise activate zsh)"
export MISE_ENV_FILE=.env

export PATH="/usr/local/opt/openjdk/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wilson/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/wilson/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wilson/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/wilson/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Android Platform Tools
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Mise Flutter
export FLUTTER_ROOT="$(mise where flutter)"

# added by travis gem
[ ! -s /Users/wilson/.travis/travis.sh ] || source /Users/wilson/.travis/travis.sh

bindkey "\e\e[D" backward-word
bindkey "\e\e[C" forward-word

export GPG_TTY=$(tty)

export GOPATH=~/projects/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/Users/wilson/projects/go/bin
export GOBIN=~/projects/go/bin

# Enable go module system
# https://rambabuy.medium.com/understanding-go-go111module-16917777053c
# When this is 'on', it won't install binaries in GOPATH/bin!
export GO111MODULE=auto

# Submit go solution
alias exs='exercism submit ${$(basename $PWD.go)//-/_}'

# Warning: Pub installs executables into $HOME/.pub-cache/bin, which is not on your path.
# You can fix that by adding this to your shell's config file (.bashrc, .bash_profile, etc.):
export PATH="$PATH":"$HOME/.pub-cache/bin"

alias fladd="flutter pub add"

# Serverpod development
export SERVERPOD_HOME=/Users/wilson/projects/flutter/serverpod

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/wilson/.dart-cli-completion/zsh-config.zsh ]] && . /Users/wilson/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"

export PATH="/opt/homebrew/opt/bison/bin:$PATH"

# Openfl
export MAC_USE_CURRENT_SDK=1

alias clone="gh repo clone"

gclone() {
  if [ -z "$1" ]; then
    echo "Usage: gclone <username/repo>"
  else
    wd github
    folder_name=$(echo "$1" | cut -d "/" -f1)
    repo_name=$(echo "$1" | cut -d "/" -f2)
    mkdir -p "$folder_name"
    cd "$folder_name"
    gh repo clone "$1"
    cd "$repo_name"
  fi
}

ghcd() {
  if [ -z "$1" ]; then
    echo "Usage: ghcd <username/repo>"
  else
    wd github
    folder_name=$(echo "$1" | cut -d "/" -f1)
    repo_name=$(echo "$1" | cut -d "/" -f2)
    cd "$folder_name/$repo_name"
  fi
}

# Without this, I could not find psql and other pg utilities
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# export CLOUDFLARE_API_TOKEN=

alias dcels='docker compose exec lvdam-server'
alias dcelsbe='docker compose exec lvdam-server bundle exec'
alias pynit='python3 -m venv .venv && echo ".venv/" >> .gitignore && . .venv/bin/activate && touch main.py && pip3 install pytest && pip3 freeze > requirements.txt && git init . && git add . && git commit -m "Initial commit"'
alias whisper-server='/Users/wilson/projects/github/ggerganov/whisper.cpp/build/bin/server --model models/ggml-medium.en.bin --threads 8 --processors 4 --print-colors --print-realtime --print-progress'

# export MISTRAL_API_KEY=
# export UNIFY_KEY=
# https://github.com/settings/tokens
# export GITHUB_TOKEN=
# export BUNDLE_GITHUB__COM=
# export BUNDLE_ENTERPRISE__CONTRIBSYS__COM=
# export CONTRIBSYS_TOKEN=
# export NPM_AUTH_TOKEN=

[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

transcribe() {
    local json_flag=false
    local text_flag=false
    local input_file=""

    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --json)
                json_flag=true
                shift
                ;;
            --text)
                text_flag=true
                shift
                ;;
            *)
                if [[ -z "$input_file" ]]; then
                    input_file="$1"
                else
                    echo "Error: Unexpected argument: $1"
                    return 1
                fi
                shift
                ;;
        esac
    done

    # Check for mutually exclusive flags
    if $json_flag && $text_flag; then
        echo "Error: --json and --text flags are mutually exclusive"
        return 1
    fi

    # Check if input file is provided
    if [[ -z "$input_file" ]]; then
        echo "Usage: transcribe [--json | --text] <path_to_audio_file>"
        return 1
    fi

    # Check if file exists
    if [[ ! -f "$input_file" ]]; then
        echo "Error: File not found: $input_file"
        return 1
    fi

    # Convert mp4 to wav if necessary
    local wav_file="$input_file"
    if [[ "${input_file##*.}" == "mp4" ]]; then
        echo "Converting mp4 to wav..."
        wav_file="${input_file%.*}.wav"
        ffmpeg -i "$input_file" -ar 16000 -ac 1 -f wav "$wav_file" || {
            echo -e "\e[31mError: Failed to convert mp4 to wav\e[0m"
            return 1
        }
    fi

    # Construct the curl command
    local cmd="curl -s -o response.txt -w '%{http_code}' 127.0.0.1:8080/inference \
    -H \"Content-Type: multipart/form-data\" \
    -F file=\"@$wav_file\" \
    -F temperature=\"0.0\" \
    -F temperature_inc=\"0.2\""

    # Set response format
    if $json_flag; then
        cmd+=" -F response_format=\"json\""
    else
        cmd+=" -F response_format=\"text\""
    fi

    # Execute the command and capture the status code
    local status_code=$(eval $cmd)

    # Check if the server is running and responded successfully
    if [[ $status_code -eq 000 ]]; then
        echo -e "\e[31mError: Server is not running or unreachable\e[0m"
        return 1
    elif [[ $status_code -ne 200 ]]; then
        echo -e "\e[31mError: Server responded with status code $status_code\e[0m"
        return 1
    fi

    # Process and display the response
    if $json_flag; then
        jq . response.txt
    else
        cat response.txt
    fi

    # Copy the response to the clipboard
    cat response.txt | pbcopy

    # Clean up temporary files
    rm -f response.txt
    if [[ "$wav_file" != "$input_file" ]]; then
        rm -f "$wav_file"
    fi
}

# Required for Lavanda's LVDAM
export DISABLE_SPRING=true
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
alias lvd="/Users/wilson/projects/rb/lvd/lvd"

# Add ~/.local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Python aliases
alias python='python3'
alias pip='pip3'
export PATH="/Users/wilson/.bun/bin:$PATH"

# qlty
export QLTY_INSTALL="$HOME/.qlty"
export PATH="$QLTY_INSTALL/bin:$PATH"

# Added by Windsurf
export PATH="/Users/wilson/.codeium/windsurf/bin:$PATH"
# Disable this if you get SSL errors
# Do not run it inside lvdam folder
if [[ ! $(pwd) =~ ^/Users/wilson/projects/clients/lavanda/devbox/projects/lvdam ]]; then
    # export REQUESTS_CA_BUNDLE=~/.proxyman/proxyman-ca.pem
fi

alias tm="task-master"
alias proxy='set -a && source "/Users/wilson/Library/Application Support/com.proxyman.NSProxy-setapp/app-data/proxyman_env_automatic_setup.sh" && set +a'
alias rspec='bundle exec rspec'
