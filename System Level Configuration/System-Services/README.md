# System Services Overview

This document outlines the essential system services that are enabled on the system, providing details on each service's purpose and why they are important for the overall system performance.

## Enabled Services

### 1. **NetworkManager.service**
   - **Description**: Manages network connections, including Ethernet, Wi-Fi, and VPN.
   - **Why Important**: This service is crucial for ensuring reliable network connectivity on your system, especially for managing dynamic network interfaces like Wi-Fi.
   - **Status**: Enabled

### 2. **systemd-resolved.service**
   - **Description**: Provides network name resolution (DNS).
   - **Why Important**: It handles DNS lookups, which are critical for networking operations, such as resolving domain names into IP addresses.
   - **Status**: Enabled

### 3. **systemd-timesyncd.service**
   - **Description**: Synchronizes the system clock with network time servers.
   - **Why Important**: Ensures that your system time is accurate, which is essential for logging, file timestamps, and time-sensitive network operations.
   - **Status**: Enabled

### 4. **udisks2.service**
   - **Description**: Disk management service that handles disk mounting, unmounting, and overall management of storage devices.
   - **Why Important**: It allows for automatic mounting and management of external drives, partitions, and other storage devices.
   - **Status**: Enabled

### 5. **dbus-broker.service**
   - **Description**: Manages the D-Bus message bus, which is responsible for communication between different parts of the system, including desktop environments and background services.
   - **Why Important**: Critical for system-wide inter-process communication, allowing different applications and services to interact seamlessly.
   - **Status**: Enabled

### 6. **systemd-logind.service**
   - **Description**: Manages user logins and sessions.
   - **Why Important**: This service is responsible for handling user sessions, login requests, and switching between users.
   - **Status**: Enabled

### 7. **systemd-journald.service**
   - **Description**: Collects and stores logs from various services and the system kernel.
   - **Why Important**: Logs are crucial for system debugging and tracking any issues with the system.
   - **Status**: Enabled

### 8. **systemd-udevd.service**
   - **Description**: Manages device events and dynamically loads modules for hardware.
   - **Why Important**: Automatically detects and configures hardware as you connect devices like USB drives, ensuring the system recognizes them.
   - **Status**: Enabled

### 9. **upower.service** (If you're on a laptop)
   - **Description**: Power management service for laptops.
   - **Why Important**: Handles battery monitoring and power-saving features.
   - **Status**: Enabled (for laptops)

### 10. **user@1000.service**
   - **Description**: Manages the user session for the currently logged-in user (UID 1000).
   - **Why Important**: This service is essential for user-specific operations and session management.
   - **Status**: Enabled

### 11. **polkit.service**
   - **Description**: Provides an authorization framework for granting elevated privileges to users and services.
   - **Why Important**: Essential for system security and handling privileged operations, such as installing software or modifying system settings.
   - **Status**: Enabled

### 12. **firewalld.service** (Optional, if you need firewall security)
   - **Description**: Provides a dynamic firewall with support for network zones.
   - **Why Important**: This service is important if you require firewall functionality to secure your system.
   - **Status**: Enabled (Optional)

## Disabled or Optional Services

These services can remain disabled unless required by specific use cases:

- **sshd.service**: Enable if you require remote SSH access.
- **bluetooth.service**: Enable if you use Bluetooth devices.
- **docker.service** and **containerd.service**: Enable if you are using containers (e.g., Docker).
- **libvirtd.service**: Enable if you are working with virtual machines.

## Summary

To ensure smooth operation of the system with a minimal setup, we recommend keeping the following essential services enabled:
- NetworkManager.service
- systemd-resolved.service
- systemd-timesyncd.service
- udisks2.service
- dbus-broker.service
- upower.service (on laptops)
- polkit.service


Optional services like `firewalld`, `sshd`, and `bluetooth` should only be enabled if required by your workflow.

```systemctl list-units --type=service --all
```
