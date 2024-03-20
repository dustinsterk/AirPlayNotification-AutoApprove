This .app / script works with the latest version of MacOS Sonoma and will automatically click the AirPlay notification you get when you try to cast audio to you macbook.  You must also ensure your AirPlay receiver is **Enabled** in Settings as well as the setting Allow Airplay from "**Anyone on the same network**".

Download the .app file and place it in your "Applications" folder in Finder.  Once you run it once, you must enable the script to have permissions under **Settings->Privacy & Security->Accessibility** to allow it to do the "clicking".


If you want the raw code you can load the below code into "script editor" and save it as an application [.app] into your applications folder...you **MUST** also check the box "Stay open after run handler" before you save it!  Don't forget to enable the permissions in Settings as described above.

```
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
```

