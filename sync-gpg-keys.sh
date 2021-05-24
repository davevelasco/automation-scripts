#!/bin/sh

# Check for existing gpg keys
echo "Checking for existing GPG keys.."
gpg --list-secret-keys --keyid-format LONG

# Clone gpg repository
echo -n "Input private GPG key git repository : "
read git_repo

git clone $git_repo

echo -n "Input cloned folder name : "
read folder

echo "Files inside $folder:"
ls -1 $folder

# Input keys
# private
echo -n "Input private key filename (default: private.asc): "
read private_key

if [ -z $private_key ]; then
  private_key="private.asc"
fi

#public
echo -n "Input public key filename (default: public.asc): "
read public_key

if [ -z $public_key ]; then
  public_key="public.asc"
fi

#trust
echo -n "Input trust key filename (default: trust.asc): "
read trust_key

if [ -z $trust_key ]; then
  trust_key="trust.asc"
fi

gpg --import <  "$folder/$private_key"
gpg --import <  "$folder/$public_key"
gpg --import-ownertrust < "$folder/$trust_key"

# Print GPG key list
echo "List of GPG keys: "
gpg --list-secret-keys --keyid-format LONG

# GPG Signing
echo "Setting up GPG signing"
echo -n "Enter GPG key ID : "
read gpgkey
git config --global user.signingKey $gpgkey
git config --global commit.gpgSign true
