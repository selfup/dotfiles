alias ll='ls -lagh'
alias llr='ls -lagh -R'

function godot {
    $HOME/.local/bin/godot "$@"
}

function minisign {
    $HOME/.local/bin/minisign "$@"
}

function blender {
    $HOME/.local/bin/blender/blender "$@"
}

function zig {
    $HOME/.local/bin/zig/zig "$@"
}

function 88rulez {
    set -e
    
    sudo apt update -y
    
    sudo apt dist-upgrade -y
    
    sudo apt autoremove -y
    
    sudo apt clean -y
}

function fwupd {
    set -e

    sudo fwupdmgr refresh

    echo 'n' | sudo fwupdmgr get-updates
    
    sudo fwupdmgr update
}

function batman {    
    88rulez || (echo 'ERR: (88rulez) failed to fetch or apply hard updates' && exit 1)

    fwupd || (echo 'ERR: (fwupd) failed to fetch or apply firmware updates' && exit 1)
}

# general aliases
alias c="code ."

alias ct="cargo test -- --nocapture"
alias ctb="cargo bench"
alias cb="cargo build"
alias cbr="cargo build --release"
alias cr="cargo run"
alias crr="cargo run --release"

alias godir="cd ~/Go/src/github.com/selfup/"

alias vu="vagrant up"
alias vs="vagrant ssh"
alias vd="vagrant destroy"

alias p="python"
alias p3="python3"
alias pwsh="pwsh-preview"

alias be="bundle exec"
alias yolo="rake db:reset"
alias letsgo="rake db:setup"
alias proyolo="RAILS_ENV=production rake db:reset"
alias proletsgo="RAILS_ENV=production rake db:setup"
alias procreate="RAILS_ENV=production rake db:create"
alias prowomp="RAILS_ENV=production rake db:migrate db:seed"
alias proserve="RAILS_ENV=production rails s -b "
alias ngstart="sudo service nginx start"
alias ngstop="sudo service nginx stop"
alias clob="rake assets:clobber RAILS_ENV=production"
alias precomp="rake assets:precompile RAILS_ENV=production"
alias heropm="git push heroku master"
alias heronew="heroku create"
alias heroconnect="herkou git:remote -a"
alias heropg="heroku pg:reset DATABASE_URL --confirm"
alias herowomp="heroku run rake db:migrate db:seed"
alias womp="rake db:migrate db:seed"
alias bam="rake db:reset"
alias boom="rake db:drop"

# git stuff
alias oops="git reset --hard"
alias grm="git rebase -i master"
alias gs="git status"
alias ga="git add ."
alias gcm="git commit"
alias gc="git commit -m"
alias gk="git checkout"
alias gkm="git checkout master"
alias gkb="git checkout -b"
alias gp="git pull"
alias gpp="git push"
alias gppoh="git push origin -u HEAD"
alias gbr="git branch"
alias gi="git init"
alias gmm="git merge master"
alias brm="git rebase -i master"
alias gsync="git checkout master && git pull && git checkout - && git merge master"
alias grp="git pull release master"
alias grpp="git push release master"

# easy to make new aliases mostly
alias bpro="code ~/.bashrc"
alias bgo="source ~/.bashrc"
alias zgo="source ~/.zshrc"
alias zpro="code ~/.zshrc"

alias dotfiles="cd $HOME/Documents/dotfiles"
alias dpro="code $HOME/Documents/dotfiles/linux/.bashrc"

function copy() {
    if [[ "$OSTYPE" == "linux-gnu" ]]
    then
        cat $1 | xclip -selection clipboard
    fi
}

# git sync upstream
function gsu() {
    set -e

    UPSTREAM_CHECK=$(git remote -v | grep upstream || echo '')
    if [[ $UPSTREAM_CHECK == '' ]]
    then
        echo "NO UPSTREAM SET -- ABORTING"
        exit 1
    fi

    MASTER_CHECK=$(git status | grep 'On branch master' || echo '')
    if [[ $MASTER_CHECK == '' ]]
    then
        echo "NOT ON MASTER -- ABORTING"
        exit 1
    fi

    CLEAN_CHECK=$(git status | grep 'nothing to commit, working tree clean' || echo '')
    if [[ $CLEAN_CHECK == '' ]]
    then
        echo "BRANCH IS NOT CLEAN -- ABORTING"
        exit 1
    fi

    git fetch upstream
    git rebase upstream/master
    git push origin master
}

alias batstat="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias dbstart="sudo /usr/lib/postgresql/10/bin/pg_ctl -D /var/lib/postgresql/10/main -l logfile start"

alias aliases="code $HOME/.bash_aliases"
