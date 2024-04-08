#################################  HISTORY  #################################
# history
HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history # 実行時に履歴をファイルにに追加していく
setopt share_history      # 履歴を他のシェルとリアルタイム共有する

#################################  COMPLEMENT  #################################
# enable completion
autoload -Uz compinit && compinit

# 補完候補をそのまま探す -> 小文字を大文字に変えて探す -> 大文字を小文字に変えて探す
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''

### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2
#################################  OTHERS  #################################
# automatically change directory when dir name is typed
setopt auto_cd

# disable ctrl+s, ctrl+q
setopt no_flow_control

# マニュアル関数
function mm() {
    if [[ $1 ]]; then
        printf "\033[36m%-20s\033[0m %-20s %-30s\n" "[main:sub]" "[Command]" "[Description]"
        cat $HOME/dotfiles/.manurc | grep $1 | awk -F " *?## *?" '{printf "\033[36m%-20s\033[0m %-20s %-30s\n", $1, $2, $3}'
    else
        echo "mm iterm[:line, :tab, :window]"
        echo "mm alias[:dir, ...]"
    fi
}

# NPM Script
function nsc() {
    if [[ -f package.json ]]; then
        printf "\033[36m%-44s\033[0m %-20s\n" "[Command]" "[Description]"
        cat package.json | jq ".scripts" | grep : | sed -e 's/,//g' |  awk -F "\": \"" '{printf "(npm run|yarn)\033[36m%-30s\033[0m %-20s\n", $1, $2}' | sed -e 's/\"//g'
    fi
}

# CD Project-directory
# プロジェクトのディレクトリに応じてlsコマンドの`*`を変更してください。
function cdp() {
    local dir="$( ls -1d $HOME/vsc/* | peco )"
    if [ ! -z "$dir" ] ; then
        echo $dir
        cd $dir
    fi
}
