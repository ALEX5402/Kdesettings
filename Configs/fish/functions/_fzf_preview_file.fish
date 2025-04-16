function _fzf_preview_file --description "Print a preview for the given file based on its file type."
    # Collect all the arguments into one variable and treat that as the path
    set -f file_path $argv

    if test -L "$file_path" # symlink
        # Notify user and recurse on the target of the symlink
        set -l target_path (realpath "$file_path")

        set_color yellow
        echo "'$file_path' is a symlink to '$target_path'."
        set_color normal

        _fzf_preview_file "$target_path"
    else if test -f "$file_path" # regular file
        if set --query fzf_preview_file_cmd
            # Escape quotes to make sure eval receives file_path as a single arg
            eval "$fzf_preview_file_cmd '$file_path'"
        else if string match -r '\.(jpg|jpeg|png|webp|gif)$' -- "$file_path"
            # Render a smaller, high-quality image preview
            chafa --size=40x20 --colors=256 "$file_path"
        else
            bat --style=numbers --color=always "$file_path"
        end
    else if test -d "$file_path" # directory
        if set --query fzf_preview_dir_cmd
            # Escape quotes to make sure eval receives file_path as a single arg
            eval "$fzf_preview_dir_cmd '$file_path'"
        else
            # List directory contents including hidden files
            command ls -A -F "$file_path"
        end
    else if test -c "$file_path"
        _fzf_report_file_type "$file_path" "character device file"
    else if test -b "$file_path"
        _fzf_report_file_type "$file_path" "block device file"
    else if test -S "$file_path"
        _fzf_report_file_type "$file_path" socket
    else if test -p "$file_path"
        _fzf_report_file_type "$file_path" "named pipe"
    else
        echo "$file_path doesn't exist." >&2
    end
end
