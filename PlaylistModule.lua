--[[

	PlaylistModule :
	
	- Made & Coded by @MyUsernameIsYuri
	
	Dev Post :
	
	(not made yet)
	
	Reasons you should use it :
	
	- Music is key to fun in games, this module will easily help you handle playlists easily.
	- This module has alot of functions to help you configure your playlists.
	- Easy to understand & use.
	
	Setup / Installation :
	
	You can make your own playlists and insert your own songs! You just need to make a folder inside the module and call it whatever you want, then
	you can put songs you like in the folder you just made and finally you can require the module and use the start function :
	
	local PlaylistModule = require(game.ReplicatedStorage.PlaylistModule) -- Location depends on where you put the module
	PlaylistModule:Start(YourPlaylistName, LoopPlaylist, songsVolume) -- You don't need to fill in all the arguments because the module has default 
	settings
	
	Documentation/Functions :
	
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
	
	Note :
	
	Enjoy using the module, I hope it can help you in your projects!

]]--

local PlaylistModule = {}
local currentSong
local previousSong

function PlaylistModule:Start(PlaylistName : string?, LoopablePlaylist : boolean?, Volume : number?)
	local playlistIndex = 0
	coroutine.resume(coroutine.create(function()
		if LoopablePlaylist == false or LoopablePlaylist == nil then
			repeat
				local playlistSongs
				if PlaylistName then
					playlistSongs = script[PlaylistName]:GetChildren()
				else
					playlistSongs = script["DefaultPlaylist"]:GetChildren()
				end
				local randomSong = playlistSongs[math.random(1, #playlistSongs)]
				randomSong:Play()
				previousSong = currentSong
				currentSong = randomSong
				
				if Volume then
					currentSong.Volume = Volume
				else
					currentSong.Volume = 0.5
				end

				currentSong.Ended:Wait()
				currentSong:Stop()
				playlistIndex += 1

			until playlistIndex == #script[PlaylistName]:GetChildren()
			
		elseif LoopablePlaylist == true then
			while true do
				local playlistSongs = script[PlaylistName]:GetChildren()
				local randomSong = playlistSongs[math.random(1, #playlistSongs)]
				randomSong:Play()
				previousSong = currentSong
				currentSong = randomSong
				
				if Volume then
					currentSong.Volume = Volume
				else
					currentSong.Volume = 0.5
				end
				
				currentSong.Ended:Wait()
				currentSong:Stop()
				playlistIndex += 1
			end
		end

	end))

end

function PlaylistModule:GetCurrentSongName(returnTime : boolean?)
	if returnTime == true then
		return currentSong.TimePosition, currentSong.Name
	else
		return currentSong.Name
	end
end

function PlaylistModule:SkipForward(PlaylistName : string, allowSameSong : boolean?, Volume : number?)
	previousSong = currentSong
	currentSong:Stop()

	local playlistSongs
	if PlaylistName then
		playlistSongs = script[PlaylistName]:GetChildren()
	else
		playlistSongs = script["DefaultPlaylist"]:GetChildren()
	end
	
	local randomSong
	
	if allowSameSong == true then
		randomSong = playlistSongs[math.random(1, #playlistSongs)]
	else
		repeat
			randomSong = playlistSongs[math.random(1, #playlistSongs)]
			wait()
		until randomSong.Name ~= previousSong.Name
	end
	
	randomSong:Play()
	currentSong = randomSong
	
	if Volume then
		currentSong.Volume = Volume
	else
		currentSong.Volume = 1
	end

end

function PlaylistModule:SkipBackwards(Volume : number?)
	currentSong:Stop()
	previousSong:Play()
	currentSong = previousSong
	
	if Volume then
		currentSong.Volume = Volume
	else
		currentSong.Volume = 1
	end

end

function PlaylistModule:PauseCurrentSong()
	if currentSong ~= nil then
		currentSong:Pause()
	end
end

function PlaylistModule:ResumeCurrentSong()
	if currentSong ~= nil then
		currentSong:Resume()
	end
end

function PlaylistModule:AdjustCurrentSongVolume(newVolume : number?, tweenVolume : boolean?, tweenTime : number?)
	if currentSong ~= nil then
		if tweenVolume == true then
			local VolumeTween = game:GetService("TweenService"):Create(currentSong, TweenInfo.new(tweenTime or 1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Volume = newVolume}):Play()
		else
			currentSong.Volume = newVolume
		end

	end
end

function PlaylistModule:LoopCurrentSong()
	if currentSong ~= nil then
		currentSong.Looped = true
	end
end

function PlaylistModule:UnLoopCurrentSong()
	if currentSong ~= nil then
		currentSong.Looped = false
	end
end

function PlaylistModule:ChangeCurrentSongTimePosition(newTimePosition : number, tweenTimePosition : boolean?, tweenTime : number?)
	if currentSong ~= nil then
		if tweenTimePosition == true then
			local TimePositionTween = game:GetService("TweenService"):Create(currentSong, TweenInfo.new(tweenTime or 1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {TimePosition = newTimePosition}):Play()
		else
			currentSong.TimePosition = newTimePosition
		end
		
	end
end

function PlaylistModule:ChangeCurrentSongPlaybackSpeed(newPlaybackSpeed : number)
	if currentSong ~= nil then
		currentSong.PlaybackSpeed = newPlaybackSpeed
	end
end

function PlaylistModule:ChangeCurrentSongRollOffMode(newRollOffMode : Enum)
	if currentSong ~= nil then
		currentSong.RollOffMode = newRollOffMode
	end
end

function PlaylistModule:ChangeCurrentSongRollOff(rollOffMax : number, rollOffMin : number)
	if currentSong ~= nil then
		currentSong.RollOffMaxDistance = rollOffMax
		currentSong.RollOffMinDistance = rollOffMin
	end
end

function PlaylistModule:ResetAllSongsToDefaultSettings(PlaylistName : string)
	for i, sound in pairs(script[PlaylistName]:GetChildren()) do
		sound.Looped = false
		sound.PlaybackSpeed = 1
		sound.Volume = 0.5
		sound.RollOffMaxDistance = 10000
		sound.RollOffMinDistance = 10
		sound.RollOffMode = Enum.RollOffMode.Inverse
	end
end

function PlaylistModule:AssignCurrentSongSoundGroup(soundGroup : SoundGroup)
	if currentSong ~= nil then
		currentSong.SoundGroup = soundGroup
	end
end

return PlaylistModule
