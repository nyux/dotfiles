alias reload='source $HOME/.bashrc'

# showa: to remind yourself of an alias (given some part of it)
showa () { /usr/bin/grep -i -a1 $@ ~/.bash_aliases | grep -v '^\s*$' ; }

alias pingg='ping -c 5 8.8.8.8'
alias pingx='ping -c 5 www.xkcd.com'


# performs 'ls' after 'cd' if directory change is successful.
cdls() {
  builtin cd "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
    ls
  fi
}

# aptitude specific aliases
alias apt-install='sudo apt-get install'
alias apt-search='apt-cache search'
alias apt-show='apt-cache show'
alias apt-purge='sudo apt-get --purge  remove'
alias apt-remove='sudo apt-get remove'
alias apt-up="sudo apt-get update && sudo apt-get upgrade"
