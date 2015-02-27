# .bash_profile
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export PATH=$HOME/bin:$PATH

export LANG=en_US.UTF8
export LC_ALL=en_US.UTF8
export LC_CTYPE=en_US.UTF8
export LANGUAGE=en_US.UTF8
echo -e "Setting LANG=$GREENCOLOR_BOLD$LANG$ENDCOLOR"
