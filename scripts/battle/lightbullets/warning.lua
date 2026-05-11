local Warning, super = Class(LightBullet)

function Warning:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "battle/bullets/warning_exclamation_mark")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self.collider = nil
	
	self.tp = 0
    self.destroy_on_hit = false
    self.sprite:play(1/30, false, function() self:remove() end)
    self:setScale(1, 1)
end

function Warning:onCollide(soul) end

function Warning:update()

    super.update(self)
end

return Warning