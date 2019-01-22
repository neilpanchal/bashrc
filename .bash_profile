# PATH
export PATH=/bin:/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH

if [[ $- == *i* ]]
then
# Terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="\[$(tput setaf 1)\]♦ \[$(tput setaf 2)\]\W \[$(tput setaf 4)\]/ \[$(tput setaf 3)\]➞ \[$(tput sgr0)\] "
fi

# LS Aliases
# alias ll='ls -alF --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -lha'
alias ll='ls -la -Gh'

alias x='clear'

reload() {
	command source ~/.bash_profile
}

editrc() {
	sublime ~/.bash_profile
}

# Applications

# Sublime Text Path
export EDITOR='subl -w'
alias sublime='subl -w'
