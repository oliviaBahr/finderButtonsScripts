-- function to check if iTerm has open windows
on has_windows()
	if not application "iTerm" is running then return false
	
	tell application "iTerm"
		if windows is {} then return false
		if tabs of current window is {} then return false
		if sessions of current tab of current window is {} then return false
		
		set session_text to contents of current session of current tab of current window
		if words of session_text is {} then return false
	end tell
	
	true
end has_windows


-- main
on run
	tell application "Finder" to set currDir to POSIX path of (insertion location as alias)
	
	if not has_windows() then
		-- make new window if running but no windows
		if application "iTerm" is running then tell application "iTerm" to create window with default profile
		tell application "iTerm" to activate
		
		-- wait until a window is created before moving on
		repeat while not has_windows()
			delay 0.01
		end repeat
	end if
	
	-- actually do the thing
	tell application "iTerm" to tell the first window to tell current session to write text "cd " & currDir & "; clear"
	tell application "iTerm" to activate
end run