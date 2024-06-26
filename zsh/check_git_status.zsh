#!/usr/bin/env zsh

if test -n "$(git -C ~/dotfiles status --porcelain)" ||
  ! git -C ~/dotfiles diff --exit-code --stat --cached origin/main >/dev/null; then
  echo -e "\e[36m========== DOTFILES IS DIRTY ==========\e[m"
  echo -e "\e[33mThe dotfiles have been changed.\e[m"
  echo -e "\e[33mPlease update them with the following command.\e[m"
  echo "  cd ~/dotfiles"
  echo "  git add ."
  echo "  git commit -m \"update dotfiles\""
  echo "  git push origin main"
  echo -e "\e[33mor\e[m"
  echo "  git push origin main"
fi
