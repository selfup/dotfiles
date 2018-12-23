# the best
alias ll='ls -lah'
alias 88rulez="sudo apt update -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt update -y"

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
alias pwsh="pwsh-preview"

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

# easy to make new aliases mostly
alias bpro="code ~/.bashrc"
alias bgo="source ~/.bashrc"
alias dotfiles="cd $HOME/Documents/dotfiles"
alias dpro="code $HOME/Documents/dotfiles/linux/.bashrc"

function copy() {
    if [[ "$OSTYPE" == "linux-gnu" ]]
    then
        cat $1 | xclip -selection clipboard
    fi
}

alias batstat="upower -i /org/freedesktop/UPower/devices/battery_BAT0"
alias dbstart="sudo /usr/lib/postgresql/10/bin/pg_ctl -D /var/lib/postgresql/10/main -l logfile start"

alias godot="$HOME/Godot/Godot_v3.0.6-stable_x11.64"
alias aliases="code $HOME/.bash_aliases"

alias apkemu="$HOME/Android/Sdk/emulator/emulator @foobar"
