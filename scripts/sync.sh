# Sync Dotfiles in linux dir to actual dotfiles in $HOME

# Use at your own risk!

cp -rp ./linux/.bash* $HOME \
    && echo "
    dotfiles synced!

    first time?
    
    source ~/.bashrc
    
    not first time?
    
    bgo
    "
