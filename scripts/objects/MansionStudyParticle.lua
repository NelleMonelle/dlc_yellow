local MansionStudyParticle, super = Class(Object)

function MansionStudyParticle:init(x, y)
    super.init(self, x, y)
	self.max_lifetime = Utils.random(160, 220)
	self.lifetime = 0
    self.sprite = Sprite("bubbles/fill")
	self.sprite:setScale(Utils.random(1, 2)*2)
    self:addChild(self.sprite)
	self.sprite.alpha = 0
	self.physics.speed = Utils.random(0.5, 1)*2
	self.physics.direction = math.rad(270)
	self.part_timer = 0
end

function MansionStudyParticle:onAdd(parent)
    super.onAdd(self,parent)
    self:setParallax(1,1)
    self:setLayer(WORLD_LAYERS["below_ui"])
end

function MansionStudyParticle:update()
	super.update(self)
	if self.lifetime < self.max_lifetime/2 then
		self.sprite.alpha = Utils.lerp(0, 1, self.lifetime/(self.max_lifetime/2))
	else
		self.sprite.alpha = Utils.lerp(1, 0, (self.lifetime-(self.max_lifetime/2))/(self.max_lifetime/2))
	end
	if self.part_timer >= 1 then
		self.part_timer = 0
		self.physics.direction = math.rad(270 + Utils.random(-5, 5))
	end
	self.lifetime = self.lifetime + DTMULT
	if self.lifetime > self.max_lifetime then
		self:remove()
	end
end

return MansionStudyParticle