-- Load the below code into 'script editor' and save it as an application [.app] into your applications folder...you MUST also check the box "Stay open after run handler" before you save it!
-- Once you run it once, you must enable the script to have permissions under Settings->Privacy & Security->Accessibility to allow it to do the clicking

use framework "Foundation"
use scripting additions

on idle
	try
		tell application "System Events"
			if value of UI element 1 of group 1 of UI element 1 of scroll area 1 of group 1 of window "Notification Center" of application process "Notification Center" = "AIRPLAY" then
				click UI element 4 of group 1 of UI element 1 of scroll area 1 of group 1 of window "Notification Center" of application process "Notification Center"
			end if
		end tell
	end try
	return 2
end idle