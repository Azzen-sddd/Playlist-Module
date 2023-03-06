![New Project (4)|690x169](upload://nciXnDVG9ShQ4FH36rtFjFbvceU.png)

# **Reasons to use the module :**

- Music is a key to fun in games and this module is made for that.
- This module has alot of functions to help you configure your playlists.
- Easy to understand & use.

# **Setup / Installation :**

You can make your own playlists and insert your own songs and it's really easy!

**Step 1 :** Take the module ([Model](https://www.roblox.com/library/12706488843/v1-0-0-Playlist-Module)) then insert it in ReplicatedStorage or something else if you want and make a folder in the module that is going to be our playlist (name it whatever you want).
**Step 2 :** Put songs you like in the folder you just made. (You can remove the default ones of course)
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


# **Functions:**

## **:Start()**
```
function PlaylistModule:Start(PlaylistName : string?, LoopablePlaylist : boolean?, Volume : number?)
```
Starts the playlist.

**Arguments:**

- `PlaylistName : string` : The playlist folder you're looking for.
- `LoopablePlaylist : boolean?` : If you want the playlist to loop forever
- `Volume : number?` : The volume of the sounds you inserted in the playlist folder.

## **:SkipForward()**

```
function PlaylistModule:SkipForward(PlaylistName : string, allowSameSong : boolean?, Volume : number?)
```
Skips forward in the playlist.

**Arguments:**

- `PlaylistName : string` : The playlist folder you're looking for.
- `allowSameSong : boolean?` : If you want to have the same song when you skip (recommended false)
- `Volume : number?` : The volume of the sounds you inserted in the playlist folder.

## **:GetCurrentSongName()**

```
function PlaylistModule:GetCurrentSongName(returnTime : boolean?)
```
Returns current song name/time position.

**Arguments:**

- `returnTime : boolean?` : If you want to return the sound current time position aswell.

## **SkipBackwards()**

```
function PlaylistModule:SkipBackwards(Volume : number?)
```
Skips backwards in the playlist.

**Arguments:**

- `Volume: number?` : The volume of the sounds you inserted in the playlist folder.

## **PauseCurrentSong()**

```
function PlaylistModule:PauseCurrentSong()
```
Pauses the current song that is playing.

## **ResumeCurrentSong()**

```
function PlaylistModule:ResumeCurrentSong()
```
Resumes the current song that is playing.

## **AdjustCurrentSongVolume()**

```
function PlaylistModule:AdjustCurrentSongVolume(newVolume : number?, tweenVolume : boolean?, tweenTime : number?)
```

Adjusts the current song volume.

**Arguments:**

- `newVolume: number?` : The volume you want to have.
- `tweenVolume : boolean?` : If you want to tween the volume.
- `tweenTime : number?` : The time you want the tween to take when tweening.

## **LoopCurrentSong()**

```
function PlaylistModule:LoopCurrentSong()
```
Loops the current song that is playing.

## **UnLoopCurrentSong()**

```
function PlaylistModule:UnLoopCurrentSong()
```
Unloops the current song that is playing.

## **ChangeCurrentSongTimePosition()**

```
function PlaylistModule:ChangeCurrentSongTimePosition(newTimePosition : number, tweenTimePosition : boolean?, tweenTime : number?)
```

Adjusts the current song time position.

**Arguments:**

- `newTimePosition : number` : The time position you want to have.
- `tweenTimePosition : boolean?` : If you want to tween the time position.
- `tweenTime : number?` : The time you want the tween to take when tweening.

## **AssignCurrentSongSoundGroup()**

```
function PlaylistModule:AssignCurrentSongSoundGroup(soundGroup : SoundGroup)
```

Sets the current song to a sound group.

**Arguments:**

- `soundGroup : SoundGroup` : The Sound Group you want to assign it to.

## **ChangeCurrentSongPlaybackSpeed()**

```
function PlaylistModule:ChangeCurrentSongPlaybackSpeed(newPlaybackSpeed : number)	
```

Changes the current song play back speed.

**Arguments:**

- `newPlaybackSpeed : number` : The playback speed you want to assign it to.

## **ChangeCurrentSongRollOffMode()**

```
function PlaylistModule:ChangeCurrentSongRollOffMode(newRollOffMode : Enum)	
```

Changes the current song roll off mode.

**Arguments:**

- `newRollOffMode : Enum` : The rolloffmode you want to assign it to.

## **ChangeCurrentSongRollOff()**

```
function PlaylistModule:ChangeCurrentSongRollOff(rollOffMax : number, rollOffMin : number)
```

Changes the current song roll off min/max.

**Arguments:**

- `rollOffMax : number` : The rolloffmax you want to assign it to.
- `rollOffMin : number` : The rolloffmin you want to assign it to.

## **ChangeCurrentSongRollOff()**

```
function PlaylistModule:ResetAllSongsToDefaultSettings(PlaylistName : string)
```

Changes the current song roll off min/max.

**Arguments:**

- `PlaylistName : string` : The playlist name you want to reset sound settings for.



# **Source Code :**

- https://github.com/Azzen-sddd/Playlist-Module

# **Note :**

Enjoy using the module, I hope it can help you in your projects.

Let me know if you find any bugs I will fix them right away.
