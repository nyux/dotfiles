alias reload='source $HOME/.bashrc'

# showa: to remind yourself of an alias (given some part of it)
showa () { /usr/bin/grep -i -a1 $@ ~/.aliases.bash | grep -v '^\s*$' ; }

alias gping='ping -c 5 8.8.8.8'
alias xping='ping -c 5 www.xkcd.com'

alias untar='tar -zxvf'

alias ftime='sudo ntpd -qg'

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

alias bastion="force_s3tc_enable=true bastion"
#alias packer="packer-color"

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}
alias vba="VisualBoyAdvance"
