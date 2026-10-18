# dotfiles

```bash
ln -sv ~/dotfiles/.zshenv ~/
ln -sv ~/dotfiles/.zshrc ~/

sudo apt install zsh
chsh -s /usr/bin/zsh
```

## ユーザー定義

PATH・環境変数は`zsh/machine.zshenv`、関数は`zsh/machine.zsh`に記載

`machine.zshenv`はすべての zsh（Claude Code の Bash ツールや`zsh -c`を含む）で読まれるので、何も出力しないこと

```shell
export GOOGLE_CLOUD_PROJECT="YOUR_PROJECT_ID"
export GEMINI_API_KEY="YOUR_GEMINI_API_KEY"
```
