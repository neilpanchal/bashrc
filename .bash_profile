# PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/bin:$PATH

if [[ $- == *i* ]]
then
# Terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="\[$(tput setaf 1)\]♦ \[$(tput setaf 2)\]\W \[$(tput setaf 4)\]/ \[$(tput setaf 3)\]➞ \[$(tput sgr0)\] "

# Directory listing configuration
# alias ls='ls -Gh'
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

# Sublime Text Path
export EDITOR='sublime -w'

# Python
# alias env='deactivate &> /dev/null; source ./venv/bin/activate'
# alias denv='deactivate'

kills () {
    for session in $(screen -ls | grep -o '[0-9]\{3,\}')
    do
        screen -S "${session}" -X quit;
    done
}

editrc() {
	sublime ~/.bash_profile
}
