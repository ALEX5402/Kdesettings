diff --git a/Kdeconfigs/katerc b/Kdeconfigs/katerc
index d3d7d1b1..528e1d3f 100644
--- a/Kdeconfigs/katerc
+++ b/Kdeconfigs/katerc
@@ -38,7 +38,7 @@ Tabbar Tab Limit=0
 [KTextEditor Renderer]
 Animate Bracket Matching=false
 Auto Color Theme Selection=true
-Color Theme=Catppuccin Mocha
+Color Theme=Breeze Dark
 Line Height Multiplier=1
 Show Indentation Lines=false
 Show Whole Bracket Expression=false
@@ -57,8 +57,8 @@ RunPrefix=
 SetEditor=false
 
 [MainWindow]
-1920x1080 screen: Height=877
-1920x1080 screen: Width=1112
+1920x1080 screen: Height=785
+1920x1080 screen: Width=1038
 
 [filetree]
 editShade=74,55,117
diff --git a/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc b/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc
index b992a885..eba2e943 100644
--- a/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc
+++ b/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc
@@ -163,7 +163,8 @@ positions={"1920x1080":[]}
 sortMode=-1
 
 [Containments][25][Wallpaper][org.kde.image][General]
-Image=/home/alex/wallpapers/Catppuccin-Mocha/424363.jpg
+Image=/home/alex/wallpapers/Catppuccin-Mocha/vaxerski_noBG.png
+PreviewImage=/home/alex/wallpapers/Catppuccin-Mocha/vaxerski_noBG.png
 SlidePaths=/usr/share/wallpapers/
 
 [Containments][25][Wallpaper][org.kde.slideshow][General]
diff --git a/auto-sync.sh b/auto-sync.sh
index 4b4a4852..f8df8816 100755
--- a/auto-sync.sh
+++ b/auto-sync.sh
@@ -2,39 +2,7 @@
 
 #set the backup date
 date > time.txt
-
-# Get the list of modified files
-modified_files=$(git diff --name-only)
-
-# Get the count of modified files
-file_count=$(echo "$modified_files" | wc -l)
-
-# Check if there are modified files
-if [[ -z "$modified_files" ]]; then
-    echo "No changes to commit."
-    exit 0
-fi
-
-# Generate the commit message header
-commit_message=""
-
-if [[ $file_count -eq 1 ]]; then
-    commit_message+="Updated: "
-else
-    commit_message+="Updated $file_count files: "
-fi
-
-# Append the list of modified files to the commit message
-commit_message+="$modified_files"
-
-# Append the diffs for each modified file
-while IFS= read -r file; do
-    commit_message+="\n\nChanges in $file:\n"
-    commit_message+="$(git diff --color=always "$file" | sed 's/^/    /')"
-done <<< "$modified_files"
-
-echo "$commit_message and $modified_files " > changes.md
-
+git diff . > changes.md  
 git add .
 git commit -m "Update Configs : $(date)" -m "Time : $(date +%T)" -s
 git push -f
diff --git a/changes.md b/changes.md
index 53381bb0..e69de29b 100644
--- a/changes.md
+++ b/changes.md
@@ -1,75 +0,0 @@
-Updated 6 files: Kdeconfigs/gtkrc
-Kdeconfigs/gtkrc-2.0
-Kdeconfigs/kglobalshortcutsrc
-Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc
-Kdeconfigs/plasmashellrc
-time.txt\n\nChanges in Kdeconfigs/gtkrc:\n    [1mdiff --git a/Kdeconfigs/gtkrc b/Kdeconfigs/gtkrc[m
-    [1mindex 443aed12..fbf6aa46 100644[m
-    [1m--- a/Kdeconfigs/gtkrc[m
-    [1m+++ b/Kdeconfigs/gtkrc[m
-    [36m@@ -1,2 +1,2 @@[m
-    [31m-# created by KDE Plasma, Wed May 1 06:04:23 2024[m
-    [32m+[m[32m# created by KDE Plasma, Wed May 1 06:41:37 2024[m
-     #[m\n\nChanges in Kdeconfigs/gtkrc-2.0:\n    [1mdiff --git a/Kdeconfigs/gtkrc-2.0 b/Kdeconfigs/gtkrc-2.0[m
-    [1mindex 18560ad3..52ecc3bf 100644[m
-    [1m--- a/Kdeconfigs/gtkrc-2.0[m
-    [1m+++ b/Kdeconfigs/gtkrc-2.0[m
-    [36m@@ -1,4 +1,4 @@[m
-    [31m-# created by KDE Plasma, Wed May 1 06:04:23 2024[m
-    [32m+[m[32m# created by KDE Plasma, Wed May 1 06:41:37 2024[m
-     #[m
-     [m
-     gtk-alternative-button-order = 1[m\n\nChanges in Kdeconfigs/kglobalshortcutsrc:\n\n\nChanges in Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc:\n    [1mdiff --git a/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc b/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc[m
-    [1mindex ff7585c2..b992a885 100644[m
-    [1m--- a/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc[m
-    [1m+++ b/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc[m
-    [36m@@ -128,7 +128,7 @@[m [mimmutability=1[m
-     plugin=org.kde.plasma.weather[m
-     [m
-     [Containments][25][Applets][66][Configuration][m
-    [31m-PreloadWeight=26[m
-    [32m+[m[32mPreloadWeight=18[m
-     UserBackgroundHints=ShadowBackground[m
-     configMigrated=true[m
-     [m
-    [36m@@ -191,7 +191,7 @@[m [mDialogWidth=720[m
-     [Containments][26][Applets][29][Configuration][General][m
-     fill=false[m
-     groupingAppIdBlacklist=kitty.desktop,org.kde.dolphin.desktop[m
-    [31m-groupingLauncherUrlBlacklist=applications:org.kde.dolphin.desktop,applications:kitty.desktop[m
-    [32m+[m[32mgroupingLauncherUrlBlacklist=applications:kitty.desktop,applications:org.kde.dolphin.desktop[m
-     launchers=preferred://browser,applications:org.kde.haruna.desktop[m
-     [m
-     [Containments][26][Applets][30][m
-    [36m@@ -336,7 +336,7 @@[m [mimmutability=1[m
-     plugin=org.kde.plasma.mediacontroller[m
-     [m
-     [Containments][32][Applets][57][Configuration][m
-    [31m-PreloadWeight=10[m
-    [32m+[m[32mPreloadWeight=2[m
-     [m
-     [Containments][32][General][m
-     extraItems=org.kde.plasma.bluetooth,org.kde.plasma.brightness,org.kde.plasma.notifications,org.kde.kdeconnect,org.kde.plasma.cameraindicator,org.kde.plasma.printmanager,org.kde.kscreen,org.kde.plasma.keyboardindicator,org.kde.plasma.networkmanagement,org.kde.plasma.manage-inputmethod,org.kde.plasma.devicenotifier,org.kde.plasma.keyboardlayout,org.kde.plasma.volume,org.kde.plasma.mediacontroller,org.kde.plasma.battery,org.kde.plasma.clipboard[m\n\nChanges in Kdeconfigs/plasmashellrc:\n    [1mdiff --git a/Kdeconfigs/plasmashellrc b/Kdeconfigs/plasmashellrc[m
-    [1mindex 65916692..a0c13743 100644[m
-    [1m--- a/Kdeconfigs/plasmashellrc[m
-    [1m+++ b/Kdeconfigs/plasmashellrc[m
-    [36m@@ -6,7 +6,7 @@[m [mimmutability=1[m
-     plugin=org.kde.plasma.weather[m
-     [m
-     [Applets][66][Configuration][m
-    [31m-PreloadWeight=26[m
-    [32m+[m[32mPreloadWeight=18[m
-     UserBackgroundHints=ShadowBackground[m
-     configMigrated=true[m
-     [m\n\nChanges in time.txt:\n    [1mdiff --git a/time.txt b/time.txt[m
-    [1mindex 9c796a26..c997a213 100644[m
-    [1m--- a/time.txt[m
-    [1m+++ b/time.txt[m
-    [36m@@ -1 +1 @@[m
-    [31m-Wed May  1 06:04:25 AM IST 2024[m
-    [32m+[m[32mWed May  1 06:41:38 AM IST 2024[m and Kdeconfigs/gtkrc
-Kdeconfigs/gtkrc-2.0
-Kdeconfigs/kglobalshortcutsrc
-Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc
-Kdeconfigs/plasmashellrc
-time.txt 
diff --git a/time.txt b/time.txt
index c997a213..9c711139 100644
--- a/time.txt
+++ b/time.txt
@@ -1 +1 @@
-Wed May  1 06:41:38 AM IST 2024
+Wed May  1 07:14:14 AM IST 2024
