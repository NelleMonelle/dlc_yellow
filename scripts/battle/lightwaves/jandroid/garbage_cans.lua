local GarbageCans, super = Class(LightWave)

function GarbageCans:init()
    super.init(self)
    self:setArenaPosition(319, 310)
    self:setArenaSize(80, 118)
    self.time = 7 
    self.darken = true
    self.time_elapsed = 0
end

function GarbageCans:onStart()
    self:spawnBullet("jandroid/garbage_can", Game.battle.arena.x - 120, Game.battle.arena.top - 60)
end

function GarbageCans:update()
    super.update(self)
    self.time_elapsed = self.time_elapsed + DT
end

return GarbageCans
