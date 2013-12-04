# Remove Dropbox’s green checkmark icons in Finder.app

file='/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns'

[ -e "$file" ] && mv -f "$file" "$file.bak"
unset file

# note: This file used to be
# file=/Applications/Dropbox.app/Contents/Resources/check.icns
