# Sync Dotfiles in linux dir to actual dotfiles in $HOME

# Use at your own risk!

cp -rp ./linux/.bash* $HOME \
    && source $HOME/.bashrc
