local Basic, super = Class(LightWave)

function Basic:init()
    super:init(self)
    self:setArenaSize(200, 200)
    self:setArenaPosition(319, 320) -- orig 320, 385
    self.type = Game.battle:getEnemyBattler("ceroba_geno").phase
    self.time = 10
end

function Basic:onStart()
    self.timer:after(1, function()
        self:spawnBullet("ceroba/beam", Game.battle.arena.x, Game.battle.soul.y, 270)
    end)
    self.timer:every(2, function()
        self:spawnBullet("ceroba/beam", Game.battle.arena.x, Game.battle.soul.y, 270)
    end)
end

function Basic:update()

    super.update(self)
end

return Basic