#!/bin/bash

# Update the list of packages
apt-get update

# Install pre-requisite packages.
apt-get install -y wget

# Get the version of Debian
source /etc/os-release

# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/debian/$VERSION_ID/packages-microsoft-prod.deb

# Register the Microsoft repository GPG keys
dpkg -i packages-microsoft-prod.deb

# Delete the Microsoft repository GPG keys file
rm packages-microsoft-prod.deb

# Update the list of packages after we added packages.microsoft.com
apt-get update

# Install PowerShell
apt-get install -y powershell

# Prep for fips 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules 140-2 openssl cryptographic modules install
apt-get install -y gcc
apt-get install -y make

# Deal with the fips install business...
wget https://www.openssl.org/source/openssl-3.0.8.tar.gz
tar -xf openssl-3.0.8.tar.gz
cd openssl-3.0.8
./Configure enable-fips
make


