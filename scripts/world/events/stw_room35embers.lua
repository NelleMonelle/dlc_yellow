local SteamworksRoom35Embers, super = Class(Event)

function SteamworksRoom35Embers:init(x, y, width, height, properties)
	super.init(self, x, y, width, height)
	local properties = properties or {}
    self:setPosition(0,0)
end

function SteamworksRoom35Embers:onAdd(parent)
    super.onAdd(self,parent)
    self:setLayer(WORLD_LAYERS["below_ui"])
	self.part_embersys = GMParticleSystem()
	self.part_embersys:setLayer(self.layer)
	Game.world:addChild(self.part_embersys)
	self.part_ember_em = self.part_embersys:initEmitter()
	self.part_embersys:createEmitter(self.part_ember_em)
	self.part_ember_particle = self.part_embersys:initType()
	self.part_embersys:partTypeSprite(self.part_ember_particle, Assets.getTexture("world/events/steamworks/flare_part"), false, false, false)
	self.part_embersys:partTypeSize(self.part_ember_particle, 0.2, 1, 0, 0)
	self.part_embersys:partTypeScale(self.part_ember_particle, 0.2, 0.2)
	self.part_embersys:partTypeOrientation(self.part_ember_particle, 0, 0, 0, 0, 0)
	self.part_embersys:partTypeColorThree(self.part_ember_particle, ColorUtils.hexToRGB("#FF3232"), ColorUtils.hexToRGB("#FFC60C"), COLORS.white)
	self.part_embersys:partTypeAlphaThree(self.part_ember_particle, 0.7, 0.7, 0)
	self.part_embersys:partTypeBlend(self.part_ember_particle, false)
	self.part_embersys:partTypeLife(self.part_ember_particle, 100, 300)
	self.part_embersys:partTypeSpeed(self.part_ember_particle, 0.2, 0.2, 0, 0)
	self.part_embersys:partTypeDirection(self.part_ember_particle, math.rad(-60), math.rad(-120), 0, math.rad(-10))
	self.part_embersys:partTypeGravity(self.part_ember_particle, 0, math.rad(-270))
	self.part_embersys:emitterRegion(self.part_ember_em, 1400-853.3143, 1400+853.3143, 480-64, 480+64, "rectangle", "linear")
	self.part_embersys:emitterStream(self.part_ember_em, self.part_ember_particle, 1)
end

return SteamworksRoom35Embers