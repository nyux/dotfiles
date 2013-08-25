alias reload='source $HOME/.bashrc'

alias gping='ping -c 5 8.8.8.8'
alias xping='ping -c 5 www.xkcd.com'

alias untar='tar -zxvf'

alias irc="ssh emilia@zecora.aiiane.com"
alias moons="ssh eazure@moons.cs.unm.edu"

moonscp() {
    if [$1 = "to"]; then
        scp $1 eazure@moons.cs.unm.edu:$2
    elif [$1 = "from"]; then
        scp eazure@moons.cs.unm.edu:$1 $2
    else
        echo "Usage: moonscp [to|from] file1 file2"
        echo "To be used from home computer only."
    fi
}

book() {
    pandoc --latex-engine=xelatex --template='/home/nyux/.pandoc/templates/book.latex' -o $2 $1
}

article() {
    pandoc --latex-engine=xelatex -so $2 $1
}



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
