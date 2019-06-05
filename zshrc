# The following lines were added by compinstall

#zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/veit/.zshrc'
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

autoload -Uz compinit promptinit
compinit
promptinit

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
#setopt appendhistory autocd extendedglob nomatch notify beep
bindkey -v
# End of lines configured by zsh-newuser-install

# git alias
alias g="git add -A && git commit && git push"

# cd & ls
#autoload -U add-zsh-hook
#add-zsh-hook -Uz chpwd (){ ls -a; }
chpwd() {
    ls -hNF --color=auto --group-directories-first
}

# Use Copy on Write where appropriate
alias cp='cp --reflink=auto'

# directory aliases
alias eth="cd ~/Documents/ETH"
alias sem4="cd ~/Documents/ETH/sem4"
alias em="cd ~/Documents/ETH/sem4/EM"
alias hl="cd ~/Documents/ETH/sem4/Halbleiterbauelemente"
alias num="cd ~/Documents/ETH/sem4/Numerik"
alias sst="cd ~/Documents/ETH/sem4/SigSys2"
alias wus="cd ~/Documents/ETH/sem4/WuS"
alias tik="cd ~/Documents/ETH/sem4/Tik2"
alias ec="cd ~/Documents/ETH/sem3/halbleiter_schaltungstechnik"
alias dm="cd ~/Documents/ETH/sem3/diskrete_mathematik"




# Some aliases
alias e="$EDITOR"
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias sr="sudo ranger"
alias mkd="mkdir -pv"
alias n="neofetch"

# Adding color
alias ls='ls -hNF --color=auto --group-directories-first'
alias ll='ls -alF'
alias grep="grep --color=auto"
alias diff="diff --color=auto"

# Pacman alias examples
alias pacupg='sudo pacman -Syu'		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'		# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'		# Display information about a given package in the repositories
alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
alias pacloc='pacman -Qi'		# Display information about a given package in the local database
alias paclocs='pacman -Qs'		# Search for package(s) in the local database
alias paclo="pacman -Qdt"		# List all packages which are orphaned
alias pacc="sudo pacman -Sc"		# Clean cache - delete all not currently installed package files
alias paccc="sudo pacman -Scc"		# Clean cache - delete all not currently installed package files
alias paclf="pacman -Ql"		# List all files installed by a given package
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed

alias umnt="udevil umount"

# '[r]emove [o]rphans' - recursively remove ALL orphaned packages
alias pacro="pacman -Qtdq > /dev/null && sudo pacman -Rns \$(pacman -Qtdq | sed -e ':a;N;$!ba;s/\n/ /g')"

# Additional pacman alias examples
alias pacupd='sudo pacman -Sy && sudo abs'         # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
alias pacmir='sudo pacman -Syy'                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

# vim as default editor
export VISUAL=vim
export EDITOR=vim

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# neofetch new shell
#if [ -f /usr/bin/neofetch ]; then neofetch; fi

# powerline prompt theme
#powerline-daemon -q
#. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

export PATH=$PATH:~/bin:~/.local/bin:~/.gem/ruby/2.2.0/bin:
