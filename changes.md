Updated 8 files: Config/Google/AndroidStudio2023.2/options/actionSummary.xml
Config/Google/AndroidStudio2023.2/options/window.state.xml
Extrafiles/old-keymapping-backup.kksrc
Kdeconfigs/kglobalshortcutsrc
Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc
Kdeconfigs/plasmanotifyrc
Kdeconfigs/systemsettingsrc
time.txt\n\nChanges in Config/Google/AndroidStudio2023.2/options/actionSummary.xml:\n    [1mdiff --git a/Config/Google/AndroidStudio2023.2/options/actionSummary.xml b/Config/Google/AndroidStudio2023.2/options/actionSummary.xml[m
    [1mindex 44e3669b..40d7fc7a 100644[m
    [1m--- a/Config/Google/AndroidStudio2023.2/options/actionSummary.xml[m
    [1m+++ b/Config/Google/AndroidStudio2023.2/options/actionSummary.xml[m
    [36m@@ -172,7 +172,7 @@[m
           <i c="4" l="1714418927716" />[m
         </e>[m
         <e n="WelcomeScreen.RevealIn">[m
    [31m-      <i c="1" l="1714312567075" />[m
    [32m+[m[32m      <i c="2" l="1714461206724" />[m
         </e>[m
         <e n="WelcomeScreen.RunAndroidSdkManager">[m
           <i c="4" l="1714142599803" />[m\n\nChanges in Config/Google/AndroidStudio2023.2/options/window.state.xml:\n    [1mdiff --git a/Config/Google/AndroidStudio2023.2/options/window.state.xml b/Config/Google/AndroidStudio2023.2/options/window.state.xml[m
    [1mindex 052b8506..f40d7754 100644[m
    [1m--- a/Config/Google/AndroidStudio2023.2/options/window.state.xml[m
    [1m+++ b/Config/Google/AndroidStudio2023.2/options/window.state.xml[m
    [36m@@ -14,10 +14,10 @@[m
           <screen x="0" y="0" width="1920" height="1080" />[m
         </state>[m
         <state width="810" height="102" key="ShowUsagesActions.dimensionServiceKey/0.0.1920.1080" timestamp="1714338467912" />[m
    [31m-    <state x="961" y="558" width="813" height="668" key="WELCOME_SCREEN" timestamp="1714434110897">[m
    [32m+[m[32m    <state x="959" y="471" width="813" height="668" key="WELCOME_SCREEN" timestamp="1714461197670">[m
           <screen x="0" y="0" width="1920" height="1080" />[m
         </state>[m
    [31m-    <state x="961" y="558" width="813" height="668" key="WELCOME_SCREEN/0.0.1920.1080" timestamp="1714434110897" />[m
    [32m+[m[32m    <state x="959" y="471" width="813" height="668" key="WELCOME_SCREEN/0.0.1920.1080" timestamp="1714461197670" />[m
         <state x="545" y="220" width="800" height="650" key="com.android.tools.idea.devicemanagerv2.DeviceManagerWelcomeScreenFrame" timestamp="1714226986649">[m
           <screen x="0" y="0" width="1920" height="1080" />[m
         </state>[m\n\nChanges in Extrafiles/old-keymapping-backup.kksrc:\n    [1mdiff --git a/Extrafiles/old-keymapping-backup.kksrc b/Extrafiles/old-keymapping-backup.kksrc[m
    [1mindex 51df8066..d4d5e831 100644[m
    [1m--- a/Extrafiles/old-keymapping-backup.kksrc[m
    [1m+++ b/Extrafiles/old-keymapping-backup.kksrc[m
    [36m@@ -8,11 +8,11 @@[m [mSwitch to Next Keyboard Layout=Meta+Alt+K[m
     [StandardShortcuts][m
     AboutApp=[m
     AboutKDE=[m
    [31m-Activate Next Tab=Ctrl+]; Ctrl+PgDown[m
    [32m+[m[32mActivate Next Tab=Ctrl+PgDown; Ctrl+][m
     Activate Previous Tab=Ctrl+[; Ctrl+PgUp[m
     ActualSize=Ctrl+0[m
     AddBookmark=Ctrl+B[m
    [31m-Back=Alt+Left; Back[m
    [32m+[m[32mBack=Back; Alt+Left[m
     BackwardWord=Ctrl+Left[m
     Begin=Ctrl+Home[m
     BeginningOfLine=Home[m
    [36m@@ -22,7 +22,7 @@[m [mConfigureNotifications=[m
     ConfigureToolbars=[m
     Copy=Ctrl+Ins; Ctrl+C[m
     CreateFolder=Ctrl+Shift+N[m
    [31m-Cut=Ctrl+X; Shift+Del[m
    [32m+[m[32mCut=Shift+Del; Ctrl+X[m
     DeleteFile=Shift+Del[m
     DeleteWordBack=Ctrl+Backspace[m
     DeleteWordForward=Ctrl+Del[m
    [36m@@ -57,7 +57,7 @@[m [mOpen=Ctrl+O[m
     OpenContextMenu=Menu; Shift+F10[m
     OpenMainMenu=F10[m
     OpenRecent=[m
    [31m-Paste=Shift+Ins; Ctrl+V[m
    [32m+[m[32mPaste=Ctrl+V; Shift+Ins[m
     Paste Selection=Ctrl+Shift+Ins[m
     Preferences=Ctrl+Shift+,[m
     PrevCompletion=Ctrl+Up[m
    [36m@@ -76,7 +76,7 @@[m [mRotateUp=Up[m
     Save=Ctrl+S[m
     SaveAs=Ctrl+Shift+S[m
     SelectAll=Ctrl+A[m
    [31m-ShowHideHiddenFiles=Ctrl+H; Alt+.[m
    [32m+[m[32mShowHideHiddenFiles=Alt+.; Ctrl+H[m
     ShowMenubar=Ctrl+M[m
     ShowStatusbar=[m
     ShowToolbar=[m
    [36m@@ -109,7 +109,7 @@[m [mToggle Screen Reader On and Off=Meta+Alt+S[m
     [kcm_touchpad][Global Shortcuts][m
     Disable Touchpad=Touchpad Off[m
     Enable Touchpad=Touchpad On[m
    [31m-Toggle Touchpad=Meta+Ctrl+Zenkaku Hankaku; Touchpad Toggle[m
    [32m+[m[32mToggle Touchpad=Touchpad Toggle; Meta+Ctrl+Zenkaku Hankaku[m
     [m
     [kitty.desktop][Global Shortcuts][m
     _launch=Meta+T[m
    [36m@@ -117,9 +117,9 @@[m [m_launch=Meta+T[m
     [kmix][Global Shortcuts][m
     decrease_microphone_volume=Microphone Volume Down[m
     decrease_volume=Volume Down[m
    [31m-decrease_volume_small=Shift+Volume Down[m
    [32m+[m[32mdecrease_volume_small=Meta+F8; Shift+Volume Down[m
     increase_microphone_volume=Microphone Volume Up[m
    [31m-increase_volume=Volume Up[m
    [32m+[m[32mincrease_volume=Volume Up; Meta+F9[m
     increase_volume_small=Shift+Volume Up[m
     mic_mute=Microphone Mute; Meta+M; Meta+Volume Mute[m
     mute=Volume Mute[m
    [36m@@ -145,7 +145,7 @@[m [mExposeClass=Ctrl+F7[m
     ExposeClassCurrentDesktop=[m
     Grid View=Meta+G[m
     Increase Opacity=[m
    [31m-Kill Window=Alt+F4; Meta+Ctrl+Esc[m
    [32m+[m[32mKill Window=Meta+Ctrl+Esc; Alt+F4[m
     Move Tablet to Next Output=[m
     MoveMouseToCenter=Meta+F6[m
     MoveMouseToFocus=Meta+F5[m
    [36m@@ -165,7 +165,7 @@[m [mSwitch Window Down=Meta+Alt+Down[m
     Switch Window Left=Meta+Alt+Left[m
     Switch Window Right=Meta+Alt+Right[m
     Switch Window Up=Meta+Alt+Up[m
    [31m-Switch to Desktop 1=Ctrl+F1; Meta+1[m
    [32m+[m[32mSwitch to Desktop 1=Meta+1; Ctrl+F1[m
     Switch to Desktop 10=[m
     Switch to Desktop 11=[m
     Switch to Desktop 12=[m
    [36m@@ -218,7 +218,7 @@[m [mWindow Fullscreen=Meta+F11[m
     Window Grow Horizontal=[m
     Window Grow Vertical=[m
     Window Lower=[m
    [31m-Window Maximize=Meta+W; Meta+PgUp[m
    [32m+[m[32mWindow Maximize=Meta+PgUp; Meta+W[m
     Window Maximize Horizontal=[m
     Window Maximize Vertical=[m
     Window Minimize=Meta+PgDown[m
    [36m@@ -285,7 +285,7 @@[m [mWindow to Screen 5=[m
     Window to Screen 6=[m
     Window to Screen 7=[m
     view_actual_size=[m
    [31m-view_zoom_in=Meta++; Meta+=[m
    [32m+[m[32mview_zoom_in=Meta+=; Meta++[m
     view_zoom_out=Meta+-[m
     [m
     [mediacontrol][Global Shortcuts][m
    [36m@@ -313,37 +313,37 @@[m [mNewWindow=[m
     _launch=Ctrl+Alt+T[m
     [m
     [org.kde.krunner.desktop][Global Shortcuts][m
    [31m-RunClipboard=Alt+Shift+F2; Meta+R[m
    [31m-_launch=Search; Alt+F2; Meta+A; Alt+Space[m
    [32m+[m[32mRunClipboard=Alt+Shift+F2[m
    [32m+[m[32m_launch=Alt+Space; Search; Alt+F2; Meta+A[m
     [m
     [org.kde.kscreen.desktop][Global Shortcuts][m
    [31m-ShowOSD=Meta+P; Display[m
    [32m+[m[32mShowOSD=Display[m
     [m
     [org.kde.plasma-systemmonitor.desktop][Global Shortcuts][m
     _launch=Meta+Esc[m
     [m
     [org.kde.plasma.emojier.desktop][Global Shortcuts][m
    [31m-_launch=Meta+.; Meta+Ctrl+Alt+Shift+Space[m
    [32m+[m[32m_launch=Meta+Ctrl+Alt+Shift+Space; Meta+.[m
     [m
     [org.kde.spectacle.desktop][Global Shortcuts][m
     ActiveWindowScreenShot=Meta+Print[m
     CurrentMonitorScreenShot=[m
     FullScreenScreenShot=Shift+Print[m
     OpenWithoutScreenshot=[m
    [31m-RecordRegion=Meta+Shift+R[m
    [32m+[m[32mRecordRegion=Meta+Shift+R; Meta+R[m
     RecordScreen=Meta+Alt+R[m
     RecordWindow=Meta+Ctrl+R[m
    [31m-RectangularRegionScreenShot=Meta+Shift+Print; Meta+Shift+S[m
    [32m+[m[32mRectangularRegionScreenShot=Meta+Shift+S; Meta+Shift+Print[m
     WindowUnderCursorScreenShot=Meta+Ctrl+Print[m
     _launch=Print[m
     [m
     [org_kde_powerdevil][Global Shortcuts][m
     Decrease Keyboard Brightness=Keyboard Brightness Down[m
     Decrease Screen Brightness=Monitor Brightness Down[m
    [31m-Decrease Screen Brightness Small=Shift+Monitor Brightness Down[m
    [32m+[m[32mDecrease Screen Brightness Small=Shift+Monitor Brightness Down; Meta+F10[m
     Hibernate=Hibernate[m
     Increase Keyboard Brightness=Keyboard Brightness Up[m
    [31m-Increase Screen Brightness=Monitor Brightness Up[m
    [32m+[m[32mIncrease Screen Brightness=Monitor Brightness Up; Meta+F12[m
     Increase Screen Brightness Small=Shift+Monitor Brightness Up[m
     PowerDown=Power Down[m
     PowerOff=Power Off[m
    [36m@@ -352,6 +352,9 @@[m [mToggle Keyboard Backlight=Keyboard Light On/Off[m
     Turn Off Screen=[m
     powerProfile=Battery; Meta+B[m
     [m
    [32m+[m[32m[pavucontrol.desktop][Global Shortcuts][m
    [32m+[m[32m_launch=Meta+P[m
    [32m+[m
     [plasmashell][Global Shortcuts][m
     activate task manager entry 1=[m
     activate task manager entry 10=[m
    [36m@@ -379,7 +382,7 @@[m [mshow-on-mouse-pos=Meta+V[m
     stop current activity=[m
     switch to next activity=[m
     switch to previous activity=[m
    [31m-toggle do not disturb=Meta+F12[m
    [32m+[m[32mtoggle do not disturb=[m
     [m
     [systemsettings.desktop][Global Shortcuts][m
     _launch=Tools[m\n\nChanges in Kdeconfigs/kglobalshortcutsrc:\n    [1mdiff --git a/Kdeconfigs/kglobalshortcutsrc b/Kdeconfigs/kglobalshortcutsrc[m
    [1mindex dc55a527..48193c94 100644[m
    [1m--- a/Kdeconfigs/kglobalshortcutsrc[m
    [1m+++ b/Kdeconfigs/kglobalshortcutsrc[m
    [36m@@ -21,9 +21,9 @@[m [m_k_friendly_name=Touchpad[m
     _k_friendly_name=Audio Volume[m
     decrease_microphone_volume=Microphone Volume Down,Microphone Volume Down,Decrease Microphone Volume[m
     decrease_volume=Volume Down,Volume Down,Decrease Volume[m
    [31m-decrease_volume_small=Shift+Volume Down,Shift+Volume Down,Decrease Volume by 1%[m
    [32m+[m[32mdecrease_volume_small=Meta+F8\tShift+Volume Down,Shift+Volume Down,Decrease Volume by 1%[m
     increase_microphone_volume=Microphone Volume Up,Microphone Volume Up,Increase Microphone Volume[m
    [31m-increase_volume=Volume Up,Volume Up,Increase Volume[m
    [32m+[m[32mincrease_volume=Meta+F9\tVolume Up,Volume Up,Increase Volume[m
     increase_volume_small=Shift+Volume Up,Shift+Volume Up,Increase Volume by 1%[m
     mic_mute=Microphone Mute\tMeta+Volume Mute\tMeta+M,Microphone Mute\tMeta+Volume Mute,Mute Microphone[m
     mute=Volume Mute,Volume Mute,Mute[m
    [36m@@ -208,10 +208,10 @@[m [mstopmedia=Media Stop,Media Stop,Stop media playback[m
     [org_kde_powerdevil][m
     Decrease Keyboard Brightness=Keyboard Brightness Down,Keyboard Brightness Down,Decrease Keyboard Brightness[m
     Decrease Screen Brightness=Monitor Brightness Down,Monitor Brightness Down,Decrease Screen Brightness[m
    [31m-Decrease Screen Brightness Small=Shift+Monitor Brightness Down,Shift+Monitor Brightness Down,Decrease Screen Brightness by 1%[m
    [32m+[m[32mDecrease Screen Brightness Small=Shift+Monitor Brightness Down\tMeta+F10,Shift+Monitor Brightness Down,Decrease Screen Brightness by 1%[m
     Hibernate=Hibernate,Hibernate,Hibernate[m
     Increase Keyboard Brightness=Keyboard Brightness Up,Keyboard Brightness Up,Increase Keyboard Brightness[m
    [31m-Increase Screen Brightness=Monitor Brightness Up\tMeta+F10,Monitor Brightness Up,Increase Screen Brightness[m
    [32m+[m[32mIncrease Screen Brightness=Meta+F12\tMonitor Brightness Up,Monitor Brightness Up,Increase Screen Brightness[m
     Increase Screen Brightness Small=Shift+Monitor Brightness Up,Shift+Monitor Brightness Up,Increase Screen Brightness by 1%[m
     PowerDown=Power Down,Power Down,Power Down[m
     PowerOff=Power Off,Power Off,Power Off[m
    [36m@@ -269,6 +269,12 @@[m [m_launch=Meta+C[m
     [services][org.kde.krunner.desktop][m
     _launch=Meta+A\tAlt+Space\tSearch\tAlt+F2[m
     [m
    [32m+[m[32m[services][org.kde.kscreen.desktop][m
    [32m+[m[32mShowOSD=Display[m
    [32m+[m
     [services][org.kde.spectacle.desktop][m
     RectangularRegionScreenShot=Meta+Shift+S\tMeta+Shift+Print[m
     _launch=Print[m
    [32m+[m
    [32m+[m[32m[services][pavucontrol.desktop][m
    [32m+[m[32m_launch=Meta+P[m\n\nChanges in Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc:\n    [1mdiff --git a/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc b/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc[m
    [1mindex 086515a7..fe54d97c 100644[m
    [1m--- a/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc[m
    [1m+++ b/Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc[m
    [36m@@ -265,7 +265,7 @@[m [mimmutability=1[m
     plugin=org.kde.plasma.volume[m
     [m
     [Containments][32][Applets][42][Configuration][m
    [31m-PreloadWeight=90[m
    [32m+[m[32mPreloadWeight=95[m
     [m
     [Containments][32][Applets][42][Configuration][General][m
     currentTab=streams[m\n\nChanges in Kdeconfigs/plasmanotifyrc:\n    [1mdiff --git a/Kdeconfigs/plasmanotifyrc b/Kdeconfigs/plasmanotifyrc[m
    [1mindex 9a959ca5..2852588c 100644[m
    [1m--- a/Kdeconfigs/plasmanotifyrc[m
    [1m+++ b/Kdeconfigs/plasmanotifyrc[m
    [36m@@ -8,7 +8,6 @@[m [mSeen=true[m
     Seen=true[m
     [m
     [DoNotDisturb][m
    [31m-NotificationSoundsMuted=true[m
     Until=2024,4,27,22,6,0.337[m
     [m
     [Notifications][m\n\nChanges in Kdeconfigs/systemsettingsrc:\n    [1mdiff --git a/Kdeconfigs/systemsettingsrc b/Kdeconfigs/systemsettingsrc[m
    [1mindex a9366488..e859a5ff 100644[m
    [1m--- a/Kdeconfigs/systemsettingsrc[m
    [1m+++ b/Kdeconfigs/systemsettingsrc[m
    [36m@@ -3,7 +3,7 @@[m
     1920x1080 screen: Width=1216[m
     [m
     [KFileDialog Settings][m
    [31m-detailViewIconSize=128[m
    [32m+[m[32mdetailViewIconSize=68[m
     [m
     [MainWindow][m
     MenuBar=Disabled[m\n\nChanges in time.txt:\n    [1mdiff --git a/time.txt b/time.txt[m
    [1mindex bce0e821..24f8cd32 100644[m
    [1m--- a/time.txt[m
    [1m+++ b/time.txt[m
    [36m@@ -1 +1 @@[m
    [31m-Tue Apr 30 12:13:20 PM IST 2024[m
    [32m+[m[32mTue Apr 30 01:11:40 PM IST 2024[m and Config/Google/AndroidStudio2023.2/options/actionSummary.xml
Config/Google/AndroidStudio2023.2/options/window.state.xml
Extrafiles/old-keymapping-backup.kksrc
Kdeconfigs/kglobalshortcutsrc
Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc
Kdeconfigs/plasmanotifyrc
Kdeconfigs/systemsettingsrc
time.txt 
