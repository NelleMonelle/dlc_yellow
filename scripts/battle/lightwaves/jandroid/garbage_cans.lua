local Basic, super = Class(LightWave)

function Basic:init()
    super:init(self)
    --[[self:setArenaSize(160, 160)
    self:setArenaPosition(319, 360)
    self.time = 8]]
end

function Basic:onStart()
    self.timer:every(1/3, function()
        self:spawnBullet("jandroid/garbage", Game.battle.soul.x, Game.battle.arena.top - 80, math.rad(90), 4)
    end)
    self.timer:after(1.5, function()
        self:spawnBullet("jandroid/soap", Game.battle.soul.x, Game.battle.arena.top - 80, math.rad(90), 4)
    end)
end

function Basic:update()

    super.update(self)
end

return Basic