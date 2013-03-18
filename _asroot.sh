#!/bin/zsh -f

NAME="$0:t"

## START enable universal access

if [ "$EUID" != "0" ]
then
	echo "$0 must be run as root, re-running via 'sudo'"
	exec sudo "$0"
fi

# this is where '_log' is defined
[[ -e "source.zsh" ]] && source "source.zsh"

UNIVERSAL_ACCESS="/private/var/db/.AccessibilityAPIEnabled"

if [ -f "$UNIVERSAL_ACCESS" ]
then

		echo "	$NAME: Universal Access file found at $UNIVERSAL_ACCESS"
else

		_log echo -n "a" > "$UNIVERSAL_ACCESS"

fi


_log /usr/sbin/nvram SystemAudioVolume=%80﻿	# prevent OS X boot chime

_log /usr/bin/pmset -c sleep 0		# no sleep when plugged in (computer, not monitor)
_log /usr/bin/pmset -b sleep 10		# 10 minutes until sleep when on battery
_log /usr/bin/pmset displaysleep 10	# put screen to sleep after 10 minutes
_log /usr/bin/pmset autorestart 1	# auto-restart after power loss

# This one seems to be outdated in 10.8:

# _log /usr/bin/pmset panicrestart 10	# restart 10 seconds after a panic


exit 0
# EOF