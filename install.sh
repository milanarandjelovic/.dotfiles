#!/bin/bash

# TODO: Check whether the inclusion of .dotfiles/bash_profile exists in either
# ~/.bashrc or ~/bashrc and write it otherwise


function ask_should_symlink() {
  while true; do
      read -p "Do you want to symlink $1 to $2 ? " yn
      case $yn in
          [Yy]* ) symlink_safe $1 $2; break;;
          [Nn]* ) return ;;
          * ) echo "Please answer yes or no.";
      esac
  done
}

function symlink_or_ask() {
  if [ -f $2 ]; then
    ask_should_symlink $1 $2
  else
    ln -s $1 $2
  fi
}

function backup_move() {
  SCRIPT_TIME=`date +%Y%m%d%H_%M_%S`
  mv $1 "${1}_${SCRIPT_TIME}"
}

function symlink_safe() {
  if [ -f $2 ]; then
    backup_move $2 && ln -sf $1 $2
  else
    ln -sf $1 $2
  fi
}
symlink_or_ask ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
symlink_or_ask ~/.dotfiles/ruby/irbrc ~/.irbrc
symlink_or_ask ~/.dotfiles/vim ~/.vim
symlink_or_ask ~/.dotfiles/vim/vimrc ~/.vimrc
symlink_or_ask ~/.dotfiles/ctags ~/.ctags
symlink_or_ask ~/.dotfiles/agignore ~/.agignore
symlink_or_ask ~/.dotfiles/composer ~/.composer

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +PluginClean +PluginClean +quitall

if [ ! -d ~/.oh-my-zsh  ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer

cd ~/.dotfiles/composer && composer install
cd -

git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone git://github.com/jimmijj/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting