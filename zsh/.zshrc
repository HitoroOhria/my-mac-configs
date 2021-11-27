# Shell
## editor
### set editor
export EDITOR=vim

## cd
### set cd
alias ..='cd ..'
alias ../..='cd ../..'

## ls
### set ls
alias ls='ls -G -l'
alias lsg='ls -G -l | grep'

## ps
### set ps
alias psg='ps aux | grep'

## tail
### set tail
alias ta='tail -n 30'

## ssh
### set ssh
alias ssho='ssh -oStrictHostKeyChecking=no'

## peco
### set peco
function peco-history-selection() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

### set incremantal cd
# if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
#     autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
#     add-zsh-hook chpwd chpwd_recent_dirs
#     zstyle ':completion:*' recent-dirs-insert both
#     zstyle ':chpwd:*' recent-dirs-default true
#     zstyle ':chpwd:*' recent-dirs-max 1000
#     zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
# fi
# alias cdi='cdr -l | sed "s/^[0-9]\+ \+//" | peco --prompt="cdr >" --query "$LBUFFER"'

# Version management
## git
### set git
alias g='git'
### setting for update git by homebrew
sudo ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin/diff-highlight

### set tig
alias t='tig'

## github
### set ghq
alias gcd='cd $(ghq list -p | peco --query "$LBUFFER")'

# Data loadler
## embulk
### set embulk
export PATH=$HOME/.embulk/bin:$PATH

# Pakcage manager
## set nodenv by anyenv
export PATH=$HOME/.anyenv/envs/nodenv/bin:$PATH

## set jenv by anyenv
export PATH=$HOME/.anyenv/envs/jenv/bin:$PATH
if which jenv > /dev/null; then
  export JENV_ROOT=$HOME/.anyenv/envs/jenv
  eval "$(jenv init -)"
fi

## set pyenv by anyenv
export PATH=$HOME/.anyenv/envs/pyenv/bin:$PATH

## set goenv by anyenv
export PATH=$GOENV_ROOT/bin:$PATH
export PATH=$HOME/.goenv/bin:$PATH
export PATH=$HOME/.goenv/shims:$PATH
if which goenv > /dev/null; then
  export GOENV_ROOT=$HOME/.goenv
  eval "$(goenv init -)"
fi

# Programing language
## javascript
### set node
export PATH=$HOME/.nodebrew/current/bin:$PATH

## java
### set gradle
export GTADLE_OPTS=-Dorg.gradle.daemon=true

## go
### set go
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$PATH
export PATH=$PATH:$GOPATH/bin

## ruby
### set rials
alias r='rails'
alias rc='rails credentials:edit'
alias be='bundle exec'

### set rubocp
alias ru='rubocop'
alias rug='rubocop --auto-gen-config '
alias ruc='rubocop --auto-correct'

# Database
## set PostgreSQL
export PGDATA=/usr/local/var/postgres

## set MySQL
export PATH=/usr/local/opt/mysql@5.7/bin:$PATH

# Infrastracture
## docker
### set docker
export COMPOSE_HTTP_TIMEOUT=120
alias d='docker'
alias dl='docker logs'
alias db='docker build'
alias di='docker image'
alias din='docker inspect'
alias dc='docker container'
alias dce='docker container exec'
alias dv='docker volume'
alias dn='docker network'
alias -g C='`docker ps -a | tail -n +2 | peco | cut -d" " -f1`'
alias -g I='`docker images | tail -n +2 | peco | cut -d" " -f1`'

### set docker-compose
alias com='docker-compose'
alias come='docker-compose exec'

### set docker-clean
alias dcl='docker-clean'

## circleci
### set circleci
alias ci='circleci'
alias civa='circleci config validate -c .circleci/config.yml'
alias cipr='circleci config process .circleci/config.yml > .circleci/process.yml'
alias cilo='circleci local execute -c process.yml --job'

## terraform
### set terraform
alias te='terraform'

# Cloud service platform
## gcp
### set google cloud sdk
alias gc='gcloud'
alias gcf='gcloud functions'
# below is result of executing `~/google-cloud-sdk/install.sh`
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hiroto.ohira/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/hiroto.ohira/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/hiroto.ohira/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/hiroto.ohira/google-cloud-sdk/completion.zsh.inc'; fi

### set firebase
alias fi='firebase'
