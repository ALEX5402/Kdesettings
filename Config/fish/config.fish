## Set values
# Hide welcome message & ensure we are reporting fish as shell
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x SHELL /usr/bin/fish

## set my github token
source ~/.config/fish/githubtoken.fish

## Export variable need for qt-theme
if type "qtile" >> /dev/null 2>&1
   set -x QT_QPA_PLATFORMTHEME "qt5ct"
end 

function ytd
    youtube-dl -t $argv[1] 
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

#for btop
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

set -gx PATH $HOME/Android/Sdk/ndk/22.1.7171670 $PATH

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
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

#clone my repo with my token
function alexclone
    if test (count $argv) -eq 0
        echo "Please provide your repository name"
        return 1
    end

    set repo_url "https://alex5402:$gtoken@github.com/alex5402/$argv[1]"
    git clone $repo_url
end

#to play youtube with ytfzf
alias play 'ytfzf -t' # play
alias play-l 'ytfzf -L'
alias play-m 'ytfzf -m --audio-only'
alias yt-search 'ytfzf -cO'
alias haru-play 'ytfzf -u haruna -t' # dadad

#playgif
alias play-gif 'chafa'

# Replace ls with eza
alias ls 'eza --tree --level=1 --color=always --group-directories-first --icons' # preferred listing
alias lsr 'eza --color=always --git --group-directories-first --icons' # normal listing
alias lss 'eza --tree --level=2 --color=always --group-directories-first --icons' # preferred listing
alias la 'eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll 'eza -l --color=always --group-directories-first --icons'  # long format
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
alias clear "printf '\033[2J\033[3J\033[1;1H'"


# Common use
alias code 'code --ozone-platform=wayland --disable-features=WaylandFractionalScaleV1'
alias code-oss 'code --ozone-platform=wayland --disable-features=WaylandFractionalScaleV1'
alias vesktop 'vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias discord 'discord --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias youtube-music 'youtube-music --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias github 'github-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland'
alias github-desktop 'github-desktop --enable-features=UseOzonePlatform --ozone-platform=wayland'

alias install 'paru -S'
alias remove 'paru -R'
alias update 'sudo pacman -Syu'
alias studio 'QT_QPA_PLATFORM=xcb android-studio'
alias vim 'nvim'

alias print-fingerprint-jar 'keytool -printcert -jarfile'
alias wayshere 'sudo mount --bind ~/Androidshere ~/.local/share/waydroid/data/media/0/Documents'
alias waystart 'bash ~/waydroid.sh'
alias fish 'source ~/.config/fish/config.fish'

alias warpc 'warp-cli connect'
alias warpd 'warp-cli disconnect'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias big 'expac -H M "%m\t%n" | sort -h | nl'     # Sort installed packages according to size in MB (expac must be installed)
alias dir 'dir --color=auto'
alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
alias gitpkg 'pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias grep 'ugrep --color=auto'
alias egrep 'ugrep -E --color=auto'
alias fgrep 'ugrep -F --color=auto'
alias grub-update 'sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias hw 'hwinfo --short'                          # Hardware Info
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


# This function does two things:
# - Obtain the completions and store them in the global __hyprkeys_comp_results
# - Return false if file completion should be performed
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

    # If we want to prevent a space, or if file completion is NOT disabled,
    # we need to count the number of valid completions.
    # To do so, we will filter on prefix as the completions we have received
    # may not already be filtered so as to allow fish to match on different
    # criteria than the prefix.
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
                # In other cases, to support the "nospace" directive we trick the shell
                # by outputting an extra, longer completion.
                __hyprkeys_debug "Adding second completion to perform nospace directive"
                set --global __hyprkeys_comp_results $split[1] $split[1].
                __hyprkeys_debug "Completions are now: $__hyprkeys_comp_results"
            end
        end

        if test $numComps -eq 0; and test $nofiles -eq 0
            # To be consistent with bash and zsh, we only trigger file
            # completion when there are no other completions
            __hyprkeys_debug "Requesting file completion"
            return 1
        end
    end

    return 0
end

# Since Fish completions are only loaded once the user triggers them, we trigger them ourselves
# so we can properly delete any completions provided by another script.
# Only do this if the program can be found, or else fish may print some errors; besides,
# the existing completions will only be loaded if the program can be found.
if type -q "hyprkeys"
    # The space after the program name is essential to trigger completion for the program
    # and not completion of the program name itself.
    # Also, we use '> /dev/null 2>&1' since '&>' is not supported in older versions of fish.
    complete --do-complete "hyprkeys " > /dev/null 2>&1
end

# Remove any pre-existing completions for the program since we will be handling all of them.
complete -c hyprkeys -e

# this will get called after the two calls below and clear the $__hyprkeys_perform_completion_once_result global
complete -c hyprkeys -n '__hyprkeys_clear_perform_completion_once_result'
# The call to __hyprkeys_prepare_completions will setup __hyprkeys_comp_results
# which provides the program's completion choices.
# If this doesn't require order preservation, we don't use the -k flag
complete -c hyprkeys -n 'not __hyprkeys_requires_order_preservation && __hyprkeys_prepare_completions' -f -a '$__hyprkeys_comp_results'
# otherwise we use the -k flag
complete -k -c hyprkeys -n '__hyprkeys_requires_order_preservation && __hyprkeys_prepare_completions' -f -a '$__hyprkeys_comp_results'


## Run fastfetch if session is interactive

function clone -d "Clone the current fish session into a new kitty window"
    set --local data
    for a in $argv
        if contains -- "$a" -h --help
            echo "Clone the current fish session into a new kitty window."
            echo
            echo "For usage instructions see: https://sw.kovidgoyal.net/kitty/shell-integration/#clone-shell"
            return
        end
        set --local ea (printf "%s" "$a" | base64)
        set --append data "a=$ea"
    end
    set --local envs
    for e in (set --export --names)
        set --append envs "$e=$$e"
    end
    set --local b64_envs (string join0 -- $envs | base64)
    set --local b64_cwd (printf "%s" "$PWD" | base64)
    set --prepend data "shell=fish" "pid=$fish_pid" "cwd=$b64_cwd" "env=$b64_envs"
    __ksi_transmit_data (string join "," -- $data) "clone"
end


# ### key-bindings.fish ###
# #     ____      ____
# #    / __/___  / __/
# #   / /_/_  / / /_
# #  / __/ / /_/ __/
# # /_/   /___/_/ key-bindings.fish
# # from https://github.com/PatrickF1/fzf.fish?tab=readme-ov-file
set fzf_preview_dir_cmd eza --all --color=always
# width=20 so delta decorations don't wrap around small fzf preview pane
set fzf_diff_highlighter delta --paging=never --width=20
# Or, if using DFS
set fzf_diff_highlighter diff-so-fancy
set fzf_fd_opts --hidden --max-depth 5

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .gradle"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"



