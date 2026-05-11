local FloorBucket, super = Class(LightBullet)

function FloorBucket:init(x, y, speed)
    super.init(self, x, y, "battle/bullets/jandroid/floor_bucket")
	self:setOrigin(0.5,0.5)
    self:setScale(1, 1)
	local speed = speed or 3
	if self.y > Game.battle.arena.top and self.y < Game.battle.arena.bottom then
		if self.x < 320 then
			self.physics.speed_x = speed
		else
			self.physics.speed_x = -speed
		end
	else
		if self.y < 320 then
			self.physics.speed_y = speed
		else
			self.physics.speed_y = -speed
		end
	end
	self.remove_offscreen = true
end

function FloorBucket:update()

    super.update(self)
end

return FloorBucket