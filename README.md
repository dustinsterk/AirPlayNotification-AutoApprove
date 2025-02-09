This .app / script works with the latest version of MacOS Sequoia (and the last Sonoma and older versions) and will automatically click the AirPlay notification you recieve when you cast audio to your macbook/device.  You must ensure your AirPlay receiver is **Enabled** in System Settings as well as the Allow Airplay setting from "**Anyone on the same network**".

Download the .app file and place it in your "Applications" folder in Finder.  Once it is executed, you must enable the script to have permissions under **Settings->Privacy & Security->Accessibility** to allow it to do the "clicking" of the notification.  Please note that if you upgrade or change the script in any way, you must remove this permission and then re-enable it once the script is opened again.

If you do not use the drag and drop solution (.app file provided), you can load the code into "script editor" and save it as an application [.app] into your applications folder...you **MUST** also check the box "Stay open after run handler" before you save it!  Finally, do not forget to enable the permissions in Settings as described above.

You may also review the code (same as below) if you open the downloaded .app file in the "script editor" application.  Once it is packaged as an .app, it is saved as binary and cannot be opend with a simple text editor.

**For MacOS Monterey 12.5 you can use the following code (shared by Interesting_Worry457 at Reddit)**
```
use framework "Foundation"
use scripting additions
on run
    repeat
        try
            tell application "System Events"
                tell application process "NotificationCenter"
                    repeat with aGroup in (groups of UI element 1 of scroll area 1 of window "Notification Center")
                        try
                            set notifText to value of static text 1 of aGroup
                            if notifText contains "AirPlay" then
                                repeat with aButton in (buttons of aGroup)
                                    if name of aButton is "Accept" then --If your system is in another language, replace "Accept" with the correct translation of the word.
                                        click aButton
                                        exit repeat
                                    end if
                                end repeat
                                exit repeat
                            end if
                        end try
                    end repeat
                end tell
            end tell
        end try
        delay 2
    end repeat
end run
```

**For MacOS Ventura 13.0 you can use the following code (shared by Interesting_Worry457 at Reddit)**
```
use framework "Foundation"
use scripting additions

on run
	repeat
		try
			tell application "System Events"
				tell application process "NotificationCenter"
					if exists (window "Notification Center") then
						tell window "Notification Center"
							tell group 1
								tell scroll area 1
									tell UI element 1
										tell group 1
											if (exists static text "AIRPLAY") then
												click button 2
											end if
										end tell
									end tell
								end tell
							end tell
						end tell
					end if
				end tell
			end tell
		end try
		delay 2
	end repeat
end run
```


***For MacOS Sonoma 14.7, use the 'Auto-Approve AirPlay_Sonoma_14.7.app' file if you want a drag and drop solution***
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



***For MacOS Sequoia 15.0, use the 'Auto-Approve AirPlay_Sequoia_15.0.app' file if you want a drag and drop solution***
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

***For MacOS Sequoia 15.2 and 15.3, use the 'Auto-Approve AirPlay_Sequoia_15.2.app' file if you want to a drag and drop solution -- both 'if' statement checks below should work but I personally like searching for the "AIRPLAY" title in the notification.***
```
use framework "Foundation"
use scripting additions

on idle
	try
		tell application "System Events" to tell application process "NotificationCenter"
			try
				if (value of static text 1 of group 1 of scroll area 1 of group 1 of group 1 of window "Notification Center") = "AIRPLAY" then
					--if (count (actions of button 2 of group 1 of scroll area 1 of group 1 of group 1 of window "Notification Center" whose name contains "AXPress")) is 1 then
					perform (action 2 of button 2 of group 1 of scroll area 1 of group 1 of group 1 of window "Notification Center")
				end if
			end try
		end tell
	end try
	return 2
end idle
```
