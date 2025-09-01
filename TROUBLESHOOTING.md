# Burp Suite Installation Troubleshooting Guide

## Common Issues and Solutions

### 1. Previous Installation Detected

**Problem**: Installer shows "A previous installation has been detected"

**Solutions**:
- Choose option 1 to update existing installation
- Choose option 2 to install in different directory
- Uninstall previous version first: `sudo /usr/local/BurpSuiteCommunity/uninstall`

### 2. Permission Denied Errors

**Problem**: Cannot execute installer or access installation directory

**Solutions**:
```bash
# Make installer executable
chmod +x burpsuite_community.sh

# Run with sudo
sudo ./burpsuite_community.sh

# Check file permissions
ls -la burpsuite_community.sh
```

### 3. GUI Installation Issues

**Problem**: GUI installer doesn't start or display issues

**Solutions**:
```bash
# Use console mode
sudo ./burpsuite_community.sh -c

# Check if X11 forwarding is enabled (for SSH)
ssh -X username@hostname

# Install GUI dependencies if needed
sudo apt update
sudo apt install xorg
```

### 4. Download Issues

**Problem**: Download fails or corrupts

**Solutions**:
```bash
# Check internet connection
ping google.com

# Re-download with verbose output
wget -v -O burpsuite_community.sh "https://portswigger.net/burp/releases/download?product=community&type=Linux"

# Verify download integrity
ls -la burpsuite_community.sh
file burpsuite_community.sh
```

### 5. Installation Rollback

**Problem**: Installation fails and rolls back changes

**Solutions**:
- Check available disk space: `df -h`
- Ensure sufficient RAM (minimum 2GB recommended)
- Close other applications during installation
- Try installing to different directory

### 6. Java Issues

**Problem**: Java-related errors during installation or runtime

**Solutions**:
```bash
# Check Java version (installer includes JRE)
java -version

# If system Java conflicts, use bundled JRE
/usr/local/BurpSuiteCommunity/jre/bin/java -version
```

### 7. Burp Suite Won't Start

**Problem**: Application fails to launch after installation

**Solutions**:
```bash
# Check if installation directory exists
ls -la /usr/local/BurpSuiteCommunity/

# Try running from command line to see errors
/usr/local/BurpSuiteCommunity/BurpSuiteCommunity

# Check system resources
free -h
ps aux | grep -i burp
```

### 8. Uninstallation Issues

**Problem**: Cannot remove Burp Suite properly

**Solutions**:
```bash
# Use built-in uninstaller
sudo /usr/local/BurpSuiteCommunity/uninstall

# Manual removal if uninstaller fails
sudo rm -rf /usr/local/BurpSuiteCommunity/
sudo rm -f /usr/local/bin/burpsuite  # if symlink was created
```

## System Requirements Check

Before installation, verify your system meets requirements:

```bash
# Check OS version
lsb_release -a

# Check available memory
free -h

# Check disk space
df -h

# Check architecture
uname -m
```

## Getting Help

If issues persist:

1. Check PortSwigger's official documentation
2. Visit Burp Suite Community forums
3. Review installation logs in `/tmp/` directory
4. Contact PortSwigger support for complex issues

## Log Files

Installation logs are typically stored in:
- `/tmp/install4j_*.log`
- `~/.install4j/`

Check these files for detailed error messages.
