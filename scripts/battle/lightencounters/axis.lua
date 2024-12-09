local Axis, super = Class(LightEncounter)

function Axis:init()
    super:init(self)

    self.text = "* Axis Model 014, ready to\nattack!"

    self.music = "guns_blazing"

    self:addEnemy("axis")

    self.bg_siners = {0, 15, 30, 45, 60, 75}

    self.offset = 0

    self.can_flee = false

end

function Axis:update()
    super.update(self)
    for i = 1, #self.bg_siners do
        self.bg_siners[i] = self.bg_siners[i] + DTMULT *2
    end
end

function Axis:drawBackground()
    local offset = 0
    for i = 1, 6 do
        local sine = (math.sin(self.bg_siners[i] / 14) * 28) + 12
        Draw.setColor(0, 0.5, 0)
        love.graphics.setLineWidth(1)
        love.graphics.rectangle("line", 18 + offset, sine, 101, 118)
        love.graphics.rectangle("line", 18 + offset, sine + 118, 101, 118)
        offset = offset + 101
    end
end

return Axis