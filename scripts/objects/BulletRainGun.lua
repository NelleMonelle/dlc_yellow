local BulletRainGun, super = Class(Object)

function BulletRainGun:init(x,y,targetdir)
	super.init(self,x,y)
	self:setScale(1,1)
	self:setOrigin(0.5,0.5)
	self.sprite = Sprite("battle/bullets/starlo/bullet_rain_gun")
	self.sprite:setOriginExact(23,5)
	self:addChild(self.sprite)
	self.charge = 8
	self.line_offset = 0
	self.line_len = 250
	self.dash_len = 10
	self.gap_len = 6
	self.line_seg = self.line_len / (self.dash_len + self.gap_len)
	self.line_start = {}
	self.line_start[self.line_seg+1] = 0
	self.target = 0

	self.sprite.alpha = 0
	self.alpha_inc = 0.2
	local time_to_fade_in = 1 / self.alpha_inc
	self.angle_inc = 10
	self.target_dir = targetdir or 0
	self.physics.match_rotation = false
	self.physics.direction = self.target_dir
	self.rotation = self.target_dir + math.rad(time_to_fade_in * self.angle_inc)
	self.can_fire = 0
	self.fire_timer = 0
	if self.target_dir > math.rad(90) and self.target_dir < math.rad(270) then
		self.scale_y = -1
	end
	Assets.stopAndPlaySound("starlo_gun_warn")
end

function BulletRainGun:update()
	super.update(self)
	self.target = self.dash_len
	self.line_offset = self.line_offset + 3*DTMULT
	if self.line_offset >= 20 then
		self.line_offset = self.line_offset - 20
	end
	for i = self.line_seg, 0, -1 do
		self.line_start[i+1] = (self.line_offset) + ((self.dash_len + self.gap_len) * i)
	end

	self.fire_timer = math.max(self.fire_timer - DTMULT, 0)
	if self.can_fire == 0 then
		self.rotation = self.rotation - math.rad(self.angle_inc * DTMULT)
		self.sprite.alpha = self.sprite.alpha + self.alpha_inc * DTMULT
		if self.sprite.alpha >= 1 then
			self.sprite.alpha = 1
			self.rotation = self.physics.direction
			self.fire_timer = 16
			self.can_fire = -1
		end
	end
	if self.can_fire == -1 and self.fire_timer <= 0 then
		self.can_fire = 1
	end
	if self.can_fire == 1 then
		Assets.stopAndPlaySound("shot_weak")
		self.physics.gravity = 0.25
		self.physics.speed = -3
		self.physics.speed_y = -1
		local bullet = self.wave:spawnBullet("starlo/bullet_rain_bullet", self.x, self.y, self.physics.direction)
		bullet:setLayer(self.layer - 0.01)
		self.can_fire = 2
	end
	if self.can_fire == 2 then
		self.rotation = self.rotation - math.rad((self.scale_y * 2) * DTMULT)
		self.sprite.alpha = self.sprite.alpha - 0.025 * DTMULT
		if self.sprite.alpha <= 0 then
			self:remove()
		end
	end
end

function BulletRainGun:draw()
	if self.can_fire == -1 then
		Draw.setColor(1, 1, 1, 0.5)
		love.graphics.setLineWidth(3)
		for i = self.line_seg, 0, -1 do
			love.graphics.line(self.line_start[i+1], 0, self.line_start[i+1] + self.target, 0)
		end
	end
	Draw.setColor(1, 1, 1, 1)
	super.draw(self)
end

return BulletRainGun