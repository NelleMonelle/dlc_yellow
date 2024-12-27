function Mod:init()
    print("Loaded "..self.info.name.."!")
end

function Mod:load(data, new_file)
    Game.money = Kristal.getLibConfig("magical-glass", "debug") and 1000 or 0
    Game.lw_money = Kristal.getLibConfig("magical-glass", "debug") and 1000 or 0
    MagicalGlassLib:setLightBattleShakingText(true)
    MagicalGlassLib:setCellCallsRearrangement(true)
end
