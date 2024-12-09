local Garbage, super = Class(Bullet)

function Garbage:init(x, y, dir, speed)
    local sprite = Utils.pick({
        "battle/bullets/jandroid/garbage_1",
        "battle/bullets/jandroid/garbage_2",
        "battle/bullets/jandroid/garbage_3"
    })
    super.init(self, x, y, sprite)

    self:setScale(1, 1)

    self.physics.direction = dir
    self.physics.speed = speed
end

function Garbage:update()

    super.update(self)
end

return Garbage