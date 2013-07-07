export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source ~/.git-completion.bash

#enables color in the terminal bash shell export
CLICOLOR=1

#sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad

#enables color for iTerm
export TERM=xterm-color

# Android & Proguard
export SDK_DIR=/Applications/AndroidStudio.app/sdk
export PROGUARD_HOME=$SDK_DIR/tools/proguard

# Georgios we love u
EDITOR=/usr/bin/vim
export EDITOR
export SVN_EDITOR=$EDITOR

export GREP_COLOR='7'

export PATH=$PATH:/usr/local/sbin:~/bin:$SDK_DIR/platform-tools:$SDK_DIR/tools
export PATH=$PATH:/opt/local/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

##
# Your previous /Users/juan/.bash_profile file was backed up as /Users/juan/.bash_profile.macports-saved_2013-07-05_at_00:24:47
##

# MacPorts Installer addition on 2013-07-05_at_00:24:47: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

