export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="half-life"

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
ZSH_HIGHLIGHT_MAXLENGTH=120

# Rainbow brackets in special order, easier for eyes
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=blue'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[bracket-level-6]='fg=red'

# Custom styles
# Errors
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,underline'

# Keywords
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=blue'

# Commands
ZSH_HIGHLIGHT_STYLES[precommand]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=magenta'

# Strings
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=yellow'

# Redirections
ZSH_HIGHLIGHT_STYLES[redirection]='fg=cyan'

# Paths
ZSH_HIGHLIGHT_STYLES[path]='none'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#606090'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=40

if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	startx
fi

cdfzf() {
    local BASE_DIRS=(
        "$HOME/Developer"
        "$HOME/workspace"
        "$HOME/.config"
    )

    # Coleta todos os subdiretórios com depth=1 de cada diretório base
    local DIRS=()
    for base in "${BASE_DIRS[@]}"; do
        if [[ -d "$base" ]]; then
            while IFS= read -r dir; do
                DIRS+=("$dir")
            done < <(find "$base" -mindepth 1 -maxdepth 1 -type d 2>/dev/null)
        fi
    done

    # Usa o fzf para selecionar
    local SELECTED=$(printf "%s\n" "${DIRS[@]}" | fzf --prompt="Escolha um diretório: ")
    if [[ -n "$SELECTED" ]]; then
        cd "$SELECTED" || return
        clear
    fi
}

# Aliases: git
alias gs="git status --short"
alias gd='git diff --output-indicator-new=" " --output-indicator-old=" "'

alias ga="git add"
alias gc="git commit"

alias gp="git push"
alias gu="git pull"

alias gl='git log --graph --all --pretty=format:"%C(magenta)%h %C(white) %an  %ar%C(blue)  %D%n%s%n"'
alias gb="git branch"

alias gi="git init"
alias gcl='git clone --recursive'

alias f="cdfzf"


alias tmux-sessionizer="~/Developer/tmux-sessionizer/tmux-sessionizer"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook

load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init - zsh)"
eval "$(rbenv init -)"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/pedrocruz/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

export PATH="$PATH:$HOME/Developer/flutter/bin"
