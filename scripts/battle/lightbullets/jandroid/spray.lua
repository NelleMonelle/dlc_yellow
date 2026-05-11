local Spray, super = Class(LightBullet)

function Spray:init(x, y, dir)
    super.init(self, x, y, "battle/bullets/jandroid/spray")
	self.sprite:play(3/30, true)
    self:setScale(1, 1)
    self.physics.direction = dir
    self.physics.speed = 8
	self.disappearing = false
end

function Spray:update()
	self.physics.speed = Utils.lerp(self.physics.speed, 0, 0.05*DTMULT)
	if self.physics.speed < 2 and self.disappearing == false then
		self.disappearing = true
		self:setSprite("battle/bullets/jandroid/spray_disappear")
		self.sprite:play(3/30, false, (function() self:remove() end))
	end
    super.update(self)
end

return Spray