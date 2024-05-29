# Kdesettings
  My kde settings on kde 6 with all config files
 
# Installetion
- clone this repo
- `cd Kdesettings`
- `./install.sh`

# Requred dependencies need to be installed
- nwg-look                                                ( gtk configuration tool )
- qt5ct                                                  ( qt5 configuration tool )
- qt6ct                                                  ( qt6 configuration tool )
- kvantum                                                ( svg based qt theme engine )
- qt5-wayland                                            ( wayland support in qt5 )
- qt6-wayland                                            ( wayland support in qt6 )

## Packages i use 
``` 
ueberzug apk-editor-studio-bin apkstudio-git appimagelauncher fisher tmux waydroid python-pyclip wl-clipboard-rs kio-admin noto-fonts-extra jdk21-openjdk jdk17-openjdk jdk-openjdk iaito ttf-jetbrains-mono neovim ttf-jetbrains-mono-nerd ttf-liberation ttf-jetbrains-mono ugrep elisa f2fs-tools ytfzf yt-dlp yyjson android-studio rust qt5ct qt6ct nwg-look frida frida-dexdump fzf eza bat ugrep android-tools fish fisher ttf-jetbrains-mono ttf-jetbrains-mono-nerd 

```
## have a look
![sssss](https://github.com/ALEX5402/Kdesettings/assets/76860596/b80d5c47-3875-4c11-a451-b70e212b507a)
image![Screenshot_20240428_012937](https://github.com/ALEX5402/Kdesettings/assets/76860596/dc3b01ac-b289-4165-a134-acf529370561)
![Screenshot_20240430_080652](https://github.com/ALEX5402/Kdesettings/assets/76860596/7f518edf-ff0b-41fd-853c-b78ea457078f)
![Screenshot_20240430_080509](https://github.com/ALEX5402/Kdesettings/assets/76860596/e7017410-fc18-4a68-b25f-7132873ecb0b)
![Screenshot_20240430_080430](https://github.com/ALEX5402/Kdesettings/assets/76860596/3f8e5ecb-7374-4b09-82d1-942c918de48f)

 
## Changelog Wed May 29 07:27:10 AM IST 2024
```
 Config/nvim/lazy-lock.json                         |  34 +--
 Kdeconfigs/katerc                                  |   4 +-
 Kdeconfigs/kglobalshortcutsrc                      |  12 +-
 Kdeconfigs/kwinrulesrc                             |  31 +-
 Kdeconfigs/plasma-org.kde.plasma.desktop-appletsrc |   6 +-
 Kdeconfigs/spectaclerc                             |   2 +-
 .../2909i102dee260fc93a07.vcf                      |   4 +-
 .../2909i10ab625086874f1.vcf                       | 232 +++++++++------
 .../2909i11b60418eb90fc5.vcf                       |   4 +-
 .../2909i130dc4520f75dca8.vcf                      |   4 +-
 .../2909i1c1b0cd08a6680a5.vcf                      |   4 +-
 .../2909i202d54ea8934aeac.vcf                      |   4 +-
 .../2909i256b31ad0c36834a.vcf                      |   4 +-
 .../2909i286698648b9caa1a.vcf                      |   4 +-
 .../2909i2ae840118c80d71f.vcf                      |   4 +-
 .../2909i2c0095c88c28ab2f.vcf                      |   4 +-
 .../2909i2d809e070da3d620.vcf                      |   4 +-
 .../2909i3040933089acfabf.vcf                      |   4 +-
 .../2909i3235d7c98b152c59.vcf                      |   4 +-
 .../2909i32def4a8d1b117d.vcf                       |   4 +-
 .../2909i340243d28902012e.vcf                      |   4 +-
 .../2909i346b800a0bbcc40d.vcf                      |   4 +-
 .../2909i38852c410b658d23.vcf                      |   4 +-
 .../2909i39bd8eba8d76a113.vcf                      |   4 +-
 .../2909i3cc6e2b40ecc0422.vcf                      |   4 +-
 .../2909i415160660e8ebedb.vcf                      | 267 +++++++++++-------
 .../2909i45e85749881ae6fa.vcf                      |   4 +-
 .../2909i48077da18af3408b.vcf                      | 313 ++++++++++++---------
 .../2909i48755063088c3370.vcf                      |   4 +-
 .../2909i4d6c525a8ebe1938.vcf                      |   4 +-
 .../2909i4f96d8ff0807efec.vcf                      |   4 +-
 .../2909i517890cf8e3098c2.vcf                      |   4 +-
 .../2909i529a389b8dbc0c29.vcf                      |   4 +-
 .../2909i569f01c60f4aa3bc.vcf                      |   4 +-
 .../2909i5736d93f8b3fc5f3.vcf                      |   4 +-
 .../2909i577b64108767a07.vcf                       |   4 +-
 .../2909i5a4c43b60bf39875.vcf                      |   4 +-
 .../2909i609de3d789314b7c.vcf                      |   4 +-
 .../2909i60a0a7a98f38ab77.vcf                      | 288 +++++++++++--------
 .../2909i614bc72e0d587091.vcf                      |   4 +-
 .../2909i61a45be68d70ddb5.vcf                      |   4 +-
 .../2909i61cada6c0d55a2c7.vcf                      |   4 +-
 .../2909i651541ff0bf79606.vcf                      |   4 +-
 .../2909i6636ebb70926879e.vcf                      |   4 +-
 .../2909i688c3b840a39e61a.vcf                      |   4 +-
 .../2909i68c3d7b58f682740.vcf                      |   4 +-
 .../2909i69cd17a40cc376b3.vcf                      |   4 +-
 .../2909i74356086897054f5.vcf                      |   4 +-
 .../2909i78cb47b388586af9.vcf                      |   4 +-
 .../2909i7daf06f8b43ec80.vcf                       |   4 +-
 .../2909i7e36a157888625c3.vcf                      |   4 +-
 .../2909i7e7610f7899759d5.vcf                      | 249 +++++++++-------
 .../2909iec909a10ed8da08.vcf                       |   4 +-
 .../723i11544fa30dde96b9.vcf                       |   4 +-
 .../723i18efcee50b0c8c61.vcf                       |   4 +-
 .../723i24e984c88c52e71a.vcf                       |   4 +-
 .../723i3efa29660b9fcc4f.vcf                       |   4 +-
 .../723i5288e0fe8f93c618.vcf                       |   4 +-
 .../723i61ed128189c505c2.vcf                       |   4 +-
 README.md                                          |  10 +-
 60 files changed, 954 insertions(+), 686 deletions(-)
```
 
