#!/bin/bash

DEFAULT_UID=1000

echo
echo "Welcome to SamLinux!"
echo
echo "Let's create your default user."
echo

while true; do
    read -rp "Enter a username: " username

    if [ -z "$username" ]; then
        echo "Username cannot be empty."
        continue
    fi

    if id "$username" >/dev/null 2>&1; then
        echo "That user already exists."
        continue
    fi

    if adduser \
        -u "$DEFAULT_UID" \
        -h "/home/$username" \
        -s /bin/bash \
        -D \
        "$username"
    then
        break
    fi

    echo "Unable to create that username. Try another."
done

# Give the new user administrative privileges.
addgroup "$username" sudo
addgroup "$username" wheel

# Set the user's password
while true; do
    echo
    echo "Set a password for $username:"

    if passwd "$username"; then
        break
    fi

    echo
    echo "Password was not set."
    echo "Please try again."
done

echo
echo "SamLinux setup complete!"
echo "Your user '$username' can use sudo for administrative commands."
echo
