local Basic, super = Class(LightWave)

function Basic:init()
    super:init(self)
    self:setArenaSize(140, 140)
    self:setArenaPosition(319, 340) -- orig 320, 385
    self.time = 10
    self.darken = true
    self.sequence = "ooboobooboobooboob"
    self.counter = 0
end

function Basic:onStart()
    --Game.battle:swapSoul(GreenSoul())
    self.timer:every(1/2, function()
        self.counter = self.counter + 1
        local ax,ay = Game.battle.arena:getCenter()
        local bullet = self:spawnBulletTo(Game.battle.arena.mask, "axis/laser_"..(self.sequence[self.counter]), Game.battle.arena.width/2, 0 - 5, math.rad(90), 6)
        bullet.bounce = false
        -- bullet.remove_offscreen = false
    end)
end

function Basic:onEnd()
    --Game.battle:swapSoul(Soul(x, y, {1, 1, 0}))
end

function Basic:update()

    super.update(self)
end

return Basic