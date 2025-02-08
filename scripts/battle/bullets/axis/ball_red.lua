local AxisBallRed, super = Class(Bullet)

function AxisBallRed:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "battle/bullets/axis/ball_red")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self.destroy_on_hit = false
    self:setScale(1, 1)
end

function AxisBallRed:update()

    super.update(self)
end

return AxisBallRed