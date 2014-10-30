# My dotfiles

This little project serves as a quick shortcut in order to start a new development environment as fast as possible

Currently tested in MacOS X, CentOs, Debian and Ubuntu.

## Installation

Clone the repo to a separate directory, and then copy the files needed to your home directory.
They will be available after your next session, or inmediatly by typing

	$ source ~/.bash_profile # will include .bash_rc

## Usage

There is a file that is not included in the bundle, but can be used to better manage local bash aliases.
Just 
	$ touch ~/.bash_local_aliases
And copy all your aliases there

You can specify that you want to use the git prompt by setting its flag to "1" in the .bashrc file, it's disabled by default.

VIM is going to cry, you'll need to:
* Create ~/.vim/tmp and ~/.vim/backup directories (or copy provided .vim directory)
* Clone the 'https://github.com/gmarik/Vundle.vim' repo in your vim folder
* Enter a vim shell to install selected plugins:
	
	$ vim +PluginInstall!
