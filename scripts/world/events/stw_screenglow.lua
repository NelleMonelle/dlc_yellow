local SteamworksScreenGlow, super = Class(Event)

function SteamworksScreenGlow:init(data)
	super.init(self, data)
	local properties = data.properties or {}
    self:setPosition(0,0)
    self:setParallax(0,0)
    self:setSize(SCREEN_WIDTH, SCREEN_HEIGHT)
	self.lava_particles = properties["part_enable"] or true
	self.alpha = 0
	self.alpha_trend = 1
	self.room_width = (Game.world.map.width * Game.world.map.tile_width)
	self.room_height = (Game.world.map.height * Game.world.map.tile_height)
end

function SteamworksScreenGlow:onAdd(parent)
    super.onAdd(self,parent)
    self:setLayer(WORLD_LAYERS["below_ui"])
	if self.lava_particles then
		local part_life = ((self.room_height + 100)/2) / 0.8
		local part_dist = ((self.room_width * self.room_height)/2) / 29257.14
		self.part_lavasys = GMParticleSystem()
		self.part_lavasys:setLayer(self.layer)
		Game.world:addChild(self.part_lavasys)
		self.part_lava_em = self.part_lavasys:initEmitter()
		self.part_lavasys:createEmitter(self.part_lava_em)
		self.part_lava_particle = self.part_lavasys:initType()
		self.part_lavasys:partTypeSprite(self.part_lava_particle, Assets.getTexture("world/events/steamworks/flare_part"), false, false, false)
		self.part_lavasys:partTypeSize(self.part_lava_particle, 0.05, 0.075, 0, 0)
		self.part_lavasys:partTypeScale(self.part_lava_particle, 2, 2)
		self.part_lavasys:partTypeOrientation(self.part_lava_particle, 0, 0, 0, 0, 0)
		self.part_lavasys:partTypeColorThree(self.part_lava_particle, ColorUtils.hexToRGB("#FF9BFF"), COLORS.white, ColorUtils.hexToRGB("#F8E6FF"))
		self.part_lavasys:partTypeAlphaThree(self.part_lava_particle, 0.7, 0.7, 0)
		self.part_lavasys:partTypeBlend(self.part_lava_particle, false)
		self.part_lavasys:partTypeLife(self.part_lava_particle, part_life * 0.75, part_life)
		self.part_lavasys:partTypeSpeed(self.part_lava_particle, 1.4, 1.8, 0, 0)
		self.part_lavasys:partTypeDirection(self.part_lava_particle, math.rad(-82), math.rad(-97), 0, 0)
		self.part_lavasys:partTypeGravity(self.part_lava_particle, 0, 0)
		self.part_lavasys:emitterRegion(self.part_lava_em, 0, self.room_width, 0, self.room_height, "rectangle", "linear")
		self.part_lavasys:emitterBurst(self.part_lava_em, self.part_lava_particle, part_dist)
		self.part_lavasys:emitterRegion(self.part_lava_em, 0, self.room_width, self.room_height - 1, self.room_height - 1, "line", "linear")
		self.part_lavasys:emitterStream(self.part_lava_em, self.part_lava_particle, -((self.room_width/2)/18.82))
	end
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
end

function SteamworksScreenGlow:draw()
	super.draw(self)
    Draw.setColor({1,1,1}, self.alpha)
    love.graphics.rectangle("fill", 0,0,SCREEN_WIDTH,SCREEN_HEIGHT)
end

return SteamworksScreenGlow