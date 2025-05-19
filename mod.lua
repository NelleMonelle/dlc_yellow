function Mod:init()
    print("Loaded "..self.info.name.."!")
	self.dyn_music = {}
	self.dyn_music[1] = Music()
	self.dyn_music[2] = Music()
	self.dyn_music_name = ""
	self.dyn_music_type = 0
end

function Mod:postInit(new_file)
    if not Game:getFlag("snowdin_yellow_kills") then
        Game:setFlag("snowdin_yellow_kills", 0)
    end
    if not Game:getFlag("dunes_kills") then
        Game:setFlag("dunes_kills", 0)
    end
    if not Game:getFlag("steamworks_kills") then
        Game:setFlag("steamworks_kills", 0)
    end
    if Game:getFlag("EMPTIED_STEAMWORKS") then
        MUSIC_PITCHES["snowfall"] = 0.25
        MUSIC_PITCHES["vigorous_terrain"] = 0.25
        MUSIC_PITCHES["steamworks_overworld"] = 0.25
    elseif Game:getFlag("EMPTIED_DUNES") then
        MUSIC_PITCHES["snowfall"] = 0.25
        MUSIC_PITCHES["vigorous_terrain"] = 0.25
        MUSIC_PITCHES["steamworks_overworld"] = 0.5
    elseif Game:getFlag("EMPTIED_SNOWDIN_YELLOW") then
        MUSIC_PITCHES["snowfall"] = 0.25
        MUSIC_PITCHES["vigorous_terrain"] = 0.5
    end
end

function Mod:onMapMusic(map, music, fade_out, nextmap)
	local dynmusic = map.data and map.data.properties and map.data.properties["dynmusic"] or ""
	local dynmtype = map.data and map.data.properties and map.data.properties["dynmtype"] or 0
	local fade_out = fade_out or false
	local nextmap = nextmap or nil
	if fade_out then
		if nextmap and nextmap.music ~= self.dyn_music_name then
			if self.dyn_music[1]:isPlaying() then
				self.dyn_music[1]:fade(0, 10/30, function() self.dyn_music[1]:stop() end)
			end
			if self.dyn_music[2]:isPlaying() then
				self.dyn_music[2]:fade(0, 10/30, function() self.dyn_music[2]:stop() end)
			end
			self.dyn_music_name = ""
			self.dyn_music_type = 0
		end
		return music
	else
		if music == dynmusic and dynmtype ~= 0 then
			if self.dyn_music_type == 0 then
				if dynmusic == "oasis" then
					self.dyn_music[1]:play("oasis")
					self.dyn_music[2]:play("oasis_indoors")
				end
				self.dyn_music[1]:setVolume(0)
				self.dyn_music[2]:setVolume(0)
				self.dyn_music[dynmtype]:setVolume(1)
			else
				if dynmtype ~= self.dyn_music_type then
					self.dyn_music[dynmtype]:seek(self.dyn_music[self.dyn_music_type]:tell())
					self.dyn_music[dynmtype]:fade(1, 10/30)
					self.dyn_music[self.dyn_music_type]:fade(0, 10/30)
				end
			end
			self.dyn_music_name = dynmusic
			self.dyn_music_type = dynmtype
			return ""
		end
	end
	return music
end

function Mod:load(data, new_file)
    Game.money = Kristal.getLibConfig("magical-glass", "debug") and 1000 or 0
    Game.lw_money = Kristal.getLibConfig("magical-glass", "debug") and 1000 or 0
    MagicalGlassLib:setLightBattleShakingText(true)
    MagicalGlassLib:setCellCallsRearrangement(true)
end
