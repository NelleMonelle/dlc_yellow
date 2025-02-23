function Mod:init()
    print("Loaded "..self.info.name.."!")
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

function Mod:load(data, new_file)
    Game.money = Kristal.getLibConfig("magical-glass", "debug") and 1000 or 0
    Game.lw_money = Kristal.getLibConfig("magical-glass", "debug") and 1000 or 0
    MagicalGlassLib:setLightBattleShakingText(true)
    MagicalGlassLib:setCellCallsRearrangement(true)
end
