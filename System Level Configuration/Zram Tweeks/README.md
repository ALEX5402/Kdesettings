# ZRAM and Performance Tweaks README

This README provides instructions for setting up ZRAM and applying performance tweaks using the Vortex thermal package. This setup aims to enhance system performance and responsiveness, especially on systems with limited RAM.

## i Don't use suspend mode and hybernation
- ```sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target```

## Overview

ZRAM is a Linux kernel module that creates a compressed block device in RAM, allowing for efficient memory usage. By using ZRAM, you can improve system performance by reducing the need for swap space on disk, which is slower than RAM.

The Vortex thermal package provides additional performance tweaks and optimizations for your system. For more information, visit the [Vortex thermal package repository](https://github.com/ALEX5402/Vortex-thermal-pkg).

## Dependencies

Before proceeding with the installation, ensure that you have the following dependencies installed on your system:

- `zram-generator`: A tool to configure ZRAM devices.
- `ananicy-cpp`: A daemon that manages the priority of processes based on their activity.
- `cpupower`: A utility for managing CPU frequency and power settings.
- `inxi`: A system information tool that provides detailed information about your hardware and software.
- `curl`: A command-line tool for transferring data with URLs.
- `jq`: A lightweight and flexible command-line JSON processor.
- `systemd>=256`: Ensure you have systemd version 256 or higher installed.

You can install these dependencies using your package manager. For example, on Debian-based systems, you can run:

```bash
sudo paru -S install zram-generator ananicy-cpp cpupower inxi curl jq
```
