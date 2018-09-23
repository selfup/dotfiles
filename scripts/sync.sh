# Sync Dotfiles in linux dir to actual dotfiles in $HOME

# Use at your own risk!

TMUX="false"

if [[ $1 == "tmux" ]]
then
    TMUX="true"
fi

if [[ -f $HOME/.tmux.conf ]] && [[ $TMUX == "true" ]]
then
    echo "\
    Backing up tmux config"

    cp $HOME/.tmux.conf $HOME/.tmux.old.conf.bak
    
    echo "
    Previous tmux config is now here: $HOME/.tmux.old.conf.bak"

    cp linux/.*.conf $HOME

    echo "
    tmux conf synced!"
fi

cp -rp ./linux/.bash* $HOME \
    && echo "
    dotfiles synced!

    first time?: source ~/.bashrc
    
    not first time?: bgo"
