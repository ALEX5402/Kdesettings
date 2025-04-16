# CachyOS Repository Installation Guide

This README provides instructions for adding the CachyOS repository to your Arch Linux system, as well as setting up Chaotic-AUR. You can choose between an automated installation using a helper script or a manual installation process.

## Table of Contents

1. [Adding CachyOS Repository](#adding-cachyos-repository)
   - [Option 1: Automated Installation](#option-1-automated-installation)
   - [Option 2: Manual Installation](#option-2-manual-installation)
2. [Setting Up Chaotic-AUR](#setting-up-chaotic-aur)
3. [Conclusion](#conclusion)
4. [Additional Resources](#additional-resources)

## 1. Adding CachyOS Repository

### Option 1: Automated Installation

We’ve made it easy for you! Simply run the following commands to use our helper script that does all the work for you. 😉

1. Get the archive with the script using one of the following utilities:

   Using `curl`:
   ```bash
   curl https://mirror.cachyos.org/cachyos-repo.tar.xz -o cachyos-repo.tar.xz
   ```

   Using `wget`:
   ```bash
   wget https://mirror.cachyos.org/cachyos-repo.tar.xz -O cachyos-repo.tar.xz
   ```

2. Extract and enter into the archive:
   ```bash
   tar xvf cachyos-repo.tar.xz && cd cachyos-repo
   ```

3. Run the script with `sudo`:
   ```bash
   sudo ./cachyos-repo.sh
   ```

#### Behavior of the Script

- The script will auto-detect the CPU architecture. If the CPU has x86-64-v4 or x86-64-v3 support, the script will automatically use the repositories optimized with this flag and some other flags.
- The script will back up your old `pacman.conf`.

### Option 2: Manual Installation

1. Install the CachyOS keyring:
   ```bash
   sudo pacman-key --recv-keys F3B607488DB35A47 --keyserver keyserver.ubuntu.com
   sudo pacman-key --lsign-key F3B607488DB35A47
   ```

2. Install required packages:
   ```bash
   sudo pacman -U 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-keyring-20240331-1-any.pkg.tar.zst' \
                  'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-mirrorlist-18-1-any.pkg.tar.zst' \
                  'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v3-mirrorlist-18-1-any.pkg.tar.zst' \
                  'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v4-mirrorlist-6-1-any.pkg.tar.zst' \
                  'https://mirror.cachyos.org/repo/x86_64/cachyos/pacman-6.1.0-7-x86_64.pkg.tar.zst'
   ```

## 2. Setting Up Chaotic-AUR

If you want to start using Chaotic-AUR or just need to copy the setup commands, this is the right place for you.

1. Retrieve the primary key to enable the installation of the keyring and mirror list:
   ```bash
   pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
   pacman-key --lsign-key 3056513887B78AEB
   ```

2. Install the Chaotic-AUR keyring and mirror list:
   ```bash
   pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
   pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
   ```

3. Append the following to `/etc/pacman.conf`:
   ```plaintext
   [chaotic-aur]
   Include = /etc/pacman.d/chaotic-mirrorlist
   ```

## 3. Conclusion

By following this guide, you should have successfully added the CachyOS repository and set up Chaotic-AUR on your Arch Linux system. If you encounter any issues or have questions, please refer to the documentation or seek assistance from the community.

## 4. Additional Resources

For more information on adding the CachyOS repository, visit: [CachyOS Wiki](https://wiki.cachyos.org/cachyos_repositories/how_to_add_cachyos_repo/)

For more information on Chaotic-AUR, visit: [Chaotic-AUR Documentation](https://aur.chaotic.cx/docs)

