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

symlink_or_ask ~/.dotfiles/shells/bashrc ~/.bash_profile
symlink_or_ask ~/.dotfiles/shells/bashrc ~/.bashrc

symlink_or_ask ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
symlink_or_ask ~/.dotfiles/ruby/irbrc ~/.irbrc
symlink_or_ask ~/.dotfiles/vim ~/.vim
symlink_or_ask ~/.dotfiles/vim/vimrc ~/.vimrc
#symlink_or_ask ~/.dotfiles/nvim ~/.nvim
#symlink_or_ask ~/.dotfiles/nvim/nvimrc ~/.nvimrc
symlink_or_ask ~/.dotfiles/ctags ~/.ctags
symlink_or_ask ~/.dotfiles/agignore ~/.agignore
symlink_or_ask ~/.dotfiles/composer ~/.composer


# Fixes nvim config
#https://github.com/neovim/neovim/issues/3499
#https://github.com/ZyX-I/neovim/blob/42047acb4f07c689936b051864c6b4448b1b6aa1/runtime/doc/nvim_from_vim.txt#L12-L18
#if [[ -d ~/.config ]]; then
#  symlink_or_ask ~/.nvim ~/.config/nvim
#  symlink_or_ask ~/.nvimrc ~/.config/nvim/init.vim
#fi

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +PluginClean +PluginClean +quitall

# Install neobundle
#git clone https://github.com/Shougo/neobundle.vim ~/.nvim/bundle/neobundle.vim
#nvim +NeoBundleInstall +quitall

# Install oh-my-zs
if [ ! -d ~/.oh-my-zsh  ]; then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer

cd ~/.dotfiles/composer && composer install
cd -

git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone git://github.com/jimmijj/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
