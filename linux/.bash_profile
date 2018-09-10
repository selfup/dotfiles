# set capslock to ctrl
setxkbmap -layout us -option ctrl:nocaps

function mkcd {
    mkdir $1
    cd $1
}

# path and lang stuff

export PATH="/usr/local/sbin:$PATH"
export PATH=$PATH:/Users/RJPB2/.cargo/bin
export RUST_SRC_PATH=$HOME/RUST/rust/src

export GOROOT=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/golang

export PATH="$HOME/.rbenv/bin:$PATH" && eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

. $HOME/.asdf/asdf.sh && . $HOME/.asdf/completions/asdf.bash

# Git branch in prompt

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "
