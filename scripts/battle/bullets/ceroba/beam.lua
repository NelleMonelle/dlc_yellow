local CerobaBeam, super = Class(Bullet)

function CerobaBeam:init(x, y, rot, dur)
    super.init(self, x, y)

    self.damage = 3
    self.destroy_on_hit = false
    self.rotation_num = rot or 0
    self.duration = dur or 1

    self.beam = Rectangle(x or 0, y or 0, 640, 40)
    self.beam.color = {1,1,1}
    self.beam.rotation = math.rad(self.rotation_num)
    Game.battle:addChild(self.beam)

    self:setHitbox(0, 0, 640, 20)
    Assets.playSound("kamehamehacharge")
    Game.battle.timer:after(0.5, function()
        Assets.playSound("kamehamehablast")
    end)
end

-- need to somehow damage party members for 3 MAX HP
--[[function CerobaBeam:onDamage(soul)
    -- need
    return {}
end]]

function CerobaBeam:update()
    super.update(self)
    --idk how to do that HELP

end

return CerobaBeam