## Set values
# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

## Export variable need for qt-theme
if type "qtile" >> /dev/null 2>&1
   set -x QT_QPA_PLATFORMTHEME "qt5ct"
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end


## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Replace ls with exa
alias ls="exa -al --color=always --group-directories-first --icons" # preferred listing
alias la="exa -a --color=always --group-directories-first --icons"  # all files and dirs
alias ll="exa -l --color=always --group-directories-first --icons"  # long format
alias lt="exa -aT --color=always --group-directories-first --icons" # tree listing
alias l.="exa -a | egrep '^\.'"                                     # show only dotfiles


#common
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow="tar -acf "
alias untar="tar -zxvf "
alias wget="wget -c "
alias rmpkg="sudo pacman -Rdd"
alias psmem="ps auxf | sort -nr -k 4"
alias psmem10="ps auxf | sort -nr -k 4 | head -10"
alias upd="/usr/bin/update"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias hw="hwinfo --short"                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB

#aliases - package management
alias in="sudo pacman -S"
alias inz="pacman -Slq | fzf --multi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S"
alias inow="sudo pacman -S --overwrite \*"
alias inlocal="sudo pacman -U"
alias inowlocal="sudo pacman -U --overwrite \*"
alias up="sudo pacman -Syu"
alias un="sudo pamac remove"
alias unz="pacman -Qq | fzf --multi --preview "pacman -Qi {1}" | xargs -ro sudo pacman -Rns"
alias unf="sudo pacman -Rdd"
alias unorph="sudo pacman -Rns (pacman -Qtdq)" #remove orphaned packages
alias unghost="sudo pacman -Rsu (pacman -Qqd)" #remove ghost packages
alias listgitpkg="pacman -Q | grep -i "\-git" | wc -l"			# List amount of -git packages
alias listrecentpkg="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

#aliases - systemd
alias srv="sudo systemctl"
alias usersrv="systemctl --user"
alias srvlog="journalctl -xeu"

#yt-dlp
alias ytstream="yt-dlp --cookies-from-browser firefox --proxy socks5://127.0.0.1:1080 -o - (wl-paste) | mpv -"
alias ytdlmp4="yt-dlp --cookies-from-browser firefox --proxy socks5://127.0.0.1:1080 -f mp4 -o '~/Videos/%(title)s.%(ext)s' (wl-paste)"
alias ytdl="yt-dlp --cookies-from-browser firefox --proxy socks5://127.0.0.1:1080 -o '~/Videos/%(title)s.%(ext)s' (wl-paste)"

#misc
alias bak="ipfs add --raw-leaves" #backup to ipfs with deduplication


#autorun
if status --is-interactive
   fastfetch
end
