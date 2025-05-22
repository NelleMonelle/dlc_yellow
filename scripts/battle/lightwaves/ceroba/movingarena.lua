local Basic, super = Class(LightWave)

function Basic:init()
    super.init(self)
    self:setArenaSize(160, 160)
    --self:setArenaPosition(319, 320) -- orig 320, 385
    self.type = Game.battle:getEnemyBattler("ceroba_geno").phase
    self.time = 13
    self.flowercount = 1
end

function Basic:onStart()
    local arena = Game.battle.arena
    arena:slideTo(arena.x + 200, arena.y, 3)
    self.timer:after(3, function()
        arena:slideTo(arena.x - 200, arena.y, 3)
    end)
    self.timer:after(6, function()
        arena:slideTo(arena.x - 200, arena.y, 3)
    end)
    self.timer:after(9, function()
        arena:slideTo(arena.x + 200, arena.y, 3)
    end)

    local colors = {"b", "o", "o", "b", "o", "o", "o", "b", "o", "b", "o", "b"}
    if self.type == 2 then
        colors = {"o", "b", "b", "o", "b", "b", "b", "o", "b", "o", "b", "o"}
    end
    self.timer:every(1, function()
        local xcoord = Game.battle.arena.x - Game.battle.arena.width/2
        if self.flowercount < 3 or self.flowercount > 8 then
            xcoord = Game.battle.arena.x + Game.battle.arena.width/2
        end
        if self.flowercount < 12 then
            self:spawnBullet("ceroba/flower_large", xcoord, 520, math.rad(270), 15, 0.5, true, colors[self.flowercount])
            self.flowercount = self.flowercount + 1
        end
    end)
end

function Basic:update()

    super.update(self)
end

return Basic