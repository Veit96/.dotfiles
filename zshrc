# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/veit/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
#setopt appendhistory autocd extendedglob nomatch notify beep
bindkey -v
# End of lines configured by zsh-newuser-install

# ranger alias
alias r='ranger'

alias ls='ls --color=auto'
# git alias
alias g="git add . && git commit && git push"

# cd & ls
#autoload -U add-zsh-hook
#add-zsh-hook -Uz chpwd (){ ls -a; }
chpwd() {
  ls --color
}

# xrandr alias
alias multi='xrandr --output eDP1 --auto --output VGA1 --auto --right-of eDP1'
alias terra='xrandr --output eDP1 --auto --output HDMI1 --auto --right-of eDP1 && feh --randomize --bg-fill $HOME/media/pictures/wallpapers/wallpapers_current'

# keyboard K780 use regular F1..12 instead of media keys
alias chk='solaar config k780 fn-swap false'

# set wallpaper
alias goal='feh --bg-fill /home/veit/media/pictures/wallpapers/wallpapers_current/triumph-street-triple-r_2333.jpg'
alias bmwgs='feh --bg-fill /home/veit/media/pictures/wallpapers/wallpapers_current/bmwr1200gs.jpg'
alias cwp='feh --randomize --bg-fill /home/veit/media/pictures/wallpapers/wallpapers_old/*'
alias cwpn='feh --randomize --bg-fill /home/veit/share/media/wallpapers/'

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

# Use Copy on Write where appropriate
alias cp='cp --reflink=auto'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#powerline-daemon -q
#. /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

if [ -f /usr/bin/screenfetch ]; then screenfetch; fi


export PATH=$PATH:~/bin:~/.local/bin:~/.gem/ruby/2.2.0/bin:
