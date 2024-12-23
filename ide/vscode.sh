finderPath=`osascript -e 'tell application "Finder" to get the POSIX path of (target of front window as alias)'`
open -n -a "Visual Studio Code" --args "$finderPath"