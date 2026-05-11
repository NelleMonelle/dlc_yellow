local RerunRabbit, super = Class(LightBullet)

function RerunRabbit:init(x, y)
    super.init(self, x, y, "battle/bullets/tellyvis/reruns/rabbit")
	self.sprite:setFrame(2)
	self:setScale(2, 2)
	self:setOrigin(0.5,0.5)
	self.alpha = 0
	self:fadeTo(1, 0.1)
	self.physics.speed_x = -3 + Utils.random(1)
	self.jumpsiner = Utils.random(100)
	self.jumpspeed = 8 + Utils.random(4)
	self.jumpheight = 50 + Utils.random(10)
	self.collider = Hitbox(self, 8, 25, 17, 5)
	self.fading_out = false
end

function RerunRabbit:update()
	super.update(self)
	self.jumpsiner = self.jumpsiner + DTMULT
	local bottomy = Game.battle.arena.bottom-20
	local jsine = math.sin(self.jumpsiner/self.jumpspeed)*self.jumpheight
	self.y = (bottomy + jsine) - self.jumpheight
	self.sprite:setFrame(2)
	if jsine > 0 then
		self.sprite:setFrame(3)
	end
	if jsine > self.jumpheight / 2 then
		self.sprite:setFrame(1)
	end
	if self.x < Game.battle.arena.left-40 and not self.fading_out then
		self:fadeOutAndRemove(0.1)
		self.fading_out = true
	end
end

return RerunRabbit