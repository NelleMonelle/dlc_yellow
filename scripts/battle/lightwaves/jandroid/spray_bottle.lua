local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    self:setArenaSize(110, 128)
	local arena = Game.battle.arena
	self:setArenaPosition(arena.x, arena.y-10)
    self.time = 7
    self.enemies = self:getAttackers()
	self.spray_amount = 4
	self.rad_current = 0
end

function Basic:onStart()
	local arena = Game.battle.arena
	self.timer:script(function(wait)
		self.bottle = self:spawnSprite("battle/bullets/jandroid/spray_bottle", 440, 300)
		self.bottle:setScale(1)
		self.bottle:setOriginExact(32,20)
		self.bottle.alpha = 0
		wait(2/30)
		self.bottle:fadeToSpeed(1, 0.1)
		wait(10/30)
		wait(15/30)
		while true do
			self.bottle:play(3/30, false)
			for i = 1, self.spray_amount do
				local bullet = self:spawnBullet("jandroid/spray", self.bottle.x - 8, self.bottle.y - 9, math.rad(135 + i * (90 / self.spray_amount)))
			end
			wait(20/30)
		end
	end)
end

function Basic:update()
	super.update(self)
	self.rad_current = self.rad_current + 0.05 * DTMULT
	if self.rad_current >= 360 then
		self.rad_current = 0
	end
	self.bottle.y = 300 + math.sin(self.rad_current) * 30
	self.bottle.x = 410
end
return Basic