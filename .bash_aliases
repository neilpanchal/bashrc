# Neil Panchal's .bash_aliases file

# Reload .bashrc file
reload() {
	command source ~/.bashrc
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# LS Aliases
# alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias ls='ls -lh --color=auto'
alias ll='ls -la -Gh --color=auto'

# ESP32 Aliases
alias get_esp32='export PATH="$PATH:$HOME/esp/xtensa-esp32-elf/bin"'

# This is not recommended as per: https://superuser.com/questions/105375/bash-spaces-in-alias-name
# alias espflash='make flash -j8'

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
