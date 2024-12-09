local Basic, super = Class(LightWave)

function Basic:init()
    super:init(self)
    self.time = 3
end

function Basic:onStart()
    self.timer:after(1/5, function()
        Game.battle.soul.can_move = true
    end)
    self.timer:every(1/2, function()
        local rnd = math.random(1, 4)
        if rnd == 1 then
            self:spawnBullet("steamworks/axis_ball", Game.battle.arena.right, Utils.random(Game.battle.arena.top, Game.battle.arena.bottom), math.rad(math.random(140, 220)), 8)
        elseif rnd == 2 then
            self:spawnBullet("steamworks/axis_ball", Utils.random(Game.battle.arena.left, Game.battle.arena.right), Game.battle.arena.bottom, math.rad(math.random(230, 310)), 8)
        elseif rnd == 3 then
            self:spawnBullet("steamworks/axis_ball", Game.battle.arena.left, Utils.random(Game.battle.arena.top, Game.battle.arena.bottom), math.rad(math.random(-40, 40)), 8)
        else
            self:spawnBullet("steamworks/axis_ball", Utils.random(Game.battle.arena.left, Game.battle.arena.right), Game.battle.arena.top, math.rad(math.random(50, 130)), 8)
        end
    end)
end

function Basic:update()

    super.update(self)
end

return Basic