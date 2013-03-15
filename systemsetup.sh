#!/bin/zsh -f
# systemsetup and scutil
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2013-03-14

NAME="$0:t"

# this is where '_log' is defined
[[ -e "source.zsh" ]] && source "source.zsh"

###########################################################################

COMPUTERNAME=$(systemsetup -getcomputername | sed 's#Computer Name: ##g')

echo -n "$NAME: Enter new computername (currently: $COMPUTERNAME) [press 'Enter' to skip] "
	read NEWCOMPNAME

if [ "$NEWCOMPNAME" != "" ]
then
		_log systemsetup -setcomputername 	"$NEWCOMPNAME"
		_log scutil 		--set HostName  	"$NEWCOMPNAME"
		_log scutil 		--set ComputerName	"$NEWCOMPNAME"
		_log scutil 		--set LocalHostName	"$NEWCOMPNAME"
fi

###########################################################################

	# set time zone
_log systemsetup -settimezone "America/New_York"

	# This enables sshd
_log systemsetup -setremotelogin on

	# wake on network
_log systemsetup -setwakeonnetworkaccess on

	# restart on freeze
_log systemsetup -setrestartfreeze on

	# restart after a power failure
_log systemsetup -setrestartpowerfailure on

	# set display to sleep after 10 minutes
_log systemsetup -setdisplaysleep 10

	# Let the power button be used to sleep computer
_log systemsetup -setallowpowerbuttontosleepcomputer on

[[ "$ERRORS" == "" ]] && exit 0

COUNT="${#ERRORS[@]}"

if [ "$COUNT" = "1" ]
then

	echo "\n\n$NAME: Finished, with $COUNT error:\n$ERRORS"

else

	echo "\n\n$NAME: Finished, with $COUNT errors:\n$ERRORS"
fi


exit 1

#
#EOF
