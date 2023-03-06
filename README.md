# **Reasons to use the module :**

- Music is a key to fun in games and this module is made for that.
- This module has alot of functions to help you configure your playlists.
- Easy to understand & use.

# **Setup / Installation :**

You can make your own playlists and insert your own songs and it's really easy!

**Step 1 :** Take the module ([Model](https://www.roblox.com/library/12706488843/v1-0-0-Playlist-Module)) then insert it in ReplicatedStorage or something else if you want and make a folder in the module that is going to be a playlist (name it whatever you want).
**Step 2 :** Put songs you like in the folder you just made.
**Step 3 :** Finally you can require the module and use the **:Start()** function :
	
```
local PlaylistModule = require(game.ReplicatedStorage.PlaylistModule) -- Location depends on where you put the module

PlaylistModule:Start(YourPlaylistName, LoopPlaylist, songsVolume) -- You don't need to fill in all the arguments because the module has default settings
```
 # **Template Script :**

```
local PlaylistModule = require(game.ReplicatedStorage.PlaylistModule) -- Location depends on where you put the module
PlaylistModule:Start("TestPlaylist", false, 0.5) -- You don't need to fill in all the arguments because the module has default settings
```


# **Documentation/Features:**

- PlaylistModule:Start(PlaylistName : string?, LoopablePlaylist : boolean?, Volume : number?)

- PlaylistModule:SkipForward(PlaylistName : string, allowSameSong : boolean?, Volume : number?)

- PlaylistModule:GetCurrentSongName(returnTime : boolean?)

- PlaylistModule:SkipBackwards(Volume : number?)

- PlaylistModule:PauseCurrentSong()

- PlaylistModule:ResumeCurrentSong()

- PlaylistModule:AdjustCurrentSongVolume(newVolume : number?, tweenVolume : boolean?, tweenTime : number?)

- PlaylistModule:LoopCurrentSong()

- PlaylistModule:UnLoopCurrentSong()

- PlaylistModule:ChangeCurrentSongTimePosition(newTimePosition : number, tweenTimePosition : boolean?, tweenTime : number?)

- PlaylistModule:AssignCurrentSongSoundGroup(soundGroup : SoundGroup)

- PlaylistModule:ChangeCurrentSongPlaybackSpeed(newPlaybackSpeed : number)	

- PlaylistModule:ChangeCurrentSongRollOffMode(newRollOffMode : Enum)

- PlaylistModule:ChangeCurrentSongRollOff(rollOffMax : number, rollOffMin : number)

- PlaylistModule:ResetAllSongsToDefaultSettings(PlaylistName : string)

# **Note :**

Enjoy using the module, I hope it can help you in your projects.

Let me know if you find any bugs I will fix them right away.

