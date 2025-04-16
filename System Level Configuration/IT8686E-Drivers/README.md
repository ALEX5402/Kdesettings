# IT8686E Sensor Driver Installation Guide

This README provides step-by-step instructions for downloading, compiling, and installing the IT8686E sensor driver for monitoring hardware sensors on your system.

## Table of Contents

1. [Download the Source Code](#download-the-source-code)
2. [Unpack the Source Code](#unpack-the-source-code)
3. [Compile the Source Code](#compile-the-source-code)
4. [Install the IT8686E Module](#install-the-it8686e-module)
5. [Load the Module](#load-the-module)
6. [Create a Custom Configuration File](#create-a-custom-configuration-file)
7. [Loading IT8686E on Gentoo Linux](#loading-it8686e-on-gentoo-linux)
8. [Verification](#verification)
9. [Arch Linux Users](#arch-linux-users)
10. [Conclusion](#conclusion)

## 1. Download the Source Code

Open a terminal and create a directory for the IT8686E source code:

```bash
# mkdir /usr/src/it87
# cd /usr/src/it87
```

Download the source code from the GitHub repository:

```bash
/usr/src/it87 # wget https://github.com/frankcrawford/it87/archive/refs/heads/master.zip
```

## 2. Unpack the Source Code

Unzip the downloaded file:

```bash
/usr/src/it87 # unzip master.zip
```

You should see the following files and directories:

```
Archive:  master.zip
40bec4b5a7896d4406d2a7d095d06c0624c24aca
   creating: it87-master/
  inflating: it87-master/ISSUES
  inflating: it87-master/ITE_Register_map.csv
  inflating: it87-master/ITE_Register_map.pdf
  inflating: it87-master/Makefile
  inflating: it87-master/README
  inflating: it87-master/compat.h
  inflating: it87-master/dkms.conf
  inflating: it87-master/it87.c
```

## 3. Compile the Source Code

Navigate to the unpacked source code directory:

```bash
/usr/src/it87 # cd it87-master
```

Compile the source code using the `make` command:

```bash
/usr/src/it87/it87-master # make
```

You should see output indicating that the module is being compiled.

## 4. Install the IT8686E Module

Install the compiled module using the following command:

```bash
/usr/src/it87/it87-master # sudo make install
```

## 5. Load the Module

To load the module for the IT8686E chip, you need to add specific options. Use the following command:

```bash
/usr/src/it87/it87-master # sudo modprobe it87 force_id=0x8686 ignore_resource_conflict=1
```

You can verify that the module has loaded successfully by checking the kernel logs:

```bash
# dmesg
```

You should see messages indicating that the IT8686E driver has been loaded.

## 6. Create a Custom Configuration File

To adjust the raw voltage and temperature values from the sensor chip, create a configuration file. Use the following command to create the file:

```bash
sudo nano /etc/sensors.d/gigabyte-it8686.conf
```

Add the following content to the file:

```plaintext
chip "it8686-*"
    label in0 "Vcore"
    label in1 "+3.3V"
        compute in1 @ * 1.65, @ / 1.65
    label in2 "+12.0V"
        compute in2 @ * 6, @ / 6
    label in3 "+5.0V"
        compute in3 @ * 2.5, @ / 2.5
    label in4 "VSOC"
    label in5 "VDDP"
    label in6 "DRAM"
    label in7 "3VSB"
    label in8 "VBAT"
    label fan1 "CPU Fan"
    label fan2 "SYS Fan 1"
    label fan3 "SYS Fan 2"
    label fan4 "SYS Fan 3_PUMP"
    label fan5 "CPU_OPT"
    label temp1 "System"
    label temp2 "Chipset"
    label temp3 "CPU"
    label temp4 "PCIe x16"
    label temp5 "VRM"
    label temp6 "VSoC"
    label intrusion0 "Intrusion"
```

## 7. Loading IT8686E on Gentoo Linux

If you are using Gentoo Linux and want to autoload the module during boot, add the module configuration to either `/etc/modules-load.d/it87.conf` (for systemd) or `/etc/conf.d/modules` (for OpenRC).

For systemd, create the file:

```bash
sudo nano /etc/modules-load.d/it87.conf
```

Add the following line:

```plaintext
it87
```

For OpenRC, edit the file:

```bash
sudo nano /etc/conf.d/modules
```

Add the following line:

```plaintext
modules="it87"
```

Then, add the modprobe options to `/etc/modprobe.d/it87.conf`:

```bash
sudo nano /etc/modprobe.d/it87.conf
```

Add the following content:

```plaintext
options it87 force_id=0x8686 ignore_resource_conflict=1
```

## 8. Verification

To verify that the sensors are working correctly, run the following command:

```bash
# sensors
```

You should see output similar to the following, showing proper names and values for each input:

```
it8686-isa-0a40
Adapter: ISA adapter
Vcore:       732.00 mV (min =  +0.00 V, max =  +3.06 V)
+3.3V:         3.43 V  (min =  +0.00 V, max =  +5.05 V)
+12.0V:       12.31 V  (min =  +0.00 V, max =  +18.36 V)
+5.0V:         4.98 V  (min =  +0.00 V, max =  +7.65 V)
...
```

## 9. Arch Linux Users

If you are using Arch Linux, you can simplify the installation process by using the AUR package. You can install the IT87 DKMS driver from the AUR with the following command:

```bash
yay -S it87-dkms-git
```

This will automatically handle the downloading, compiling, and installation of the IT8686E driver for you.

## 10. Conclusion

By following this guide, you should have successfully installed and configured the IT8686E sensor driver on your system. If you encounter any issues or have questions, please refer to the documentation in the repository or seek assistance from the community.

For more information, visit the [IT87 GitHub repository](https://github.com/frankcrawford/it87).
