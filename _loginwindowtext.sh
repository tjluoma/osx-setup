#!/bin/zsh -f
# set loginwindow text
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2013-03-15

NAME="$0:t"

####|####|####|####|####|####|####|####|####|####|####|####|####|####|####
#
#
echo -n "LoginwindowText: Name? "
read LWTNAME

echo -n "LoginwindowText: Phone? (i.e. 555-789-4567) "
read LWTPHONE

LWTPHONE=$(echo $LWTPHONE | tr -c '[0-9]-\n' ' ')

echo -n "LoginwindowText: Email? "
read LWTEMAIL

LOGIN_WINDOW_TEXT="This computer belongs to $LWTNAME.\\nIf found, please call $LWTPHONE or email $LWTEMAIL\\nThank You\!"

sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "${LOGIN_WINDOW_TEXT}"

echo "\n\n$NAME: Here's what it looks like: \n\n"

sudo defaults read /Library/Preferences/com.apple.loginwindow LoginwindowText


sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName



#
#
####|####|####|####|####|####|####|####|####|####|####|####|####|####|####

exit 0

#
#EOF
