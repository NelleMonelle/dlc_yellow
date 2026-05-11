local RerunClubsBlack, super = Class(LightBullet)

function RerunClubsBlack:init(x, y)
    super.init(self, x, y, "battle/bullets/tellyvis/reruns/clubs_black")
	self:setScale(1, 1)
	self.physics.speed = 20
	self.physics.friction = 1
	self.physics.match_rotation = true
end

function RerunClubsBlack:update()
	super.update(self)
end

return RerunClubsBlack