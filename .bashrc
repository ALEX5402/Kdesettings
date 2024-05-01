#
# ~/.bashrc
#
export TERMINAL=kitty
export QT_TERMINAL=kitty
export GTK_IM_MODULE=kitty
export XDG_SESSION_TYPE=wayland
export QT_QPA_PLATFORM=kitty
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export MOZ_ENABLE_WAYLAND=1


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

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
