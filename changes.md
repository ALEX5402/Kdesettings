## Thu May  2 03:03:12 PM IST 2024
```
diff --git a/Kdeconfigs/katerc b/Kdeconfigs/katerc
index c434c6de..7bddcbc3 100644
--- a/Kdeconfigs/katerc
+++ b/Kdeconfigs/katerc
@@ -58,8 +58,8 @@ RunPrefix=
 SetEditor=false
 
 [MainWindow]
-1920x1080 screen: Height=707
-1920x1080 screen: Width=729
+1920x1080 screen: Height=702
+1920x1080 screen: Width=724
 
 [filetree]
 editShade=74,55,117
diff --git a/changelog.sh b/changelog.sh
index 7b2541de..e0a3647d 100755
--- a/changelog.sh
+++ b/changelog.sh
@@ -2,6 +2,6 @@
 
 #set the backup date
 echo "## $(date)"
-echo '``'
+echo '```'
 git diff
-echo '``'
+echo '```'
diff --git a/changes.md b/changes.md
index 6031c8d4..00d4632c 100644
--- a/changes.md
+++ b/changes.md
@@ -1,21 +1,2 @@
-## Thu May  2 03:00:24 PM IST 2024
-``
-diff --git a/auto-sync.sh b/auto-sync.sh
-index 39926437..7256ab8b 100755
---- a/auto-sync.sh
-+++ b/auto-sync.sh
-@@ -1,5 +1,5 @@
- #!/bin/bash
--# bash changelog.sh > changes.md
-+bash changelog.sh > changes.md
- #set the backup date
- date > time.txt
- git add .
-diff --git a/time.txt b/time.txt
-index 19da0e62..1d12f4f0 100644
---- a/time.txt
-+++ b/time.txt
-@@ -1 +1 @@
--Thu May  2 02:58:40 PM IST 2024
-+Thu May  2 03:00:15 PM IST 2024
-``
+## Thu May  2 03:03:12 PM IST 2024
+```
```
