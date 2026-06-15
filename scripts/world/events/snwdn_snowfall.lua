local SnowdinSnowfall, super = Class(Event)

function SnowdinSnowfall:init(x, y, width, height, properties)
	super.init(self, x, y, width, height)
	local properties = properties or {}
    self:setPosition(0,0)
	self.room_width = (Game.world.map.width * Game.world.map.tile_width)
	self.room_height = (Game.world.map.height * Game.world.map.tile_height)
end

function SnowdinSnowfall:onAdd(parent)
    super.onAdd(self,parent)
    self:setLayer(WORLD_LAYERS["below_ui"])
	self.part_snowfallsys = GMParticleSystem()
	self.part_snowfallsys:setLayer(self.layer)
	Game.world:addChild(self.part_snowfallsys)
	self.part_snowfall_em = self.part_snowfallsys:initEmitter()
	self.part_snowfallsys:createEmitter(self.part_snowfall_em)
	self.part_snowfall = self.part_snowfallsys:initType()
	self.part_snowfallsys:partTypeSprite(self.part_snowfall, Assets.getFrames("world/events/snowdin/snowflake_part"), false, false, true)
	self.part_snowfallsys:partTypeSize(self.part_snowfall, 1, 1, 0, 0)
	self.part_snowfallsys:partTypeScale(self.part_snowfall, 2, 2)
	self.part_snowfallsys:partTypeColorTwo(self.part_snowfall, COLORS.white, COLORS.white)
	self.part_snowfallsys:partTypeAlphaThree(self.part_snowfall, 0.25, 0.95, 0)
	self.part_snowfallsys:partTypeSpeed(self.part_snowfall, 0.6, 2.4, 0, 0)
	self.part_snowfallsys:partTypeDirection(self.part_snowfall, math.rad(-250), math.rad(-290), 0, 0)
	self.part_snowfallsys:partTypeOrientation(self.part_snowfall, math.rad(-0), math.rad(-359), math.rad(-MathUtils.random(-2, 2)), 0.1, 1)
	self.part_snowfallsys:partTypeLife(self.part_snowfall, 250, 2000)
	self.part_snowfallsys:partTypeBlend(self.part_snowfall, true)
	self.part_snowfallsys:emitterRegion(self.part_snowfall_em, 0, self.room_width, -200, self.room_height, "rectangle", "linear")
	self.part_snowfallsys:emitterBurst(self.part_snowfall_em, self.part_snowfall, self.room_width / 8)
	self.part_snowfallsys:emitterRegion(self.part_snowfall_em, 0, self.room_width, 0, 0, "line", "linear")
	self.part_snowfallsys:emitterStream(self.part_snowfall_em, self.part_snowfall, -8)
end

return SnowdinSnowfall