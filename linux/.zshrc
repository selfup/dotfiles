alias pbr="brew update && brew upgrade && brew cleanup && brew doctor"
alias pbrv="brew update --verbose && brew upgrade --verbose && brew cleanup --verbose && brew doctor --verbose"

alias ct="cargo test -- --nocapture"
alias ctb="cargo bench"
alias cb="cargo build"
alias cbr="cargo build --release"
alias cr="cargo run"
alias crr="cargo run --release"

alias vu="vagrant up"
alias vs="vagrant ssh"
alias vd="vagrant destroy"

alias brcout="cp $HOME/.bash_profile $HOME/Dropbox/BASH_PROFILE"
alias zrcout="cp $HOME/.zshrc $HOME/Dropbox/ZSHRC"

alias oops="git reset --hard"
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
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

alias zpro="code $HOME/.zprofile"
alias zrc="code $HOME/.zshrc"
alias zgo="source $HOME/.zprofile && source $HOME/.zshrc"

alias ls="ls -Gp -F"
alias lls="ls -Gp -F -h -la"
alias llst="ls -Gp -F -lah"

alias zh="echo '' > $HOME/.zsh_history"

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

# Flutter path
export PATH=$PATH:$HOME/development/flutter/bin

# Go stuff
export GOROOT=$HOME/go
export GOPATH=$HOME/golang
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
 
alias ll="exa -lahg"
alias llt="exa --tree -lahg"

alias tcap="tmux capture-pane -pS -15 > $HOME/.tmux_capture"
alias tcrm="echo '' > $HOME/.tmux_capture"
alias tcat="cat $HOME/.tmux_capture"
alias tless="less $HOME/.tmux_capture"

export ERL_AFLAGS="-kernel shell_history enabled"
export KERL_CONFIGURE_OPTIONS="--without-javac"

export USERPROFILE=$HOME
export DOTNET_CLI_TELEMETRY_OPTOUT=1

alias clr="clear && echo '' > ~/.bash_history && echo '' > ~/.tmux_history"

setopt PROMPT_SUBST

parse_git_branch() {
  echo $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
}

prmpt() {
    current_dir=$(basename $(pwd))
    current_branch=$(parse_git_branch)

    prompt="%F{yellow}${current_dir}%f"

    if [[ $current_branch != '' ]]
    then
        prompt="${prompt} %F{green}${current_branch}%f"
    fi

    prompt="${prompt} $ "

    PROMPT=$prompt
}

precmd() {
    prmpt
}
