Updated 15 files: Config/Kvantum/Catppuccin-Mocha/Catppuccin-Mocha.kvconfig
Config/gtk-3.0/colors.css
Config/gtk-4.0/colors.css
Kdeconfigs/Trolltech.conf
Kdeconfigs/auroraerc
Kdeconfigs/breezerc
Kdeconfigs/gtkrc
Kdeconfigs/gtkrc-2.0
Kdeconfigs/kdeglobals
Kdeconfigs/kglobalshortcutsrc
Kdeconfigs/kwinrc
Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc
Kdeconfigs/plasmashellrc
Local/share/knewstuff3/window-decorations.knsregistry
time.txt\n\nChanges in Config/Kvantum/Catppuccin-Mocha/Catppuccin-Mocha.kvconfig:\n    [1mdiff --git a/Config/Kvantum/Catppuccin-Mocha/Catppuccin-Mocha.kvconfig b/Config/Kvantum/Catppuccin-Mocha/Catppuccin-Mocha.kvconfig[m
    [1mindex 7d66830d..8d1790fc 100644[m
    [1m--- a/Config/Kvantum/Catppuccin-Mocha/Catppuccin-Mocha.kvconfig[m
    [1m+++ b/Config/Kvantum/Catppuccin-Mocha/Catppuccin-Mocha.kvconfig[m
    [36m@@ -20,8 +20,8 @@[m [mslim_toolbars=false[m
     toolbutton_style=1[m
     x11drag=menubar_and_primary_toolbar[m
     double_click=false[m
    [31m-translucent_windows=false[m
    [31m-blurring=false[m
    [32m+[m[32mtranslucent_windows=true[m
    [32m+[m[32mblurring=true[m
     popup_blurring=true[m
     opaque=kaffeine,kmplayer,subtitlecomposer,kdenlive,vlc,smplayer,smplayer2,avidemux,avidemux2_qt4,avidemux3_qt4,avidemux3_qt5,kamoso,QtCreator,VirtualBox,VirtualBoxVM,trojita,dragon,digikam,lyx[m
     group_toolbar_buttons=false[m
    [36m@@ -68,7 +68,7 @@[m [mreduce_menu_opacity=0[m
     reduce_window_opacity=10[m
     saturation=1.00[m
     shadowless_popup=true[m
    [31m-transient_groove=false[m
    [32m+[m[32mtransient_groove=true[m
     menu_blur_radius=6[m
     tooltip_blur_radius=6[m
     [m
    [36m@@ -441,10 +441,10 @@[m [mkcapacitybar_as_progressbar=true[m
     force_size_grip=false[m
     iconless_pushbutton=true[m
     iconless_menu=true[m
    [31m-disabled_icon_opacity=80[m
    [31m-lxqtmainmenu_iconsize=0[m
    [32m+[m[32mdisabled_icon_opacity=100[m
    [32m+[m[32mlxqtmainmenu_iconsize=2[m
     normal_default_pushbutton=true[m
    [31m-single_top_toolbar=false[m
    [32m+[m[32msingle_top_toolbar=true[m
     tint_on_mouseover=0[m
     transparent_pcmanfm_sidepane=true[m
     transparent_pcmanfm_view=true[m\n\nChanges in Config/gtk-3.0/colors.css:\n    [1mdiff --git a/Config/gtk-3.0/colors.css b/Config/gtk-3.0/colors.css[m
    [1mindex 1fa6daf2..a468447c 100644[m
    [1m--- a/Config/gtk-3.0/colors.css[m
    [1m+++ b/Config/gtk-3.0/colors.css[m
    [36m@@ -1,6 +1,6 @@[m
     @define-color borders_breeze #474b57;[m
     @define-color content_view_bg_breeze #161925;[m
    [31m-@define-color error_color_backdrop_breeze #ed254e;[m
    [32m+[m[32m@define-color error_color_backdrop_breeze #e52e58;[m
     @define-color error_color_breeze #ed254e;[m
     @define-color error_color_insensitive_backdrop_breeze #5d1c31;[m
     @define-color error_color_insensitive_breeze #5d1c31;[m
    [36m@@ -15,70 +15,70 @@[m
     @define-color insensitive_unfocused_fg_color_breeze #555965;[m
     @define-color insensitive_unfocused_selected_bg_color_breeze #171a26;[m
     @define-color insensitive_unfocused_selected_fg_color_breeze #555965;[m
    [31m-@define-color link_color_breeze #d91619;[m
    [32m+[m[32m@define-color link_color_breeze #dd0000;[m
     @define-color link_visited_color_breeze #7cb7ff;[m
    [31m-@define-color success_color_backdrop_breeze #71f79f;[m
    [32m+[m[32m@define-color success_color_backdrop_breeze #75f1a6;[m
     @define-color success_color_breeze #71f79f;[m
     @define-color success_color_insensitive_backdrop_breeze #33624c;[m
     @define-color success_color_insensitive_breeze #33624c;[m
     @define-color theme_base_color_breeze #161925;[m
     @define-color theme_bg_color_breeze #181b28;[m
    [31m-@define-color theme_button_background_backdrop_breeze #1e2233;[m
    [32m+[m[32m@define-color theme_button_background_backdrop_breeze #202434;[m
     @define-color theme_button_background_backdrop_insensitive_breeze #1d2031;[m
     @define-color theme_button_background_insensitive_breeze #1d2031;[m
     @define-color theme_button_background_normal_breeze #1e2233;[m
    [31m-@define-color theme_button_decoration_focus_backdrop_breeze #d91619;[m
    [31m-@define-color theme_button_decoration_focus_backdrop_insensitive_breeze #5b1c28;[m
    [31m-@define-color theme_button_decoration_focus_breeze #d91619;[m
    [31m-@define-color theme_button_decoration_focus_insensitive_breeze #5b1c28;[m
    [31m-@define-color theme_button_decoration_hover_backdrop_breeze #d91619;[m
    [31m-@define-color theme_button_decoration_hover_backdrop_insensitive_breeze #5b1c28;[m
    [31m-@define-color theme_button_decoration_hover_breeze #d91619;[m
    [31m-@define-color theme_button_decoration_hover_insensitive_breeze #5b1c28;[m
    [31m-@define-color theme_button_foreground_active_backdrop_breeze #d3dae3;[m
    [32m+[m[32m@define-color theme_button_decoration_focus_backdrop_breeze #d90e14;[m
    [32m+[m[32m@define-color theme_button_decoration_focus_backdrop_insensitive_breeze #5c1520;[m
    [32m+[m[32m@define-color theme_button_decoration_focus_breeze #dd0000;[m
    [32m+[m[32m@define-color theme_button_decoration_focus_insensitive_breeze #5c1520;[m
    [32m+[m[32m@define-color theme_button_decoration_hover_backdrop_breeze #d90e14;[m
    [32m+[m[32m@define-color theme_button_decoration_hover_backdrop_insensitive_breeze #5c1520;[m
    [32m+[m[32m@define-color theme_button_decoration_hover_breeze #dd0000;[m
    [32m+[m[32m@define-color theme_button_decoration_hover_insensitive_breeze #5c1520;[m
    [32m+[m[32m@define-color theme_button_foreground_active_backdrop_breeze #fbfafa;[m
     @define-color theme_button_foreground_active_backdrop_insensitive_breeze #555965;[m
     @define-color theme_button_foreground_active_breeze #ffffff;[m
     @define-color theme_button_foreground_active_insensitive_breeze #555965;[m
    [31m-@define-color theme_button_foreground_backdrop_breeze #c3c7d1;[m
    [32m+[m[32m@define-color theme_button_foreground_backdrop_breeze #c2c4c9;[m
     @define-color theme_button_foreground_backdrop_insensitive_breeze #545765;[m
     @define-color theme_button_foreground_insensitive_breeze #545765;[m
     @define-color theme_button_foreground_normal_breeze #c3c7d1;[m
     @define-color theme_fg_color_breeze #d3dae3;[m
    [31m-@define-color theme_header_background_backdrop_breeze #181b28;[m
    [32m+[m[32m@define-color theme_header_background_backdrop_breeze #1a1d2a;[m
     @define-color theme_header_background_breeze #181b28;[m
     @define-color theme_header_background_light_breeze #181b28;[m
    [31m-@define-color theme_header_foreground_backdrop_breeze #d3dae3;[m
    [32m+[m[32m@define-color theme_header_foreground_backdrop_breeze #d4d5d8;[m
     @define-color theme_header_foreground_breeze #d3dae3;[m
    [31m-@define-color theme_header_foreground_insensitive_backdrop_breeze #d3dae3;[m
    [31m-@define-color theme_header_foreground_insensitive_breeze #d3dae3;[m
    [31m-@define-color theme_hovering_selected_bg_color_breeze #d91619;[m
    [31m-@define-color theme_selected_bg_color_breeze #9e161c;[m
    [32m+[m[32m@define-color theme_header_foreground_insensitive_backdrop_breeze #d4d5d8;[m
    [32m+[m[32m@define-color theme_header_foreground_insensitive_breeze #d4d5d8;[m
    [32m+[m[32m@define-color theme_hovering_selected_bg_color_breeze #dd0000;[m
    [32m+[m[32m@define-color theme_selected_bg_color_breeze #a1070b;[m
     @define-color theme_selected_fg_color_breeze #ffffff;[m
     @define-color theme_text_color_breeze #d3dae3;[m
     @define-color theme_titlebar_background_backdrop_breeze #2f343f;[m
    [31m-@define-color theme_titlebar_background_breeze #2f343f;[m
    [32m+[m[32m@define-color theme_titlebar_background_breeze #a1080b;[m
     @define-color theme_titlebar_background_light_breeze #181b28;[m
     @define-color theme_titlebar_foreground_backdrop_breeze #666a73;[m
    [31m-@define-color theme_titlebar_foreground_breeze #d3dae3;[m
    [32m+[m[32m@define-color theme_titlebar_foreground_breeze #ffffff;[m
     @define-color theme_titlebar_foreground_insensitive_backdrop_breeze #666a73;[m
     @define-color theme_titlebar_foreground_insensitive_breeze #666a73;[m
    [31m-@define-color theme_unfocused_base_color_breeze #161925;[m
    [31m-@define-color theme_unfocused_bg_color_breeze #181b28;[m
    [31m-@define-color theme_unfocused_fg_color_breeze #d3dae3;[m
    [31m-@define-color theme_unfocused_selected_bg_color_alt_breeze #521016;[m
    [31m-@define-color theme_unfocused_selected_bg_color_breeze #521016;[m
    [31m-@define-color theme_unfocused_selected_fg_color_breeze #d3dae3;[m
    [31m-@define-color theme_unfocused_text_color_breeze #d3dae3;[m
    [32m+[m[32m@define-color theme_unfocused_base_color_breeze #181b27;[m
    [32m+[m[32m@define-color theme_unfocused_bg_color_breeze #1a1d2a;[m
    [32m+[m[32m@define-color theme_unfocused_fg_color_breeze #d4d5d8;[m
    [32m+[m[32m@define-color theme_unfocused_selected_bg_color_alt_breeze #a00a0d;[m
    [32m+[m[32m@define-color theme_unfocused_selected_bg_color_breeze #a00a0d;[m
    [32m+[m[32m@define-color theme_unfocused_selected_fg_color_breeze #fbfafa;[m
    [32m+[m[32m@define-color theme_unfocused_text_color_breeze #d4d5d8;[m
     @define-color theme_unfocused_view_bg_color_breeze #151823;[m
     @define-color theme_unfocused_view_text_color_breeze #545863;[m
    [31m-@define-color theme_view_active_decoration_color_breeze #d91619;[m
    [31m-@define-color theme_view_hover_decoration_color_breeze #d91619;[m
    [32m+[m[32m@define-color theme_view_active_decoration_color_breeze #dd0000;[m
    [32m+[m[32m@define-color theme_view_hover_decoration_color_breeze #dd0000;[m
     @define-color tooltip_background_breeze #353945;[m
     @define-color tooltip_border_breeze #5d616d;[m
     @define-color tooltip_text_breeze #d3dae3;[m
    [31m-@define-color unfocused_borders_breeze #474b57;[m
    [32m+[m[32m@define-color unfocused_borders_breeze #494b55;[m
     @define-color unfocused_insensitive_borders_breeze #262a36;[m
    [31m-@define-color warning_color_backdrop_breeze #ff6a00;[m
    [32m+[m[32m@define-color warning_color_backdrop_breeze #f56e11;[m
     @define-color warning_color_breeze #ff6a00;[m
     @define-color warning_color_insensitive_backdrop_breeze #633317;[m
     @define-color warning_color_insensitive_breeze #633317;[m\n\nChanges in Config/gtk-4.0/colors.css:\n    [1mdiff --git a/Config/gtk-4.0/colors.css b/Config/gtk-4.0/colors.css[m
    [1mindex 1fa6daf2..a468447c 100644[m
    [1m--- a/Config/gtk-4.0/colors.css[m
    [1m+++ b/Config/gtk-4.0/colors.css[m
    [36m@@ -1,6 +1,6 @@[m
     @define-color borders_breeze #474b57;[m
     @define-color content_view_bg_breeze #161925;[m
    [31m-@define-color error_color_backdrop_breeze #ed254e;[m
    [32m+[m[32m@define-color error_color_backdrop_breeze #e52e58;[m
     @define-color error_color_breeze #ed254e;[m
     @define-color error_color_insensitive_backdrop_breeze #5d1c31;[m
     @define-color error_color_insensitive_breeze #5d1c31;[m
    [36m@@ -15,70 +15,70 @@[m
     @define-color insensitive_unfocused_fg_color_breeze #555965;[m
     @define-color insensitive_unfocused_selected_bg_color_breeze #171a26;[m
     @define-color insensitive_unfocused_selected_fg_color_breeze #555965;[m
    [31m-@define-color link_color_breeze #d91619;[m
    [32m+[m[32m@define-color link_color_breeze #dd0000;[m
     @define-color link_visited_color_breeze #7cb7ff;[m
    [31m-@define-color success_color_backdrop_breeze #71f79f;[m
    [32m+[m[32m@define-color success_color_backdrop_breeze #75f1a6;[m
     @define-color success_color_breeze #71f79f;[m
     @define-color success_color_insensitive_backdrop_breeze #33624c;[m
     @define-color success_color_insensitive_breeze #33624c;[m
     @define-color theme_base_color_breeze #161925;[m
     @define-color theme_bg_color_breeze #181b28;[m
    [31m-@define-color theme_button_background_backdrop_breeze #1e2233;[m
    [32m+[m[32m@define-color theme_button_background_backdrop_breeze #202434;[m
     @define-color theme_button_background_backdrop_insensitive_breeze #1d2031;[m
     @define-color theme_button_background_insensitive_breeze #1d2031;[m
     @define-color theme_button_background_normal_breeze #1e2233;[m
    [31m-@define-color theme_button_decoration_focus_backdrop_breeze #d91619;[m
    [31m-@define-color theme_button_decoration_focus_backdrop_insensitive_breeze #5b1c28;[m
    [31m-@define-color theme_button_decoration_focus_breeze #d91619;[m
    [31m-@define-color theme_button_decoration_focus_insensitive_breeze #5b1c28;[m
    [31m-@define-color theme_button_decoration_hover_backdrop_breeze #d91619;[m
    [31m-@define-color theme_button_decoration_hover_backdrop_insensitive_breeze #5b1c28;[m
    [31m-@define-color theme_button_decoration_hover_breeze #d91619;[m
    [31m-@define-color theme_button_decoration_hover_insensitive_breeze #5b1c28;[m
    [31m-@define-color theme_button_foreground_active_backdrop_breeze #d3dae3;[m
    [32m+[m[32m@define-color theme_button_decoration_focus_backdrop_breeze #d90e14;[m
    [32m+[m[32m@define-color theme_button_decoration_focus_backdrop_insensitive_breeze #5c1520;[m
    [32m+[m[32m@define-color theme_button_decoration_focus_breeze #dd0000;[m
    [32m+[m[32m@define-color theme_button_decoration_focus_insensitive_breeze #5c1520;[m
    [32m+[m[32m@define-color theme_button_decoration_hover_backdrop_breeze #d90e14;[m
    [32m+[m[32m@define-color theme_button_decoration_hover_backdrop_insensitive_breeze #5c1520;[m
    [32m+[m[32m@define-color theme_button_decoration_hover_breeze #dd0000;[m
    [32m+[m[32m@define-color theme_button_decoration_hover_insensitive_breeze #5c1520;[m
    [32m+[m[32m@define-color theme_button_foreground_active_backdrop_breeze #fbfafa;[m
     @define-color theme_button_foreground_active_backdrop_insensitive_breeze #555965;[m
     @define-color theme_button_foreground_active_breeze #ffffff;[m
     @define-color theme_button_foreground_active_insensitive_breeze #555965;[m
    [31m-@define-color theme_button_foreground_backdrop_breeze #c3c7d1;[m
    [32m+[m[32m@define-color theme_button_foreground_backdrop_breeze #c2c4c9;[m
     @define-color theme_button_foreground_backdrop_insensitive_breeze #545765;[m
     @define-color theme_button_foreground_insensitive_breeze #545765;[m
     @define-color theme_button_foreground_normal_breeze #c3c7d1;[m
     @define-color theme_fg_color_breeze #d3dae3;[m
    [31m-@define-color theme_header_background_backdrop_breeze #181b28;[m
    [32m+[m[32m@define-color theme_header_background_backdrop_breeze #1a1d2a;[m
     @define-color theme_header_background_breeze #181b28;[m
     @define-color theme_header_background_light_breeze #181b28;[m
    [31m-@define-color theme_header_foreground_backdrop_breeze #d3dae3;[m
    [32m+[m[32m@define-color theme_header_foreground_backdrop_breeze #d4d5d8;[m
     @define-color theme_header_foreground_breeze #d3dae3;[m
    [31m-@define-color theme_header_foreground_insensitive_backdrop_breeze #d3dae3;[m
    [31m-@define-color theme_header_foreground_insensitive_breeze #d3dae3;[m
    [31m-@define-color theme_hovering_selected_bg_color_breeze #d91619;[m
    [31m-@define-color theme_selected_bg_color_breeze #9e161c;[m
    [32m+[m[32m@define-color theme_header_foreground_insensitive_backdrop_breeze #d4d5d8;[m
    [32m+[m[32m@define-color theme_header_foreground_insensitive_breeze #d4d5d8;[m
    [32m+[m[32m@define-color theme_hovering_selected_bg_color_breeze #dd0000;[m
    [32m+[m[32m@define-color theme_selected_bg_color_breeze #a1070b;[m
     @define-color theme_selected_fg_color_breeze #ffffff;[m
     @define-color theme_text_color_breeze #d3dae3;[m
     @define-color theme_titlebar_background_backdrop_breeze #2f343f;[m
    [31m-@define-color theme_titlebar_background_breeze #2f343f;[m
    [32m+[m[32m@define-color theme_titlebar_background_breeze #a1080b;[m
     @define-color theme_titlebar_background_light_breeze #181b28;[m
     @define-color theme_titlebar_foreground_backdrop_breeze #666a73;[m
    [31m-@define-color theme_titlebar_foreground_breeze #d3dae3;[m
    [32m+[m[32m@define-color theme_titlebar_foreground_breeze #ffffff;[m
     @define-color theme_titlebar_foreground_insensitive_backdrop_breeze #666a73;[m
     @define-color theme_titlebar_foreground_insensitive_breeze #666a73;[m
    [31m-@define-color theme_unfocused_base_color_breeze #161925;[m
    [31m-@define-color theme_unfocused_bg_color_breeze #181b28;[m
    [31m-@define-color theme_unfocused_fg_color_breeze #d3dae3;[m
    [31m-@define-color theme_unfocused_selected_bg_color_alt_breeze #521016;[m
    [31m-@define-color theme_unfocused_selected_bg_color_breeze #521016;[m
    [31m-@define-color theme_unfocused_selected_fg_color_breeze #d3dae3;[m
    [31m-@define-color theme_unfocused_text_color_breeze #d3dae3;[m
    [32m+[m[32m@define-color theme_unfocused_base_color_breeze #181b27;[m
    [32m+[m[32m@define-color theme_unfocused_bg_color_breeze #1a1d2a;[m
    [32m+[m[32m@define-color theme_unfocused_fg_color_breeze #d4d5d8;[m
    [32m+[m[32m@define-color theme_unfocused_selected_bg_color_alt_breeze #a00a0d;[m
    [32m+[m[32m@define-color theme_unfocused_selected_bg_color_breeze #a00a0d;[m
    [32m+[m[32m@define-color theme_unfocused_selected_fg_color_breeze #fbfafa;[m
    [32m+[m[32m@define-color theme_unfocused_text_color_breeze #d4d5d8;[m
     @define-color theme_unfocused_view_bg_color_breeze #151823;[m
     @define-color theme_unfocused_view_text_color_breeze #545863;[m
    [31m-@define-color theme_view_active_decoration_color_breeze #d91619;[m
    [31m-@define-color theme_view_hover_decoration_color_breeze #d91619;[m
    [32m+[m[32m@define-color theme_view_active_decoration_color_breeze #dd0000;[m
    [32m+[m[32m@define-color theme_view_hover_decoration_color_breeze #dd0000;[m
     @define-color tooltip_background_breeze #353945;[m
     @define-color tooltip_border_breeze #5d616d;[m
     @define-color tooltip_text_breeze #d3dae3;[m
    [31m-@define-color unfocused_borders_breeze #474b57;[m
    [32m+[m[32m@define-color unfocused_borders_breeze #494b55;[m
     @define-color unfocused_insensitive_borders_breeze #262a36;[m
    [31m-@define-color warning_color_backdrop_breeze #ff6a00;[m
    [32m+[m[32m@define-color warning_color_backdrop_breeze #f56e11;[m
     @define-color warning_color_breeze #ff6a00;[m
     @define-color warning_color_insensitive_backdrop_breeze #633317;[m
     @define-color warning_color_insensitive_breeze #633317;[m\n\nChanges in Kdeconfigs/Trolltech.conf:\n    [1mdiff --git a/Kdeconfigs/Trolltech.conf b/Kdeconfigs/Trolltech.conf[m
    [1mindex 5e5b961b..1cb441f9 100644[m
    [1m--- a/Kdeconfigs/Trolltech.conf[m
    [1m+++ b/Kdeconfigs/Trolltech.conf[m
    [36m@@ -1,17 +1,17 @@[m
     [qt][m
     GUIEffects=none[m
     KDE\contrast=7[m
    [31m-KWinPalette\activeBackground=#2f343f[m
    [32m+[m[32mKWinPalette\activeBackground=#a1080b[m
     KWinPalette\activeBlend=#2f343f[m
    [31m-KWinPalette\activeForeground=#d3dae3[m
    [32m+[m[32mKWinPalette\activeForeground=#ffffff[m
     KWinPalette\activeTitleBtnBg=#181b28[m
     KWinPalette\frame=#181b28[m
     KWinPalette\inactiveBackground=#2f343f[m
     KWinPalette\inactiveBlend=#2f343f[m
     KWinPalette\inactiveForeground=#666a73[m
    [31m-KWinPalette\inactiveFrame=#181b28[m
    [31m-KWinPalette\inactiveTitleBtnBg=#181b28[m
    [31m-Palette\active=#d3dae3, #1e2233, #39405e, #2c3149, #0c0d13, #151722, #d3dae3, #ffffff, #c3c7d1, #161925, #181b28, #090a0e, #9e161c, #ffffff, #d91619, #7cb7ff, #1f2333, #000000, #353945, #d3dae3, #666a73, #9e161c[m
    [31m-Palette\disabled=#555965, #1d2031, #383f5d, #2b3148, #0b0d13, #141621, #545863, #ffffff, #545765, #151823, #171a26, #08090e, #171a26, #555965, #56171f, #374d6c, #1e2131, #000000, #353945, #d3dae3, #30333d, #171a26[m
    [31m-Palette\inactive=#d3dae3, #1e2233, #39405e, #2c3149, #0c0d13, #151722, #d3dae3, #ffffff, #c3c7d1, #161925, #181b28, #090a0e, #521016, #d3dae3, #d91619, #7cb7ff, #1f2333, #000000, #353945, #d3dae3, #666a73, #521016[m
    [32m+[m[32mKWinPalette\inactiveFrame=#1a1d2a[m
    [32m+[m[32mKWinPalette\inactiveTitleBtnBg=#1a1d2a[m
    [32m+[m[32mPalette\active=#d3dae3, #1e2233, #39405e, #2c3149, #0c0d13, #151722, #d3dae3, #ffffff, #c3c7d1, #161925, #181b28, #090a0e, #a1070b, #ffffff, #dd0000, #7cb7ff, #1f2333, #000000, #353945, #d3dae3, #666a73, #a1070b[m
    [32m+[m[32mPalette\disabled=#555965, #1d2031, #383f5d, #2b3148, #0b0d13, #141621, #545863, #ffffff, #545765, #151823, #171a26, #08090e, #171a26, #555965, #570f17, #374d6c, #1e2131, #000000, #353945, #d3dae3, #30333d, #171a26[m
    [32m+[m[32mPalette\inactive=#d4d5d8, #202434, #3a415d, #2e3349, #0d0e14, #171924, #d4d5d8, #ffffff, #c2c4c9, #181b27, #1a1d2a, #090a0f, #a00a0d, #fbfafa, #d90c10, #97b2dd, #212534, #000000, #353945, #d3dae3, #656a76, #a00a0d[m
     font="Noto Sans,10,-1,0,400,0,0,0,0,0,0,0,0,0,0,1"[m\n\nChanges in Kdeconfigs/auroraerc:\n    [1mdiff --git a/Kdeconfigs/auroraerc b/Kdeconfigs/auroraerc[m
    [1mindex d8fb1bed..a020850e 100644[m
    [1m--- a/Kdeconfigs/auroraerc[m
    [1m+++ b/Kdeconfigs/auroraerc[m
    [36m@@ -1,2 +1,5 @@[m
    [32m+[m[32m[CatppuccinMocha-Modern][m
    [32m+[m[32mButtonSize=0[m
    [32m+[m
     [Utterly-Round-Dark][m
     ButtonSize=0[m\n\nChanges in Kdeconfigs/breezerc:\n    [1mdiff --git a/Kdeconfigs/breezerc b/Kdeconfigs/breezerc[m
    [1mindex ce2f55bc..e69de29b 100644[m
    [1m--- a/Kdeconfigs/breezerc[m
    [1m+++ b/Kdeconfigs/breezerc[m
    [36m@@ -1,4 +0,0 @@[m
    [31m-[Common][m
    [31m-OutlineIntensity=OutlineLow[m
    [31m-ShadowSize=ShadowSmall[m
    [31m-ShadowStrength=230[m\n\nChanges in Kdeconfigs/gtkrc:\n    [1mdiff --git a/Kdeconfigs/gtkrc b/Kdeconfigs/gtkrc[m
    [1mindex 9332fecd..beb02ecc 100644[m
    [1m--- a/Kdeconfigs/gtkrc[m
    [1m+++ b/Kdeconfigs/gtkrc[m
    [36m@@ -1,2 +1,2 @@[m
    [31m-# created by KDE Plasma, Wed May 1 05:47:14 2024[m
    [32m+[m[32m# created by KDE Plasma, Wed May 1 06:03:27 2024[m
     #[m\n\nChanges in Kdeconfigs/gtkrc-2.0:\n    [1mdiff --git a/Kdeconfigs/gtkrc-2.0 b/Kdeconfigs/gtkrc-2.0[m
    [1mindex abb2ed2c..706a0d48 100644[m
    [1m--- a/Kdeconfigs/gtkrc-2.0[m
    [1m+++ b/Kdeconfigs/gtkrc-2.0[m
    [36m@@ -1,4 +1,4 @@[m
    [31m-# created by KDE Plasma, Wed May 1 05:47:14 2024[m
    [32m+[m[32m# created by KDE Plasma, Wed May 1 06:03:27 2024[m
     #[m
     [m
     gtk-alternative-button-order = 1[m\n\nChanges in Kdeconfigs/kdeglobals:\n    [1mdiff --git a/Kdeconfigs/kdeglobals b/Kdeconfigs/kdeglobals[m
    [1mindex 38324cc5..0a24013f 100644[m
    [1m--- a/Kdeconfigs/kdeglobals[m
    [1m+++ b/Kdeconfigs/kdeglobals[m
    [36m@@ -10,24 +10,24 @@[m [mIntensityAmount=0.1[m
     IntensityEffect=2[m
     [m
     [ColorEffects:Inactive][m
    [31m-ChangeSelectionColor=true[m
    [32m+[m[32mChangeSelectionColor=false[m
     Color=112,111,110[m
     ColorAmount=0.025000000000000001[m
     ColorEffect=2[m
     ContrastAmount=0.10000000000000001[m
     ContrastEffect=2[m
    [31m-Enable=false[m
    [32m+[m[32mEnable=true[m
     IntensityAmount=0[m
     IntensityEffect=0[m
     [m
     [Colors:Button][m
    [31m-BackgroundAlternate=160,25,32[m
    [32m+[m[32mBackgroundAlternate=163,10,15[m
     BackgroundNormal=30,34,51[m
    [31m-DecorationFocus=217,22,25[m
    [31m-DecorationHover=217,22,25[m
    [31m-ForegroundActive=217,22,25[m
    [32m+[m[32mDecorationFocus=221,0,0[m
    [32m+[m[32mDecorationHover=221,0,0[m
    [32m+[m[32mForegroundActive=221,0,0[m
     ForegroundInactive=102,106,115[m
    [31m-ForegroundLink=217,22,25[m
    [32m+[m[32mForegroundLink=221,0,0[m
     ForegroundNegative=237,37,78[m
     ForegroundNeutral=255,106,0[m
     ForegroundNormal=195,199,209[m
    [36m@@ -35,18 +35,10 @@[m [mForegroundPositive=113,247,159[m
     ForegroundVisited=82,148,226[m
     [m
     [Colors:Complementary][m
    [31m-BackgroundAlternate[$d][m
    [31m-BackgroundNormal[$d][m
    [31m-DecorationFocus=217,22,25[m
    [31m-DecorationHover=217,22,25[m
    [31m-ForegroundActive=217,22,25[m
    [31m-ForegroundInactive[$d][m
    [31m-ForegroundLink=217,22,25[m
    [31m-ForegroundNegative[$d][m
    [31m-ForegroundNeutral[$d][m
    [31m-ForegroundNormal[$d][m
    [31m-ForegroundPositive[$d][m
    [31m-ForegroundVisited[$d][m
    [32m+[m[32mDecorationFocus=221,0,0[m
    [32m+[m[32mDecorationHover=221,0,0[m
    [32m+[m[32mForegroundActive=221,0,0[m
    [32m+[m[32mForegroundLink=221,0,0[m
     [m
     [Colors:Header][m
     BackgroundAlternate[$d][m
    [36m@@ -63,13 +55,13 @@[m [mForegroundPositive[$d][m
     ForegroundVisited[$d][m
     [m
     [Colors:Selection][m
    [31m-BackgroundAlternate=158,22,28[m
    [31m-BackgroundNormal=158,22,28[m
    [31m-DecorationFocus=217,22,25[m
    [31m-DecorationHover=217,22,25[m
    [31m-ForegroundActive=217,22,25[m
    [32m+[m[32mBackgroundAlternate=161,7,11[m
    [32m+[m[32mBackgroundNormal=161,7,11[m
    [32m+[m[32mDecorationFocus=221,0,0[m
    [32m+[m[32mDecorationHover=221,0,0[m
    [32m+[m[32mForegroundActive=221,0,0[m
     ForegroundInactive=255,255,255[m
    [31m-ForegroundLink=217,22,25[m
    [32m+[m[32mForegroundLink=221,0,0[m
     ForegroundNegative=237,37,78[m
     ForegroundNeutral=255,106,0[m
     ForegroundNormal=255,255,255[m
    [36m@@ -79,11 +71,11 @@[m [mForegroundVisited=189,195,199[m
     [Colors:Tooltip][m
     BackgroundAlternate=47,52,63[m
     BackgroundNormal=53,57,69[m
    [31m-DecorationFocus=217,22,25[m
    [31m-DecorationHover=217,22,25[m
    [31m-ForegroundActive=217,22,25[m
    [32m+[m[32mDecorationFocus=221,0,0[m
    [32m+[m[32mDecorationHover=221,0,0[m
    [32m+[m[32mForegroundActive=221,0,0[m
     ForegroundInactive=102,106,115[m
    [31m-ForegroundLink=217,22,25[m
    [32m+[m[32mForegroundLink=221,0,0[m
     ForegroundNegative=237,37,78[m
     ForegroundNeutral=255,106,0[m
     ForegroundNormal=211,218,227[m
    [36m@@ -93,11 +85,11 @@[m [mForegroundVisited=82,148,226[m
     [Colors:View][m
     BackgroundAlternate=31,35,51[m
     BackgroundNormal=22,25,37[m
    [31m-DecorationFocus=217,22,25[m
    [31m-DecorationHover=217,22,25[m
    [31m-ForegroundActive=217,22,25[m
    [32m+[m[32mDecorationFocus=221,0,0[m
    [32m+[m[32mDecorationHover=221,0,0[m
    [32m+[m[32mForegroundActive=221,0,0[m
     ForegroundInactive=102,106,115[m
    [31m-ForegroundLink=217,22,25[m
    [32m+[m[32mForegroundLink=221,0,0[m
     ForegroundNegative=237,37,78[m
     ForegroundNeutral=255,106,0[m
     ForegroundNormal=211,218,227[m
    [36m@@ -107,11 +99,11 @@[m [mForegroundVisited=124,183,255[m
     [Colors:Window][m
     BackgroundAlternate=47,52,63[m
     BackgroundNormal=24,27,40[m
    [31m-DecorationFocus=217,22,25[m
    [31m-DecorationHover=217,22,25[m
    [31m-ForegroundActive=217,22,25[m
    [32m+[m[32mDecorationFocus=221,0,0[m
    [32m+[m[32mDecorationHover=221,0,0[m
    [32m+[m[32mForegroundActive=221,0,0[m
     ForegroundInactive=102,106,115[m
    [31m-ForegroundLink=217,22,25[m
    [32m+[m[32mForegroundLink=221,0,0[m
     ForegroundNegative=237,37,78[m
     ForegroundNeutral=255,106,0[m
     ForegroundNormal=211,218,227[m
    [36m@@ -123,13 +115,14 @@[m [mDirSelectDialog Size=820,584[m
     History Items[$e]=file:///media/Workspace2,file:///media/Workspace,file:$HOME/wallpapers/Catppuccin-Mocha[m
     [m
     [General][m
    [31m-AccentColor=217,22,25[m
    [31m-ColorSchemeHash=a054744e5da530142f039caa182148b170643d2e[m
    [32m+[m[32mAccentColor=221,0,0[m
    [32m+[m[32mColorSchemeHash=374b4774d102eb9b5cd79deb555d3ba5723e74b9[m
    [32m+[m[32mLastUsedCustomAccentColor=221,0,0[m
     TerminalApplication=kitty[m
     TerminalService=kitty.desktop[m
     XftHintStyle=hintslight[m
     XftSubPixel=rgb[m
    [31m-accentColorFromWallpaper=true[m
    [32m+[m[32maccentColorFromWallpaper=false[m
     toolBarFont=Liberation Mono,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1[m
     [m
     [Icons][m
    [36m@@ -164,9 +157,9 @@[m [mView Style=DetailTree[m
     MaximumRemoteSize=0[m
     [m
     [WM][m
    [31m-activeBackground=47,52,63[m
    [32m+[m[32mactiveBackground=161,8,11[m
     activeBlend=47,52,63[m
    [31m-activeForeground=211,218,227[m
    [32m+[m[32mactiveForeground=255,255,255[m
     inactiveBackground=47,52,63[m
     inactiveBlend=47,52,63[m
     inactiveForeground=102,106,115[m\n\nChanges in Kdeconfigs/kglobalshortcutsrc:\n\n\nChanges in Kdeconfigs/kwinrc:\n    [1mdiff --git a/Kdeconfigs/kwinrc b/Kdeconfigs/kwinrc[m
    [1mindex f9d60521..ab6b9fdf 100644[m
    [1m--- a/Kdeconfigs/kwinrc[m
    [1m+++ b/Kdeconfigs/kwinrc[m
    [36m@@ -32,7 +32,9 @@[m [mFocusStealingPreventionLevel=3[m
     Scale=1[m
     [m
     [org.kde.kdecoration2][m
    [32m+[m[32mBorderSize=None[m
    [32m+[m[32mBorderSizeAuto=false[m
     ButtonsOnLeft=XAI[m
     ButtonsOnRight=SM[m
    [31m-library=org.kde.breeze[m
    [31m-theme=Breeze[m
    [32m+[m[32mlibrary=org.kde.kwin.aurorae[m
    [32m+[m[32mtheme=__aurorae__svg__CatppuccinMocha-Modern[m\n\nChanges in Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc:\n    [1mdiff --git a/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc b/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc[m
    [1mindex a5224c21..dd60b373 100644[m
    [1m--- a/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc[m
    [1m+++ b/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc[m
    [36m@@ -47,7 +47,7 @@[m [mpopupHeight=324[m
     popupWidth=324[m
     [m
     [Containments][25][Applets][51][Configuration][General][m
    [31m-history=#f4e2c0,#f9c9a6,#a6474e,#46313b[m
    [32m+[m[32mhistory=#161926,#f4e2c0,#f9c9a6,#a6474e,#46313b[m
     [m
     [Containments][25][Applets][53][m
     immutability=1[m
    [36m@@ -128,7 +128,7 @@[m [mimmutability=1[m
     plugin=org.kde.plasma.weather[m
     [m
     [Containments][25][Applets][66][Configuration][m
    [31m-PreloadWeight=42[m
    [32m+[m[32mPreloadWeight=34[m
     UserBackgroundHints=ShadowBackground[m
     configMigrated=true[m
     [m
    [36m@@ -190,8 +190,8 @@[m [mDialogWidth=720[m
     [m
     [Containments][26][Applets][29][Configuration][General][m
     fill=false[m
    [31m-groupingAppIdBlacklist=org.kde.dolphin.desktop,kitty.desktop[m
    [31m-groupingLauncherUrlBlacklist=applications:org.kde.dolphin.desktop,applications:kitty.desktop[m
    [32m+[m[32mgroupingAppIdBlacklist=kitty.desktop,org.kde.dolphin.desktop[m
    [32m+[m[32mgroupingLauncherUrlBlacklist=applications:kitty.desktop,applications:org.kde.dolphin.desktop[m
     launchers=preferred://browser,applications:org.kde.haruna.desktop[m
     [m
     [Containments][26][Applets][30][m
    [36m@@ -242,7 +242,7 @@[m [mimmutability=1[m
     plugin=org.kde.plasma.notifications[m
     [m
     [Containments][32][Applets][33][Configuration][m
    [31m-PreloadWeight=95[m
    [32m+[m[32mPreloadWeight=100[m
     [m
     [Containments][32][Applets][34][m
     immutability=1[m
    [36m@@ -293,7 +293,7 @@[m [mimmutability=1[m
     plugin=org.kde.plasma.volume[m
     [m
     [Containments][32][Applets][42][Configuration][m
    [31m-PreloadWeight=95[m
    [32m+[m[32mPreloadWeight=100[m
     [m
     [Containments][32][Applets][42][Configuration][General][m
     currentTab=streams[m\n\nChanges in Kdeconfigs/plasmashellrc:\n    [1mdiff --git a/Kdeconfigs/plasmashellrc b/Kdeconfigs/plasmashellrc[m
    [1mindex 7ae6559b..83ab47e1 100644[m
    [1m--- a/Kdeconfigs/plasmashellrc[m
    [1m+++ b/Kdeconfigs/plasmashellrc[m
    [36m@@ -6,7 +6,7 @@[m [mimmutability=1[m
     plugin=org.kde.plasma.weather[m
     [m
     [Applets][66][Configuration][m
    [31m-PreloadWeight=42[m
    [32m+[m[32mPreloadWeight=34[m
     UserBackgroundHints=ShadowBackground[m
     configMigrated=true[m
     [m\n\nChanges in Local/share/knewstuff3/window-decorations.knsregistry:\n    [1mdiff --git a/Local/share/knewstuff3/window-decorations.knsregistry b/Local/share/knewstuff3/window-decorations.knsregistry[m
    [1mindex c2b7c66a..030fb9da 100644[m
    [1m--- a/Local/share/knewstuff3/window-decorations.knsregistry[m
    [1m+++ b/Local/share/knewstuff3/window-decorations.knsregistry[m
    [36m@@ -1,6 +1,74 @@[m
     <?xml version="1.0" encoding="UTF-8"?>[m
     <!DOCTYPE khotnewstuff3>[m
     <hotnewstuffregistry>[m
    [32m+[m[32m <stuff category="717">[m
    [32m+[m[32m  <name>Vivid-Blur-Dark-Aurorae-6</name>[m
    [32m+[m[32m  <providerid>api.kde-look.org</providerid>[m
    [32m+[m[32m  <author>l4k1</author>[m
    [32m+[m[32m  <homepage>https://store.kde.org/p/2133852</homepage>[m
    [32m+[m[32m  <licence></licence>[m
    [32m+[m[32m  <version></version>[m
    [32m+[m[32m  <rating>50</rating>[m
    [32m+[m[32m  <downloads>3616</downloads>[m
    [32m+[m[32m  <installedfile>/home/alex/.local/share/aurorae/themes/Vivid-Blur-Dark-Aurorae-6/*</installedfile>[m
    [32m+[m[32m  <id>2133852</id>[m
    [32m+[m[32m  <releasedate>2024-03-26</releasedate>[m
    [32m+[m[32m  <summary>BLUR Dark Rounded  Window Decorations (Aurorae Theme) for Plasma 6&lt;br />[m
    [32m+[m[32m&lt;br />[m
    [32m+[m[32mDark Rounded Kvantum Theme &lt;span style="color: #008b8b;"> &lt;strong>Vivid-Dark-Kvantum&lt;/strong> &lt;/span>: &lt;a href="https://www.pling.com/p/2110194/" target="_blank" rel="nofollow">&lt;span style="color: red;"> Here...</summary>[m
    [32m+[m[32m  <changelog></changelog>[m
    [32m+[m[32m  <preview>https://images.pling.com/cache/100x100-0/img/00/00/49/90/47/2133852/11.png</preview>[m
    [32m+[m[32m  <previewBig>https://images.pling.com/cache/770x540-0/img/00/00/49/90/47/2133852/11.png</previewBig>[m
    [32m+[m[32m  <payload>https://files04.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE3MTExNDIyNTkiLCJvIjoiMSIsInMiOiI3ZmU0MDczNTAyMjlkZjc3ODA4OWE5MmU2OGQwNDlkN2VlMGIyYWNjOTgyZDNlOWQ5MTJiZmY0OWE0Yzg5YTU0YzZhZWJhYzg5MzFmNjY5OTUyOTg5NzE0ZGMzZTlmZGZhYTRmNzgzMzkzZDFkNGQ4NDZmZGIwNTE3MDc4YWE3NSIsInQiOjE3MTQ1MjYzMjYsInN0ZnAiOm51bGwsInN0aXAiOiIxMDMuMTc1LjYzLjEzNyJ9.rV-7RVTiVLzhkhrsP3o2vpVyy0wokfcuv8bWghR3BJ8/Vivid-Blur-Dark-Aurorae-6.tar.gz</payload>[m
    [32m+[m[32m  <tags>kde,linux,unix,theme,plasma,original-product,gplv3</tags>[m
    [32m+[m[32m  <status>installed</status>[m
    [32m+[m[32m </stuff>[m
    [32m+[m[32m <stuff category="717">[m
    [32m+[m[32m  <name>Wings-Blur-Dark-Aurorae-6</name>[m
    [32m+[m[32m  <providerid>api.kde-look.org</providerid>[m
    [32m+[m[32m  <author>l4k1</author>[m
    [32m+[m[32m  <homepage>https://store.kde.org/p/2143596</homepage>[m
    [32m+[m[32m  <licence></licence>[m
    [32m+[m[32m  <version></version>[m
    [32m+[m[32m  <rating>50</rating>[m
    [32m+[m[32m  <downloads>1545</downloads>[m
    [32m+[m[32m  <installedfile>/home/alex/.local/share/aurorae/themes/Wings-Blur-Dark-Aurorae-6/*</installedfile>[m
    [32m+[m[32m  <id>2143596</id>[m
    [32m+[m[32m  <releasedate>2024-04-02</releasedate>[m
    [32m+[m[32m  <summary>BLUR Dark Rounded  Window Decorations  For Plasma 6&lt;br />[m
    [32m+[m[32m________________________________________________&lt;br />[m
    [32m+[m[32m&lt;br />[m
    [32m+[m[32mDark Rounded  Window Decorations (Follows Dark Color Schemes)  &lt;span style="color: #008b8b;"> &lt;strong>Wings-Dark-Aurorae-6&lt;/strong> &lt;/span>:  &lt;a...</summary>[m
    [32m+[m[32m  <changelog></changelog>[m
    [32m+[m[32m  <preview>https://images.pling.com/cache/100x100-0/img/00/00/49/90/47/2143596/screenshot-20240402-212202.png</preview>[m
    [32m+[m[32m  <previewBig>https://images.pling.com/cache/770x540-0/img/00/00/49/90/47/2143596/screenshot-20240402-212202.png</previewBig>[m
    [32m+[m[32m  <payload>https://files04.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE3MTIwODgwMjgiLCJvIjoiMSIsInMiOiJkYTdhNzBmYTI1Y2JlYTQ0MWEyNGI2ZWRjMzcyMjFmYjIzNGQyMjc3MTdjZDRmNjAzMzViZTRkZjhhYWM0ZTdlNWM0YjljMzhiODUxNmE3Mjk4YTJhNjQyNGJiZTQ1Zjc2NGIzNTk4MDIyNzM3MTFjMmM4ZDM0OTFjNGM2YWY1YSIsInQiOjE3MTQ1MjYzNzIsInN0ZnAiOm51bGwsInN0aXAiOiIxMDMuMTc1LjYzLjEzNyJ9.OJ-7RSDmepKd7Dr4S54TFlJi8bJCExOnJjAodzsO1eQ/Wings-Blur-Dark-Aurorae-6.tar.gz</payload>[m
    [32m+[m[32m  <tags>linux,kde,unix,theme,plasma,original-product,gplv3</tags>[m
    [32m+[m[32m  <status>installed</status>[m
    [32m+[m[32m </stuff>[m
    [32m+[m[32m <stuff category="717">[m
    [32m+[m[32m  <name>Gently-Dark-Aurorae-6</name>[m
    [32m+[m[32m  <providerid>api.kde-look.org</providerid>[m
    [32m+[m[32m  <author>l4k1</author>[m
    [32m+[m[32m  <homepage>https://store.kde.org/p/2136787</homepage>[m
    [32m+[m[32m  <licence></licence>[m
    [32m+[m[32m  <version></version>[m
    [32m+[m[32m  <rating>50</rating>[m
    [32m+[m[32m  <downloads>2075</downloads>[m
    [32m+[m[32m  <installedfile>/home/alex/.local/share/aurorae/themes/Gently-Dark-Aurorae-6/*</installedfile>[m
    [32m+[m[32m  <id>2136787</id>[m
    [32m+[m[32m  <releasedate>2024-03-18</releasedate>[m
    [32m+[m[32m  <summary>Dark Rounded  Window Decorations (Aurorae Theme) for Plasma 6&lt;br />[m
    [32m+[m[32m______________________________________________________________________&lt;br />[m
    [32m+[m[32m&lt;br />[m
    [32m+[m[32mBLUR Dark Rounded  Window Decorations (Aurorae Theme)  &lt;span style="color: #008b8b;"> &lt;strong>Gently-Blur-Dark-Aurorae-6&lt;/strong> &lt;/span> : &lt;a...</summary>[m
    [32m+[m[32m  <changelog></changelog>[m
    [32m+[m[32m  <preview>https://images.pling.com/cache/100x100-0/img/00/00/49/90/47/2136787/screenshot-20240311-184124.png</preview>[m
    [32m+[m[32m  <previewBig>https://images.pling.com/cache/770x540-0/img/00/00/49/90/47/2136787/screenshot-20240311-184124.png</previewBig>[m
    [32m+[m[32m  <payload>https://files04.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE3MTA3OTEyMTQiLCJvIjoiMSIsInMiOiJmNmEzNjE2YmVmMGUwZTNlYzFlMzJhNTRhNDRiZDliNjliOTg2OWYzYjkwMzkwODJlMmMzNjdhOWRkYTdhOTVhMTc1ZWRkZmUwZTg4NTE2ZWRhY2U5ODkyYzRlMjc2MGFmODllZjNiNGVmOWNiOTY3YmE4MTY2ZjI5MTQyMjQxNyIsInQiOjE3MTQ1MjYzNDgsInN0ZnAiOm51bGwsInN0aXAiOiIxMDMuMTc1LjYzLjEzNyJ9.BM8OXQU0Z4CGN5Noryqi2Qt7p39MNd0SoiS0L2bayhk/Gently-Dark-Aurorae-6.tar.gz</payload>[m
    [32m+[m[32m  <tags>kde,linux,gplv3,theme,unix,plasma,original-product</tags>[m
    [32m+[m[32m  <status>installed</status>[m
    [32m+[m[32m </stuff>[m
      <stuff category="717">[m
       <name>Catppuccin Mocha Modern Aurora 6</name>[m
       <providerid>api.kde-look.org</providerid>[m
    [36m@@ -24,26 +92,25 @@[m [mCatppuccin is a community-driven pastel theme that aims to be a middle ground be[m
       <status>installed</status>[m
      </stuff>[m
      <stuff category="717">[m
    [31m-  <name>Vivid-Dark-Aurorae-6</name>[m
    [32m+[m[32m  <name>Colorful-Blur-Dark-Aurorae-6</name>[m
       <providerid>api.kde-look.org</providerid>[m
       <author>l4k1</author>[m
    [31m-  <homepage>https://store.kde.org/p/2133854</homepage>[m
    [32m+[m[32m  <homepage>https://store.kde.org/p/2134954</homepage>[m
       <licence></licence>[m
       <version></version>[m
       <rating>50</rating>[m
    [31m-  <downloads>2971</downloads>[m
    [31m-  <installedfile>/home/alex/.local/share/aurorae/themes/Vivid-Dark-Aurorae-6/*</installedfile>[m
    [31m-  <id>2133854</id>[m
    [31m-  <releasedate>2024-03-26</releasedate>[m
    [31m-  <summary>Dark Rounded  Window Decorations (Aurorae Theme) for Plasma 6&lt;br />[m
    [31m-______________________________________________________________________&lt;br />[m
    [32m+[m[32m  <downloads>2005</downloads>[m
    [32m+[m[32m  <installedfile>/home/alex/.local/share/aurorae/themes/Colorful-Blur-Dark-Aurorae-6/*</installedfile>[m
    [32m+[m[32m  <id>2134954</id>[m
    [32m+[m[32m  <releasedate>2024-03-18</releasedate>[m
    [32m+[m[32m  <summary> BLUR Dark Rounded  Window Decorations (Aurorae Theme) For Plasma 6&lt;br />[m
     &lt;br />[m
    [31m- BLUR Dark Rounded  Window Decorations (Aurorae Theme)  &lt;span style="color: #008b8b;"> &lt;strong>Vivid-Blur-Dark-Aurorae-6&lt;/strong> &lt;/span>, which...</summary>[m
    [32m+[m[32mDark Rounded KVANTUM Theme, Blur and Transparent  &lt;span style="color: #008b8b;"> &lt;strong>Colorful-Dark-Kvantum&lt;/strong> &lt;/span>, which you can download: &lt;a href="https://store.kde.org/p/2091058" target="_blank"...</summary>[m
       <changelog></changelog>[m
    [31m-  <preview>https://images.pling.com/cache/100x100-0/img/00/00/49/90/47/2133854/2.png</preview>[m
    [31m-  <previewBig>https://images.pling.com/cache/770x540-0/img/00/00/49/90/47/2133854/2.png</previewBig>[m
    [31m-  <payload>https://files04.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE3MTExNDIyMzkiLCJvIjoiMSIsInMiOiI5YmM1NWE5YmU4OGI2OTMzNWZjN2RmZGM3YzBkMjRmMmFjMTgwNDdhYzBjOGI2YzdmMzdjZjA4MjgwZThhYTFlN2YyZGI0Y2UyOWUwMjdhMTM2OWMyNGI4OGM5OTUzYzkxMDNlYTBhNGMzMTgzNmNhZDUyNjQ5MTJhYjZlNWVhYiIsInQiOjE3MTQyNTcyOTUsInN0ZnAiOm51bGwsInN0aXAiOiIxNDYuMTk2LjQ3LjE0OSJ9.v9XiSwEkqQa4Wb15LBTAjdOEvOYabIAsdPlSyIK6ZTg/Vivid-Dark-Aurorae-6.tar.gz</payload>[m
    [31m-  <tags>gplv3,linux,kde,original-product,plasma,theme,unix</tags>[m
    [32m+[m[32m  <preview>https://images.pling.com/cache/100x100-0/img/00/00/49/90/47/2134954/logo-31.png</preview>[m
    [32m+[m[32m  <previewBig>https://images.pling.com/cache/770x540-0/img/00/00/49/90/47/2134954/logo-31.png</previewBig>[m
    [32m+[m[32m  <payload>https://files04.pling.com/api/files/download/j/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjE3MTA3OTA4MTIiLCJvIjoiMSIsInMiOiIwNzZjZjQ3ODAzYjlmZWMxYTUxMWFmNDZmZjZiOTE3ZDY4ODViYzYzOTEyOTFiNWRiYTZlMzA0YThmZTA5Y2M4YzdiOTIyN2I0OTEzNmQzNGZiMjNkMjc2NmNlNzdlYjI0ZTY5NTEwYTA3MTdjNGU5NjMzZTY0OTUwZTg5MmNjMCIsInQiOjE3MTQ1MjYzNjAsInN0ZnAiOm51bGwsInN0aXAiOiIxMDMuMTc1LjYzLjEzNyJ9.oubeTbVCL6kzdJC9e-kI8B8ANfX7h2ezV8Zpw2wd1YY/Colorful-Blur-Dark-Aurorae-6.tar.gz</payload>[m
    [32m+[m[32m  <tags>theme,unix,original-product,plasma,linux,kde,gplv3</tags>[m
       <status>installed</status>[m
      </stuff>[m
     </hotnewstuffregistry>[m\n\nChanges in time.txt:\n    [1mdiff --git a/time.txt b/time.txt[m
    [1mindex e0777954..6e1d2e50 100644[m
    [1m--- a/time.txt[m
    [1m+++ b/time.txt[m
    [36m@@ -1 +1 @@[m
    [31m-Wed May  1 05:47:15 AM IST 2024[m
    [32m+[m[32mWed May  1 06:03:28 AM IST 2024[m and Config/Kvantum/Catppuccin-Mocha/Catppuccin-Mocha.kvconfig
Config/gtk-3.0/colors.css
Config/gtk-4.0/colors.css
Kdeconfigs/Trolltech.conf
Kdeconfigs/auroraerc
Kdeconfigs/breezerc
Kdeconfigs/gtkrc
Kdeconfigs/gtkrc-2.0
Kdeconfigs/kdeglobals
Kdeconfigs/kglobalshortcutsrc
Kdeconfigs/kwinrc
Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc
Kdeconfigs/plasmashellrc
Local/share/knewstuff3/window-decorations.knsregistry
time.txt 
