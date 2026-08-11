local Soap, super = Class(LightBullet)

function Soap:init(x, y, dir, speed)
    super.init(self, x, y, "battle/bullets/jandroid/garbage_soap")
    self:setScale(1)
    
    -- The wave passes math.rad(90) (down) and 4 (speed). 
    self.physics.direction = dir or math.rad(90)
    self.physics.speed = speed or 4
end

function Soap:update()
    super.update(self)
end

function Soap:onCollide(soul)

    local member = TableUtils.pick(Game.battle.party)
    member:heal(4)
    

    Assets.playSound("heal_c", 0.7)
    

    local attackers = self.wave:getAttackers()
    for _, attacker in ipairs(attackers) do
        attacker:addMercy(100)
    end
    
    self:remove()
end

return Soap
