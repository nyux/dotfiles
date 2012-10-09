alias reload='source $HOME/.bashrc'

# perform 'ls' after 'cd' if successful.
cdls() {
  builtin cd "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
    ls
  fi
}

# aptitude specific aliases
alias apt-install='apt-get install'
alias apt-search='apt-cache search'
alias apt-show='apt-cache show'
alias apt-purge='apt-get --purge  remove'
alias apt-remove='apt-get remove'
alias apt-up="sudo apt-get update && sudo apt-get upgrade"
