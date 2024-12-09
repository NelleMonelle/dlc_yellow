local Basic, super = Class(LightWave)

function Basic:init()
    super:init(self)
    self.time = 10
end

function Basic:onStart()
    --Game.battle:swapSoul(GreenSoul())
    self.timer:every(1/2, function()

        local bullet = self:spawnBullet("steamworks/axis_ball", Utils.random(Game.battle.arena.left, Game.battle.arena.right), 0, math.rad(90), 6)

        bullet.remove_offscreen = false
    end)
end

function Basic:onEnd()
    --Game.battle:swapSoul(Soul(x, y, {1, 1, 0}))
end

function Basic:update()

    super.update(self)
end

return Basic