#!/bin/bash
mDIR="$HOME/Music/"

# Directory for icons
iDIR="$HOME/.config/dunst/icons"

# Online Stations: Edit as required
declare -A online_music=(
  ["YT - Mix Taimour Baig 🎻🎵"]="Mix Taimour Baig"
  ["YT - Mix YSN Fab (hip hop) 🎤🎶"]="Mix YSN Fab"
  ["YT - Mix Alan Walker 🎧🌌"]="Mix Alan Walker"
  ["YT - Mix Boy with Uke 🎸🎵"]="Mix Boy with Uke"
  ["YT - Mix Vocal Music 🎤🎵"]="Mix Vocal Music"
  ["YT - Top YouTube Music 🎵🇮🇳"]="Top YouTube Music India"
  ["YT - Wish 107.5 YT Wishclusives ☕️🎶"]=""
  ["YT - Hip Hop 🔥🎧"]="Best HipHop Playlist"
  ["YT - Hip Hop Omegle Bars 🎤🎶"]="Harry Mack Omegle Bars"
  ["YT - Relaxing Music Lofi 🌙☕️"]="Lofi Girl Study Music"
  ["YT - Mix NCS Playlist 🔊🎶"]="Mix NCS Playlist"
  ["YT - YouTube Remix 🔀🎶"]="YouTube Remix"
  ["YT - Korean Drama OST 🎬🎶"]="Korean Drama OST Music Playlist"
  ["YT - AfroBeatz 2024 🌍🎧"]="AfroBeatz"
  ["Linux Latest News 🐧📰"]="Linux news"
  ["Latest Android Dev Videos 📱🎥"]="Android Developer videos"
)



# Populate local_music array with files from music directory and subdirectories
populate_local_music() {
  local_music=()
  filenames=()
  while IFS= read -r file; do
    local_music+=("$file")
    filenames+=("$(basename "$file")")
  done < <(find "$mDIR" -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.wav" -o -iname "*.ogg" -o -iname "*.mp4" -o -iname "*.mkv" \))
}

# Function for displaying notifications
notification() {
  notify-send -u normal -i "$iDIR/music.png" "Playing: $1"
}

# Main function for playing local music
play_local_music() {
  populate_local_music

  # Prompt the user to select a song
  choice=$(printf "%s\n" "${filenames[@]}" | rofi -i -dmenu -config ~/.config/rofi/config-rofi-Beats.rasi -p "Local Music")

  if [ -z "$choice" ]; then
    exit 1
  fi

  # Find the corresponding file path based on user's choice and set that to play the song then continue on the list
  for (( i=0; i<"${#filenames[@]}"; ++i )); do
    if [ "${filenames[$i]}" = "$choice" ]; then
      notification "$choice"
      # Play the selected local music file using mpv
      mpv --playlist-start="$i" --loop-playlist --vid=no "${local_music[@]}"
      break
    fi
  done
}

# Main function for shuffling local music
shuffle_local_music() {
  notification "Shuffle local music"
  # Play music in $mDIR on shuffle
  mpv --shuffle --loop-playlist --vid=no "$mDIR"
}

# Main function for playing online music
play_online_music() {
  choice=$(printf "%s\n" "${!online_music[@]}" | rofi -i -dmenu -config ~/.config/rofi/config-rofi-Beats.rasi -p "Online Music")

  if [ -z "$choice" ]; then
    exit 1
  fi

  link="${online_music[$choice]}"

  notification "$choice"

  # Use ytfzf to play the selected online music
  kitty ytfzf --type=playlist -s "$link"
}

# Check if an online music process is running and send a notification, otherwise run the main function
pkill mpv && notify-send -u low -i "$iDIR/music.png" "Music stopped" || {

  # Prompt the user to choose between local and online music
  user_choice=$(printf "Play from Online Stations\nPlay from Music Folder\nShuffle Play from Music Folder" | rofi -dmenu -config ~/.config/rofi/config-rofi-Beats-menu.rasi -p "Select music source")

  case "$user_choice" in
    "Play from Music Folder")
      play_local_music
      ;;
    "Play from Online Stations")
      play_online_music
      ;;
    "Shuffle Play from Music Folder")
      shuffle_local_music
      ;;
    *)
      echo "Invalid choice"
      ;;
  esac
}
