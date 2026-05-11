local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    self:setArenaSize(140, 160)
	local arena = Game.battle.arena
	self:setArenaPosition(arena.x, arena.y-20)
	local box_width = 140 + 2
	self.eq_bar_number = 5
	self.eq_bar_gap = 2
	self.eq_bar_width = box_width/self.eq_bar_number-self.eq_bar_gap*2
	self.eq_bar_height = {}
	self.eq_bar_height_target = {}
	for i = 1, self.eq_bar_number do
		self.eq_bar_height[i] = 2
		self.eq_bar_height_target[i] = 2
	end
	self.eq_bar_height_max = 160-2
	self.eq_bar_height_min = 2
	self.eq_bar_draw_warning_bars = false
	self.eq_bar_low_max = 2
	self.eq_bar_low_current = 0
	self.eq_bar_hi_max = 3
	self.eq_bar_hi_current = 0
	self.eq_bar_collidable = self.eq_bar_height_max-20
	self.eq_bar_ready = false
	self.attack_number_max = 5
	self.eq_hitboxes = {}
	for i = 1, self.eq_bar_number do
		local xx = arena.left + 2 + i * self.eq_bar_gap + self.eq_bar_width * (i-1)
		local yy = arena.bottom - 2
		local yy_2 = yy - self.eq_bar_height[i]
		self.eq_hitboxes[i] = Hitbox(self, xx, yy_2, xx+self.eq_bar_width, self.eq_bar_height[i])
	end
	self.eq_collider = ColliderGroup(self, self.eq_hitboxes)
    self.time = 0
    self.enemies = self:getAttackers()
	self.raise_eq_bars = false
	self.fill = Assets.getTexture("bubbles/fill")
	self.damage_hack_bullet = nil
end

function Basic:onStart()
	local arena = Game.battle.arena
	local box_width = arena.width + 2
	self.eq_bar_width = box_width/self.eq_bar_number-self.eq_bar_gap*2
	self.eq_bar_height_max = arena.height-2
	self.eq_bar_ready = true
	self.damage_hack_bullet = self:spawnBullet("smallbullet", 0, 0)
	self.damage_hack_bullet.visible = false
	self.damage_hack_bullet.destroy_on_hit = false
	self.timer:script(function(wait)
		while true do
			for i = 1, self.eq_bar_number, 1 do
				self.eq_bar_height_target[i] = love.math.random(self.eq_bar_height_min, self.eq_bar_height_max)
				if self.eq_bar_height_target[i] < self.eq_bar_collidable then
					if self.eq_bar_low_current < self.eq_bar_low_max then
						self.eq_bar_low_current = self.eq_bar_low_current + 1
					else
						self.eq_bar_hi_current = self.eq_bar_hi_current + 1
						self.eq_bar_height_target[i] = love.math.random(self.eq_bar_collidable, self.eq_bar_height_max)
					end
				elseif self.eq_bar_height_target[i] > self.eq_bar_collidable then				
					if self.eq_bar_hi_current < self.eq_bar_hi_max then
						self.eq_bar_hi_current = self.eq_bar_hi_current + 1
					else
						self.eq_bar_height_target[i] = love.math.random(self.eq_bar_height_min, self.eq_bar_collidable)
						self.eq_bar_hi_current = self.eq_bar_low_current + 1
					end
				end
			end
			wait(0.1)
			Assets.playSound("bombfall")
			self.eq_bar_draw_warning_bars = true
            self.damage_hack_bullet.grazed = false
			wait(0.1)
			self.eq_bar_draw_warning_bars = false
			wait(0.1)
			Assets.playSound("bombfall")
			self.eq_bar_draw_warning_bars = true
			wait(0.1)
			self.eq_bar_draw_warning_bars = false
			wait(0.1)
			Assets.playSound("bombfall")
			self.eq_bar_draw_warning_bars = true
			wait(0.1)
			self.eq_bar_draw_warning_bars = false
			wait(0.3)
			self.raise_eq_bars = true
			wait(0.6)
			self.raise_eq_bars = false
			self.eq_bar_hi_current = 0
			self.eq_bar_low_current = 0
			self.attack_number_max = self.attack_number_max - 1
			for i = 1, self.eq_bar_number do
				self.eq_bar_height_target[i] = self.eq_bar_height_min
			end
		end
	end)
