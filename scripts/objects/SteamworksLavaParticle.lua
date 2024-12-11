local SteamworksLavaParticle, super = Class(Object)

function SteamworksLavaParticle:init(x, y)
    super.init(self, x, y)
	self.room_width = (Game.world.map.width * Game.world.map.tile_width)
	self.room_height = (Game.world.map.height * Game.world.map.tile_height)
	local part_life = (self.room_width + 100) / 0.8
	self.max_lifetime = Utils.random(part_life*0.75, part_life)
	self.lifetime = 0
    self.sprite = Sprite("world/events/stw_flare_part")
	self.sprite:setScale(Utils.random(0.05, 0.075)*2)
    self:addChild(self.sprite)
	self.sprite.color = {1, 0.596078431372549, 1, 0.7}
	self.physics.speed = Utils.random(0.7, 0.9)*2
	self.physics.direction = math.rad(Utils.random(-83, -97))
end

function SteamworksLavaParticle:onAdd(parent)
    super.onAdd(self,parent)
    self:setParallax(1,1)
    self:setLayer(WORLD_LAYERS["below_ui"])
end

function SteamworksLavaParticle:update()
	super.update(self)
	if self.lifetime < self.max_lifetime/2 then
		self.sprite.color = Utils.mergeColor({1, 0.596078431372549, 1, 0.7}, {1, 1, 1, 0.7}, self.lifetime/(self.max_lifetime/2))
	else
		self.sprite.color = Utils.mergeColor({1, 1, 1, 0.7}, {0.9725490196078431, 0.9019607843137255, 1, 0}, (self.lifetime-(self.max_lifetime/2))/(self.max_lifetime/2))
		self.sprite.alpha = self.sprite.color[4]
	end
	self.lifetime = self.lifetime + DTMULT
	if self.lifetime > self.max_lifetime then
		self:remove()
	end
end

return SteamworksLavaParticle