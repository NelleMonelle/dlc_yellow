local Basic, super = Class(LightWave)

function Basic:init()
    super:init(self)
    self:setArenaSize(120, 120)
    --self:setArenaPosition(319, 320) -- orig 320, 385
    self.type = Game.battle:getEnemyBattler("ceroba_geno").phase
    self.time = 10
    if self.type == 2 then
        self.beam_rotation = 360
    else
        self.beam_rotation = 0
    end
end

function Basic:onStart()
    self.timer:every(0.15, function()
        self:spawnBullet("ceroba/beam", Game.battle.arena.x, Game.battle.arena.y, self.beam_rotation, 0.1)
        if self.type == 2 then
            if self.beam_rotation == 0 then
                self.beam_rotation = 345
            else
                self.beam_rotation = self.beam_rotation - 15
            end
        else
            if self.beam_rotation == 360 then
                self.beam_rotation = 15
            else
                self.beam_rotation = self.beam_rotation + 15
            end
        end
    end)
end

function Basic:update()

    super.update(self)
end

return Basic