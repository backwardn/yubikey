#!/bin/bash

# Stop on error.
set -e

source env.sh

# Get some information from the user.

# 1. Real name.
realname=$($GIT config --global --default '' --get user.name)
echo "What is the real name you use on GitHub?"
read -p "Real name (press Enter to accept '$realname'): " input

if [[ -z $realname ]]
then
  if [[ -z $input ]]
  then
    echo "No name given!"
    exit 1
  else
    realname=$input
    echo "Using given input: $realname"
  fi
else
  if [[ -z $input ]]
  then
    echo "Using given user.name: $realname"
  else
    realname=$input
    echo "Using given input: $realname"
  fi
fi

realname_len=${#realname}
if [[ $realname_len -lt 5 ]]
then
  echo "Real name has $realname_len < 5 characters!"
  exit 2
fi

echo ""

# 2. Email address.
email=$($GIT config --global --default '' --get user.email)
echo "What is an email address you have registered with GitHub?"
read -p "Email (press Enter to accept '$email'): " input

if [[ -z $email ]]
then
  if [[ -z $input ]]
  then
    echo "No email given!"
    exit 3
  else
    email=$input
    echo "Using given input: $email"
  fi
else
  if [[ -z $input ]]
  then
    echo "Using given user.email: $email"
  else
    email=$input
    echo "Using given input: $email"
  fi
fi

echo ""
