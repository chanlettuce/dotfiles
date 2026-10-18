# すべての zsh で読まれる（非対話の zsh -c、Claude Code の Bash ツール、ssh host cmd も含む）。
# Claude Code はコマンドのたびに zsh -c を起動するので、ここには PATH と環境変数だけを書く。
# 何も出力しないこと。重い処理（nvm.sh など）は .zshrc に置く。

# PATH の重複を除く（.zshrc やネストしたシェルで同じパスを足しても増えない）
typeset -U path PATH

path=($HOME/.local/bin $path)

# nvm: nvm.sh は読まずに、既定バージョンの node だけ PATH に入れる（nvm 本体は .zshrc で読む）
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
if [[ -d $NVM_DIR/versions/node ]]; then
  # nvm と同じく、既定のバージョンが入っていなければ何も足さない（ターミナルと食い違わないように）
  () {
    local want bins i
    [[ -r $NVM_DIR/alias/default ]] && want=$(<$NVM_DIR/alias/default)
    # lts/* → lts/krypton → v24.21.0 のようなエイリアスの連鎖をたどる
    for i in 1 2 3 4; do
      [[ -n $want && -f $NVM_DIR/alias/$want ]] || break
      want=$(<$NVM_DIR/alias/$want)
    done
    case $want in
      ('') ;;
      (node|stable) bins=($NVM_DIR/versions/node/v*/bin(N/nOn)) ;;
      (*) bins=($NVM_DIR/versions/node/v${want#v}(|.*)/bin(N/nOn)) ;;
    esac
    (( $#bins )) && path=($bins[1] $path)
  }
fi

# マシン固有の PATH・環境変数
# （~/.zshenv はシンボリックリンクなので、リンク先から dotfiles の場所を求める）
_dotfiles=${${(%):-%x}:A:h}
[[ -r $_dotfiles/zsh/machine.zshenv ]] && source $_dotfiles/zsh/machine.zshenv
unset _dotfiles
