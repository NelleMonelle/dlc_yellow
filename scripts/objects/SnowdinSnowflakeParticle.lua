local SnowdinSnowflakeParticle, super = Class(Sprite)

function SnowdinSnowflakeParticle:init(x, y)
    super.init(self,"world/events/snowdin/snowflake_part",x, y)
	self.lifetime = 0
	self:setOrigin(0.5, 0.5)
	self:setScale(2,2)
	self:setFrame(Utils.pick({1,2,3}))
	self.alpha = 0.25
	self.rotation = math.rad(love.math.random(0, 359))
	self.graphics.spin = math.rad(Utils.pick({-2, 2}))
	self.physics.speed = Utils.random(0.3, 1.2)*2
	self.physics.direction = math.rad(Utils.random(-250, -290))
end

function SnowdinSnowflakeParticle:onAdd(parent)
    super.onAdd(self,parent)
    self:setParallax(1,1)
    self:setLayer(WORLD_LAYERS["below_ui"])
end

function SnowdinSnowflakeParticle:update()
	super.update(self)
	if self.lifetime < 250 then
		self.alpha = Utils.lerp(0.25, 0.95, self.lifetime/250)
	else
		self.alpha = 0.95
	end
	self.lifetime = self.lifetime + DTMULT
	if self.lifetime > 2000 then
		self:remove()
	end
end

function SnowdinSnowflakeParticle:draw()
	love.graphics.setBlendMode("add")
    super.draw(self)
	love.graphics.setBlendMode("alpha")
end

return SnowdinSnowflakeParticle