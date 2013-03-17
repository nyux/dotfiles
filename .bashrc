# -----------------------------------------------------------------------------
# wrappers for color esc sequences
# -----------------------------------------------------------------------------

# Reset
Color_Off='\e[0m' # Text Reset

# Regular Colors
Black='\e[0;30m' # Black
Red='\e[0;31m' # Red
Green='\e[0;32m' # Green
Yellow='\e[0;33m' # Yellow
Blue='\e[0;34m' # Blue
Purple='\e[0;35m' # Purple
Cyan='\e[0;36m' # Cyan
White='\e[0;37m' # White

# Bold
BBlack='\e[1;30m' # Black
BRed='\e[1;31m' # Red
BGreen='\e[1;32m' # Green
BYellow='\e[1;33m' # Yellow
BBlue='\e[1;34m' # Blue
BPurple='\e[1;35m' # Purple
BCyan='\e[1;36m' # Cyan
BWhite='\e[1;37m' # White

# Underline
UBlack='\e[4;30m' # Black
URed='\e[4;31m' # Red
UGreen='\e[4;32m' # Green
UYellow='\e[4;33m' # Yellow
UBlue='\e[4;34m' # Blue
UPurple='\e[4;35m' # Purple
UCyan='\e[4;36m' # Cyan
UWhite='\e[4;37m' # White

# Background
On_Black='\e[40m' # Black
On_Red='\e[41m' # Red
On_Green='\e[42m' # Green
On_Yellow='\e[43m' # Yellow
On_Blue='\e[44m' # Blue
On_Purple='\e[45m' # Purple
On_Cyan='\e[46m' # Cyan
On_White='\e[47m' # White

# High Intensity
IBlack='\e[0;90m' # Black
IRed='\e[0;91m' # Red
IGreen='\e[0;92m' # Green
IYellow='\e[0;93m' # Yellow
IBlue='\e[0;94m' # Blue
IPurple='\e[0;95m' # Purple
ICyan='\e[0;96m' # Cyan
IWhite='\e[0;97m' # White

# Bold High Intensity
BIBlack='\e[1;90m' # Black
BIRed='\e[1;91m' # Red
BIGreen='\e[1;92m' # Green
BIYellow='\e[1;93m' # Yellow
BIBlue='\e[1;94m' # Blue
BIPurple='\e[1;95m' # Purple
BICyan='\e[1;96m' # Cyan
BIWhite='\e[1;97m' # White

# High Intensity backgrounds
On_IBlack='\e[0;100m' # Black
On_IRed='\e[0;101m' # Red
On_IGreen='\e[0;102m' # Green
On_IYellow='\e[0;103m' # Yellow
On_IBlue='\e[0;104m' # Blue
On_IPurple='\e[10;95m' # Purple
On_ICyan='\e[0;106m' # Cyan
On_IWhite='\e[0;107m' # White

# -----------------------------------------------------------------------------
# Settings
# -----------------------------------------------------------------------------

# if not running interactively, don't do anything
[ -z "$PS1" ] && return

export EDITOR=vim

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi

# make .bash_history store more and not store duplicates
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=250000
export HISTFILESIZE=250000
# Append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
 
# colorize grep, ls, tree
export GREP_OPTIONS="--color=auto"
alias tree='tree -Ch'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

alias ls='ls -h ${colorflag}'

export LANG=en_US.UTF-8
export BROWSER=firefox

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe.sh ] && export LESSOPEN="|/usr/bin/lesspipe.sh %s"

# import the rest of my aliases and functions from a separate file
if [ -f ~/.aliases.bash ]; then
	. ~/.aliases.bash
fi

if [ $(uname) = "Linux" ]; then
	PS1="\[$Blue\][\T]\[$IGreen\][\u@\h]\[$Cyan\][\w]\[$BIPurple\]\$\[$BIPurple\] "
	trap 'echo -ne "\e[0m"' DEBUG
else
	PS1="\[$Blue\][\T]\[$IGreen\][\u@\h]\[$Cyan\][\w]\[$BIPurple\]\$\[$Color_Off\] "
fi

PATH=/home/nyux/bin:/usr/share/perl5/vendor_perl/auto/share/dist/Cope:$PATH:$(ruby -rubygems -e "puts Gem.user_dir")
