local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    self:setArenaSize(140, 128)
	local arena = Game.battle.arena
    self.time = 10
	self.disk_state = 0
	self.launch_timer = 1
	self.launch_timer_max = self.launch_timer
	self.slow_down_noloop = false
	self.spin_speed = 0
	self.disk = nil
end

function Basic:onStart()
	local arena = Game.battle.arena
	self.timer:script(function(wait)
		self.disk = self:spawnBullet("goosic/disk", arena.x, arena.top - 35)
		self.disk.alpha = 0
		self.disk_arrow = self:spawnSprite("battle/bullets/goosic/disk_arrow", self.disk.x, self.disk.y, self.disk.layer)
		self.disk_arrow:setScale(1)
		self.disk_arrow:setOriginExact(-25,7)
		self.disk_arrow.alpha = 0
		self.disk:fadeToSpeed(1, 0.2)
		while true do
			wait(0.5)
			self.disk_state = 1
			while self.spin_speed < 20 do
				self.spin_speed = self.spin_speed + DTMULT
				wait(1/30)
			end
			self.disk_state = 2
			while self.disk_state == 2 do
				local soul_dir = Utils.angle(self.disk.x, self.disk.y, Game.battle.soul.x, Game.battle.soul.y)
				if self.launch_timer > 0 then
					self.launch_timer = self.launch_timer - DT
				elseif Utils.angleDiff(self.disk.rotation, soul_dir) < math.rad(self.spin_speed) then
					self.slow_down_noloop = true
				end
				if self.slow_down_noloop then
					self.spin_speed = Utils.lerp(self.spin_speed, 0, 0.75*DTMULT)
					if self.spin_speed < 0.1 then
						self.spin_speed = 0
						self.disk_state = 3
					end
				end
				wait(1/30)
			end
			wait(0.2)
			self.disk_state = 4
			self.disk.physics.speed = Utils.lerp(self.disk.physics.speed, 14, 0.5*DTMULT)
			wait(0.7)
			self.disk_state = 0
			self.launch_timer = self.launch_timer_max
			self.slow_down_noloop = false
		end
	end)
end

function Basic:update()
	super.update(self)
	if self.disk then
		if self.disk:isRemoved() then
			self.finished = true
			return
		end
		self.disk.rotation = self.disk.rotation - math.rad(self.spin_speed)
		if self.disk_state ~= 4 and self.disk_state ~= -1 then
			self.disk.physics.speed = Utils.lerp(self.disk.physics.speed, 0, 0.3*DTMULT)
		end
		if self.disk_arrow then
			local alpha_new = 0
			if self.disk_state == 1 or self.disk_state == 2 then
				alpha_new = 1
			end
			self.disk_arrow.x = self.disk.x
			self.disk_arrow.y = self.disk.y
			self.disk_arrow.rotation = self.disk.rotation
			self.disk_arrow.alpha = Utils.lerp(self.disk_arrow.alpha, alpha_new, 0.2)
		end
	end
end

return Basic