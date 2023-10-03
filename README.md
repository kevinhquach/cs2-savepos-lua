# cs2-savepos-lua
Enables saving and loading multiple positions in CS2.
Note that this requires the usage of a lua-enabled vscript.dll, which may become unsupported.

**This requires the modification of dynamic link libraries, which may trigger VAC bans, continue at your own risk.**

Consider setting up a server running with the -insecure flag, rather than using a modified vscript.dll on your own account.

# Installation
1. Replace the original `vscript.dll` in `Counter-Strike Global Offensive\game\bin\win64` with a lua-enabled `vscript.dll`, such as from https://github.com/bklol/vscriptPatch
    * **This modifies dynamic link libraries.** If you intend to play on VAC-secured servers, keep the original vscript.dll to replace the modified file. If in doubt as to whether the vscript.dll file is modified, delete it and verify CS2's game files' integrity from steam.
    * Using the -insecure launch option is **highly recommended** when using modified binaries, preventing you from accidentally connecting to VAC-secured servers.
2. Place `savepos.lua` in `Counter-Strike Global Offensive\game\csgo\scripts\vscripts`

# Usage
In console, enter `sv_cheats 1; script_reload_code savepos` to enable the vscript.

The `savepos <index>` command saves your current location to the specified index (number or string). These positions are not saved across multiple sessions.

The `loadpos <index>` command teleports you to the location saved to the specified index.

The `lastpos` command teleports you to the last location you were at before teleporting.

# Example
https://github.com/kevinhquach/cs2-savepos-lua/assets/8755691/68aca612-6a9b-4a4d-b25b-f7982e9db9fc
