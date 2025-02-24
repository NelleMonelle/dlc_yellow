local Dunebud, super = Class(LightEncounter)

function Dunebud:init()
    super:init(self)

    self.text = "* Dunebud popped out of the sand!"

    if Game:getFlag("dunes_kills") >= 13 then
        local enemies_left = 20 - Game:getFlag("dunes_kills")
        local mus_pitch = 1
        if enemies_left > 0 then
            mus_pitch = (enemies_left / 7)
        end
        MUSIC_PITCHES["genobattle_yellow"] = mus_pitch
        self.music = "genobattle_yellow"
    else
        self.music = "prebattle3_yellow"
    end

    self:addEnemy("dunebud")

    self.background_color = {1, 204/255, 0}

    self.can_flee = false

    self.kill_count = 0

end

return Dunebud