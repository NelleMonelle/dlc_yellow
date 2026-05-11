local RerunDiamondWhite, super = Class(LightBullet)

function RerunDiamondWhite:init(x, y, dir)
    super.init(self, x, y, "battle/bullets/tellyvis/reruns/diamond_white")

	self:setScale(1, 1)
    self.rotation = dir
    self.physics.speed = 6
	self.physics.match_rotation = true
end

return RerunDiamondWhite