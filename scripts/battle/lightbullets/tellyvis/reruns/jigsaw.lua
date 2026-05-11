local RerunJigsaw, super = Class(LightBullet)

function RerunJigsaw:init(x, y)
    super.init(self, x, y, "battle/bullets/tellyvis/reruns/jigsaw")

	self:setScale(1, 1)
	self:setOrigin(0.5,0.5)
	self.alpha = 0
	self:fadeTo(1, 0.1)
	self.targeting = true
	self.can_collide = false
	self.side = 0
	self.bid = nil
	Game.battle.timer:script(function(wait)
		wait(15/30)
		self.targeting = false
		self.physics.direction = math.rad((self.side*90))
		self.physics.speed = 4
		self.physics.gravity_direction = math.rad((self.side*90)+180)
		self.physics.gravity = 1.2
		wait(10/30)
		self.physics.gravity = 0
		self.can_collide = true
	end)
end

function RerunJigsaw:update()
	super.update(self)
	if self.targeting then
		if self.side == 1 or self.side == 3 then
			if Game.battle.soul.x - self.x >= 10 then
				self.x = self.x + 3 * DTMULT
			end
			if Game.battle.soul.x - self.x <= -10 then
				self.x = self.x - 3 * DTMULT
			end
		end
		if self.side == 0 or self.side == 2 then
			if Game.battle.soul.y - self.y >= 10 then
				self.y = self.y + 3 * DTMULT
			end
			if Game.battle.soul.y - self.y <= -10 then
				self.y = self.y - 3 * DTMULT
			end
		end
	end
    Object.startCache()
	for _,jigsaw in ipairs(Game.stage:getObjects(LightBullet)) do
		if jigsaw:collidesWith(self) and jigsaw.bid ~= self.bid and jigsaw:isBullet("tellyvis/reruns/jigsaw") and jigsaw.can_collide then
			self.physics.speed = 0
			jigsaw.physics.speed = 0
			self.can_collide = false
			jigsaw.can_collide = false
			Game.battle.timer:script(function(wait)
				wait(12/30)
				self:fadeOutAndRemove(0.2)
				jigsaw:fadeOutAndRemove(0.2)
			end)
			for i = 0, 16 do
				if self.side == 0 then
					if self.x >= jigsaw.x - 28 then	self.x = self.x - 1 end
					if self.x >= jigsaw.x - 28 then	jigsaw.x = jigsaw.x + 1 end
				end
				if self.side == 3 then
					if self.y >= jigsaw.y - 28 then	self.y = self.y - 1 end
					if self.y >= jigsaw.y - 28 then	jigsaw.y = jigsaw.y + 1 end
				end
				if self.side == 2 then
					if self.x <= jigsaw.x + 28 then	self.x = self.x + 1 end
					if self.x <= jigsaw.x + 28 then	jigsaw.x = jigsaw.x - 1 end
				end
				if self.side == 1 then
					if self.y <= jigsaw.y + 28 then	self.y = self.y + 1 end
					if self.y <= jigsaw.y + 28 then	jigsaw.y = jigsaw.y - 1 end
				end
			end
			break
		end
	end	
    Object.endCache()
end

return RerunJigsaw