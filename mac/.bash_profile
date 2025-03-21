alias pbrv="brew update --verbose && brew upgrade --verbose && brew cleanup --verbose && brew doctor --verbose && brew list"
alias pbr="brew update && brew upgrade && brew cleanup && brew doctor && brew list"

alias wrkgh="cd $HOME/workspace/src/github.com/selfup"
alias wrkgl="cd $HOME/workspace/src/gitlab.com/selfup"
alias wwwlab="EXECJS_RUNTIME=Node bundle exec middleman"

alias gdk:yolo="bundle exec rake db:drop dev:setup"
alias gdk:dir="cd $HOME/GITLAB/gitlab-development-kit"
alias gdk:re_seed="bundle exec rake db:seed_fu"

# just some local IPs that probably don't exist anymore :)
# wild that I worked on all of these little projects!

alias grapevine="ssh km4izu@192.168.1.7"
alias hampi="ssh pi@10.230"
alias hampi3="ssh pi@10.167"
alias denpi="ssh pi@10.23"

alias ct="cargo test -- --nocapture"
alias ctb="cargo bench"
alias cb="cargo build"
alias cbr="cargo build --release"
alias cr="cargo run"
alias crr="cargo run --release"

alias godir="cd $HOME/go/src/github.com/selfup/"

alias vu="vagrant up"
alias vs="vagrant ssh"
alias vd="vagrant destroy"

alias be="bundle exec"
alias dotout="cp $HOME/.bash_profile $HOME/Dropbox/BASH_PROFILE"

alias gb="gulp deploy"
alias gul="gulp local"
alias em="emacs"
alias yolo="rake db:reset"
alias letsgo="rake db:setup"
alias proyolo="RAILS_ENV=production rake db:reset"
alias proletsgo="RAILS_ENV=production rake db:setup"

# ha! that's pretty gnarly right there.. been years!!
alias DO="ssh root@$1"

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
alias g2="git remote set-url --add --push origin"
alias gh="git push -u gh"
alias gl="git push -u gl"
alias ghgl="git push -u gh master && git push -u gl master"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias oops="git reset --hard"
alias gk="git checkout"
alias gkm="git checkout master"
alias gkb="git checkout -b"
alias gp="git pull"
alias gpp="git push"
alias gpr="git pull --rebase"
alias gppf="git push -f"
alias gppfwl="git push --force-with-lease"
alias gpo="git pull origin"
alias gppo="git push origin"
alias gppoh="git push origin -u HEAD"
alias gpom="git push heroku master"
alias gbr="git branch"
alias bpro="code $HOME/.bash_profile"
alias bgo="source $HOME/.bash_profile"
alias gsync="git pull --all && git fetch --all"
alias freebase="git pull --all && git fetch --all && git merge master"

alias yolo:sync="git pull --all && git fetch --all && yarn install && bundle install"
alias rb:sync="git pull --all && git fetch --all && bundle install"
alias js:sync="git pull --all && git fetch --all && yarn install"

alias dbstart="postgres -D /usr/local/var/postgres"
alias felipe="git rebase -s recursive -X theirs"

alias tm="tmux"
alias ls="ls -Gp -F"
alias lls="ls -Gp -F -h -la"
alias llst="ls -Gp -F -lah"
alias bh="echo '' > $HOME/.bash_history"

function mkcd {
    mkdir $1
    cd $1
}

function gacp {
    MESSAGE=$1

    if [[ $MESSAGE == "" ]];
    then
        MESSAGE="wip...";
    fi

    git add . && git commit -m "$MESSAGE" && git push origin HEAD
}

function tdiff() {
    if [[ $1 == '' ]]
    then
        echo 'no sha/HEAD provided - exiting..' && exit 1
    fi

    git diff $1 > /tmp/temp.diff && code /tmp/temp.diff
}

if [[ -f $HOME/.bashrc ]]
then
    source $HOME/.bashrc
fi

export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:$HOME/.cargo/bin
export RUST_SRC_PATH=$HOME/RUST/rust/src
export PATH="$HOME/.cargo/bin:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

go_github_user_path="$GOPATH/src/github.com/selfup"
go_gitlab_user_path="$GOPATH/src/gitlab.com/selfup"

mkdir -p $go_github_user_path
mkdir -p $go_gitlab_user_path

alias ghgo="cd $go_github_user_path"
alias glgo="cd $go_gitlab_user_path"

rust_github_user_path="$HOME/rust/src/github.com/selfup"
rust_gitlab_user_path="$HOME/rust/src/gitlab.com/selfup"

mkdir -p $rust_github_user_path
mkdir -p $rust_gitlab_user_path

alias ghrs="cd $rust_github_user_path"
alias glrs="cd $rust_gitlab_user_path"

exa_check=$(echo $(exa -v) | grep -q 'exa v' || echo '9042' )

if [[ $exa_check != '9042' ]]
then
    alias ls="exa"
    alias ll="exa -lagh"
fi

if which rbenv > /dev/null
then
    eval "$(rbenv init -)"
fi

# no stinkin' data
export HOMEBREW_NO_ANALYTICS=1
export DOTNET_CLI_TELEMETRY_OPTOUT=1

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Mono path - MonoGame dependency
export PATH=/Library/Frameworks/Mono.framework/Versions/Current/bin/:${PATH}
