#!/bin/zsh
# add PATH to /etc/launchd.conf
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2013-03-14

NAME="$0:t"

FILE=/etc/launchd.conf

	# if there's already a PATH line in the file, then exit
fgrep -q 'setenv PATH ' "$FILE" && exit 0

if [[ -e "$FILE" ]]
then

		setenv PATH "$PATH"

else


fi

exit 0

#
#EOF
