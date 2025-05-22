local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    self:setArenaSize(140, 140)
    self:setArenaPosition(319, 340) -- orig 320, 385
    self.time = 12
    self.darken = true
end

function Basic:onStart()
    self.timer:after(0.5, function()
        local bullet = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_b", Game.battle.arena.width/2, 0 - 5, math.rad(90), 3.5)
        bullet.bounce = false
        local bullet2 = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_o", Game.battle.arena.width/2, 140 + 5, math.rad(270), 3.5)
        bullet2.bounce = false
    end)
    self.timer:after(2, function()
        local bullet = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_b", Game.battle.arena.width/2, 0 - 5, math.rad(90), 3.5)
        bullet.bounce = false
        local bullet2 = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_o", Game.battle.arena.width/2, 140 + 5, math.rad(270), 3.5)
        bullet2.bounce = false
    end)
    self.timer:after(3.5, function()
        local bullet = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_o", Game.battle.arena.width/2, 0 - 5, math.rad(90), 3.5)
        bullet.bounce = false
        local bullet2 = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_b", Game.battle.arena.width/2, 140 + 5, math.rad(270), 3.5)
        bullet2.bounce = false
    end)
    self.timer:after(6, function()
        local bullet = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_b", 0 - 5, Game.battle.arena.height/2, math.rad(0), 3.5, 90)
        bullet.bounce = false
        local bullet2 = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_o", 140 + 5, Game.battle.arena.height/2, math.rad(180), 3.5, 90)
        bullet2.bounce = false
    end)
    self.timer:after(7.5, function()
        local bullet = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_o", 0 - 5, Game.battle.arena.height/2, math.rad(0), 3.5, 90)
        bullet.bounce = false
        local bullet2 = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_b", 140 + 5, Game.battle.arena.height/2, math.rad(180), 3.5, 90)
        bullet2.bounce = false
    end)
    self.timer:after(9, function()
        local bullet = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_o", 0 - 5, Game.battle.arena.height/2, math.rad(0), 3.5, 90)
        bullet.bounce = false
        local bullet2 = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_b", 140 + 5, Game.battle.arena.height/2, math.rad(180), 3.5, 90)
        bullet2.bounce = false
    end)
end

function Basic:update()

    super.update(self)
end

return Basic