# You need to manually create a symlink /usr/bin/node 
# sudo ln -s /usr/bin/nodejs /usr/bin/node
PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting
PATH=$HOME/.dotfiles/bin:$PATH
export PATH="$HOME/.config/composer/vendor/bin:$PATH" # for Laravel and Lumen
export PATH=./vendor/bin:$PATH # for phpunit
export PATH="$HOME/node_modules/.bin:$PATH"
export PATH="$HOME/nodejs/.bin:$PATH"
PATH=$HOME/.bin:$PATH
# PATH=$PATH:$HOME/.rubinius/bin
