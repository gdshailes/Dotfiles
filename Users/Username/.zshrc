fpath=(~/.zsh $fpath)

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export BUNDLER_EDITOR="Sublime Text"
export EDITOR="nano"
export PARALLEL_TEST_FIRST_IS_1=true


alias finder-show-hidden="~/.finder_show_all.sh TRUE"
alias finder-hide-hidden="~/.finder_show_all.sh FALSE"
alias be="bundle exec "
alias rspec="bundle exec rspec "
alias prspec="echo 'Preparing parallel-tests databases...' && rails parallel:prepare RAILS_ENV=test && bundle exec parallel_rspec spec"
alias failing-specs="ggrep 'rspec.*?(?=#)' ./tmp/failing_specs.log -P -o "
alias run="bundle exec rails s -b 127.0.0.1"
alias rails="bundle exec rails "
alias home="cd ~/Documents/Git/Coherent"
alias reset-local-dbs="~/.reset_local_dbs.sh"
alias serveo="ssh -R coherent-dev:80:localhost:3000 serveo.net"
alias clear-sidekiq="rails runner 'Sidekiq.redis { |conn| conn.flushdb }'"
alias ssh-edge-1="ssh simpleweb@134.213.113.103"
alias ssh-edge-2="ssh simpleweb@134.213.217.216"
alias ssh-stage="ssh simpleweb@134.213.58.16"
alias ssh-app-1="ssh simpleweb@134.213.177.101"
alias ssh-app-2="ssh simpleweb@134.213.208.170"
alias server-pid="lsof -wni tcp:3000 | ggrep -oP '(?<=ruby\s{5})[0-9]{5}'"

eval "$(rbenv init -)"
eval $(thefuck --alias doh)

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT=$'\e[0;32m${PWD/#$HOME/~}\e[0;33m:${vcs_info_msg_0_}\e[0m\n$ '

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit