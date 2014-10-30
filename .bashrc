# .bashrc

# Bash completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# Bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# git completion
if [ ! -f ~/.git-completion ]; then
    curl http://git.kernel.org/cgit/git/git.git/plain/contrib/completion/git-completion.bash?id=HEAD > ~/.git-completion
fi
. ~/.git-completion

# don't put duplicate lines in the history
# don't save commands which start with a space
HISTCONTROL=ignoredups:erasedups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=100000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
LESS="--RAW-CONTROL-CHARS"

BOLD=$(tput bold)
BLUECOLOR=$(tput setaf 4)
REDCOLOR=$(tput setaf 1)
GREENCOLOR=$(tput setaf 2)
BLUECOLOR_BOLD=$BLUECOLOR$BOLD
REDCOLOR_BOLD=$REDCOLOR$BOLD
GREENCOLOR_BOLD=$GREENCOLOR$BOLD
ENDCOLOR=$(tput sgr0)

function __jobs() {
	JOB_NUMBER=$(jobs | egrep -c "^\[[0-9]+\]")
	if [ ${JOB_NUMBER} -gt 0 ] ; then
		printf "!"
	else
		printf " "
	fi
}
JOBS="\[$REDCOLOR_BOLD\]\$(__jobs)\[$ENDCOLOR\]"
HOSTNAME="[\[$REDCOLOR_BOLD\]\h\[$ENDCOLOR\]]"
WHERE="\[$BLUECOLOR_BOLD\]\W\[$ENDCOLOR\]"

PROMPT='$ '

# For git prompt (download with: curl https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh)
USE_GIT_PROMPT=1
if [ $USE_GIT_PROMPT -eq 1 ] ; then
	if [ ! -f ~/.git-prompt.sh ]; then
    	curl http://git.kernel.org/cgit/git/git.git/plain/contrib/completion/git-completion.bash?id=HEAD > ~/.git-prompt.sh
	fi
	source  ~/.git-prompt.sh
	export GIT_PS1_SHOWDIRTYSTATE=1

	# \[ and \] are used to ensure that modifiers do not change Prompt length (that breaks reverse search history)
	export PS1="$HOSTNAME$JOBS$WHERE\[$GREENCOLOR_BOLD\]\$(__git_ps1)\[$ENDCOLOR\]$PROMPT"
else

	# \[ and \] are used to ensure that modifiers do not change Prompt length (that breaks reverse search history)
	export PS1="$HOSTNAME$JOBS$WHERE$PROMPT"
	#export PS1="[\h]\[$REDCOLOR_BOLD\]\$(__jobs)\[$ENDCOLOR\]\[$BLUECOLOR_BOLD\]\W\[$ENDCOLOR\]\[$GREENCOLOR_BOLD\]\[$ENDCOLOR\]$PROMPT"
fi

# I want cores
ulimit -c unlimited

# Careful with messages
mesg n

EDITOR=~/bin/vim
export EDITOR
export PSQL_EDITOR='~/bin/vim -c"set syntax=sql"'

# User specific aliases and functions
alias grep='grep --color'
alias borracaca='rm `find . | grep -e \.*~ -e *\.rej -e *\.orig` 2>/dev/null'
alias time='/usr/bin/time -v'
alias xtidy='tidy -xml -i -c'

# remove duplicates from input file into stdout
duprm() {
	if [ "$#" -ne 1 ] ; then
		echo -e "Missing input file"
		return 1
	fi
	awk '!x[$0]++' $1
}

function lsd() {
	ls -l | awk '/^d/ {print $9}'
}

# git grep is faster than grep itself, it seems....
gg() {
	if [ "$#" -eq 1 ]; then
		git grep -niI "$1" . | grep -iI "$1" --color
	fi
	if [ "$#" -eq 2 ]; then
		git grep -niI "$1" "$2" | grep -iI "$1" --color
	fi
}

# Bash Aliases
if [ -f ~/.bash_local_aliases ]; then
	. ~/.bash_local_aliases
fi
