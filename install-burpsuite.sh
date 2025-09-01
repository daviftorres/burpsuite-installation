#!/bin/bash

# Burp Suite Community Edition Installation Script
# Author: abhi-mag21
# Date: September 2025

set -e

echo "=== Burp Suite Community Edition Installation Script ==="
echo

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   echo "This script should not be run as root directly."
   echo "It will prompt for sudo when needed."
   exit 1
fi

# Check internet connectivity
echo "Checking internet connectivity..."
if ! ping -c 1 google.com &> /dev/null; then
    echo "Error: No internet connection detected."
    exit 1
fi
echo "✓ Internet connection verified"

# Download Burp Suite Community Edition
echo "Downloading Burp Suite Community Edition..."
wget -O burpsuite_community.sh "https://portswigger.net/burp/releases/download?product=community&type=Linux"
echo "✓ Download completed"

# Make installer executable
echo "Making installer executable..."
chmod +x burpsuite_community.sh
echo "✓ Permissions set"

# Run installer
echo "Starting installation..."
echo "Note: The installer will open in GUI mode. Follow the on-screen instructions."
echo "For console mode, you can run: sudo ./burpsuite_community.sh -c"
echo

sudo ./burpsuite_community.sh

# Verify installation
echo
echo "Verifying installation..."
if [ -d "/usr/local/BurpSuiteCommunity" ]; then
    echo "✓ Burp Suite Community Edition installed successfully!"
    echo "Installation location: /usr/local/BurpSuiteCommunity/"
    echo
    echo "To run Burp Suite:"
    echo "/usr/local/BurpSuiteCommunity/BurpSuiteCommunity"
    echo
    echo "Or create a symbolic link:"
    echo "sudo ln -s /usr/local/BurpSuiteCommunity/BurpSuiteCommunity /usr/local/bin/burpsuite"
else
    echo "✗ Installation verification failed. Please check the installation manually."
    exit 1
fi

# Clean up
echo "Cleaning up..."
rm -f burpsuite_community.sh
echo "✓ Cleanup completed"

echo
echo "=== Installation Complete ==="
