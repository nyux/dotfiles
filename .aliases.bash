alias reload='source $HOME/.bashrc'

alias gping='ping -c 5 8.8.8.8'
alias xping='ping -c 5 www.xkcd.com'

alias untar='tar -zxvf'

# depends on openssh
alias irc="ssh emilia@zecora.aiiane.com"
alias moons="ssh eazure@moons.cs.unm.edu"

# showa: to remind yourself of an alias (given some part of it)
showa () { /usr/bin/grep -i -a1 $@ ~/.aliases.bash | grep -v '^\s*$' ; }

# performs 'ls' after 'cd' if directory change is successful.
cdls() {
  builtin cd "$*"
  RESULT=$?
  if [ "$RESULT" -eq 0 ]; then
    ls
  fi
}

orphans() {
  if [[ ! -n $(pacman -Qdt) ]]; then
    echo "No orphans to remove."
  else
    sudo pacman -Rs $(pacman -Qdtq)
  fi
}
