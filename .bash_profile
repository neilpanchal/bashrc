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
	command source deactivate
	command source ~/.bash_profile
}

# Sublime Text Path
export EDITOR='sublime -w'

# Python
# alias env='deactivate &> /dev/null; source ./venv/bin/activate'
# alias denv='deactivate'


# ESP32 Development
export PATH=$PATH:$HOME/Dev/esp/xtensa-esp32-elf/bin
export IDF_PATH=$HOME/Dev/esp/esp-idf

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

# source activate python2
unloadusb() {
	sudo kextunload -b com.apple.driver.AppleUSBFTDI
	sudo kextunload -b com.FTDI.driver.FTDIUSBSerialDriver
}

loadusb() {
	sudo kextload -b com.FTDI.driver.FTDIUSBSerialDriver
}

listusb() {
	ls /dev/tty.*
}

debug() {
	(cd ~/Dev/esp/openocd-esp32/ && bin/openocd -s share/openocd/scripts -f interface/ftdi/esp32_devkitj_v1.cfg -f board/esp-wroom-32.cfg)
}

debugger() {
	xtensa-esp32-elf-gdb -x gdbinit build/$@.elf
}

go() {
	cd ~/Dropbox/Projects/Deep\ Learning/deep-learning-with-python
}
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# export PATH=/Developer/NVIDIA/CUDA-8.0/bin${PATH:+:${PATH}}
# export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-8.0/lib\
#                          ${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}
export PATH=/Developer/NVIDIA/CUDA-9.1/bin${PATH:+:${PATH}}
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-9.1/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH
export CUDA_HOME=/usr/local/cuda

editrc() {
	sublime ~/.bash_profile
}

# added by Miniconda3 installer
export PATH="/Users/carbon/Dev/anaconda/bin:$PATH"

dl() {
	source activate DL
}

udl() {
	source deactivate DL
}

export GEM_HOME=~/.gem
export GEM_PATH=~/.gem
export PATH=$PATH:$HOME/.gem/bin
export LD_LIBRARY_PAT=$HOME/Dev/caffe/build/lib

cuda() {
	~/Dev/deep-learning/cuda-smi-1.0/cuda-smi
}
export CUDA_VISIBLE_DEVICES=0

tb() {
	tensorboard --logdir=./logs & sleep 5 && open http://localhost:6006 && fg
}
