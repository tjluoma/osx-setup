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

_exit

#
#EOF
