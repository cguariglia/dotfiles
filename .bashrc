#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# copied from the arch wiki
extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}

cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls --color=auto
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

alias rm='rm -I --preserve-root'
alias emacs='echo "too casual"; sleep .5; vim'
alias pls='sudo $(history -p !!)'
alias grep='grep --color=auto'
alias netch='sudo netctl stop-all && sudo netctl start'
TERM='rxvt-unicode'
COLORTERM='rxvt-unicode-256color'
alias ls='ls --color=auto'
alias pspice='wine "/home/menrva/.wine/drive_c/Program Files/PSPICE/PSpice/pspice.exe" &'
alias explore='pcmanfm . &'
alias suexplore='sudo pcmanfm . &'
alias scrot='scrot ~/screenshots/%b-%d-%H%M%S.png'
alias steam-wine='WINEDEBUG=-all wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe -console -dxlevel 90 -width 1280 -height 1024 >/dev/null 2>&1 &'
export LD_LIBRARY_PATH="/usr/local/lib"

if [ "`id -u`" -eq 0 ]; then
    PS1="\[\033[m\]\[\e[9;33m\]\u\[\e[9;36m\]\[\033[m\]@\[\e[9;35;40\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W] >> \[\e[0m\]"
else
    PS1="\[\033[m\]\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\][\W] >> \[\e[0m\]"
fi

#export PATH="$HOME/.mongodb/versions/mongodb-current/bin:$PATH"
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#source /usr/share/nvm/init-nvm.sh
