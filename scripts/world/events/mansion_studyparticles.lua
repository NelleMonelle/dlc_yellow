local MansionStudyParticles, super = Class(Event)

function MansionStudyParticles:init(x, y, width, height, properties)
	super.init(self, x, y, width, height)
	local properties = properties or {}
    self:setPosition(0,0)
end

function MansionStudyParticles:onAdd(parent)
    super.onAdd(self,parent)
    self:setLayer(WORLD_LAYERS["below_ui"])
	self.part_studysys = GMParticleSystem()
	self.part_studysys:setLayer(self.layer)
	Game.world:addChild(self.part_studysys)
	self.part_study_em = self.part_studysys:initEmitter()
	self.part_studysys:createEmitter(self.part_study_em)
	self.part_study_dust = self.part_studysys:initType()
	self.part_studysys:partTypeSprite(self.part_study_dust, Assets.getTexture("bubbles/fill"), false, false, false)
	self.part_studysys:partTypeSize(self.part_study_dust, 1, 2, 0, 0)
	self.part_studysys:partTypeScale(self.part_study_dust, 2, 2)
	self.part_studysys:partTypeOrientation(self.part_study_dust, 0, 0, 0, 0, 0)
	self.part_studysys:partTypeColorThree(self.part_study_dust, COLORS.white, COLORS.white, COLORS.white)
	self.part_studysys:partTypeAlphaThree(self.part_study_dust, 0, 1, 0)
	self.part_studysys:partTypeBlend(self.part_study_dust, false)
	self.part_studysys:partTypeLife(self.part_study_dust, 160, 220)
	self.part_studysys:partTypeSpeed(self.part_study_dust, 1, 2, 0, 0)
	self.part_studysys:partTypeDirection(self.part_study_dust, math.rad(-90), math.rad(-90), 0, math.rad(-5))
	self.part_studysys:partTypeGravity(self.part_study_dust, 0, 0)
	local xp = 280
	local yp = 420
	self.part_studysys:emitterRegion(self.part_study_em, xp - 198, xp + 202, yp - 16, yp + 16, "rectangle", "linear")
	self.part_studysys:emitterStream(self.part_study_em, self.part_study_dust, -16)
end

return MansionStudyParticles