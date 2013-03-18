#!/bin/zsh -f
# set computer name
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2013-03-15
#
# ComputerName is the so-called “user-friendly” name for the Mac, it’s what will show up on the Mac
# itself and what will be visible to others when connecting to it over a local network. This is also
# what’s visible under the Sharing preference panel.
#
# HostName is the name assigned to the computer as visible from the command line, and it’s also used
# by local and remote networks when connecting through SSH and Remote Login.
#
# LocalHostName is the name identifier used by Bonjour and visible through file sharing services
# like AirDrop
#
# source:
# http://osxdaily.com/2012/10/24/set-the-hostname-computer-name-and-bonjour-name-separately-in-os-x/

#
#	NOTE: 	if this is not run as root, `scutil` will prompt the
#			user for their password via the OS X GUI, not the command line.
#

NAME="$0:t"

# this is where '_log' is defined
[[ -e "source.zsh" ]] && source "source.zsh"

FULL_HOST_NAME=$(scutil --get HostName)

echo -n "$NAME: Set FULL_HOST_NAME (press 'Enter' to keep: $FULL_HOST_NAME): "

read NEW_FULL_HOST_NAME

[[ "$NEW_FULL_HOST_NAME" != "" ]] &&  _log scutil --set HostName "$NEW_FULL_HOST_NAME"

####|####|####|####|####|####|####|####|####|####|####|####|####|####|####

COMPUTER_NAME=$(scutil --get ComputerName)

LOCAL_HOST_NAME=$(scutil --get LocalHostName)

if [[ "$LOCAL_HOST_NAME" == "$COMPUTER_NAME" ]]
then
		echo -n "$NAME: set ComputerName/LocalHostName [press 'Enter' to keep: $COMPUTER_NAME]: "
		read NEW_COMPUTER_NAME

		[[ "$NEW_COMPUTER_NAME" != "" ]] && _log scutil --set ComputerName	"$NEW_COMPUTER_NAME"
		[[ "$NEW_COMPUTER_NAME" != "" ]] && _log scutil --set LocalHostName	"$NEW_COMPUTER_NAME"

else

		echo -n "$NAME: set ComputerName [press 'Enter' to keep: $COMPUTER_NAME]: "
		read NEW_COMPUTER_NAME
		[[ "$NEW_COMPUTER_NAME" != "" ]] && _log scutil --set ComputerName	"$NEW_COMPUTER_NAME"

		echo -n "$NAME: set LocalHostName [press 'Enter' to keep: $LOCAL_HOST_NAME]: "
		read NEW_LOCAL_HOST_NAME
		[[ "$NEW_LOCAL_HOST_NAME" != "" ]] && _log scutil --set LocalHostName "$NEW_LOCAL_HOST_NAME"

fi

####|####|####|####|####|####|####|####|####|####|####|####|####|####|####

exit 0


# this is the same as 'scutil --set ComputerName'
# _log systemsetup -setcomputername 	"$NEW_COMPUTER_NAME"

#
#EOF
