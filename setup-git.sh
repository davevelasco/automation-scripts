#!/bin/bash

# Enter name and email
echo Setting up Git..

echo -n "Enter full name (ex:John Doe) : "
read fullname
echo -n "Enter email : "
read email

git config --global user.name "$fullname"
git config --global user.email "$email"
