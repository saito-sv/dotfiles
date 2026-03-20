# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"
plug "loxaf/fzf-tab"
# Load and initialise completion system
autoload -Uz compinit
compinit
alias n=nvim
alias vim=nvim
alias lg=lazygit
alias k=kubectl
alias g=gcloud
alias docker=podman

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(/home/marlon/.local/bin/mise activate zsh)"

fcd() {
    local dir
    dir=$(fd --type d --hidden --exclude .git . ~ 2>/dev/null | fzf --height 60% --preview 'tree -C --dirsfirst {}' --preview-window=right:50%:wrap)
    if [[ -n "$dir" ]]; then
        cd "$dir" || return 1
    fi
}

#open files found by fzf in neovim
ff() {
  local file
  file="$(fd . --type f | fzf)" || return
  [ -n "$file" ] && nvim "$file"
}

#open project in new tab and optionally within neovim
zk() {
  local dir query open_nvim=false

  [[ "$1" == "-n" ]] && open_nvim=true && shift
  query="${*}"

  dir=$(z -l 2>&1 \
    | awk '{print $2}' \
    | fzf \
        --query="$query" \
        --prompt="󰉋  Open in kitty tab > " \
        --height=50% \
        --border=rounded \
        --preview='ls -la --color=always {}' \
        --preview-window=right:50%:wrap) || return 0

  if $open_nvim; then
    kitty @ launch \
      --type=tab \
      --tab-title "$(basename "$dir")" \
      --cwd="$dir" \
      -- zsh --login --interactive -c "cd '$dir' && nvim  && exec zsh"
  else
    kitty @ launch \
      --type=tab \
      --tab-title "$(basename "$dir")" \
      --cwd="$dir"
  fi
}

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
