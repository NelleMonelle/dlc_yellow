local MansionStudyParticles, super = Class(Event)

function MansionStudyParticles:init(x, y, width, height, properties)
	super.init(self, x, y, width, height)
	local properties = properties or {}
    self:setPosition(0,0)
	self.part_timer = 0
end

function MansionStudyParticles:update()
	super.update(self)
	self.part_timer = self.part_timer + DTMULT
	if self.part_timer >= 1 then
		self.part_timer = 0
		if love.math.random(1, 16) == 1 then
			local particle = MansionStudyParticle(Utils.random(140-99, 140+101)*2,Utils.random(210-8, 210+8)*2)
			Game.world:addChild(particle)
		end
	end
end

return MansionStudyParticles