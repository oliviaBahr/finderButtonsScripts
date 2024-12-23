finderPath=$(osascript -e 'tell application "Finder" to get the POSIX path of (target of front window as alias)')
open -n -a "Cursor" --args "$finderPath"
