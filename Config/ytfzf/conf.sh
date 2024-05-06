# video_player () {
#    #check if detach is enabled
#    case "$is_detach" in
#       	#disabled
#       	0) vlc "$@" ;;
#       	#enabled
#       	1) setsid -f elisa "$@" > /dev/null 2>&1 ;;
#      esac
# }

# video_pref="bestvideo[height<=?1080]+bestaudio/best"
video_pref="medium[height<=?144]+bestaudio/mediam"
show_thumbnails=1
# skip_thumb_download=1
async_thumbnails=1
is_loop=1
thumbnail_viewer=kitty
load_thumbnail_viewer=1
search_again=1
scripting_video_count=30
search_result_type=all
# search_sort_by=view_count


# Scrapers=youtube-playlist


# SYNOPSIS
#
# ~/.config/ytfzf/conf.sh
# DESCRIPTION
#
# The configuration file is a .sh file and can be used as such. The file can be completely empty and ytfzf will still work with the default settings. The options should be set as environment variables and functions.
# CONFIGURATION FILES
#
# Configuration files are stored in $XDG_CONFIG_HOME/ytfzf (or $HOME/.config/ytfzf).
# conf.sh
#
# A shell script that gets sourced into ytfzf when ytfzf is run.
# subscriptions
#
# A file that is a list of links to youtube channel's video page, such as:
#
#     https://www.youtube.com/channel/UCtMVHI3AJD4Qk4hcbZnI9ZQ
#
# Each link should be separated by a new line.
#
# If a channel appears similar to "https://www.youtube.com/c/SomeOrdinaryGamers", run
# ytfzf --channel-link="https://www.youtube.com/c/SomeOrdinaryGamers"
# Before adding it to your subscriptions file
#
# A comment can be created by having '#comment' on its own line or after a link. For example:
#
#     link-to-channel
#     #comment
#     link-to-channel #best channel
#
# scrapers
#
# A folder that contains executable files that scrape websites See CUSTOM SCRAPERS for more information
# CONFIGURATION OPTIONS
# VARIABLES
#
# conf.sh is used mainly for setting variables for ytfzf. If a variable has no default, that means it is set to an empty string.
# To set a variable in conf.sh be sure to use
# variable_name="value"
# leave out the $ at the start of the variable name.
#
# Files and directories
#
#     $cache_dir
#
#         The directory to store cache files in.
#         It is highly recommended to only change this if $__is_submenu is 0, or funky things could happen
#         default: $XDG_CACHE_HOME/ytfzf (or $HOME/.cache/ytfzf)
#     $hist_file
#
#         The file to write watch history to if $enable_hist is 1
#         It is highly recommended to only change this if $__is_submenu is 0, or funky things could happen
#         default: $cache_dir/watch_hist
#     $search_hist_file
#
#         The file to write search history to if $enable_search_hist is 1
#         default: $cache_dir/search_hist
#
# How to play the selected videos.
#
#     $is_detach
#
#         Whether or not to detach the video player from the terminal.
#         default: 0
#     $is_audio_only
#
#         Whether or not to only play audio.
#         default: 0
#     $url_handler
#
#         The function/programs to handle the selected videos
#         It is recommended to not set this variable directly, but rather to use the command load_url_handler
#         See URL handlers for a list of built-in url handlers default: multimedia_player
#     $yt_video_link_domain
#
#         The domain to play youtube videos from (does not apply to odysee and peertube or youtube playlists)
#         default: https://www.youtube.com
#     $info_to_print
#
#         The information to print instead of playing a video. The available options for this variable are:
#
#         L | l | link
#
#             Print the URL of the selected videos.
#         VJ | vj | video-json
#
#             Prints the json of the selected videos.
#         J | j | json
#
#             Prints the json of all the videos in the search results.
#         F | f | format
#
#             Prints the video format being used.
#         R | r | raw
#
#             Prints the data of the selected videos, as appears in the menu.
#
#     $info_wait_action
#
#         The action to do when $info_wait is 1.
#         Valid actions:
#
#         q
#
#             quit (will go back to menu, if $is_loop is 1).
#         Q
#
#             quit regardless if loop is enabled or not.
#         m
#
#             return to menu.
#             default: q
#
#     $info_wait
#
#         Whether or not to wait for input after printing info.
#         default: 0
#     $video_pref
#
#         The video preference to use for youtube-dl in mpv.
#         default: bestvideo
#     $audio_pref
#
#         The audio preference to use for youtube-dl in mpv.
#         default: bestaudio
#     $ytdl_pref
#
#         The preference to use for youtube-dl in mpv.
#         default: $video_pref+$audio_pref/best/$video_pref/$audio_pref
#     $url_handler_opts
#
#         Opts to pass to the url handler, by default this will pass extra opts to mpv. This can also be set in the config file with url_handler_opts
#
# Menu options
#
#     $interface
#
#         The interface/menu to use.
#         It is recommended to not use this variable directly, instead use load_interface interface-name
#         Valid options.
#
#         ext
#
#             same as -D
#         scripting
#
#             is applied when -a, -r, or -A is used
#         ''
#
#             default
#
#     $external_menu_len
#
#         The amount of cols in interface_ext, (-D)
#         default: 210
#     $fzf_preview_side
#
#         The side to show the preview in fzf.
#         Valid options:
#
#         left
#         right
#         up
#         down
#         default: left
#
#     $thumbnail_viewer
#
#         The program to display images for thumbnail previews
#         It is recommended to not use this variable directly, instead use load_thumbnail_viewer viewer
#         Valid options:
#
#         sixel
#         iterm2
#         kitty
#
#         ueberzug
#         chafa
#         chafa-16
#
#             Uses chafa with 16 colors
#         chafa-tty
#
#             Uses chafa with 4 colors
#         catimg
#         catimg-256
#
#             Uses catimg with 256 colors
#         mpv
#
#             Uses the mpv player to display the images
#             Works well with tiling window managers.
#         imv
#
#             Similar to mpv, but is a dedicated image viewer
#         swayimg
#
#             Only works on the sway wayland compositor
#         swayimg-hyprland
#
#             Only works on the hyprland compositor. Uses swayimg to render images.
#         default: ueberzug
#
#     $show_formats
#
#         Whether or not to bring up the format selection menu.
#         default: 0
#     $format_selection_screen
#
#         The format that selection screen will use. Types:
#
#         simple normal
#         default: simple
#
#     $format_selection_sort
#
#         The --format-sort to use in ytdl.
#         default: height
#     $enable_submenus
#
#         Whether or not to enable submenus,
#         A submenu is a menu that appears after a playlist or channel is selected. (Currently only supported with youtube/invidious scraper) default: 1
#     $enable_actions
#
#         Whether or not to enable actions such as submenus, and the back button.
#         default: 1
#     $keep_vars
#
#         Whether or not options passed into ytfzf also get passed into submenus
#     $enable_back_button
#
#         Whether or not to enable back button in submenus. default: 1
#     $submenu_opts
#
#         Options to use in submenus. default:
#     $submenu_scraping_opts
#
#         DEPRECATED (use submenu_opts instead) Does the same thing as $submenu_opts default:
#     $is_sort
#
#         Whether or not to sort scraped videos by date in the menu default: 0
#     $fancy_subs
#
#         Whether or not to have a separator between each subscription default: 0
#     $fancy_subs_left
#
#         The text to display on the left of the channel name when fancy_subs is 1. default: -------------
#     $fancy_subs_right
#
#         The text to display on the right of the channel name when fancy_subs is 1. default: $fancy_subs_left
#     $show_thumbnails
#
#         Whether or not to show thumbnails in fzf.
#         default: 0
#
#     $async_thumbnails Whether or not to download thumbnails asynchronously.
#     Downloading asynchronously will open the menu before all thumbnails are downloaded. default: 0
#
#     $skip_thumb_download
#
#         Whether or not to skip thumbnail download.
#         default: 0
#     $thumbnail_quality
#
#         Select the quality of the thumbnails. Currently only supports youtube (uses invidious api).
#         This does not work for the '-cS' scraper as it scrapes youtube not invidious (use 'SI' instead).
#         For lower internet speeds it is recommended to use default.
#         Available options:
#
#         maxres
#         maxresdefault
#         sddefault
#         high (default)
#         medium
#         default
#         start
#
#             The first frame of the video (low quality)
#         middle
#
#             The middle frame of the video (low quality)
#         end
#
#             The end frame of the video (low quality)
#
#
#     $notify_playing
#
#         Whether or not to send a notification when a video is about to be played.
#         default: 0
#     $is_loop
#
#         Whether or not to show the menu after the selected videos have stopped playing.
#         default: 0
#     $search_again
#
#         Whether or not to make another search after fzf is closed.
#         default: 0
#     $download_shortcut
#
#         The shortcut to download the selected videos.
#         default: alt-d
#     $video_shortcut
#
#         The shortcut to watch the selected videos.
#         default: alt-v
#     $audio_shortcut
#
#         The shortcut to listen to the selected videos.
#         default: alt-m
#     $detach_shortcut
#
#         The shortcut to use the detach player.
#         default: alt-e
#     $print_link_shortcut
#
#         The shortcut to use to print the link.
#         default: alt-l
#     $show_formats_shortcut
#
#         The shortcut to show formats before playing the video.
#         default: alt-f
#     $info_shortcut
#
#         The shortcut to get all info about the selected video.
#         default: alt-i
#     $search_again_shortcut
#
#         The shortcut to make another search.
#         default: alt-s
#     $shortcut_binds
#
#         The keys to listen for in fzf.
#         default:"Enter,double-click,$download_shortcut, $video_shortcut,$detach_shortcut,$print_link_shortcut,$show_formats_shortcut, $info_shortcut,$search_again_shortcut,$custom_shortcut_binds"
#     next_page_action_shortcut
#
#         The shortcut to scrape the next page.
#         default: ctrl-p
#     $custom_shortcut_binds
#
#         The custom shortcut keys. Automatically appended to $shortcut_binds
#         If $shortcut_binds is set manually, this must also manually be appended.
#
# Auto selecting
#
#     $is_auto_select
#
#         Whether or not to auto select the first -n videos. (only works if $interface=scripting)
#         default: 0
#     $is_random_select
#
#         Whether or not to randomly select -n videos. (only works if $interface=scripting)
#         default: 0
#     $is_specific_select
#
#         Whether or not to select a specific video (use $ scripting_video_count to specify which) (only works if $interface=scripting)
#         default: 0
#     $scripting_video_count
#
#         The amount of videos to get with -a or -r.
#         default: 1
#
# Scrapers
#
#     $scrape
#
#         The website to scrape by default. The currently supported options are:
#
#         youtube,
#         youtube-trending,
#         youtube-subscriptions,
#         peertube,
#         odysee/lbry.
#         youtube-playlist,
#         youtube-channel,
#         invidious-channel,
#         video-recommended,
#         playlist/json-file,
#
#         The search will be a path to a json file laid out as described in VIDEO JSON FORMAT
#
#         history,
#         url/U,
#         u,
#         M/multi,
#         comments
#
#
#             default: youtube
#
#     $multi_search
#
#         Whether or not to enable multi search. default: 0
#     $search_sort_by
#
#         The attribute to sort by when searching.
#
#         relevance (default)
#         rating (youtube only)
#         upload_date
#         oldest_first (odysee only)
#         view_count (youtube only)
#
#     $search_upload_date
#
#         Search for videos within the last:
#
#         hour
#         today
#         week
#         month
#         year
#
#     $search_video_duration
#
#         Whether or not to search for long or short videos. Possible options:
#
#         short
#         long
#
#     $search_result_type
#
#         The type of results to get.
#
#         video (default)
#         playlist
#         channel
#         all (may not work on some instances)
#
#     $nsfw
#
#         Whether or not to search for nsfw videos in odysee/O.
#         default: false
#     $search_result_features
#
#         The features to have on a video (comma separated).
#
#         hd
#         subtitles
#         creative_commons
#         3d
#         live
#         4k
#         360
#         location
#         hdr
#
#     $search_region
#
#         The region (country code) to search. default: US
#     $invidious_instance
#
#         The instance of invidious to use.
#         default: https://vid.puffyan.us
#     $pages_to_scrape
#
#         The amount of pages to scrape on youtube/invidious.
#         default: 1
#     $pages_start
#
#         The starting page to scrape.
#         default: 1
#     $max_thread_count
#
#         The amount of threads that can be used while scraping youtube search, playlists, and channels. (this does not apply to the subscription scraper)
#         default: 20
#     $odysee_video_search_count
#
#         The amount of videos to scrape on odysee.
#         default: 30
#     $sub_link_count
#
#         The amount of videos to scrape per channel when getting subscriptions.
#         default: 2
#
# Misc
#
#     $scrape_search_exclude
#
#         The scrapers to not ask for a search query.
#         Be sure to have a space at the end and beginning of the string.
#         default: youtube-subscriptions S SI T youtube-trending H history
#     $custom_scrape_search_exclude
#
#         Extra scrapers to not ask for a search query.
#         This will automatically be appended to $ scrape_search_exclude.
#         In addition, you do not need spaces at the start, and end, only between scrapers. default:
#     $gap_space
#
#         A number of spaces equal to half the width of your terminal
#         default: 115 spaces
#     $enable_hist
#
#         Whether or not to keep track of history
#         default: 1
#     $enable_search_hist
#
#         Whether or not to keep track of search history
#         default: 1
#     $search_source
#
#         How to get the search query. The builtin values for this are:
#
#         args
#
#             Use commandline arguments as the search (default)
#         prompt
#
#             Ask for a search via a prompt
#         hist
#
#             Use search history.
#         next
#
#             Used internally to use the next search in the list when multi_search is enabled.
#         fn-args
#
#             Used internally to use the function arguments passed to the function as the source.
#
#     $log_level
#
#         How much debug information to log.
#
#         2
#
#             Log everything
#         1
#
#             Log only warnings and errors
#         0
#
#             Log only errors
#         default: 2
#
#     $thumbnail_debug_log
#
#         The log file for thumbnail debug information. default:/dev/null
#     $useragent
#
#         The useragent to use when scraping websites.
#         default: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.152 Safari/537.36"
#     $ytdl_opts
#
#         The command-line options to pass to youtube-dl when downloading.
#     $ytdl_path
#
#         Path to youtube-dl or a fork of youtube-dl for downloading.
#         If yt-dlp is installed that will be preferred over youtube-dl
#         default: youtube-dl
#
# Option Parsing
#
#     $long_opt_char
#
#         The char to use for long opts.
#         default: -
#     $optstring
#
#         The string of options to use for the getopts function.
#         It is highly unrecommended to change this variable, unless you know what you are doing.
#         default: ac:de:fhi:lmn:qrstu:xADHI:LS:T:W:$long_opt_char:
#     $YTFZF_CHECK_VARS_EXISTS
#
#         Whether or not to check if variables in the environment already exist when setting default options.
#         This option can not be set in the config, it must be set in your startup shell with export, or before running ytfzf such as: YTFZF_CHECK_VARS_EXISTS=0 ytfzf ...
#         default:1
#
# State
# State values are NOT meant to be modified by the user.
#
#     $__is_submenu
#
#         Whether or not the script is in a submenu.
#     $__is_fzf_preview
#
#         Whether or not the script is running to display an fzf preview
#     __scrape_count
#
#         The current scrape count starting at 1.
#
# FUNCTIONS
#
# Sometimes a variable is not good enough, instead functions should be defined. To find the default value of these, check the source code by searching for function_exists "<function_you_are_looking_for>".
#
# Menu related functions
#
#     external_menu()
#
#         When $interface is ext_menu, call this function instead of fzf.
#         This function takes 1 argument, a prompt string.
#     get_sort_by()
#
#         This function is called to get the value to sort by when $is_sort is 1.
#         This function takes in a line in the form of "title |channel |duration |views |date |id".
#     data_sort_fn()
#
#         This function sorts the data that is being piped into it.
#         This function takes no arguments, all data is piped into it.
#     custom_info_wait_action_<text>()
#
#         This function is called if an unknown $info_wait_action is given or read.
#         <text> should be replaced with the text wanted from $info_wait_action, eg: custom_info_wait_e.
#         This function takes no arguments.
#     video_info_text()
#
#         This function prints the text for the selection menu.
#         Must end with a new line,
#         The url must be the last thing printed.
#         This function takes no arguments, the relevant variables are listed here:
#
#         title
#         channel
#         duration
#         views
#         date
#         url
#
#         It is recommended to check the script to see how each thing is printed.
#
#     thumbnail_video_info_text()
#
#         This function prints text in the preview area of fzf when thumbnails are enabled.
#         Everything can be printed however you like.
#         This function takes no arguments, the relevant variables are listed here:
#
#         title
#         channel
#         duration
#         views
#         date
#         url
#
#     thumbnail_video_info_text_<scraper>()
#
#         This function is the same as thumbnail_video_info_text() for the scraper specified.
#     on_no_thumbnail()
#
#         This function is run when no thumbnail is found
#     get_ueberzug_positioning_left()
#
#         This function sets the variables, $width, $height, $x, and $y. $x, and $y, should represent cols and lines not pixels.
#         These variables will be used to position and size the image in the fzf preview when $fzf_preview_side is left.
#         This function takes 2 arguments:
#
#         max_width
#         max_height
#
#         get_ueberzug_positioning_right()
#         This function sets the variables, $width, $height, $x, and $y.
#         $x, and $y, should represent cols and lines not pixels.
#
#         These variables will be used to position and size the image in the fzf preview when $fzf_preview_side is right.
#
#         This function takes 2 arguments:
#         max_width
#         max_height
#
#         get_ueberzug_positioning_up()
#         This function sets the variables, $width, $height, $x, and $y.
#         $x, and $y, should represent cols and lines not pixels.
#
#         These variables will be used to position and size the image in the fzf preview when $fzf_preview_side is up.
#
#         This function takes 2 arguments:
#         max_width
#         max_height
#
#         get_ueberzug_positioning_down()
#         This function sets the variables, $width, $height, $x, and $y.
#         $x, and $y, should represent cols and lines not pixels.
#
#         These variables will be used to position and size the image in the fzf preview when $fzf_preview_side is down.
#
#         This function takes 2 arguments:
#         max_width
#         max_height
#
#         get_swayimg_positioning_left()
#         This function sets the variables, $x, $y, $img_w, and $img_h.
#         $x, and $y, should represent pixels.
#
#         These variables will be used to position and size the image in the fzf preview when $fzf_preview_side is left.
#
#         This function takes 8 arguments:
#         img_w
#         img_h
#         max_width
#         max_height
#         max_height
#         term_x
#         term_y
#         col_px_width
#         line_px_height
#
#         get_swayimg_positioning_right()
#         This function sets the variables, $x, $y, $img_w, and $img_h.
#         $x, and $y, should represent pixels.
#
#         These variables will be used to position and size the image in the fzf preview when $fzf_preview_side is right.
#
#         This function takes 8 arguments:
#         img_w
#         img_h
#         max_width
#         max_height
#         max_height
#         term_x
#         term_y
#         col_px_width
#         line_px_height
#
#         get_swayimg_positioning_up()
#         This function sets the variables, $x, $y, $img_w, and $img_h.
#         $x, and $y, should represent pixels.
#
#         These variables will be used to position and size the image in the fzf preview when $fzf_preview_side is up.
#
#         This function takes 8 arguments:
#         img_w
#         img_h
#         max_width
#         max_height
#         max_height
#         term_x
#         term_y
#         col_px_width
#         line_px_height
#
#         get_swayimg_positioning_down()
#         This function sets the variables, $x, $y, $img_w, and $img_h.
#         $x, and $y, should represent pixels.
#
#         These variables will be used to position and size the image in the fzf preview when $fzf_preview_side is down.
#
#         This function takes 8 arguments:
#         img_w
#         img_h
#         max_width
#         max_height
#         max_height
#         term_x
#         term_y
#         col_px_width
#         line_px_height
#
#         search_prompt_menu()
#         This function asks the user to make a search query, and sets the variable $_search to the query.
#
#         This function is called if ytfzf is started without a search. (and is using the default interface)
#
#         This function takes no arguments.
#
#         search_prompt_ext()
#         This function asks the user to make a search query, and sets the variable $_search to the query.
#
#         This function is called if ytfzf is started without a search. (and is using the -D flag)
#
#         This function takes no arguments.
#
#         quick_menu()
#         This function should take user input and echo it back
#
#         This function is called with -f, and -q. Or any other time a generic menu is needed. (and the default interface is being used)
#
#         This function takes 1 argument, and takes input from stdin
#
#         1: The prompt to use.
#
#         stdin: the items to choose from (separated by new lines)
#
#         quick_menu_ext()
#         This function should do the same thing as quick_menu()
#
#         This function is called when quick_menu() would be called, but when -D is enabled.
#
#         This function takes 1 argument, and takes input from stdin
#
#         1: The prompt to use.
#
#         stdin: the items to choose from (separated by new lines)
#
#         info_wait_prompt()
#         The prompt to use when info_wait is enabled.
#
#         This function takes no arguments.
#
#         info_wait_prompt_ext()
#         Same as info_wait_prompt() when -D is used.
#
#         This function takes no arguments.
#
#         info_wait_prompt_wrapper()
#         Call info_wait_prompt_<interface_name>
#
#         This function takes no arguments.
#
#         display_text()
#         Print text to standard out.
#
#         This function takes an unlimited number of arguments to print.
#
#         display_text_ext()
#         Print text to standard out.
#
#         This function takes an unlimited number of arguments to print.
#
#         display_text_wrapper()
#         Call display_text_<interface_name>
#
#         This function takes an unlimited number of arguments to print.
#
#         URL handlers
#
#         A URL handler is a function that handles the urls given,
#
#         URL handlers should take into account these modifier values,
#         $video_pref ,
#         $is_audio_only ,
#         and
#         $is_detach
#
#         Modifier variables will be piped into a URL handler to allow for URL handlers to be written in any language.
#
#         They will be piped in the order shown above separated by spaces.
#
#         multimedia_player()
#         The handler that is called by default.
#
#         This function opens either video_player() or audio_player() depending on whether or not
#
#         $is_audio_only (-m) is enabled.
#
#         This function takes in an unlimited amount of arguments, each of which is a link to a video.
#
#         video_player()
#         Plays the urls with a video player
#
#         This function takes in an unlimited amount of arguments, each of which is a link to a video.
#
#         audio_player()
#         Plays the urls with an audio player
#
#         This function takes in an unlimited amount of arguments, each of which is a link to a video.
#
#         downloader()
#         Downloads the urls
#
#         This function takes in an unlimited amount of arguments, each of which is a link to a video.
#
#         get_video_format_<name>()
#         A custom format selection screen
#
#         <name> should be the the wanted value of $format_selection_screen
#
#         This function should set ytdl_pref
#
#         This function takes all urls as separate arguments.
#
#         on_open_url_handler_<ext>()
#         This function is run when open_url_handler is called, but before the url handler is actually opened.
#
#         This function takes an unlimited number of arguments, each argument is a url that was opened.
#
#         close_url_handler_<name>
#         <name> should be the name of the url handler with - replaced with _.
#
#         A function that happens after the url handler has finished playing.
#
#         The point of this function is to clean up anything that the url handler did.
#
#         after_close_url_handler_<ext>
#         A function that happens after the url handler has finished playing, and after
#         close_url_handler_<name>
#         has happened.
#
#         If
#         is_detach
#         is
#         1
#         this function may be called immediately after
#         url_handler
#         opens.
#
#         Search History
#
#         handle_search_history()
#         This function handles appending the search to the given search file.
#
#         This function takes 2 arguments:
#         1
#         The search to write
#         2
#         The file to append to.
#
#         parse_search_hist_file()
#         This function should parse the search history file, and print out each search separated by new lines.
#
#         The search history file will be fed through stdin.
#
#         get_search_from_<src>()
#         If search_source is set to <src> this function will be called.
#         This function is expected to set the variable _search to a search query.
#
#         This function takes no arguments.
#
#         on_search()
#         This function gets called each time a website is scraped.
#
#         This function takes 2 arguments:
#         1
#         The search query
#         2
#         The current scrape
#
#         on_search_<search_query>()
#
#             This function gets called each time a website is scraped if the current search matches <search_query>.
#             This function takes 1 argument.
#
#             1
#
#                 The current scrape
#
#     Misc
#
#         get_requested_info_<name>()
#
#             If <name> is in info_to_print this function will be run.
#             This function takes no arguments.
#         handle_playing_notifications()
#
#             This function sends a notification for the videos that are about to be played.
#             This function takes an unknown amount of urls as arguments.
#         post_scrape()
#
#             This function happens after all scraping is complete
#         post_scrape_<extension-name>()
#
#             Same as post_scrape() but for each extension
#         on_opt_parse()
#
#             This function gets called after an option is parsed, and sets variables based the options passed into it. A non 0 exit code will override the default behavior of a specific option.
#             This function takes 4 arguments:
#
#         1
#             The current option being parsed
#         2
#             The current option argument being parsed
#         3
#             The unmodified option being parsed.
#             For an option such as -a, this value will be the same as $1.
#             However, for every --long-option this value will be "-".
#         4
#             The unmodified option argument being parsed.
#             For an option such as -c S, this value will be the same as $2.
#             However, for every --long-option=value, this value will be -long-option=value.
#
#         on_opt_parse_<opt_name>()
#
#             This function gets called before an option is parsed. A non 0 exit code will override the default behavior of a specific option.
#             This function takes 3 arguments:
#
#             1
#
#                 The the optarg
#             2
#
#                 The raw opt
#             3
#
#                 The raw optarg
#
#         on_post_set_vars()
#
#             This function gets called after all vars are set, and all opts are parsed.
#             This function takes no arguments.
#         on_clean_up()
#
#             This function is called when the script is cleaning up files from the search, or when the script exits.
#             This function takes no arguments.
#         usage()
#
#             This function calls the print_help_<ext> for each loaded extension.
#             This function takes no arguments.
#         handle_custom_keypresses()
#
#             This function gets called in the internal handle_keypress() function. This function should return 0 to not override the default handle_keypress() function.
#             This function takes 1 argument:
#
#         1
#             The key pressed.
#
#         handle_custom_post_keypresses()
#
#             This function gets called in the internal handle_post_keypress() function, this function should return 0 to not override the default handle_post_keypress() function.
#             The job of this function is to undo the changes of the last keypress.
#             This function takes no arguments, it must get the keypress from $keypress_file
#         handle_keypress_*()
#
#             The name of this function should replace the "*" with the name of the shortcut, eg: alt_d
#             in addition replace any "-" with "_".
#             This function is called after handle_custom_keypresses() if it returned 0, and the shortcut is not a built-in shortcut.
#             This function takes 0 arguments.
#         handle_post_keypress_*()
#
#             The name of this function should replace the "*" with the name of the shortcut, eg: alt_d
#             in addition replace any "-" with "_".
#             This function is called after handle_custom_post_keypresses() if it returned 0, and the shortcut is not a built-in shortcut.
#             this function takes 0 arguments.
#         handle_custom_action()
#
#             This function is called when an unknown action (as described in VIDEO JSON FORMAT) is given.
#             This function takes 1 argument:
#
#             The action.
#
#
#         Exit Codes:
#
#             1
#
#                 go back to menu
#             2
#
#                 exit
#
# CUSTOM THUMBNAILS
#
# Custom thumbnails are located in $YTFZF_CUSTOM_THUMBNAILS_DIR. The name of the image must be <video-id>.jpg
#
# To see an example, make a search with ytfzf and locate the thumbnails folder in $cache_dir/search
#
# Custom thumbnails are going to try to be loaded before the official thumbnail.
# If a custom thumbnail, and the official thumbnail doesn't exist, ytfzf will try to use $YTFZF_CUSTOM_THUMBNAILS_DIR/YTFZF:DEFAULT.jpg .
# VIDEO JSON FORMAT
#
# This is the format used for playlists, and custom scrapers.
# Videos should be objects in a list.
#
# Required object keys:
#
# ID (string): a unique id to the video
# url (string): the url to the video
# title (string): the title of the video
# scraper (string): The scraper that created the json (used for thumbnails)
#
#     thumbs (string): a url to a thumbnail/image
#     channel (string): the channel name
#     duration (string): length of the video (standard: [HH:]MM:SS)
#     views (string): amount of views a video has
#     date (string): upload date (standard: date is relative to current day, eg: 3 days ago)
#     action (string): an action in the format of "action [key=value key2=value2...]"
#
# Example JSON:
#
# [
#     {
# 	"ID": "dQw4w9WgXcQ",
# 	"url": "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
# 	"title": "definitely not never gonna give you up"
#     }
# ]
#
# PLAYLISTS
#
# A playlist is a json file in the format of VIDEO JSON FORMAT, To easily get the formatted json for a video, run ytfzf -I VJ <search
# SORT NAMES
#
# A sort name is a function in your config file, or a shell script in $YTFZF_SORT_NAMES_DIR that defines the following functions:
# data_sort_fn()
# get_sort_by()
# CUSTOM SCRAPERS
#
# Custom scrapers shell scripts located in $YTFZF_CUSTOM_SCRAPERS_DIR.
# A scraper is responsible for scraping videos from a website and APPENDING them to "$ytfzf_video_json_file".
# The shell script must be the same shell as your /bin/sh.
#
# Other functions this script may define:
#
# on_startup_<name_of_scraper>
#
#     This function will be called when the scraper is sourced (which is when the user asks for it).
#
#     This function takes no arguments.
#
# thumbnail_video_info_text_<name_of_scraper>
#
#     This function shall print information for the thumbnails interface.
#
#     This function is effectively the same as thumbnail_video_info_text().
#
# scrape_next_page_<scraper>
#
#     This function shall scrape more videos from <scraper>.
#     In order for this function to be called properly with alt-p, or ctrl-p, the page it left off on must be written to ${session_cache_dir}/<scraper>-current-page.
#     Where scraper is the name of the scraper with _ instead of -
#
#     <scraper> should be the name put in the "scraper" attribute in VIDEO JSON FORMAT
#
#     This function will happen if the user presses alt-p in fzf.
#
#     This function takes no arguments.
#
# handle_custom_action_<action_name>
#
#     This function shall handle a custom action.
#
#     <action_name> should be the name of the action replacing any "-" with "_".
#
#     This function takes 1 argument.
#
#         1
#
#             The action arguments
#
#     Exit Codes:
#
#         1
#
#             go back to menu
#         2
#
#             exit
#
# CUSTOM INTERFACES
#
# Custom interfaces are shell scripts located in $YTFZF_CUSTOM_INTERFACES_DIR.
# An interface is responsible for letting the user pick a video from "$ytfzf_video_json_file", then writing the url(s) to "$ytfzf_selected_urls"
# The shell script must be the same shell as your /bin/sh.
# In addition, the script must also define the function interface_<name_of_interface>
# With _ replacing -.
# This function could handle everything itself, or call another program written in any language to handle it.
#
# interface_<name_of_interface> will take a path to the json file holding all data about all the videos as the first argument.
# The second argument will be a path to a file to store the selected url in, separated by new lines.
#
# Other functions the scraper may define:
#
# search_prompt_menu_<name_of_interface>()
#
#     This function should do the same thing as search_prompt_menu(). This function takes no arguments.
#     If this function is not defined, search_prompt_menu_ext() will be called instead.
# quick_menu_<name_of_interface>()
#
#     This function should do the same thing as quick_menu(). This function takes no arguments.
#     If this function is not defined, quick_menu_ext() will be called instead.
# display_text_<name_of_interface>()
#
#     This function should display text in a way that is copy and pasteable. This function takes an unlimited number of arguments.
#
#     ...
#
#         The text to display
#
# info_wait_prompt_<name_of_interface>()
#
#     This function should ask the user to pick an info_wait_action option. It should then set the variable info_wait_action equal to the user's choice. This function takes no arguments.
#
# THUMBNAIL VIEWERS
#
# Custom thumbnail viewers are programs in $YTFZF_THUMBNAIL_VIEWERS_DIR. Arguments:
#
#     1
#
#         An action, there are 3 actions, start, stop, view, no-img
#     2
#
#         The path to the thumbnail.
#     3
#
#         x position (in columns) of the image
#     4
#
#         y position (in lines) of the image
#     5
#
#         width of image (in columns)
#     6
#
#         height of image (in lines)
#     7
#
#         max width of image (in columns) (width already accounts for this)
#     8
#
#         max height of image (in lines) (height already accounts for this)
#     9
#
#         side of the terminal to display the image (x, y, width, height already account for this)
#         this will be either up down left right
#
# EXTENSIONS
#
# Extensions are essentially extra config files that you can load in your own config file.
#
# Extensions should either be in $YTFZF_EXTENSIONS_DIR or $YTFZF_SYSTEM_ADDON_DIR/extensions
#
# An extension can do anything a config file can, this includes modifying the default utility functions in ytfzf (which could break the script)
#
# Extensions will be given a variable called $__loaded_path which is the full path to the extension that is loaded.
# This is helpful when needing to determine the current runtime path for the extension.
#
# To load an extension add load_extension name-of-extension to $YTFZF_CONFIG_FILE
#
# There are two automatically loaded extensions, __ytfzf__ and __ytfzf_multisearch__
# __ytfzf_multisearch__ is only loaded if $multi_search is 1
#
# Functions for extensions, where <ext> is replaced with the name of the extension, and all - are replaced with _.
#
# on_clean_up_<ext>()
#
#     Runs when the script exits. This function takes no arguments.
# on_no_thumbnail_<ext>()
#
#     Runs when no thumbnail is found. This function takes no arguments.
# after_close_url_handler_<ext>()
#
#     Runs after the url handler is closed. This function takes no arguments.
# on_post_set_vars_<ext_name>()
#
#     Replace ext_name with the name of an extension (with - replaced with _). This function is the same as on_post_set_vars
# ext_on_search_<ext>()
#
#     Runs for before the website is scraped, for every search query. This function takes two arguments.
#
#     1
#
#         The current search
#     2
#
#         The current scrape type
#
# post_scrape_<ext>()
#
#     Runs after scraping is complete. This function takes no arguments.
# on_init_search_<ext>()
#
#     Runs when the search is being initialized. This function takes one argument.
#
#     1
#
#         The search
#
# UTILITY FUNCTIONS
#
# A utility function is any function that can be used in configuration files, extensions, thumbnail viewers, interfaces, search-names,
#
# refresh_inv_instances()
#
#     This function writes the response from "https://api.invidious.io/instances.json?sort_by=type,health,api" to $cache_dir/instances.json. This function takes no arguments.
# get_invidious_instances()
#
#     This function grabs invidious instances that have an api and prints them separated by a new line. This function takes no arguments.
# create_sorted_video_data()
#
#     This function prints a sorted jsonl string of the scraped videos that can be used in an interface This function takes no arguments.
# run_interface()
#
#     Runs the function interface_<interface_name>, and passes $ytfzf_video_json_file, and $ytfzf_selected_urls This function takes no arguments.
# download_thumbnails()
#
#     If $skip_thumb_download is 0, this function downloads thumbnails. This function takes an unlimited number of arguments formatted in the following way:
#
# <url_name>;<id>
#
# This function should download <url_name> and save it as <id>.jpg in the $thumb_dir folder.
#
# prepare_for_set_args()
#
#     This function sets the variable $OLD_IFS to $IFS, then sets $IFS to the first argument, lastly it runs set -f. This function takes one argument.
#
#     1
#
#         The new IFS.
#
# end_of_set_args()
#
#     This function sets IFS to OLD_IFS. This function takes no arguments.
# modify_ifs()
#
#     This function sets IFS to the first argument. This function takes one argument.
#
#     1
#
#         The value to set IFS to.
#
# end_modify_ifs()
#
#     This function unsets $IFS. This function takes no arguments.
# mul_str()
#
#     This function does string multiplication, then prints the result to stdout. This function takes two arguments.
#
#     1
#
#         The string.
#     2
#
#         The amount to duplicate the string.
#
# remove_ansi_escapes()
#
#     This function removes ansi escape sequences from a string passed to this function through stdin. This function then prints the final string to stdout. This function takes no arguments.
# remove_quotes_on_var_value()
#
#     This function removes the leading and ending quotes from a string passed through stdin. This function prints the final string to stdout. This function takes no arguments
# do_an_event_function()
#
#     This function runs an event if it exists, then runs event_<ext> for every loaded extension $loaded_extensions, if they exist. This function takes an unlimited number of arguments.
#
#     1
#
#         The name of the event.
#     ...
#
#         The arguments to pass to event
#
# detach_cmd()
#
#     This function detaches a command from the terminal. This function takes an unlimited number of arguments.
#
#     1
#
#         The command to run
#     ...
#
#         The arguments to pass to the command.
#
# source_scrapers()
#
#     This function goes through each scraper listed in $scrape, and sources the appropriate file. After sourcing the file, it runs the on_startup_<scrape> function, if $__is_fzf_preview is 0. This function checks the following locations for the file to source.
#
#     $YTFZF_CUSTOM_SCRAPERS_DIR
#     $YTFZF_SYSTEM_ADDON_DIR/scrapers
#     $YTFZF_CUSTOM_SCRAPERS_DIR
#     $YTFZF_SYSTEM_ADDON_DIR/scrapers
#
# add_commas()
#
#     This function adds commas to a number (in the standard english way). This function gets a number from stdin, and prints the result to stdout. This function takes no arguments.
# command_exists()
#
#     This function checks if a command exists. This function exits with status code 0 if it exists, and 1 if it does not. This function takes 1 argument.
#
#     1
#
#         The command to check
#
# get_key_value()
#
#     This function gets the value by a key in a key_value string.
#     A key_value string is formatted in the following way:
#
# <sep>key=value<sep>...
# where <sep> is argument 3, by default a space.
#
# If there is only one key_value pair, there must still be <sep> on each side.
# After printing the value to stdout, this function sets the variable $KEY_VALUE to the value of the key.
# This function exits with status code 0 if the value is not empty, and 1 if it is empty.
# This function takes three arguments.
#
#     1
#
#         The key_value string.
#     2
#
#         The key to find the value for.
#     3 (optional)
#
#         The separator that separates each key_value pair. By default this is a space.
#
# title_str()
#
#     This function capitalizes the first letter of a string, and prints it to stdout. This function takes one argument.
#
#     1
#
#         The string to title.
#
# shuf()
#
#     This function is only created if shuf is not installed. This function should act the same as the base functionality of shuf
# print_info()
#
#     This function prints information to stderr, if $log_level is greater than or equal to 2. This function takes one argument.
#
#     1
#
#         The text to print
#
# print_warning()
#
#     This function prints a warning to stderr, if $log_level is greater than or equal to 1. This function takes one argument.
#
#     1
#
#         The text to print
#
# print_error()
#
#     This function prints a warning to stderr, if $log_level is greater than or equal to 0. This function takes one argument.
#
#     1
#
#         The text to print
#
# clean_up()
#
#     This function kills all ytfzf(1) subprocesses, and removes $session_cache_dir if $session_cache_dir exists, and if $keep_cache equals 0.
#     Lastly, it runs the on_clean_up event. This function takes no arguments.
# is_relative_dir()
#
#     Checks if a string is a relative path. This function exits with status code 0 if it is relative, and 1 if it is not. This function takes one argument.
#
#     1
#
#         The path to check
#
# die()
#
#     This function runs print_error with a string, then exits with a status code. This function takes two arguments.
#
#     1
#
#         The exit status
#     2
#
#         The text to print with print_error.
#
# trim_url()
#
#     This function reads lines from stdin, and prints the url from them to stdout. The lines should be formatted in the following way:
#
# text....|url
#
# This function takes no arguments.
#
# get_search_from_source()
#
#     This function sets _search to a search depending on the source. This function takes an unlimited number of arguments.
#
#     1
#
#         The source to get the search from.
#     ...
#
#         The arguments to use as the search if $1 is fn-args, or if 1 is not matched, ... is given to get_search_from_<1>.
#
# load_extension()
#
#     This function adds an extension to the $loaded_extensions variable, and sources the extension. This function checks the following locations for the extension
#
# $YTFZF_EXTENSIONS_DIR
# $YTFZF_SYSTEM_ADDON_DIR/extensions
# $PATH
#
# This function exits with the same exit code as when the extension was loaded. This function takes one argument.
#
#     1
#
#         The extension to load
#
# extension_is_loaded()
#
#     This function checks if an extension is loaded. This function takes one argument.
#
#     1
#
#         The extension to check
#
# load_sort_name()
#
#     This function loads a sort-name. This function checks the following locations for the sort-name.
#
# $YTFZF_SORT_NAMES_DIR
# $YTFZF_SYSTEM_ADDON_DIR/sort-names
#
# This function exits with status code 1 if the sort-name does not exist, otherwise it exits with the same status code as when the sort-name was loaded. This function takes one argument.
#
#     1
#
#         The sort-name to load
#
# load_url_handler()
#
#     This function sets $url_handler to a url-handler. This function checks the following locations for the url-handler.
#
# $PATH, and functions in config file
# $YTFZF_URL_HANDLERS_DIR
# $YTFZF_SYSTEM_ADDON_DIR/url-handlers
# If the url-handler does not exist, this function runs die.
# This function takes one argument.
# 1
# The url-handler to load
#
# load_interface()
# This function sets $interface to an interface.
# If $1 is equal to ext, scripting, or "", $interface is set to 1.
# This function checks the following locations for the interface.
# $1
# $YTFZF_CUSTOM_INTERFACES_DIR
# $YTFZF_SYSTEM_ADDON_DIR/interfaces
#
# This function takes one argument.
#
#     1
#
#         The interface to load
#
# load_thumbnail_viewer()
#
#     This function sets $thumbnail_viewer to a thumbnail-viewer. If $i is equal to a built-in thumbnail-viewer, $thumbnail_viewer is set to that. Otherwise, the following locations are checked.
#
# $1
# $YTFZF_THUMBNAIL_VIEWERS_DIR
# $YTFZF_SYSTEM_ADDON_DIR
#
# This function takes one argument.
#
#     1
#
#         The thumbnail viewer to load
#
# _get_request()
#
#     This function sends a request to a server and prints the response. This function takes Unlimited arguments.
#
#     1
#
#         The url to send a request to
#     ...
#
#         Arguments to pass to curl(1)
#
# _get_real_channel_link()
#
#     This function converts a youtube channel link in the form of
#
# @user
# https://www.youtube.com/user/<channel-name>
# https://www.youtube.com/c/<channel-name>
#
# This function takes one argument.
#
#     1
#
#         The link to convert



