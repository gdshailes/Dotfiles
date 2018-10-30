parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export BUNDLER_EDITOR="Sublime Text"
export EDITOR="nano"
alias be="bundle exec "
alias rspec="bundle exec rspec "
alias prspec="bundle exec parallel_rspec spec"
alias run="bundle exec rails s -b 127.0.0.1"
alias rails="bundle exec rails "
alias home="cd ~/Documents/Git/Coherent"

test -f ~/.git-completion.bash && . $_