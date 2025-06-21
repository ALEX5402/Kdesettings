## Set values
# Hide welcome message & ensure we are reporting fish as shell
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x SHELL /usr/bin/fish


## Export variable need for qt-theme
if type "qtile" >> /dev/null 2>&1
   set -x QT_QPA_PLATFORMTHEME "qt5ct"
end 

#youtubedl fix
function ytd
    yt-dlp $argv[1]
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

#for btop
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# set -gx PATH $HOME/Android/Sdk/ndk/26.1.10909125 $PATH

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add /opt/android-ndk/ to PATH
if test -d /opt/android-ndk
    if not contains -- /opt/android-ndk $PATH
        set -p PATH /opt/android-ndk
    end
end

# Add ~/.cargo/bin to PATH
if test -d ~/.cargo/bin
    if not contains -- ~/.cargo/bin $PATH
        set -p PATH ~/.cargo/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end


function gitset --description "Set github username and ssh key based on workspace"
    set current_dir (pwd)

    if string match -q "$HOME/workspace/github-0xaddress/*" $current_dir
        eval (ssh-agent -c)
        ssh-add ~/.ssh/github2
        git config user.name "0xaddress"
        git config user.email "bd38243@gmail.com"
        git config user.signingKey 38E33F18B009C9A7
        git config --local commit.gpgsign true
    else
        eval (ssh-agent -c)
        ssh-add ~/.ssh/github
        git config user.name "alex5402"
        git config user.email "alex5402private@gmail.com"
        git config user.signingKey D64F014312B9F022
        git config --local commit.gpgsign true
    end
end

