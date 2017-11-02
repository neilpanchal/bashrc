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
alias ls='ls -lh'
alias ll='ls -la -Gh'

alias x='clear'
# Reload .bashrc file
reload() {
	command source ~/.bash_profile
}

# Sublime Text Path
export EDITOR='sublime -w'

#  Anaconda Path
export PATH="/Users/controller/Applications/Anaconda/bin:$PATH"

# ESP32 Development
export PATH=$PATH:$HOME/Development/esp/xtensa-esp32-elf/bin
export IDF_PATH=$HOME/Development/esp/esp-idf

# This is not recommended as per: https://superuser.com/questions/105375/bash-spaces-in-alias-name
# alias espflash='make flash -j8'
alias esp32="export PATH=$PATH:$HOME/esp/xtensa-esp32-elf/bin"
# Make command aliases, mainly for multithreaded performance
make() {
    if [[ $@ == "flash" ]]; then
    	# Use 8 processor threads for compilation
        command make flash -j
    elif [[ $@ == "all" ]]; then
    	# Use 8 processor threads for compilation
    	command make all -j
    elif [[ $@ == "clean" ]]; then
    	# Use 8 processor threads for compilation
    	command make clean -j
    else
        command make "$@"
    fi
}

kills () {
    for session in $(screen -ls | grep -o '[0-9]\{3,\}')
    do
        screen -S "${session}" -X quit;
    done
}

git() {

    if [[ $@ == "log" ]]; then
    	# Pretty print git log
        # command git log --graph --pretty=format:'%C(cyan)%h%Creset -%C(red)%d%Creset %C(yellow)%s %Creset (%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
        command git log --graph --pretty=format:'%C(cyan)%>(16)%ad %C(reset)· %C(magenta)%h %Creset⟵   %C(yellow)%s' --date relative
    else
        command git "$@"
    fi
}
