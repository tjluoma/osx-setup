
####|####|####|####|####|####|####|####|####|####|####|####|####|####|####
#
# http://macadmincorner.com/configure-the-mac-os-x-firewall-with-a-script/

# firewall ON
sudo /usr/bin/defaults write /Library/Preferences/com.apple.alf globalstate -int 1
sudo /usr/bin/defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1

# firewall OFF
sudo /usr/bin/defaults write /Library/Preferences/com.apple.alf globalstate -int 0
sudo /usr/bin/defaults write /Library/Preferences/com.apple.alf stealthenabled -int 0

# use '2' for 'block all'


# If you're looking for a way to control Lion's firewall using AppleScript, I
# put together a script that does exactly that. It's up on GitHub
# (https://github.com/lhagan/Firewall-Switch) and here's the (MIT Licensed)
# code:

set getValue to do shell script "defaults read /Library/Preferences/com.apple.alf globalstate"
if getValue is less than "2" then
	display dialog "Switch firewall ON?" with icon caution
	do shell script "/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on --setblockall on" with administrator privileges
else
	display dialog "Switch firewall OFF?" with icon caution
	do shell script "/usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate off" with administrator privileges
end if

# Based on an article by Charles Edge (http://krypted.com/mac-os-x/the-os-x-application-layer-firewall-part-3-lion/)
# and a comment by 'dsanfili' (http://hints.macworld.com/article.php?story=20090217124731597).

# source: <http://hints.macworld.com/article.php?story=20090217124731597>

####|####|####|####|####|####|####|####|####|####|####|####|####|####|####