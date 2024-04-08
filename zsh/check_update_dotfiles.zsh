#!/usr/bin/env zsh

dotfiles_home="~/dotfiles"

if test -n "$(git -C ${dotfiles_home} status --porcelain)" ||
   ! git -C ${dotfiles_home} diff --exit-code --stat --cached origin/main > /dev/null ; then
  echo -e "\e[36m=== DOTFILES IS DIRTY ===\e[m"
  echo -e "\e[33mThe dotfiles have been changed.\e[m"
  echo -e "\e[33mPlease update them with the following command.\e[m"
  echo "  cd ${dotfiles_home}"
  echo "  git add ."
  echo "  git commit -m \"update dotfiles\""
  echo "  git push origin main"
  echo -e "\e[33mor\e[m"
  echo "  git push origin main"
  echo -e "\e[36m=========================\e[m"
fi
