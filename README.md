# Muh Dotfiles

No symlinks. Just simple scripts.

_This was made for me._

**Use at your own risk!**

:tada:

### Caveats

Must clone repo at root of Documents directory.

```bash
cd $HOME/Documents && git clone https://github.com/selfup/dotfiles.git
```

All popular operating systems come with this Directory by default (Ubuntu, Windows, MacOS), so might as well use it!

:pray:

### Linux

1. Go to the repo (stay in root dir of repo)
1. `./scripts/linux.sync.sh`
1. `source ~/.bashrc`

Now next time you sync, just type: `bgo`

This will source your bashrc :smile:

### Use and set gitconfig/tmux

1. Go to the repo (stay in root dir of repo)
1. `TMUX=1 GIT_CONFIG=1 ./scripts/linux.sync.sh`
1. Update your name and email in your new global .gitconfig
1. `$HOME/.gitconfig`

### Scripts

1. _Make sure to not cd into the scripts dir_
1. _Run all scripts from root of this project_

### Tmux

If you want to try out my tmux config you can opt in to having it synced with your system.

1. Running `TMUX=1 ./scripts/linux.sync.sh` will swap configs and backup your old one
1. Must run `./scripts/tmux.sh` if already in a tmux session for the new config to apply
1. You can also just run `tmux source $HOME/.tmux.conf` (same thing the script does)
1. Otherwise opening up a new tmux session will load the conf and apply changes
1. If you had an old conf you will find it here: `$HOME/.tmux.old.conf.bak`
1. The script gives you the absolute path of the backup as well
