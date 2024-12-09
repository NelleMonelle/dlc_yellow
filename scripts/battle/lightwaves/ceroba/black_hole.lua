local Basic, super = Class(LightWave)

function Basic:init()
    super:init(self)
    self:setArenaSize(200, 200)
    self:setArenaPosition(319, 320) -- orig 320, 385
    self.type = Game.battle:getEnemyBattler("ceroba_geno").phase
    self.time = 10
end

function Basic:onStart()
    local warning = self:spawnBullet("warning", Game.battle.arena.x, Game.battle.arena.y)
    self.timer:after(0.1, function()
        Assets.playSound("bombfall")
    end)
    self.timer:after(0.2, function()
        Assets.playSound("bombfall")
    end)
    self.timer:after(0.3, function()
        Assets.playSound("bombfall")
    end)
    self.timer:after(0.4, function()
        warning:fadeOutAndRemove(0.1)
    end)
    self.timer:after(1, function()
        self:spawnBullet("ceroba/black_hole", Game.battle.arena.x, Game.battle.arena.y)
    end)
    self.timer:every(2, function()
        self:spawnBullet("ceroba/diamond", Game.battle.soul.x, Game.battle.soul.y)
    end)
end

function Basic:update()

    super.update(self)
end

return Basic