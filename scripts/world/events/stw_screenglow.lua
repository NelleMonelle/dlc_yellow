local SteamworksScreenGlow, super = Class(Event)

function SteamworksScreenGlow:init(data)
	super.init(self, data.x, data.y, data.width, data.height)
	local properties = data.properties or {}
    self:setPosition(0,0)
    self:setParallax(0,0)
    self:setSize(SCREEN_WIDTH, SCREEN_HEIGHT)
	self.lava_particles = properties["part_enable"] or true
	self.alpha = 0
	self.alpha_trend = 1
	self.part_timer = 0
	self.room_width = (Game.world.map.width * Game.world.map.tile_width)
	self.room_height = (Game.world.map.height * Game.world.map.tile_height)
	if self.lava_particles then
		local part_dist = self.room_width * self.room_height / 29257.14
		for i = 0, math.floor(part_dist) do
			local particle = SteamworksLavaParticle(Utils.random(0, self.room_width),Utils.random(0, self.room_height))
			Game.world:addChild(particle)
		end
	end
end

function SteamworksScreenGlow:onAdd(parent)
    super.onAdd(self,parent)
    self:setLayer(WORLD_LAYERS["below_ui"])
end

function SteamworksScreenGlow:update()
	super.update(self)
	if self.alpha_trend == 1 then
		if self.alpha < 0.15 then
			self.alpha = self.alpha + 0.00125 * DTMULT
		else
			self.alpha_trend = -1
		end
	end
	if self.alpha_trend == -1 then
		if self.alpha > 0 then
			self.alpha = self.alpha - 0.00125 * DTMULT
		else
			self.alpha_trend = 1
		end
	end
	if self.lava_particles then
		self.part_timer = self.part_timer + DTMULT
		local part_stream = self.room_width / 18.82
		if self.part_timer >= math.floor(part_stream) then
			self.part_timer = 0
			local particle = SteamworksLavaParticle(Utils.random(0, self.room_width),self.room_height-1)
			Game.world:addChild(particle)
		end
	end
end

function SteamworksScreenGlow:draw()
	super.draw(self)
    Draw.setColor({1,1,1}, self.alpha)
    love.graphics.rectangle("fill", 0,0,SCREEN_WIDTH,SCREEN_HEIGHT)
end

return SteamworksScreenGlow