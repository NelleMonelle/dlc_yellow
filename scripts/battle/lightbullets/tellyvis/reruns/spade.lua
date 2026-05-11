local RerunSpade, super = Class(LightBullet)

function RerunSpade:init(x, y, dir)
    super.init(self, x, y, "battle/bullets/tellyvis/reruns/spade")

	self:setScale(1, 1)
	self.alpha = 0
	self:fadeTo(1, 0.2)
    self.rotation = dir
    self.physics.speed = 5
	self.physics.friction = -0.1
	self.physics.match_rotation = true
end

return RerunSpade