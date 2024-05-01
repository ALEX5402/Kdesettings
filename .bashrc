#
# ~/.bashrc
#
#for btop
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add ~/.local/bin to PATH
if [ -d "$HOME/.local/bin" ] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Add ~/.cargo/bin to PATH
if [ -d "$HOME/.cargo/bin" ] && [[ ":$PATH:" != *":$HOME/.cargo/bin:"* ]]; then
    PATH="$HOME/.cargo/bin:$PATH"
fi


export TERMINAL=kitty
export QT_TERMINAL=kitty
export GTK_IM_MODULE=kitty
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=kitty
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export MOZ_ENABLE_WAYLAND=1

# Play YouTube videos with ytfzf
alias play='ytfzf -T kitty -t'           # play
alias play-l='ytfzf -T kitty -L'
alias play-m='ytfzf -T kitty -m --audio-only'
alias yt-search='ytfzf -T kitty -cO'
alias haru-play='ytfzf -T kitty -u haruna -t'  # dadad

# Play gifs with chafa
alias play-gif='chafa'

# Replace ls with eza
alias ls='eza --tree --level=1 --color=always --group-directories-first --icons'  # preferred listing
alias lsr='eza --color=always --git --group-directories-first --icons'            # normal listing
alias lss='eza --tree --level=2 --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons'                 # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'                 # long format
alias lt='eza -aT --color=always --group-directories-first --icons'                # tree listing
alias tree='eza -aT --color=always --group-directories-first --icons'              # tree listing
alias l.='eza -ald --color=always --group-directories-first --icons .*'            # show only dotfiles

# Replace some more commands with better alternatives
alias cat='bat --style header --style snip --style changes --style header'
if [ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ]; then
    alias yay='paru'
fi

# Set up icat
alias icat='kitten icat'

# Commonly used commands
alias code='code --ozone-platform=wayland --disable-features=WaylandFractionalScaleV1'
alias code-oss='code --ozone-platform=wayland --disable-features=WaylandFractionalScaleV1'
alias vesktop='vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias discord='discord --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias youtube-music='youtube-music --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias github='github-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias github-desktop='github-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias install='paru -S'
alias remove='paru -R'
alias update='sudo pacman -Syu'
alias studio='QT_QPA_PLATFORM=xcb android-studio'
alias vim='nvim'
alias print-fingerprint-jar='keytool -printcert -jarfile'
alias wayshere='sudo mount --bind ~/Androidshere ~/.local/share/waydroid/data/media/0/Documents'
alias waystart='bash ~/waydroid.sh'
alias fish='source ~/.config/fish/config.fish'
alias warpc='warp-cli connect'
alias warpd='warp-cli disconnect'
alias '..'='cd ..'
alias '...'='cd ../..'
alias '....'='cd ../../..'
alias '.....'='cd ../../../..'
alias '......'='cd ../../../../..'
alias big='expac -H M "%m\t%n" | sort -h | nl'     # Sort installed packages according to size in MB (expac must be installed)
alias dir='dir --color=auto'
alias fixpacman='sudo rm /var/lib/pacman/db.lck'
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias grep='ugrep --color=auto'
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias hw='hwinfo --short'                          # Hardware Info
alias ip='ip -color'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias rmpkg='sudo pacman -Rdd'
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias vdir='vdir --color=auto'
alias wget='wget -c '
alias staccer='QT_QPA_PLATFORM=xcb stacer'
alias remove-force='sudo pacman -Rnsdd'

# Get fastest mirrors
alias mirror-update='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirror-age='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirror-delay='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors-score='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

alias please='sudo'
alias helpme='echo "To print basic information about a command use tldr <command>"'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

# Get error messages from journalctl
alias jctl='journalctl -p 3 -xb'

# Recently installed packages
alias rip='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
eval "$(fzf --bash)"

#export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .gradle .cache .local .fonts .pki .presage .themes .android .git"
#export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .gradle"
#export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .cache"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"

