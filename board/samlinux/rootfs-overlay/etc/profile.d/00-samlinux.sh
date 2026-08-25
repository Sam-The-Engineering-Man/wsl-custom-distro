#!/bin/bash

# Only apply customization to interactive shells.
case "$-" in
    *i*) ;;
    *) return ;;
esac

# SamLinux banner
printf '\e[34m'
cat /etc/motd
printf '\e[0m'

# Prompt:
# blue [user@hostname]
# purple working directory
# green $ or #
PS1='\[\e[34m\][\u@\h]\[\e[35m\]\w\[\e[32m\]\$\[\e[0m\] '
export PS1
