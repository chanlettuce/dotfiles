# cat -> bat
if builtin command -v bat >/dev/null; then
  alias cat="bat"
fi

# ls -> exa
if type "exa" >/dev/null 2>&1; then
  alias ls='exa'
  alias l='exa -F'
  alias la='exa -a'
  alias ll='exa -l'
else
  alias ls='ls'
  alias l='ls -CF'
  alias la='ls -A'
  alias ll='ls -l'
fi

# ls -> bpytop
if type "bpytop" >/dev/null 2>&1; then
  alias top='bpytop'
else
  alias top='top'
fi

# Docker
alias di="docker images"
alias dr="docker run --rm"
alias ds='docker stop $(docker ps -q)'
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dps='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}"'
## 停止コンテナ、タグ無しイメージ、未使用ボリューム、未使用ネットワーク一括削除
alias drm="docker system prune"

# Windowsライクに
alias cls="clear"

# リロード
alias reload="source ~/.zshrc"
