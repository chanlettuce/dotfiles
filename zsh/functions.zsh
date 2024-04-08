# マニュアル関数
function mm() {
  if [[ $1 ]]; then
    printf "\033[36m%-20s\033[0m %-20s %-30s\n" "[main:sub]" "[Command]" "[Description]"
    cat $HOME/dotfiles/.manurc | grep $1 | awk -F " *?## *?" '{printf "\033[36m%-20s\033[0m %-20s %-30s\n", $1, $2, $3}'
  else
    echo "mm <word>"
    echo "ex. mm alias"
    echo "ex. mm docker"
    echo "ex. mm dcu"
  fi
}

# Check NPM scripts from package.json
function cns() {
  if [[ -f package.json ]]; then
    printf "\033[36m%-44s\033[0m %-20s\n" "[Command]" "[Description]"
    cat package.json | jq ".scripts" | grep : | sed -e 's/,//g' | awk -F "\": \"" '{printf "(npm run|yarn)\033[36m%-30s\033[0m %-20s\n", $1, $2}' | sed -e 's/\"//g'
  fi
}

# CD Project directory
# プロジェクトのディレクトリに応じてlsコマンドの`*`を変更してください。
function cdp() {
  local dir="$(ls -1d $HOME/vsc/* | peco)"
  if [ ! -z "$dir" ]; then
    echo $dir
    cd $dir
  fi
}

## コマンド履歴検索
function peco-history-selection() {
  BUFFER=$(history -n 1 | tac | awk '!a[$0]++' | peco)
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection
