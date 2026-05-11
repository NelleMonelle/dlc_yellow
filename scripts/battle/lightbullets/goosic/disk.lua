local GoosicDisk, super = Class(LightBullet)

function GoosicDisk:init(x, y, speed)
    super.init(self, x, y, "battle/bullets/goosic/disk")
	self:setOrigin(0.5,0.5)
    self:setScale(1, 1)
	self.physics.match_rotation = true
	local speed = speed or 3
end

function GoosicDisk:update()

    super.update(self)
end

return GoosicDisk