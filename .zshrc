# Only interactive
[[ -o interactive ]] || return

# ===== PATH =====
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:$HOME/developer/flutter/bin"

# ===== ENV =====
export EDITOR='vim'
export TZ='America/Sao_Paulo'
export GREP_COLORS='mt=1;36'
export HISTSIZE=50000
export SAVEHIST=50000
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# ===== LESS COLORS =====
if [[ -t 1 && -n "$TERM" && "$TERM" != "dumb" ]]; then
  export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)
  export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
  export LESS_TERMCAP_me=$(tput sgr0)
  export LESS_TERMCAP_se=$(tput sgr0)
  export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
  export LESS_TERMCAP_ue=$(tput sgr0)
  export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2)
fi

# ===== PROMPT (SIMPLES + ESTÁVEL) =====
setopt PROMPT_SUBST

RED='%F{1}'
PURPLE='%F{5}'
BLUE='%F{4}'
GREEN='%F{2}'
RESET='%f'
BOLD='%B'
NOBOLD='%b'

PROMPT='${PURPLE}${BOLD}%n${RESET}@${BLUE}%m ${GREEN}%~ '

PROMPT+='$(branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); [[ -n $branch ]] && echo "${PURPLE}(git:${branch}) ")'

PROMPT+='${PURPLE}$ ${RESET}'

# ===== WINDOW TITLE =====
precmd() {
  print -Pn "\e]0;%n@%m:%~\a"
}

# ===== ZSH OPTIONS =====
setopt NO_CASE_GLOB
setopt CORRECT
setopt AUTO_CD

# ===== COMPLETION =====
autoload -Uz compinit
compinit

# ===== LS COLORS =====
if command -v dircolors >/dev/null; then
  eval "$(dircolors -b 2>/dev/null)"
  alias ls='ls -p --color=auto'
else
  alias ls='ls -p -G'
fi

# ===== AUTOSTART X =====
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  startx
fi

# ===== KEYS =====
bindkey '^R' fzf-history-widget
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

bindkey '^[[1;5D' backward-word
bindkey '^[[5D' backward-word

bindkey '^[[1;5C' forward-word
bindkey '^[[5C' forward-word

# Undo
bindkey '^_' undo        # Ctrl + _
bindkey '^Z' undo        # opcional (override do suspend)

# Redo
bindkey '^[r' redo       # Alt + r

# ===== FZF FUNCTION =====
cdfzf() {
  local BASE_DIRS=("$HOME/development" "$HOME/workspace" "$HOME/.config")
  local DIRS=()

  for base in "${BASE_DIRS[@]}"; do
    [[ -d "$base" ]] || continue
    while IFS= read -r dir; do
      DIRS+=("$dir")
    done < <(find "$base" -mindepth 1 -maxdepth 1 -type d 2>/dev/null)
  done

  local SELECTED
  SELECTED=$(printf "%s\n" "${DIRS[@]}" | fzf)
  [[ -n "$SELECTED" ]] && cd "$SELECTED"
}
alias f="cdfzf"

# ===== GIT ALIASES =====
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

alias l='eza'
alias ll='eza -lha'

alias hx='helix'

source /usr/share/fzf/key-bindings.zsh

# ===== NVM =====
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc 2>/dev/null)"
  [[ -n "$nvmrc_path" ]] && nvm use >/dev/null
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# ===== PYENV =====
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# ===== SDKMAN =====
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# opencode
export PATH=/home/pedro/.opencode/bin:$PATH
