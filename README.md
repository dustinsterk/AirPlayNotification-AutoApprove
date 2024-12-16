This .app / script works with the latest version of MacOS Sonoma and will automatically click the AirPlay notification you get when you try to cast audio to you macbook.  You must also ensure your AirPlay receiver is **Enabled** in Settings as well as the setting Allow Airplay from "**Anyone on the same network**".

Download the .app file and place it in your "Applications" folder in Finder.  Once you run it once, you must enable the script to have permissions under **Settings->Privacy & Security->Accessibility** to allow it to do the "clicking".

If you want the raw code you can load the below code into "script editor" and save it as an application [.app] into your applications folder...you **MUST** also check the box "Stay open after run handler" before you save it!  Don't forget to enable the permissions in Settings as described above.

You can also look at the code (same as below) if you open the downloaded .app file in the same "script editor" application.  Once it is packaged as an .app it is saved as binary.

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



***For MacOS Sequoia 15.0, use the 'Auto-Approve AirPlay_Sequoia.app' file if you want a drag and drop solution***
```
use framework "Foundation"
use scripting additions

on idle
	try
		tell application "System Events" to tell application process "NotificationCenter"
			try
				perform (actions of UI elements of UI element 1 of scroll area 1 of group 1 of group 1 of window "Notification Center" of application process "NotificationCenter" of application "System Events" whose name starts with "Name:Accept")
			end try
		end tell
	end try
	return 2
end idle
```

***For MacOS Sequoia 15.1, use the 'Auto-Approve AirPlay_Sequoia_15.1.app' file if you want a drag and drop solution***
```
use framework "Foundation"
use scripting additions

on idle
	try
		tell application "System Events" to tell application process "NotificationCenter"
			try
				-- Apple Script has hidden reading the values of 'AXAttributedDescription' which contains the 'AIRPLAY' title, so count the number of actions in the notification where it has the 'accept' button and then click it which is action 5.
				if (count (actions of button 1 of scroll area 1 of group 1 of group 1 of window "Notification Center" whose name contains "Name:Accept")) is 1 then
					perform (action 5 of button 1 of scroll area 1 of group 1 of group 1 of window "Notification Center")
				end if
			end try
		end tell
	end try
	return 2
end idle
```

***For MacOS Squoia 15.2, use the 'Auto-Approve AirPlay_Sequoia_15.2.app' file if you want to a drag and drop solution***
```
use framework "Foundation"
use scripting additions

on idle
	try
		tell application "System Events" to tell application process "NotificationCenter"
			try
				if (count (actions of button 2 of group 1 of scroll area 1 of group 1 of group 1 of window "Notification Center" whose name contains "AXPress")) is 1 then
					perform (action 2 of button 2 of group 1 of scroll area 1 of group 1 of group 1 of window "Notification Center")
				end if
			end try
		end tell
	end try
	return 2
end idle
```
