#!/bin/bash

read -p "This script will update your installed packages using Yum. Do you want to proceed? [y/n] " proceed

if [ "$proceed" == "y" ]; then
    # Update package list
    echo "Updating package list..."
    sudo yum check-update

    # Upgrade packages
    echo "Upgrading packages..."
    sudo yum update -y

    # Clean up
    echo "Cleaning up..."
    sudo yum clean all

    # Ask user if they want to restart
    read -p "Packages have been updated. Do you want to restart your computer now? [y/n] " restart
    if [ "$restart" == "y" ]; then
        sudo shutdown -r now
    fi
else
    echo "Update cancelled."
fi