local RerunBlockFall, super = Class(LightBullet)

function RerunBlockFall:init(x, y)
    super.init(self, x, y, "battle/bullets/tellyvis/reruns/block")

	self:setScale(1, 1)
	self:setOrigin(0.5,0.5)
	self.alpha = 0
	self.graphics.fade = 0.15
	self.graphics.fade_to = 1
	self.graphics.fade_callback = (function() self.falling = true end)
	self.xpos = 0
	self.ypos = -8
	self.fall_timer = 0
	self.fall_collider = PointCollider(self, 17, 42)
	self.falling = true
	self.halt = false
end

function RerunBlockFall:update()
	super.update(self)
	if self.falling then
		self.fall_timer = self.fall_timer + DTMULT
		if self.fall_timer >= 5 then
			Object.startCache()
			for _,block in ipairs(Game.stage:getObjects(Mod.libs["magical-glass"]:getLightBullet("tellyvis/reruns/blockfall"))) do
				if self.ypos > 0 or (self.fall_collider:collidesWith(block) and block.collidable) then
					self.halt = true
				end
			end
			Object.endCache()
			if not self.halt then
				self.ypos = self.ypos + 1
			end
			self.fall_timer = 0
		end
	end
	local lx = Game.battle.arena.left+12
	local yx = Game.battle.arena.bottom-15-28
	self.x = lx + (self.xpos * 34)
	self.y = yx + (self.ypos * 28)
end

return RerunBlockFall