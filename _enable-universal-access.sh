#!/bin/zsh -f

## START enable universal access

UNIVERSAL_ACCESS="/private/var/db/.AccessibilityAPIEnabled"

if [ ! -f "$UNIVERSAL_ACCESS" ]
then

	echo -n "a" > /tmp/a

	msg "Enabling Universal Access (needs root)"
	sudo mv -fv /tmp/a "$UNIVERSAL_ACCESS"

fi

exit 0
## END enable universal access
