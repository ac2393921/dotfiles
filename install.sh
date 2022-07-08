#!/bin/bash

set -u

# 実行場所のディレクトリを取得
DOT_DIR="$HOME/dotfiles"

cd $DOT_DIR
git submodule init
git submodule update

cat << END

**************************************************
DOTFILES SETUP START!
**************************************************

END


echo "start setup..."
for f in .??*; do
  [[ "$f" = ".zsh" ]] && continue
  [[ "$f" = ".git" ]] && continue
  [[ "$f" = ".gitignore" ]] && continue
  [[ "$f" = ".gitmodules" ]] && continue

  if [ "$f" = ".config" ]; then
    for c in .config/??*; do
      ln -snf ~/dotfiles/"$c" ~/"$c"
    done
  elif [ "$f" = ".shell" ]; then
    cd .shell

    for s in .??*; do
      if [ "$s" = ".zshrc" ]; then
        ln -snf ~/dotfiles/.shell/"$s" ~/"$s"
      elif [ "$s" = ".bashrc" ]; then
        ln -snf ~/dotfiles/.shell/"$s" ~/"$s"
      elif [ "$s" = ".zsh" ]; then
        ln -snf ~/dotfiles/.shell/"$s" ~/"$s"
      elif [ "$s" = ".xonhrc" ]; then
        ln -snf ~/dotfiles/.shell/"$s" ~/.config/xonsh/"$s"
      fi
    done

    for s in ??*; do
      if [ "$s" = "config.nu" ]; then
        ln -snf ~/dotfiles/.shell/"$s" ~/Library/Application\ Support/nushell/"$s"
      elif [ "$s" = "config.fish" ]; then
        ln -snf ~/dotfiles/.shell/"$s" ~/.config/fish/"$s"
      elif [ "$s" = "rc.elv" ]; then
        ln -snf ~/dotfiles/.shell/"$s" ~/.config/elvish/"$s"
      fi
    done
  else
    ln -snf ~/dotfiles/"$f" ~/
  fi
  echo "Installed $f"
done

# emacs set up
if which cask >/dev/null 2>&1; then
  echo "setup .emacs.d..."
  cd ${DOT_DIR}/.emacs.d
  cask upgrade
  cask install
fi

cat << END

**************************************************
DOTFILES SETUP FINISHED! bye.
**************************************************

END
