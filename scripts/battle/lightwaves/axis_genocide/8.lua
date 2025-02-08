local Basic, super = Class(LightWave)

function Basic:init()
    super:init(self)
    self:setArenaSize(60, 60)
    --self:setArenaPosition(319, 360) -- orig 320, 385
    self.time = 8
    self.darken = true
end

function Basic:spawnTurrets()
    local updown = Utils.pick({1,2})
    local leftright = Utils.pick({1,2})
    local bullet1
    local bullet2
    local bullet3
    local bullet4
    local bullet5
    local bullet6
    if updown == 1 then -- up
        bullet1 = self:spawnBullet("axis/turret", Game.battle.arena.x, Game.battle.arena.top - 20, 90)
        bullet2 = self:spawnBullet("axis/turret", Game.battle.arena.x - 20, Game.battle.arena.top - 20, 90)
        bullet3 = self:spawnBullet("axis/turret", Game.battle.arena.x + 20, Game.battle.arena.top - 20, 90)
    elseif updown == 2 then -- down
        bullet1 = self:spawnBullet("axis/turret", Game.battle.arena.x, Game.battle.arena.bottom + 20, 270)
        bullet2 = self:spawnBullet("axis/turret", Game.battle.arena.x - 20, Game.battle.arena.bottom + 20, 270)
        bullet3 = self:spawnBullet("axis/turret", Game.battle.arena.x + 20, Game.battle.arena.bottom + 20, 270)
    end
    if leftright == 1 then -- left
        bullet4 = self:spawnBullet("axis/turret", Game.battle.arena.left - 20, Game.battle.arena.y, 0)
        bullet5 = self:spawnBullet("axis/turret", Game.battle.arena.left - 20, Game.battle.arena.y - 20, 0)
        bullet6 = self:spawnBullet("axis/turret", Game.battle.arena.left - 20, Game.battle.arena.y + 20, 0)
    elseif leftright == 2 then -- right
        bullet4 = self:spawnBullet("axis/turret", Game.battle.arena.right + 20, Game.battle.arena.y, 180)
        bullet5 = self:spawnBullet("axis/turret", Game.battle.arena.right + 20, Game.battle.arena.y - 20, 180)
        bullet6 = self:spawnBullet("axis/turret", Game.battle.arena.right + 20, Game.battle.arena.y + 20, 180)
    end
    self.timer:after(1.5, function()
        bullet1:fadeOutAndRemove(0.25)
        bullet2:fadeOutAndRemove(0.25)
        bullet3:fadeOutAndRemove(0.25)
        bullet4:fadeOutAndRemove(0.25)
        bullet5:fadeOutAndRemove(0.25)
        bullet6:fadeOutAndRemove(0.25)
    end)
end

function Basic:onStart()
    self:spawnTurrets()
    self.timer:every(2, function()
        self:spawnTurrets()
    end)
end

function Basic:update()

    super.update(self)
end

return Basic