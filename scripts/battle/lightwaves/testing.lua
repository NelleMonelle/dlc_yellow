local Basic, super = Class(LightWave)

function Basic:init()
    super:init(self)
    self.time = -1
end

function Basic:onStart()
    --self:spawnBullet("steamworks/ceroba_ring_b", Game.battle.arena.x, Game.battle.arena.top)
    --self:spawnBullet("steamworks/ceroba_ring_o", Game.battle.arena.x, Game.battle.arena.bottom)

    self:spawnBullet("steamworks/ceroba_beam", 0, Game.battle.soul.y)
end

function Basic:update()

    super.update(self)
end

return Basic