local RerunClubsBall, super = Class(LightBullet)

function RerunClubsBall:init(x, y, dir, rotdir, type)
    super.init(self, x, y, "battle/bullets/tellyvis/reruns/clubs_ball_"..type)

	self:setScale(1, 1)
    self.rotation = rotdir
    self.physics.direction = dir
    self.physics.speed = 4
	self.tp = 0.08
end

return RerunClubsBall