#aliases - package management
alias in="sudo pacman -S"
alias inz="pacman -Slq | fzf --multi --preview "pacman -Si {1}" | xargs -ro sudo pacman -S"
alias inow="sudo pacman -S --overwrite \*"
alias inlocal="sudo pacman -U"
alias inowlocal="sudo pacman -U --overwrite \*"
alias up="sudo pamac upgrade"
alias un="sudo pamac remove"
alias unz="pacman -Qq | fzf --multi --preview "pacman -Qi {1}" | xargs -ro sudo pacman -Rns"
alias unf="sudo pacman -Rdd"
alias unorph="pacman -Qtdq | sudo pacman -Rns -"
alias unghost="pacman -Qqd | sudo pacman -Rsu -"

#aliases - systemd
alias srv="sudo systemctl"
alias usersrv="systemctl --user"
alias srvlog="journalctl -u"

#aliases - apps
alias code="gnome-text-editor"

#aliases - games
alias minecraft="gamemoderun java -jar ~/games/minecraft/TLauncher-2.86.jar"
alias sims="gamemoderun mangohud proton ~/games/Sims4/Game/Bin/TS4_x64.exe"
alias yakuza="gamemoderun mangohud proton /home/vi/games/Yakuza/runtime/media/YakuzaLikeADragon.exe"
alias persona="gamemoderun mangohud proton ~/games/PersonaStrikers/game.exe"
alias cyberpunk="gamemoderun mangohud proton ~/games/Cyberpunk2077/bin/x64/Cyberpunk2077.exe"

#path+=("")
#env_temp
export 

#zsh options
USE_POWERLINE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

fastfetch
