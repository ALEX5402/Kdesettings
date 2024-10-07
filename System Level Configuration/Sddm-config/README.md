# SDDM Configuration README

This README provides information about the SDDM configuration file located at `/etc/sddm.conf.d/`.
This configuration file is used to customize the behavior and appearance of the SDDM login manager.

## Theme
- Don't forget to copy the Candy theme file into `/usr/share/sddm/themes/` this dir
- And don't foget to copy `Bibata-Modern-Classic` this iconpack into `/usr/share/icons/`
- Don't download icon pack using pacman only use icon packs given by me

## Configuration Overview

The configuration file is divided into several sections, each serving a specific purpose. Below is a breakdown of each section and its parameters.

### [Autologin]

This section configures the autologin feature for SDDM.

- `Relogin`: Set to `false` to disable automatic relogin.
- `User`: Specify the username for autologin (leave empty if not using autologin).
- `Session`: Specify the session type (leave empty if not using autologin).

### [General]

This section contains general commands for system operations.

- `HaltCommand`: Command to power off the system. Default is set to `/usr/bin/systemctl poweroff`.
- `RebootCommand`: Command to reboot the system. Default is set to `/usr/bin/systemctl reboot`.

### [Theme]

This section configures the appearance of the SDDM login screen.

- `Current`: Specifies the current theme. In this case, it is set to `Candy`.
- `CursorSize`: Defines the size of the cursor. Set to `24`.
- `CursorTheme`: Specifies the cursor theme. In this case, it is set to `Bibata-Modern-Classic`.
- `EnableAvatars`: Set to `true` to enable user avatars on the login screen.

### [Users]

This section defines user ID (UID) limits for the login manager.

- `MaximumUid`: The maximum UID allowed for users. Set to `60513`.
- `MinimumUid`: The minimum UID allowed for users. Set to `1000`.

## Installation

To apply this configuration, paste the contents into a new file in the `/etc/sddm.conf.d/` directory. You can create a new configuration file using the following command:

```bash
sudo nano /etc/sddm.conf.d/autologin.conf.conf
```

