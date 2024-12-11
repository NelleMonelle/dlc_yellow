local SteamworksEmberParticle, super = Class(Object)

function SteamworksEmberParticle:init(x, y)
    super.init(self, x, y)
	self.room_width = (Game.world.map.width * Game.world.map.tile_width)
	self.room_height = (Game.world.map.height * Game.world.map.tile_height)
	self.max_lifetime = Utils.random(100, 300)
	self.lifetime = 0
    self.sprite = Sprite("world/events/stw_flare_part")
	self.sprite:setScale(Utils.random(0.2, 1)*0.4)
    self:addChild(self.sprite)
	self.sprite.color = {1, 0.196078431372549, 0.196078431372549, 1}
		self.sprite.alpha = self.sprite.color[4]
	self.physics.speed = Utils.random(0.1, 0.3)*2
	self.physics.gravity_direction = math.rad(270)
	self.physics.direction = math.rad(Utils.random(-60, -120))
end

function SteamworksEmberParticle:onAdd(parent)
    super.onAdd(self,parent)
    self:setParallax(1,1)
    self:setLayer(WORLD_LAYERS["below_ui"])
end

function SteamworksEmberParticle:update()
	super.update(self)
	if self.lifetime < self.max_lifetime/2 then
		self.sprite.color = Utils.mergeColor({1, 0.196078431372549, 0.196078431372549, 1}, {1, 0.7764705882352941, 0.0470588235294118, 1}, self.lifetime/(self.max_lifetime/2))
		self.sprite.alpha = self.sprite.color[4]
	else
		self.sprite.color = Utils.mergeColor({1, 0.7764705882352941, 0.0470588235294118, 1}, {1, 0.9568627450980392, 0.6862745098039216, 0}, (self.lifetime-(self.max_lifetime/2))/(self.max_lifetime/2))
		self.sprite.alpha = self.sprite.color[4]
	end
	self.lifetime = self.lifetime + DTMULT
	if self.lifetime > self.max_lifetime then
		self:remove()
	end
end

return SteamworksEmberParticle