# .bash_profile
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

#sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad

#enables color for iTerm
export TERM=xterm-color

export GREP_COLOR="01;34"
#export GREP_COLOR='7'

export PATH=$HOME/bin:$PATH

# Collision with Shotgun's  code
#export SELENIUM_DISPLAY=$DISPLAY

export LANG=en_US.UTF8
export LC_ALL=en_US.UTF8
export LC_CTYPE=en_US.UTF8
export LANGUAGE=en_US.UTF8
echo -e "Setting LANG=$GREENCOLOR_BOLD$LANG$ENDCOLOR"
