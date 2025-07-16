local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    self:setArenaSize(256, 180)
    --self:setArenaPosition(319, 320) -- orig 320, 385
    self.time = 11
end

function Basic:onStart()
	self.timer:every(1, function()
		self.gun = self:spawnObject(BulletRainGun(Game.battle.arena.x, Game.battle.arena.y, Utils.pick({0, math.rad(90), math.rad(180), math.rad(270)})))
	end)
end

function Basic:update()

    super.update(self)
end

return Basic