end

function Basic:update()
	super.update(self)
	if not self.eq_bar_ready then return end
	local arena = Game.battle.arena
	for i = 1, self.eq_bar_number do
		local y_target = self.eq_bar_height_min
		if self.raise_eq_bars then
			y_target = self.eq_bar_height_target[i]
		end
		self.eq_bar_height[i] = Utils.lerp(self.eq_bar_height[i], y_target, 0.25*DTMULT)
	end
	for i = 1, self.eq_bar_number do
		local xx = arena.left + 2 + i * self.eq_bar_gap + self.eq_bar_width * (i-1)
		local yy = arena.bottom - 2
		local yy_2 = yy - self.eq_bar_height[i]
		self.eq_hitboxes[i] = Hitbox(self, xx, yy_2, self.eq_bar_width, self.eq_bar_height[i])
	end
	if not self.eq_collider then return end
	if self.eq_collider:collidesWith(Game.battle.soul) and self.damage_hack_bullet then
		self.damage_hack_bullet:onCollide(Game.battle.soul)
	end
	if self.damage_hack_bullet and self.damage_hack_bullet:getGrazeTension() and self.eq_collider:collidesWith(Game.battle.soul.graze_collider) then
        local old_graze = self.damage_hack_bullet.grazed
        if self.damage_hack_bullet.grazed then
			Game:giveTension(self.damage_hack_bullet:getGrazeTension() * DT * Game.battle.soul.graze_tp_factor)
            if Game.battle.wave_timer < Game.battle.wave_length - (1/3) then
                Game.battle.wave_timer = Game.battle.wave_timer + (self.damage_hack_bullet.time_bonus * (DT / 30) * Game.battle.soul.graze_time_factor)
            end
            if Game.battle.soul.graze_sprite.timer < 0.1 then
                Game.battle.soul.graze_sprite.timer = 0.1
            end
        else
            Assets.playSound("graze")
            Game:giveTension(self.damage_hack_bullet:getGrazeTension() * Game.battle.soul.graze_tp_factor)
            if Game.battle.wave_timer < Game.battle.wave_length - (1/3) then
                Game.battle.wave_timer = Game.battle.wave_timer + ((self.damage_hack_bullet.time_bonus / 30) * Game.battle.soul.graze_time_factor)
            end
            Game.battle.soul.graze_sprite.timer = 1/3
            self.damage_hack_bullet.grazed = true
		end
        Game.battle.soul:onGraze(self.damage_hack_bullet, old_graze)
    end
end

function Basic:draw()
	super.draw(self)
	if not self.eq_bar_ready then return end
	local arena = Game.battle.arena
	for i = 1, self.eq_bar_number do
		local xx = arena.left + 2 + i * self.eq_bar_gap + self.eq_bar_width * (i-1)
		local yy = arena.bottom - 2
		local yy_2 = yy - self.eq_bar_height[i]
		local shader = Kristal.Shaders["GradientV"]
		local last_shader = love.graphics.getShader()

		love.graphics.setShader(shader)
		shader:sendColor("from", COLORS.gray)
		shader:sendColor("to", COLORS.white)
		Draw.draw(self.fill, xx, yy_2, 0, self.eq_bar_width, self.eq_bar_height[i])
		love.graphics.setShader(last_shader)
		if self.eq_bar_draw_warning_bars then
			local yy_2 = yy - self.eq_bar_height_target[i]
			Draw.setColor(COLORS.red, 0.3)
			Draw.draw(self.fill, xx, yy_2, 0, self.eq_bar_width, self.eq_bar_height_target[i])
			Draw.setColor({1,1,1,1})
		end
	end
	if DEBUG_RENDER and self.eq_collider then
        self.eq_collider:draw(1, 0, 0)
    end
end

function Basic:canEnd()
    if self.attack_number_max <= 0 then
        return true
	end
    return false
end

return Basic