tell application "Finder" to set folderPath to POSIX path of (target of front window as alias)

tell application "Terminal"
	activate
	do script "cd " & quoted form of folderPath
end tell