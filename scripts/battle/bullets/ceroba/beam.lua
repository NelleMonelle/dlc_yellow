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

function CerobaBeam:onDamage(soul)
    if soul.inv_timer > 0 then else
        soul.inv_timer = self.inv_timer
        Assets.playSound("ceroba_hurt_red")
        local alive_battlers = Utils.filter(Game.battle.party, function(battler) return not battler.is_down end)
        for _,battler in ipairs(alive_battlers) do
            battler:hurt(3, true)
            battler.chara:addStatBuff("health", -3)
        end
    end
    return {}
end

function CerobaBeam:update()
    super.update(self)
    --idk how to do that HELP

end

return CerobaBeam