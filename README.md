# Burp Suite Community Edition Installation Guide

This repository contains step-by-step instructions for installing Burp Suite Community Edition on Linux systems.

## Prerequisites

- Linux system (Ubuntu/Debian based)
- Internet connection
- sudo privileges

## Installation Steps

### Step 1: Download Burp Suite Community Edition

```bash
wget -O burpsuite_community.sh "https://portswigger.net/burp/releases/download?product=community&type=Linux"
```

### Step 2: Make the installer executable

```bash
chmod +x burpsuite_community.sh
```

### Step 3: Run the installer

```bash
sudo ./burpsuite_community.sh
```

**Note:** The installer will start in GUI mode by default. For console mode installation, use:

```bash
sudo ./burpsuite_community.sh -c
```

### Step 4: Verify Installation

Check if Burp Suite is installed successfully:

```bash
ls -la /usr/local/BurpSuiteCommunity/
```

The installation directory should contain:
- `BurpSuiteCommunity` (main executable)
- `burpsuite_community.jar`
- `burpbrowser/` directory
- `jre/` directory

## Running Burp Suite

To launch Burp Suite Community Edition:

```bash
/usr/local/BurpSuiteCommunity/BurpSuiteCommunity
```

Or create a symbolic link for easier access:

```bash
sudo ln -s /usr/local/BurpSuiteCommunity/BurpSuiteCommunity /usr/local/bin/burpsuite
```

Then run:

```bash
burpsuite
```

## Troubleshooting

### Installation Issues

1. **Previous installation detected**: The installer may detect a previous installation and ask whether to update or install to a different directory.

2. **Permission issues**: Make sure you have sudo privileges and the installer file has execute permissions.

3. **GUI not available**: If running on a headless server, use the console mode installation option (`-c` flag).

### Uninstallation

To uninstall Burp Suite:

```bash
sudo /usr/local/BurpSuiteCommunity/uninstall
```

## System Requirements

- Java Runtime Environment (included with installer)
- Minimum 2GB RAM recommended
- 1GB free disk space

## About Burp Suite

Burp Suite is a leading toolkit for web application security testing. The Community Edition is free and includes essential tools for manual security testing.

## License

This installation guide is provided as-is. Burp Suite Community Edition is subject to PortSwigger's license terms.

---

**Author**: abhi-mag21  
**Date**: September 2025
