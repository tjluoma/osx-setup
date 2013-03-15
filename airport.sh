#!/bin/zsh -f
# link `airport` utility  to $DIR
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2013-03-14

NAME="$0:t"

AIRPORT="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

if [ -x "$AIRPORT" ]
then
		DIR=/usr/local/bin/

		TARGET="$DIR/airport"

		if [ -e "$TARGET" ]
		then
				echo "$NAME: airport already exists in $DIR"
				exit 0
		else

				# This will create it if needed
			mkdir -p $DIR

			ln -s "$AIRPORT" $DIRairport && echo "$NAME: Linked 'airport' to /usr/local/bin" && exit 0

			echo "$NAME: failed to link airport to $DIR"

			exit 1

		fi
else
		echo "$NAME: airport not found at $AIRPORT"

		exit 1
fi

exit 0

#
#EOF
