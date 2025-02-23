local Frostermit, super = Class(LightEncounter)

function Frostermit:init()
    super:init(self)

    self.text = "* There is an igloo here."

    if Game:getFlag("snowdin_yellow_kills") >= 13 then
        local enemies_left = 20 - Game:getFlag("snowdin_yellow_kills")
        local mus_pitch
        if enemies_left <= 0 then
            mus_pitch = 1
        else
            mus_pitch = (enemies_left / 7)
        end
        MUSIC_PITCHES["genobattle_yellow"] = mus_pitch
        self.music = "genobattle_yellow"
    else
        self.music = "battle_snowdin"
    end

    self:addEnemy("frostermit")

    self.background_color = {0, 198/255, 1}

    self.can_flee = false

    self.kill_count = 0

end

return Frostermit