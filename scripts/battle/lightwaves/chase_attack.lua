local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    self.time = 3
end

function Basic:onStart()
    self.timer:after(1/5, function()
        Game.battle.soul.can_move = true
    end)
    self.timer:every(1/2, function()
        local rnd = love.math.random(1, 4)
        if rnd == 1 then
            local bullet = self:spawnBulletTo(Game.battle.mask, "axis/ball", Game.battle.arena.right + 40, Utils.random(Game.battle.arena.top, Game.battle.arena.bottom), math.rad(love.math.random(150, 210)), 8)
            if not bullet.attacker then
                bullet.damage = 6
            end
        elseif rnd == 2 then
            local bullet = self:spawnBulletTo(Game.battle.mask, "axis/ball", Utils.random(Game.battle.arena.left, Game.battle.arena.right), Game.battle.arena.bottom + 40, math.rad(love.math.random(240, 300)), 8)
            if not bullet.attacker then
                bullet.damage = 6
            end
        elseif rnd == 3 then
            local bullet = self:spawnBulletTo(Game.battle.mask, "axis/ball", Game.battle.arena.left - 40, Utils.random(Game.battle.arena.top, Game.battle.arena.bottom), math.rad(love.math.random(-30, 30)), 8)
            if not bullet.attacker then
                bullet.damage = 6
            end
        else
            local bullet = self:spawnBulletTo(Game.battle.mask, "axis/ball", Utils.random(Game.battle.arena.left, Game.battle.arena.right), Game.battle.arena.top - 40, math.rad(love.math.random(60, 120)), 8)
            if not bullet.attacker then
                bullet.damage = 6
            end
        end
    end)
end

function Basic:update()

    super.update(self)
end

return Basic