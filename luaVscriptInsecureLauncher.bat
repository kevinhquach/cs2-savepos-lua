@echo off
:: !! Update vscriptEnabledFile to point to where your lua-enabled vscript.dll is for this to work !!
:: Make sure to change cs2VscriptDir if you have cs2 installed elsewhere
set "vscriptEnabledFile=C:\PATH\TO\PATCHED-VSCRIPT.dll"
set "cs2VscriptDir=C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\bin\win64"

if not exist %vscriptEnabledFile% (
	echo Lua-enabled vscript.dll not found at %vscriptEnabledFile%
	pause
) else (
	if not exist %cs2VscriptDir% (
		echo CS2 installation not found at %cs2VscriptDir%
		pause
	) else (
		:: Assumes that the vscript.dll file to start with is the one that comes from the game
		REN "%cs2VscriptDir%\vscript.dll" vscript-clean.dll
		MOVE %vscriptEnabledFile% "%cs2VscriptDir%\vscript.dll"

		:: This method of launching the game may not work at some point in the future, making a shortcut to steam games sometimes needs something like steam://rungameid/(app id)
		start /W /d %cs2VscriptDir% cs2.exe -insecure

		:: Make sure not to close the cmd window before you close the game, or else you will need to replace the vscript.dll files manually
		MOVE "%cs2VscriptDir%\vscript.dll" %vscriptEnabledFile%
		REN "%cs2VscriptDir%\vscript-clean.dll" vscript.dll
	)
)

:: If you are in doubt about which vscript.dll is unmodified and can be used safely, delete vscript.dll and verify cs2's game files from steam