function upload-go
    if test (count $argv) -eq 0
        echo '❌ ERROR: No File Specified!'
        return 1
    end

    set FILE $argv[1]

    set SERVER (curl -s https://api.gofile.io/servers | jq -r '.data.servers[0].name')
    if test -z "$SERVER"
        echo "❌ Failed to get upload server from GoFile."
        return 1
    end

    set LINK (curl -# -F "file=@$FILE" "https://$SERVER.gofile.io/uploadFile" | jq -r '.data.downloadPage' 2>/dev/null)

    if test -z "$LINK"
        echo "❌ Upload failed or invalid response from server."
        return 1
    end

    echo "✅ Uploaded successfully:"
    echo "$LINK"
    echo
end


function upload --description "Upload files to 0x0.st with options"

    set timestamp (date "+%Y%m%d%H%M%S")
    set log_file "upload-logs$timestamp.txt"

    function upload_file
        set filename $argv[1]
        set filetype $argv[2]
        set filesize (stat -c%s $filename 2>/dev/null)

        if test "$filesize" -gt 500000000
            echo "Skipping $filename: >500 MB" >> $log_file
            return
        end

        set filelink (curl -sf -F "file=@$filename" 0x0.st)
        if test -z "$filelink"
            echo "Failed to upload $filename." >> $log_file
            return
        end

        set filelink (string replace "http:" "https:" $filelink)
        echo "{filename:\""(basename $filename)"\", filetype:\"$filetype\", filelink:\"$filelink\"}"
    end

    function upload_singlefile
        set filename $argv[1]
        set filetype $argv[2]
        set filesize (stat -c%s $filename 2>/dev/null)

        if test "$filesize" -gt 500000000
            echo "Skipping $filename: >500 MB" >> $log_file
            return
        end

        set filelink (curl -sf -F "file=@$filename" 0x0.st)
        if test -z "$filelink"
            echo "Failed to upload $filename." >> $log_file
            return
        end

        set filelink (string replace "http:" "https:" $filelink)
        echo -e "\e[32m$filelink\e[0m"
        echo "{filename:\""(basename $filename)"\", filetype:\"$filetype\", filelink:\"$filelink\"}"
    end

    function remove_files
        find . -maxdepth 1 -type f \( -name '*.json' -o -name '*.txt' \) -delete
        echo "🧹 All .json and .txt files removed from current directory."
    end

    function updatescript
        curl -LSs "https://raw.githubusercontent.com/ALEX5402/Q-shere/main/setup.sh" | bash -
    end

    function show_usage
        echo "Usage:"
        echo "  upload -f <type1> [<type2> ...]   Upload specific file types"
        echo "  upload -j                         Upload all files in directory"
        echo "  upload -d                         Delete all .json and .txt files"
        echo "  upload <file>                    Upload a specific file"
        echo "  upload -u                         Update script"
        echo "  upload -h                         Show help"
    end

    if test (count $argv) -eq 0
        echo "❌ No arguments provided."
        show_usage
        return 1
    end

    switch $argv[1]
        case '-f'
            if test (count $argv) -eq 1
                echo "Usage: upload -f <type1> [<type2> ...]"
                return 1
            end

            set output_file "$timestamp-links.json"
            touch $output_file $log_file
            echo "[" >> $output_file

            for type in $argv[2..-1]
                set files (find . -maxdepth 1 -type f -name "*.$type")
                if test (count $files) -eq 0
                    echo "No files found with .$type"
                    echo "No files found with .$type" >> $log_file
                    continue
                end

                for file in $files
                    upload_file $file $type >> $output_file
                end
            end

            echo "]" >> $output_file
            echo "✅ Upload complete. Output saved to $output_file"
            return 0

        case '-j'
            set output_file "$timestamp-links.json"
            touch $output_file $log_file
            echo "[" >> $output_file

            for file in *
                if test -f $file
                    set ext (string split -r . -- $file)[-1]
                    upload_file $file $ext >> $output_file
                end
            end

            echo "]" >> $output_file
            echo "✅ Upload complete. Output saved to $output_file"
            return 0

        case '-d'
            remove_files
            return 0

        case '-u'
            updatescript
            return 0

        case '-h'
            show_usage
            return 0

        case '*'
            if test -f $argv[1]
                set ext (string split -r . -- $argv[1])[-1]
                upload_singlefile $argv[1] $ext
            else
                echo "Invalid option or file not found: $argv[1]"
                show_usage
                return 1
            end
    end
end


function waydroid_size --description "Set Waydroid screen resolution: height and width"
    if test (count $argv) -ne 2
        echo "❌ Usage: set-waydroid-res <height> <width>"
        return 1
    end

    set height $argv[1]
    set width $argv[2]

    waydroid prop set persist.waydroid.height $height
    waydroid prop set persist.waydroid.width $width

    echo "✅ Set height: $height  width: $width"
end

function waydroid_padding --description "Set Waydroid height and width padding"
    if test (count $argv) -ne 2
        echo "❌ Usage: waydroid_padding <height_padding> <width_padding>"
        return 1
    end

    set height_padding $argv[1]
    set width_padding $argv[2]

    waydroid prop set persist.waydroid.height_padding $height_padding
    waydroid prop set persist.waydroid.width_padding $width_padding

    echo "✅ Set height padding = $height_padding and width padding = $width_padding"
end


function play-music --description "Play audio/video files from a directory, optionally shuffled"
    if test (count $argv) -eq 0
        echo "Usage: play-music [-s] <directory>"
        echo "  -s            Shuffle the playlist."
        echo "  <directory>   Directory containing the music files."
        return 1
    end

    set shuffle false
    set dir ""
    while set -q argv[1]
        switch $argv[1]
            case -s
                set shuffle true
                set argv $argv[2..-1]
            case '*'
                set dir $argv[1]
                set argv $argv[2..-1]
        end
    end

    if test -z "$dir"
        echo "❌ Error: No directory provided."
        return 1
    end

    if not test -d "$dir"
        echo "❌ Error: Directory '$dir' does not exist."
        return 1
    end

    pkill -x mpv > /dev/null 2>&1
    set -l files (find "$dir" -type f \( -iname '*.mp3' -o -iname '*.mp4' -o -iname '*.ogg' \) | sort)

    if test (count $files) -eq 0
        echo "No mp3, mp4, or ogg files found in '$dir'."
        return 1
    end

    if test "$shuffle" = true
        mpv --loop-playlist --vid=no --shuffle $files
    else
        mpv --loop-playlist --vid=no $files
    end
end


## port forward setup 😜
function port-forward
    if test (count $argv) -eq 0
        echo "❌ Please choose a port to forward."
        echo "👉 Example: port-forward 3000"
        return 1
    end

    set port $argv[1]
    echo "🌐 Forwarding localhost:$port to https://serveo.net (remote port 80)..."
    ssh -R 80:localhost:$port serveo.net
end


## Starship prompt
if status --is-interactive
   source ("/usr/bin/starship" init fish --print-full-init | psub)
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
	set from (echo $argv[1] | string trim --right --chars=/)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Cleanup local orphaned packages with cache
function cleanup
     sudo pacman -Sc
     paru -Sc
    while pacman -Qdtq
        sudo pacman -R (pacman -Qdtq)
    end
end


# host http using python
function open-http
    if test (count $argv) -eq 0
        echo "Usage: host-http <port>"
        return 1
    end

    set port $argv[1]
    echo "Starting HTTP server on port $port..."
    python3 -m http.server $port
end


#to play youtube with ytfzf
# alias play 'ytfzf -t' # play
# alias play-l 'ytfzf -L'
# alias play-m 'ytfzf -m --audio-only'
# alias yt-search 'ytfzf -cO'
# alias haru-play 'ytfzf -u haruna -t'



#playgif
alias gif-play 'chafa'

# Replace ls with eza
alias ls 'eza -a --tree --level=1 --color=always --group-directories-first --icons' # preferred listing
alias lsr 'eza --color=always --git --group-directories-first --icons' # normal listing
alias lss 'eza --tree --level=2 --color=always --group-directories-first --icons' # preferred listing
alias la 'eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll 'eza -a -l --color=always --group-directories-first --icons'  # long format
alias lt 'eza -aT --color=always --group-directories-first --icons' # tree listing
alias tree 'eza -aT --color=always --group-directories-first --icons' # tree listing
alias l. 'eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles

# Replace some more things with better alternatives
alias cat 'bat --style header --style snip --style changes --style header'
if not test -x /usr/bin/yay; and test -x /usr/bin/paru
    alias yay 'paru'
end

## setup icat
alias icat="kitten icat"

## fix scrollback buffer clear for kitty
alias clearf "printf '\033[2J\033[3J\033[1;1H'"

alias vesktop-wayland 'vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias discord-wayland 'discord --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias youtube-music-wayland 'youtube-music --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias github-desktop-wayland 'github-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias spotify-wayland 'LD_PRELOAD=/lib/spotify-adblock.so spotify --enable-features=UseOzonePlatform --ozone-platform=wayland'

alias install 'paru -S'
alias remove 'paru -R'
alias update 'sudo pacman -Syu'
alias vim 'nvim'
abbr vi nvim

alias vimpager='nvim - -c "lua require(\"util\").colorize()"'

## distrobox containers 

alias arch-linux1 'distrobox enter arch2'

alias print-fingerprint-jar 'keytool -printcert -jarfile'
alias wayshere 'sudo mount --bind ~/Androidshere ~/.local/share/waydroid/data/media/0/Documents'
alias waystart 'waydroid show-full-ui'
alias fish 'source ~/.config/fish/config.fish'

# git stuff

alias pull 'git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias diff 'git diff'
alias push='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias commit 'git commit'
alias clone 'git clone'
alias git-push-behave 'git config --global push.default'
alias git-setefitor 'git config --global core.editor'
alias git-colour 'git config --global color.ui'
alias git-addd 'git remote add origin'

alias warpc 'warp-cli connect'
alias flex 'fastfetch'
alias warpd 'warp-cli disconnect'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias big 'expac -H M "%m\t%n" | sort -h | nl'     # Sort installed packages according to size in MB (expac must be installed)
alias dir 'lsd --color=auto'
alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
alias gitpkg 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias grep 'ugrep --color=auto'
alias egrep 'ugrep -E --color=auto'
alias fgrep 'ugrep -F --color=auto'
alias grub-update-boot 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grub-update-etc 'sudo grub-mkconfig -o /etc/default/grub'

alias hw 'hwinfo --short'
alias ip 'ip -color'
alias psmem 'ps auxf | sort -nr -k 4'
alias psmem10 'ps auxf | sort -nr -k 4 | head -10'
alias rmpkg 'sudo pacman -Rdd'
alias tarnow 'tar -acf '
alias untar 'tar -zxvf '
alias vdir 'vdir --color=auto'
alias wget 'wget -c '
alias staccer 'QT_QPA_PLATFORM=xcb stacer'
alias remove-force 'sudo pacman -Rnsdd'
abbr se "sudo systemctl enable --now"
# Get fastest mirrors
alias mirror-update 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirror-age 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirror-delay 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors-score 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

alias please 'sudo'
alias helpme 'echo "To print basic information about a command use tldr <command>"'
alias pacdiff 'sudo -H DIFFPROG=meld pacdiff'

# Get the error messages from journalctl
alias jctl 'journalctl -p 3 -xb'

# Recent installed packages
alias rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'


# fish completion for hyprkeys                             -*- shell-script -*-

function __hyprkeys_debug
    set -l file "$BASH_COMP_DEBUG_FILE"
    if test -n "$file"
        echo "$argv" >> $file
    end
end

function __hyprkeys_perform_completion
    __hyprkeys_debug "Starting __hyprkeys_perform_completion"

    # Extract all args except the last one
    set -l args (commandline -opc)
    # Extract the last arg and escape it in case it is a space
    set -l lastArg (string escape -- (commandline -ct))

    __hyprkeys_debug "args: $args"
    __hyprkeys_debug "last arg: $lastArg"

    # Disable ActiveHelp which is not supported for fish shell
    set -l requestComp "HYPRKEYS_ACTIVE_HELP=0 $args[1] __complete $args[2..-1] $lastArg"

    __hyprkeys_debug "Calling $requestComp"
    set -l results (eval $requestComp 2> /dev/null)

    # Some programs may output extra empty lines after the directive.
    # Let's ignore them or else it will break completion.
    # Ref: https://github.com/spf13/cobra/issues/1279
    for line in $results[-1..1]
        if test (string trim -- $line) = ""
            # Found an empty line, remove it
            set results $results[1..-2]
        else
            # Found non-empty line, we have our proper output
            break
        end
    end

    set -l comps $results[1..-2]
    set -l directiveLine $results[-1]

    # For Fish, when completing a flag with an = (e.g., <program> -n=<TAB>)
    # completions must be prefixed with the flag
    set -l flagPrefix (string match -r -- '-.*=' "$lastArg")

    __hyprkeys_debug "Comps: $comps"
    __hyprkeys_debug "DirectiveLine: $directiveLine"
    __hyprkeys_debug "flagPrefix: $flagPrefix"

    for comp in $comps
        printf "%s%s\n" "$flagPrefix" "$comp"
    end

    printf "%s\n" "$directiveLine"
end

# this function limits calls to __hyprkeys_perform_completion, by caching the result behind $__hyprkeys_perform_completion_once_result
function __hyprkeys_perform_completion_once
    __hyprkeys_debug "Starting __hyprkeys_perform_completion_once"

    if test -n "$__hyprkeys_perform_completion_once_result"
        __hyprkeys_debug "Seems like a valid result already exists, skipping __hyprkeys_perform_completion"
        return 0
    end

    set --global __hyprkeys_perform_completion_once_result (__hyprkeys_perform_completion)
    if test -z "$__hyprkeys_perform_completion_once_result"
        __hyprkeys_debug "No completions, probably due to a failure"
        return 1
    end

    __hyprkeys_debug "Performed completions and set __hyprkeys_perform_completion_once_result"
    return 0
end

# this function is used to clear the $__hyprkeys_perform_completion_once_result variable after completions are run
function __hyprkeys_clear_perform_completion_once_result
    __hyprkeys_debug ""
    __hyprkeys_debug "========= clearing previously set __hyprkeys_perform_completion_once_result variable =========="
    set --erase __hyprkeys_perform_completion_once_result
    __hyprkeys_debug "Succesfully erased the variable __hyprkeys_perform_completion_once_result"
end

function __hyprkeys_requires_order_preservation
    __hyprkeys_debug ""
    __hyprkeys_debug "========= checking if order preservation is required =========="

    __hyprkeys_perform_completion_once
    if test -z "$__hyprkeys_perform_completion_once_result"
        __hyprkeys_debug "Error determining if order preservation is required"
        return 1
    end

    set -l directive (string sub --start 2 $__hyprkeys_perform_completion_once_result[-1])
    __hyprkeys_debug "Directive is: $directive"

    set -l shellCompDirectiveKeepOrder 32
    set -l keeporder (math (math --scale 0 $directive / $shellCompDirectiveKeepOrder) % 2)
    __hyprkeys_debug "Keeporder is: $keeporder"

    if test $keeporder -ne 0
        __hyprkeys_debug "This does require order preservation"
        return 0
    end

    __hyprkeys_debug "This doesn't require order preservation"
    return 1
end



function __hyprkeys_prepare_completions
    __hyprkeys_debug ""
    __hyprkeys_debug "========= starting completion logic =========="

    # Start fresh
    set --erase __hyprkeys_comp_results

    __hyprkeys_perform_completion_once
    __hyprkeys_debug "Completion results: $__hyprkeys_perform_completion_once_result"

    if test -z "$__hyprkeys_perform_completion_once_result"
        __hyprkeys_debug "No completion, probably due to a failure"
        # Might as well do file completion, in case it helps
        return 1
    end

    set -l directive (string sub --start 2 $__hyprkeys_perform_completion_once_result[-1])
    set --global __hyprkeys_comp_results $__hyprkeys_perform_completion_once_result[1..-2]

    __hyprkeys_debug "Completions are: $__hyprkeys_comp_results"
    __hyprkeys_debug "Directive is: $directive"

    set -l shellCompDirectiveError 1
    set -l shellCompDirectiveNoSpace 2
    set -l shellCompDirectiveNoFileComp 4
    set -l shellCompDirectiveFilterFileExt 8
    set -l shellCompDirectiveFilterDirs 16

    if test -z "$directive"
        set directive 0
    end

    set -l compErr (math (math --scale 0 $directive / $shellCompDirectiveError) % 2)
    if test $compErr -eq 1
        __hyprkeys_debug "Received error directive: aborting."
        # Might as well do file completion, in case it helps
        return 1
    end

    set -l filefilter (math (math --scale 0 $directive / $shellCompDirectiveFilterFileExt) % 2)
    set -l dirfilter (math (math --scale 0 $directive / $shellCompDirectiveFilterDirs) % 2)
    if test $filefilter -eq 1; or test $dirfilter -eq 1
        __hyprkeys_debug "File extension filtering or directory filtering not supported"
        # Do full file completion instead
        return 1
    end

    set -l nospace (math (math --scale 0 $directive / $shellCompDirectiveNoSpace) % 2)
    set -l nofiles (math (math --scale 0 $directive / $shellCompDirectiveNoFileComp) % 2)

    __hyprkeys_debug "nospace: $nospace, nofiles: $nofiles"

    if test $nospace -ne 0; or test $nofiles -eq 0
        set -l prefix (commandline -t | string escape --style=regex)
        __hyprkeys_debug "prefix: $prefix"

        set -l completions (string match -r -- "^$prefix.*" $__hyprkeys_comp_results)
        set --global __hyprkeys_comp_results $completions
        __hyprkeys_debug "Filtered completions are: $__hyprkeys_comp_results"

        # Important not to quote the variable for count to work
        set -l numComps (count $__hyprkeys_comp_results)
        __hyprkeys_debug "numComps: $numComps"

        if test $numComps -eq 1; and test $nospace -ne 0
            # We must first split on \t to get rid of the descriptions to be
            # able to check what the actual completion will be.
            # We don't need descriptions anyway since there is only a single
            # real completion which the shell will expand immediately.
            set -l split (string split --max 1 \t $__hyprkeys_comp_results[1])

            # Fish won't add a space if the completion ends with any
            # of the following characters: @=/:.,
            set -l lastChar (string sub -s -1 -- $split)
            if not string match -r -q "[@=/:.,]" -- "$lastChar"
                __hyprkeys_debug "Adding second completion to perform nospace directive"
                set --global __hyprkeys_comp_results $split[1] $split[1].
                __hyprkeys_debug "Completions are now: $__hyprkeys_comp_results"
            end
        end

        if test $numComps -eq 0; and test $nofiles -eq 0
            __hyprkeys_debug "Requesting file completion"
            return 1
        end
    end

    return 0
end


if type -q "hyprkeys"
   complete --do-complete "hyprkeys " > /dev/null 2>&1
end

# Remove any pre-existing completions for the program since we will be handling all of them.
complete -c hyprkeys -e
complete -c hyprkeys -n '__hyprkeys_clear_perform_completion_once_result'
complete -c hyprkeys -n 'not __hyprkeys_requires_order_preservation && __hyprkeys_prepare_completions' -f -a '$__hyprkeys_comp_results'
complete -k -c hyprkeys -n '__hyprkeys_requires_order_preservation && __hyprkeys_prepare_completions' -f -a '$__hyprkeys_comp_results'

set fzf_preview_dir_cmd eza --all --color=always
set fzf_diff_highlighter delta --paging=never --width=20
set fzf_diff_highlighter diff-so-fancy
set fzf_fd_opts --hidden --max-depth 5

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .gradle"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"

