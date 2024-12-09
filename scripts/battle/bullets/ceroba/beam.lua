local CerobaBeam, super = Class(Bullet)

function CerobaBeam:init(x, y, rot, dur)
    super.init(self, x, y)

    self.damage = 3
    self.destroy_on_hit = false
    self.rotation_num = rot or 0
    self.duration = dur or 1

    self.beam = Rectangle(x, y, 640, 40)
    self.beam.color = {1,1,1}
    self.beam.rotation = math.rad(self.rotation_num)
    Game.battle:addChild(self.beam)

    self:setHitbox(0, 0, 640, 20)
    Assets.playSound("kamehamehablast")
end

function CerobaBeam:onDamage(soul)
    local damage = self:getDamage()
    if damage > 0 then
        local battlers = Game.battle:hurt(damage, false, self:getTarget())
        soul.inv_timer = self.inv_timer
        soul:onDamage(self, damage)
        return battlers
    end
    return {}
end

function CerobaBeam:update()
    super.update(self)

    Game.battle.timer:every(0.1, function()
        local smt = 1
        if smt == 1 then
            smt = 2
            self.beam.graphics.grow_y = 0.1
        else
            smt = 1
            self.beam.graphics.grow_y = -0.1
        end
    end)

    Game.battle.timer:after(self.duration, function()
        self.beam:remove()
        self:remove()
    end)

end

return CerobaBeam