# SHORTCUTS
#
# These shortcuts will apply in any menu that supports it.
# The only menu that currently supports it is fzf.
# Shortcuts starting with alt, will exit the menu, shortcuts starting with ctrl will not.
# To change any of the defaults set the corresponding variable in your configuration file.
#
# download
#
#     alt-d (download_shortcut)
# watch video
#
#     alt-v (video_shortcut)
# audio only
#
#     alt-m (audio_shortcut)
# detatch
#
#     alt-e (detach_shortcut)
# print link
#
#     alt-l (print_link_shortcut)
# show formats
#
#     alt-f (show_formats_shortcut)
# show all info
#
#     alt-i (info_shortcut)
# new search
#
#     alt-s (search_again_shortcut)
# scrape next page
#
#     ctrl-p (next_page_action_shortcut)
#
# OPTIONS
#
# Information
#
#     -h, --help
#
#         Show help text.
#     --version
#
#         Show ytfzf's version.
#
# How to play the selected videos.
#
#     -d, --download
#
#         Download the selected videos. This can also be set in the config file with is_download.
#     -m, --audio-only
#
#         Play audio only. This can also be set in the config file with is_audio_only.
#     -f, --formats
#
#         Show available formats before proceeding.
#     --format-selection=screen
#
#         The format selection screen type to use.
#
#         Types:
#
#             normal
#             simple
#
#         This can also be set in the config file with format_selection_screen.
#
#     --format-sort=sort
#
#         The --format-sort to use in ytdl. This can also be set in the config file with format_selection_sort.
#     --video-pref=pref
#
#         Set the ytdl video format to pref. This can also be set in the config file with video_pref.
#     --audio-pref=pref
#
#         Set the ytdl audio format to pref. This can also be set in the config file with audio_pref.
#     --ytdl-pref=pref
#
#         Set the ytdl format to pref. This can also be set in the config file with ytdl_pref.
#     --detach
#
#         Detach the video player from the terminal. This can also be set in the config file with is_detach.
#     -u, --url-handler=handler
#
#         The function/program to use as a url handler. This can also be set in the config file by adding load_url_handler <handler>.
#     -I option
#
#         Instead of playing the selected videos, get information about them in the selected format. The available options are:
#
#         L|l|link
#
#             Prints the URL of the selected videos.
#         VJ|vj|video-json
#
#             Prints the json of the selected videos.
#         J|j|json
#
#             Prints the json of all the videos in the search results.
#         F|f|format
#
#             Prints the video format being used.
#         R|r|raw
#
#             Prints the data of the selected videos, as appears in the menu.
#
#     -L
#
#         Alias for -I L
#     --info-action=Iaction
#
#         The action to do when --info-wait is 1. info_wait_action.
#     --info-wait=number
#
#         Whether or not to wait after printing info requested with -I or -L. This can also be set in the config file with info_wait.
#
# --url-handler-opts=opts
#
#     Opts to pass to the url handler, by default this will pass extra opts to mpv. This can also be set in the config file with url_handler_opts.
#
# Menu options
#
#     -l, --loop
#
#         Reopen the menu when the video stops playing. This can also be set in the config file with is_loop.
#     -s, --search-again
#
#         After closing fzf make another search. This can also be set in the config file with search_again.
#     -t, --show-thumbnails
#
#         Show thumbnails. Doesn't work with -D or -H. This can also be set in the config file with show_thumbnails.
#     --async-thumbnails
#
#         Whether or not to download thumbnails asynchronously.
#         Downloading asynchronously will open the menu before all thumbnails are downloaded. This can also be set in the config file with async_thumbnails.
#     --skip-thumb-download
#
#         Whether or not to skip the thumbnail download. This is used if you want to not have thumbnails, or use custom thumbnails in $YTFZF_CUSTOM_THUMBNAILS_DIR.
#         For more info see CUSTOM THUMBNAILS in ytfzf(5)
#         This can also be set in the config file with skip_thumb_download.
#     --notify-playing
#
#         Show notifications when a video is about to be played, and other notifications relating to playing videos. This can also be set in the config file with notify_playing.
#     --preview-side=side
#
#         The preview side in fzf.
#         Options:
#
#         left
#         right
#         up
#         down
#
#     This can also be changed in the config file with fzf_preview_side.
#
#     -T, --thumb-viewer=program
#
#         Use program for displaying thumbnails.
#         Built-in programs:
#
#         chafa,chafa-16,chafa-tty
#
#             chafa, chafa with 16 colors, chafa with 4 colors.
#         catimg,catimg-256
#
#             catimg, catimg with 256 colors.
#         imv
#
#             Good with tiling window managers.
#         mpv
#
#             Similar to imv.
#         swayimg
#
#             Only works on the sway wayland compositor.
#         swayimg-hyprland
#
#             Only works on the hyprland compositor. Uses swayimg to render an image.
#         <custom>
#
#             Additional viewers can be put into $YTFZF_THUMBNAIL_VIEWERS_DIR.
#
#     This can also be changed in the config file by adding
#     load_thumbnail_viewer <viewer>.
#
#     -D, --external-menu
#
#         Use an external menu instead of fzf. The default is dmenu. This can also be set in the config file with interface="ext".
#     -i, --interface=interface
#
#         Use a custom interface script, which would be in $YTFZF_CUSTOM_INTERFACES_DIR. This can also be set in the config file by adding load_interface <interface>.
#     --sort
#
#         Sorts videos (after scraping) by upload date. This can also be set in the config file by adding is_sort.
#     --sort-name=name
#
#         Calls a function set in $YTFZF_CONFIG_FILE. Or sources a script in $YTFZF_SORT_NAMES_DIR (if it exists). See SORT NAMES in ytfzf(5) for more information.
#     --fancy-subs
#
#         Whether or not to have a separator between each subscription. When this option is used it automatically disables --sort as it will mess up this option.
#         This can also be set in the config file with fancy_subs.
#     --disable-back
#
#         Whether or not to disable the back button in submenus.
#         This can also be set in the config file with enable_back_button. --disable-actions Whether or not to disable actions such as submenus and the back button.
#         This can also be set in the config file with enable_actions.
#     --disable-submenus
#
#         Whether or not to disable submenus.
#         Submenus are the menus that happen after a playlist or channel (currently only supported by youtube/invidious) is selected
#         This can also be set in the config file with enable_submenus.
#     --keep-vars
#
#         Whether or not options passed into ytfzf also get passed into submenus. This can also be set in the config file with keep_vars.
#     --submenu-opts=opts
#
#         The opts to use in the submenu.
#         This can also be set in the config file with submenu_opts.
#     --submenu-scraping-opts=opts
#
#         DEPRECATED (use --submenu-opts instead) Does the same thing as --submenu-opts.
#         This can also be set in the config file with submenu_scraping_opts.
#
# Auto selecting
#
#     -a, --auto-select
#
#         Auto-play the first result.
#     -A, --select-all
#
#         Select all results.
#     -r, --random-select
#
#         Auto-play a random result.
#     -S sed address, --select=sed address
#
#         Auto-play a specific video.
#
#         Examples:
#
#             2
#
#                 Select the second video
#             $
#
#                 Select the last video
#             /^h/
#
#                 Select all videos starting with h
#
#     -n number, --link-count=number
#
#         The number of videos to select with -a or -r.
#
# Scrapers
#
#     -c scrapers, --scrape=scrapers
#
#         Set which scraper to use. Multiple scrapers can be separated by comma (,). The currently supported builtin scrapers are:
#
#         youtube|Y
#
#             Scrapes invidious' api with a search query
#         youtube-channel
#
#             Scrapes a youtube channel with youtube
#         invidious-channel
#
#             Scrapes a youtube channel with $invidious_instance
#             When this scrape is active the search query is the link to a channel.
#         video-recommended|R
#
#             Scrapes recommended videos from an invidious video link
#         youtube-playlist|invidious-playlist
#
#             Scrapes a youtube playlist
#             When this scrape is active the search query is the link to a playlist.
#         youtube-trending|T
#
#             Scrapes invidious' api to get youtube trending.
#             When this scrape is active the search query is the tab of trending to scrape.
#         M|multi
#
#             Uses ytfzf recursively to scrape multiple things with multiple different options
#             See ytfzf -c M :help for more info
#             Tabs:
#
#             gaming
#             music
#             movies
#
#         youtube-subscriptions|S|SI
#
#             SI Scrapes invidious for channels instead of youtube. Scraping youtube may result in rate limiting.
#         scrape-list|SL
#
#             uses your $YTFZF_SCRAPELIST_FILE as scrape and search input. See "scrape lists" ytfzf(5) for more information.
#         peertube|P
#         odysee|lbry|O
#         history|H
#
#             (Only if $enable_hist is enabled)
#         url|U
#
#             Opens the url in the video player and exits
#         u
#
#             Treats the url as an item, and will open fzf, or the external menu.
#         comments
#
#             Scrapes the comments of a video link from youtube
#
#     -H, --history
#
#         Alias for -c H.
#         Scrapes history file.
#     --scrape+=scrapers
#
#         Same as -c, but keeps the default scrape as well.
#     --scraper-=scrapers
#
#         Removes scraper from list of scrapers to use
#     --multi-search
#
#         Whether or not to use multi search.
#         To use multi search, separate each search with a comma, this works well when using multiple scrapers.
#         This can also be set in the config file with multi_search.
#     --force-youtube
#
#         When using the youtube scraper, convert the invidious links to youtube links before playing/downloading.
#
# Scraper Options
#
#     Currently, --video-duration, --type, --thumbnail-quality, and --features only applies to the scrape: youtube/Y
#
#     --pages=amount
#
#         Amount of pages to scrape on youtube/invidious, and the comments scraper. This can also be set in the config file with pages_to_scrape.
#     --pages-start=page
#
#         The page to start on. This can also be set in the config file with pages_start.
#     --max-threads=amount
#
#         Amount of threads that can be used to scrape youtube search, playlists, and channels. (this does not apply to the subscription scraper).
#         This can also be set in the config file with max_thread_count.
#     --single-threaded
#
#         Set the max_thread_count to 1, this has the same effect as making everything single threaded. (this does not apply to the subscription scraper).
#         This can also bet set in the config file with max_thread_count=1.
#     --odysee-video-count=amount
#
#         Amount of videos to scrape on odysee. This can also be set in the config file with odysee_video_search_count.
#     --nsfw
#
#         Whether or not to search for nsfw videos.
#         Only works with odysee/O This can also be set in the config file with nsfw.
#     --sort-by=sort
#
#         Works with youtube/Y and odysee/O.
#         To use a different sort for each scrape, use comma (,) to separate the sorts.
#         As apposed to --sort, this happens during the search, not after. Results should sort by:
#
#         relevance
#         rating (youtube only)
#         upload_date
#         oldest_first (odysee only)
#         view_count (youtube only)
#
#     --upload-date=time-frame
#
#         Works with youtube/Y and odysee/O
#         To use a different sort for each scrape, use comma (,) to separate the dates.
#         Search for videos within the last:
#
#         hour
#         today
#         week
#         month
#         year
#
#     --video-duration=duration
#
#         Whether or not to search for long or short videos. Possible options:
#
#         short
#         long
#
#     --type=type
#
#         The type of results to get.
#
#         video
#         playlist
#         channel
#         all
#
#     --thumbnail-quality=quality
#
#         Select the quality of the thumbnails. Available options:
#
#         maxres
#         maxresdefault
#         sddefault
#         high (default)
#         medium
#         default
#         start
#
#             The first frame of the video (low quality)
#         middle
#
#             The middle frame of the video (low quality)
#         end
#
#             The end frame of the video (low quality)
#
#     --features=features
#
#         The features to have on a video (comma separated).
#
#         hd
#         subtitles
#         creative_commons
#         3d
#         live
#         4k
#         360
#         location
#         hdr
#
#     --region
#
#         The region (country code) to search.
#         Supported by the scrapes youtube/Y and youtube-trending/T
#
# Miscellaneous
#
#     --ii=instance,--invidious-instance=instance
#
#         Use a different invidious instance.
#     --rii,--refresh-inv-instance
#
#         If this flag is provided, refresh instance cache with healthy instances using Invidious API
#     --available-inv-instances
#
#         Prints the invidious instances that may be used and exits.
#     --channel-link=link
#
#         Converts channel links from 'https://youtube.com/c/name' to 'https://youtube.com/channel/id'
#     -q
#
#         Use search history instead of a search. This can also be set in the config file with search_source=hist.
#     --search-source
#
#         The source to use for the search query. Valid values include:
#
#         args
#
#             Use commandline arguments as the search (default)
#         prompt
#
#             Ask for a search via a prompt
#         hist
#
#             Use search history.
#         next
#
#             Used internally to use the next search in the list when multi_search is enabled.
#         fn-args
#
#             Used internally to use the function arguments passed to the function as the source.
#         <custom>
#
#             A custom search source may be used if a function called get_search_from_<source> exists. The function must set the _search variable to a search.
#
#     -x, --history-clear=<search|watch>
#
#         Clear search and watch history (if -x or --history-clear is used)
#         To specify either search or watch history use --history-clear=<search|watch>
#     --keep-cache
#
#         Whether or not to keep cache after ytfzf exists. This can also be set in the config file with keep_cache.
#     --ytdl-opts=option
#
#         Pass command-line options to youtube-dl when downloading.
#
#     example: --ytdl-opts="
#
#     --ytdl-path=path
#
#         Specify the path to youtube-dl or a fork of youtube-dl for downloading.
#         This can also be set in the config file with ytdl_path.
#     -e, --ext=extension
#
#         Load an extension.
#         You may also add load_extension extension to your config file.
#     --list-addons
#
#         Lists all addons and exits.
#     --thumbnail-log
#
#         Sets the file to log thumbnail debug info to. This can also be set in the config file with thumbnail_debug_log.
#
# CONFIGURATION
#
# The default behaviour of ytfzf can be changed by modifying the config file. See ytfzf(5) for more information.
# ADDONS
#
# There are a few types of addons,
# interfaces (-i, --interface)
# scrapers (-c, --scrape)
# sort-names (--sort-name)
# thumbnail-viewers (-T, --thumb-viewer)
# url-handlers (-u, --url_handler)
# extensions (-e, --ext)
#
# To install an addon, place the addon in $YTFZF_SYSTEM_ADDON_DIR/<addon-type>/addon-name
#
# To use an addon, use one of the options listed above, or add
# load_interface <interface>
# scrape=<scraper>
# load_sort_name <sort-name>
# load_thumbnail_viewer <viewer>
# load_url_handler <url-handler>
# load_extension <ext>
# In your configuration file
# EXIT CODES
#
# 0
#
#     Success
# 1
#
#     General error
# 2
#
#     Invalid --option, option value, or configuration error.
# 3
#
#     Missing dependency
# 5
#
#     Empty search
#
# ENVIRONMENT
#
# $YTFZF_CONFIG_DIR
#
#     The directory to store config files. The default is $XDG_CONFIG_HOME/ytfzf (or ~/.config/ytfzf)
# $YTFZF_CONFIG_FILE
#
#     The configuration file to use. The default is $YTFZF_CONFIG_DIR/conf.sh
# $YTFZF_SUBSCRIPTIONS_FILE
#
#     The subscriptions file to use. The default is $YTFZF_CONFIG_DIR/subscriptions
# $YTFZF_SCRAPELIST_FILE
#
#     The scrapelist file to use. The default is $YTFZF_CONFIG_DIR/scrapelist
# $YTFZF_THUMBNAIL_VIEWERS_DIR
#
#     The directory to keep additional thumbnail viewers. The default is $YTFZF_CONFIG_DIR/thumbnail-viewers
# $YTFZF_CUSTOM_SCRAPERS_DIR
#
#     The directory to store custom scraper scripts in The default is $YTFZF_CONFIG_DIR/scrapers
# $YTFZF_CUSTOM_INTERFACES_DIR
#
#     The directory to store custom interface scripts in the default is $YTFZF_CONFIG_DIR/interfaces
# $YTFZF_SORT_NAMES_DIR
#
#     The directory to store custom sort-name scripts in the default is $YTFZF_CONFIG_DIR/sort-names
# $YTFZF_URL_HANDLERS_DIR
#
#     The directory to store custom url handlers in the default is $YTFZF_CONFIG_DIR/url-handlers
# $YTFZF_CUSTOM_THUMBNAILS_DIR
#
#     The directory to store custom thumbnails the default is $YTFZF_CONFIG_DIR/thumbnails
# $YTFZF_EXTENSIONS_DIR
#
#     The directory to store extensions the default is $YTFZF_CONFIG_DIR/extensions
# $YTFZF_SYSTEM_ADDON_DIR
#
#     The directory to store system installed addons. The default may vary depending on how you installed ytfzf.
# $YTFZF_CHECK_VARS_EXISTS
#
#     Whether or not to check if variables are set in the environment before setting default values. The default is 1
# $YTFZF_TEMP_DIR
#
#     The temporary directory The default is is $TMPDIR/ytfzf-$user-id.
#     If $TMPDIR is not defined it will use /tmp
#
# FILES
#
# ~/.config/ytfzf/conf.sh
#
#     The configuration file. If submenu-conf.sh does not exist, this will also be used as the config in submenus
# ~/.config/ytfzf/submenu-conf.sh
#
#     The submenu configuration file
# ~/.config/ytfzf/subscriptions
#
#     The subscriptions file.
#
# CACHE
#
# Each instance of ytfzf has its own directory in $YTFZF_TEMP_DIR, if $keep_cache is enabled, it uses $cache_dir instead.
# The structure of each instance folder looks like this: (<> represents a placeholder, ? means optional)
# If an addon scraper is used, it may use undocumented files.
#
#     $cache_dir
#     | -- watch_hist
#     | -- <search>-<pid>
#     |  | -- searches.list
#     |  | -- post-scrape
#     |  | -- <submenu-search>-<submenu-pid>?
#     |  | -- thumbnails?
#     |  | -- environment
#     |  | -- tmp
#     |  |  | -- curl_config
#     |  |  | -- <scrape>.html
#     |  |  | -- <scrape>.json
#     |  |  | -- <scrape>.json.final?
#     |  |  | -- menu_keypress
#     |  |  | -- all-ids.list
#     |  |  | -- downloaded-ids.list
#     |  | -- ids
#     |  | -- videos_json
#
# An explanation of each directory/file:
#
#     searches.list
#
#         A list of all searches
#         If --multi-search is enabled, each search is separated by a new line
#     watch_hist
#
#         The watch history file.
#     <search>-<pid>
#
#         An instance's parent folder.
#         If no search was given it uses the name "SCRAPE-<scrape>-<pid>" instead.
#     post-scrape
#
#         A folder that contains files relating to the scraping of a selected result.
#     <submenu-search>-<submenu-pid>
#
#         Created when a submenu is opened (eg: when a channel/playlist is selected).
#     thumbnails
#
#         Stores the thumbnails for the instance (only with -t).
#     environment
#
#         Every variable that is set and it's value, in that instance of ytfzf
#     tmp
#
#         Stores less important temporarily used files.
#     curl_config
#
#         The configuration file for curl for downloading thumbnails (only with -t).
#     <scrape>.html
#
#         For scrapers that need to scrape websites, this is the output of curl.
#     <scrape>.json
#
#         The json scraped from a website.
#     <scrape>.json.final
#
#         The final json scraped from a website. (Is used when multiple threads are used for scraping)
#     menu_keypress
#
#         The key pressed in fzf.
#     all-ids.json
#
#         File that contains all scraped ids. Mainly to compare against downloaded-ids.json
#     downloaded-ids.json
#
#         File that contains which thumbnails have been downloaded
#     ids
#
#         The file that stores the id of each selected video.
#     videos_json
#
#         The file that stores a json of all videos displayed in fzf.
#         This file is very helpful for making playlists as it is in the same format.
#
# SHORTCUTS
#
# These shortcuts will apply in any menu that supports it.
# The only menu that currently supports it is fzf.
# Shortcuts starting with alt, will exit the menu, shortcuts starting with ctrl will not.
# To change any of the defaults set the corresponding variable in your configuration file.
#
# download
#
#     alt-d (download_shortcut)
# watch video
#
#     alt-v (video_shortcut)
# audio only
#
#     alt-m (audio_shortcut)
# detatch
#
#     alt-e (detach_shortcut)
# print link
#
#     alt-l (print_link_shortcut)
# show formats
#
#     alt-f (show_formats_shortcut)
# show all info
#
#     alt-i (info_shortcut)
# new search
#
#     alt-s (search_again_shortcut)
# scrape next page
#
#     ctrl-p (next_page_action_shortcut)
#
# OPTIONS
#
# Information
#
#     -h, --help
#
#         Show help text.
#     --version
#
#         Show ytfzf's version.
#
# How to play the selected videos.
#
#     -d, --download
#
#         Download the selected videos. This can also be set in the config file with is_download.
#     -m, --audio-only
#
#         Play audio only. This can also be set in the config file with is_audio_only.
#     -f, --formats
#
#         Show available formats before proceeding.
#     --format-selection=screen
#
#         The format selection screen type to use.
#
#         Types:
#
#             normal
#             simple
#
#         This can also be set in the config file with format_selection_screen.
#
#     --format-sort=sort
#
#         The --format-sort to use in ytdl. This can also be set in the config file with format_selection_sort.
#     --video-pref=pref
#
#         Set the ytdl video format to pref. This can also be set in the config file with video_pref.
#     --audio-pref=pref
#
#         Set the ytdl audio format to pref. This can also be set in the config file with audio_pref.
#     --ytdl-pref=pref
#
#         Set the ytdl format to pref. This can also be set in the config file with ytdl_pref.
#     --detach
#
#         Detach the video player from the terminal. This can also be set in the config file with is_detach.
#     -u, --url-handler=handler
#
#         The function/program to use as a url handler. This can also be set in the config file by adding load_url_handler <handler>.
#     -I option
#
#         Instead of playing the selected videos, get information about them in the selected format. The available options are:
#
#         L|l|link
#
#             Prints the URL of the selected videos.
#         VJ|vj|video-json
#
#             Prints the json of the selected videos.
#         J|j|json
#
#             Prints the json of all the videos in the search results.
#         F|f|format
#
#             Prints the video format being used.
#         R|r|raw
#
#             Prints the data of the selected videos, as appears in the menu.
#
#     -L
#
#         Alias for -I L
#     --info-action=Iaction
#
#         The action to do when --info-wait is 1. info_wait_action.
#     --info-wait=number
#
#         Whether or not to wait after printing info requested with -I or -L. This can also be set in the config file with info_wait.
#
# --url-handler-opts=opts
#
#     Opts to pass to the url handler, by default this will pass extra opts to mpv. This can also be set in the config file with url_handler_opts.
#
# Menu options
#
#     -l, --loop
#
#         Reopen the menu when the video stops playing. This can also be set in the config file with is_loop.
#     -s, --search-again
#
#         After closing fzf make another search. This can also be set in the config file with search_again.
#     -t, --show-thumbnails
#
#         Show thumbnails. Doesn't work with -D or -H. This can also be set in the config file with show_thumbnails.
#     --async-thumbnails
#
#         Whether or not to download thumbnails asynchronously.
#         Downloading asynchronously will open the menu before all thumbnails are downloaded. This can also be set in the config file with async_thumbnails.
#     --skip-thumb-download
#
#         Whether or not to skip the thumbnail download. This is used if you want to not have thumbnails, or use custom thumbnails in $YTFZF_CUSTOM_THUMBNAILS_DIR.
#         For more info see CUSTOM THUMBNAILS in ytfzf(5)
#         This can also be set in the config file with skip_thumb_download.
#     --notify-playing
#
#         Show notifications when a video is about to be played, and other notifications relating to playing videos. This can also be set in the config file with notify_playing.
#     --preview-side=side
#
#         The preview side in fzf.
#         Options:
#
#         left
#         right
#         up
#         down
#
#     This can also be changed in the config file with fzf_preview_side.
#
#     -T, --thumb-viewer=program
#
#         Use program for displaying thumbnails.
#         Built-in programs:
#
#         chafa,chafa-16,chafa-tty
#
#             chafa, chafa with 16 colors, chafa with 4 colors.
#         catimg,catimg-256
#
#             catimg, catimg with 256 colors.
#         imv
#
#             Good with tiling window managers.
#         mpv
#
#             Similar to imv.
#         swayimg
#
#             Only works on the sway wayland compositor.
#         swayimg-hyprland
#
#             Only works on the hyprland compositor. Uses swayimg to render an image.
#         <custom>
#
#             Additional viewers can be put into $YTFZF_THUMBNAIL_VIEWERS_DIR.
#
#     This can also be changed in the config file by adding
#     load_thumbnail_viewer <viewer>.
#
#     -D, --external-menu
#
#         Use an external menu instead of fzf. The default is dmenu. This can also be set in the config file with interface="ext".
#     -i, --interface=interface
#
#         Use a custom interface script, which would be in $YTFZF_CUSTOM_INTERFACES_DIR. This can also be set in the config file by adding load_interface <interface>.
#     --sort
#
#         Sorts videos (after scraping) by upload date. This can also be set in the config file by adding is_sort.
#     --sort-name=name
#
#         Calls a function set in $YTFZF_CONFIG_FILE. Or sources a script in $YTFZF_SORT_NAMES_DIR (if it exists). See SORT NAMES in ytfzf(5) for more information.
#     --fancy-subs
#
#         Whether or not to have a separator between each subscription. When this option is used it automatically disables --sort as it will mess up this option.
#         This can also be set in the config file with fancy_subs.
#     --disable-back
#
#         Whether or not to disable the back button in submenus.
#         This can also be set in the config file with enable_back_button. --disable-actions Whether or not to disable actions such as submenus and the back button.
#         This can also be set in the config file with enable_actions.
#     --disable-submenus
#
#         Whether or not to disable submenus.
#         Submenus are the menus that happen after a playlist or channel (currently only supported by youtube/invidious) is selected
#         This can also be set in the config file with enable_submenus.
#     --keep-vars
#
#         Whether or not options passed into ytfzf also get passed into submenus. This can also be set in the config file with keep_vars.
#     --submenu-opts=opts
#
#         The opts to use in the submenu.
#         This can also be set in the config file with submenu_opts.
#     --submenu-scraping-opts=opts
#
#         DEPRECATED (use --submenu-opts instead) Does the same thing as --submenu-opts.
#         This can also be set in the config file with submenu_scraping_opts.
#
# Auto selecting
#
#     -a, --auto-select
#
#         Auto-play the first result.
#     -A, --select-all
#
#         Select all results.
#     -r, --random-select
#
#         Auto-play a random result.
#     -S sed address, --select=sed address
#
#         Auto-play a specific video.
#
#         Examples:
#
#             2
#
#                 Select the second video
#             $
#
#                 Select the last video
#             /^h/
#
#                 Select all videos starting with h
#
#     -n number, --link-count=number
#
#         The number of videos to select with -a or -r.
#
# Scrapers
#
#     -c scrapers, --scrape=scrapers
#
#         Set which scraper to use. Multiple scrapers can be separated by comma (,). The currently supported builtin scrapers are:
#
#         youtube|Y
#
#             Scrapes invidious' api with a search query
#         youtube-channel
#
#             Scrapes a youtube channel with youtube
#         invidious-channel
#
#             Scrapes a youtube channel with $invidious_instance
#             When this scrape is active the search query is the link to a channel.
#         video-recommended|R
#
#             Scrapes recommended videos from an invidious video link
#         youtube-playlist|invidious-playlist
#
#             Scrapes a youtube playlist
#             When this scrape is active the search query is the link to a playlist.
#         youtube-trending|T
#
#             Scrapes invidious' api to get youtube trending.
#             When this scrape is active the search query is the tab of trending to scrape.
#         M|multi
#
#             Uses ytfzf recursively to scrape multiple things with multiple different options
#             See ytfzf -c M :help for more info
#             Tabs:
#
#             gaming
#             music
#             movies
#
#         youtube-subscriptions|S|SI
#
#             SI Scrapes invidious for channels instead of youtube. Scraping youtube may result in rate limiting.
#         scrape-list|SL
#
#             uses your $YTFZF_SCRAPELIST_FILE as scrape and search input. See "scrape lists" ytfzf(5) for more information.
#         peertube|P
#         odysee|lbry|O
#         history|H
#
#             (Only if $enable_hist is enabled)
#         url|U
#
#             Opens the url in the video player and exits
#         u
#
#             Treats the url as an item, and will open fzf, or the external menu.
#         comments
#
#             Scrapes the comments of a video link from youtube
#
#     -H, --history
#
#         Alias for -c H.
#         Scrapes history file.
#     --scrape+=scrapers
#
#         Same as -c, but keeps the default scrape as well.
#     --scraper-=scrapers
#
#         Removes scraper from list of scrapers to use
#     --multi-search
#
#         Whether or not to use multi search.
#         To use multi search, separate each search with a comma, this works well when using multiple scrapers.
#         This can also be set in the config file with multi_search.
#     --force-youtube
#
#         When using the youtube scraper, convert the invidious links to youtube links before playing/downloading.
#
# Scraper Options
#
#     Currently, --video-duration, --type, --thumbnail-quality, and --features only applies to the scrape: youtube/Y
#
#     --pages=amount
#
#         Amount of pages to scrape on youtube/invidious, and the comments scraper. This can also be set in the config file with pages_to_scrape.
#     --pages-start=page
#
#         The page to start on. This can also be set in the config file with pages_start.
#     --max-threads=amount
#
#         Amount of threads that can be used to scrape youtube search, playlists, and channels. (this does not apply to the subscription scraper).
#         This can also be set in the config file with max_thread_count.
#     --single-threaded
#
#         Set the max_thread_count to 1, this has the same effect as making everything single threaded. (this does not apply to the subscription scraper).
#         This can also bet set in the config file with max_thread_count=1.
#     --odysee-video-count=amount
#
#         Amount of videos to scrape on odysee. This can also be set in the config file with odysee_video_search_count.
#     --nsfw
#
#         Whether or not to search for nsfw videos.
#         Only works with odysee/O This can also be set in the config file with nsfw.
#     --sort-by=sort
#
#         Works with youtube/Y and odysee/O.
#         To use a different sort for each scrape, use comma (,) to separate the sorts.
#         As apposed to --sort, this happens during the search, not after. Results should sort by:
#
#         relevance
#         rating (youtube only)
#         upload_date
#         oldest_first (odysee only)
#         view_count (youtube only)
#
#     --upload-date=time-frame
#
#         Works with youtube/Y and odysee/O
#         To use a different sort for each scrape, use comma (,) to separate the dates.
#         Search for videos within the last:
#
#         hour
#         today
#         week
#         month
#         year
#
#     --video-duration=duration
#
#         Whether or not to search for long or short videos. Possible options:
#
#         short
#         long
#
#     --type=type
#
#         The type of results to get.
#
#         video
#         playlist
#         channel
#         all
#
#     --thumbnail-quality=quality
#
#         Select the quality of the thumbnails. Available options:
#
#         maxres
#         maxresdefault
#         sddefault
#         high (default)
#         medium
#         default
#         start
#
#             The first frame of the video (low quality)
#         middle
#
#             The middle frame of the video (low quality)
#         end
#
#             The end frame of the video (low quality)
#
#     --features=features
#
#         The features to have on a video (comma separated).
#
#         hd
#         subtitles
#         creative_commons
#         3d
#         live
#         4k
#         360
#         location
#         hdr
#
#     --region
#
#         The region (country code) to search.
#         Supported by the scrapes youtube/Y and youtube-trending/T
#
# Miscellaneous
#
#     --ii=instance,--invidious-instance=instance
#
#         Use a different invidious instance.
#     --rii,--refresh-inv-instance
#
#         If this flag is provided, refresh instance cache with healthy instances using Invidious API
#     --available-inv-instances
#
#         Prints the invidious instances that may be used and exits.
#     --channel-link=link
#
#         Converts channel links from 'https://youtube.com/c/name' to 'https://youtube.com/channel/id'
#     -q
#
#         Use search history instead of a search. This can also be set in the config file with search_source=hist.
#     --search-source
#
#         The source to use for the search query. Valid values include:
#
#         args
#
#             Use commandline arguments as the search (default)
#         prompt
#
#             Ask for a search via a prompt
#         hist
#
#             Use search history.
#         next
#
#             Used internally to use the next search in the list when multi_search is enabled.
#         fn-args
#
#             Used internally to use the function arguments passed to the function as the source.
#         <custom>
#
#             A custom search source may be used if a function called get_search_from_<source> exists. The function must set the _search variable to a search.
#
#     -x, --history-clear=<search|watch>
#
#         Clear search and watch history (if -x or --history-clear is used)
#         To specify either search or watch history use --history-clear=<search|watch>
#     --keep-cache
#
#         Whether or not to keep cache after ytfzf exists. This can also be set in the config file with keep_cache.
#     --ytdl-opts=option
#
#         Pass command-line options to youtube-dl when downloading.
#
#     example: --ytdl-opts="
#
#     --ytdl-path=path
#
#         Specify the path to youtube-dl or a fork of youtube-dl for downloading.
#         This can also be set in the config file with ytdl_path.
#     -e, --ext=extension
#
#         Load an extension.
#         You may also add load_extension extension to your config file.
#     --list-addons
#
#         Lists all addons and exits.
#     --thumbnail-log
#
#         Sets the file to log thumbnail debug info to. This can also be set in the config file with thumbnail_debug_log.
#
# CONFIGURATION
#
# The default behaviour of ytfzf can be changed by modifying the config file. See ytfzf(5) for more information.
# ADDONS
#
# There are a few types of addons,
# interfaces (-i, --interface)
# scrapers (-c, --scrape)
# sort-names (--sort-name)
# thumbnail-viewers (-T, --thumb-viewer)
# url-handlers (-u, --url_handler)
# extensions (-e, --ext)
#
# To install an addon, place the addon in $YTFZF_SYSTEM_ADDON_DIR/<addon-type>/addon-name
#
# To use an addon, use one of the options listed above, or add
# load_interface <interface>
# scrape=<scraper>
# load_sort_name <sort-name>
# load_thumbnail_viewer <viewer>
# load_url_handler <url-handler>
# load_extension <ext>
# In your configuration file
# EXIT CODES
#
# 0
#
#     Success
# 1
#
#     General error
# 2
#
#     Invalid --option, option value, or configuration error.
# 3
#
#     Missing dependency
# 5
#
#     Empty search
#
# ENVIRONMENT
#
# $YTFZF_CONFIG_DIR
#
#     The directory to store config files. The default is $XDG_CONFIG_HOME/ytfzf (or ~/.config/ytfzf)
# $YTFZF_CONFIG_FILE
#
#     The configuration file to use. The default is $YTFZF_CONFIG_DIR/conf.sh
# $YTFZF_SUBSCRIPTIONS_FILE
#
#     The subscriptions file to use. The default is $YTFZF_CONFIG_DIR/subscriptions
# $YTFZF_SCRAPELIST_FILE
#
#     The scrapelist file to use. The default is $YTFZF_CONFIG_DIR/scrapelist
# $YTFZF_THUMBNAIL_VIEWERS_DIR
#
#     The directory to keep additional thumbnail viewers. The default is $YTFZF_CONFIG_DIR/thumbnail-viewers
# $YTFZF_CUSTOM_SCRAPERS_DIR
#
#     The directory to store custom scraper scripts in The default is $YTFZF_CONFIG_DIR/scrapers
# $YTFZF_CUSTOM_INTERFACES_DIR
#
#     The directory to store custom interface scripts in the default is $YTFZF_CONFIG_DIR/interfaces
# $YTFZF_SORT_NAMES_DIR
#
#     The directory to store custom sort-name scripts in the default is $YTFZF_CONFIG_DIR/sort-names
# $YTFZF_URL_HANDLERS_DIR
#
#     The directory to store custom url handlers in the default is $YTFZF_CONFIG_DIR/url-handlers
# $YTFZF_CUSTOM_THUMBNAILS_DIR
#
#     The directory to store custom thumbnails the default is $YTFZF_CONFIG_DIR/thumbnails
# $YTFZF_EXTENSIONS_DIR
#
#     The directory to store extensions the default is $YTFZF_CONFIG_DIR/extensions
# $YTFZF_SYSTEM_ADDON_DIR
#
#     The directory to store system installed addons. The default may vary depending on how you installed ytfzf.
# $YTFZF_CHECK_VARS_EXISTS
#
#     Whether or not to check if variables are set in the environment before setting default values. The default is 1
# $YTFZF_TEMP_DIR
#
#     The temporary directory The default is is $TMPDIR/ytfzf-$user-id.
#     If $TMPDIR is not defined it will use /tmp
#
# FILES
#
# ~/.config/ytfzf/conf.sh
#
#     The configuration file. If submenu-conf.sh does not exist, this will also be used as the config in submenus
# ~/.config/ytfzf/submenu-conf.sh
#
#     The submenu configuration file
# ~/.config/ytfzf/subscriptions
#
#     The subscriptions file.
#
# CACHE
#
# Each instance of ytfzf has its own directory in $YTFZF_TEMP_DIR, if $keep_cache is enabled, it uses $cache_dir instead.
# The structure of each instance folder looks like this: (<> represents a placeholder, ? means optional)
# If an addon scraper is used, it may use undocumented files.
#
#     $cache_dir
#     | -- watch_hist
#     | -- <search>-<pid>
#     |  | -- searches.list
#     |  | -- post-scrape
#     |  | -- <submenu-search>-<submenu-pid>?
#     |  | -- thumbnails?
#     |  | -- environment
#     |  | -- tmp
#     |  |  | -- curl_config
#     |  |  | -- <scrape>.html
#     |  |  | -- <scrape>.json
#     |  |  | -- <scrape>.json.final?
#     |  |  | -- menu_keypress
#     |  |  | -- all-ids.list
#     |  |  | -- downloaded-ids.list
#     |  | -- ids
#     |  | -- videos_json
#
# An explanation of each directory/file:
#
#     searches.list
#
#         A list of all searches
#         If --multi-search is enabled, each search is separated by a new line
#     watch_hist
#
#         The watch history file.
#     <search>-<pid>
#
#         An instance's parent folder.
#         If no search was given it uses the name "SCRAPE-<scrape>-<pid>" instead.
#     post-scrape
#
#         A folder that contains files relating to the scraping of a selected result.
#     <submenu-search>-<submenu-pid>
#
#         Created when a submenu is opened (eg: when a channel/playlist is selected).
#     thumbnails
#
#         Stores the thumbnails for the instance (only with -t).
#     environment
#
#         Every variable that is set and it's value, in that instance of ytfzf
#     tmp
#
#         Stores less important temporarily used files.
#     curl_config
#
#         The configuration file for curl for downloading thumbnails (only with -t).
#     <scrape>.html
#
#         For scrapers that need to scrape websites, this is the output of curl.
#     <scrape>.json
#
#         The json scraped from a website.
#     <scrape>.json.final
#
#         The final json scraped from a website. (Is used when multiple threads are used for scraping)
#     menu_keypress
#
#         The key pressed in fzf.
#     all-ids.json
#
#         File that contains all scraped ids. Mainly to compare against downloaded-ids.json
#     downloaded-ids.json
#
#         File that contains which thumbnails have been downloaded
#     ids
#
#         The file that stores the id of each selected video.
#     videos_json
#
#         The file that stores a json of all videos displayed in fzf.
#         This file is very helpful for making playlists as it is in the same format.
#


