# Remove Dropbox’s green checkmark icons in Finder.app
file=/Applications/Dropbox.app/Contents/Resources/check.icns
[ -e "$file" ] && mv -f "$file" "$file.bak"
unset file
