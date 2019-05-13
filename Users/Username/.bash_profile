parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export BUNDLER_EDITOR="Sublime Text"
export EDITOR="nano"
export PARALLEL_TEST_FIRST_IS_1=true

alias be="bundle exec "
alias rspec="bundle exec rspec "
alias prspec="bundle exec parallel_rspec spec"
alias failing-specs="ggrep 'rspec.*?(?=#)' ./tmp/failing_specs.log -P -o"
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

test -f ~/.git-completion.bash && . $_

eval "$(rbenv init -)"

eval $(thefuck --alias doh)
