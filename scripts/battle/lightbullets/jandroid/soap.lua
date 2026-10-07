local Soap, super = Class(LightBullet)

function Soap:init(x, y)
    super.init(self, x, y, "battle/bullets/jandroid/garbage_soap")
    self:setOrigin(0.5, 0.5)
    
    self:setScale(1) 

    self.destroy_on_hit = false

    self.collider = CircleCollider(self, self.width/2, self.height/2, 12) 

    self.physics.gravity = 0.25
    self.vspeed_max = 4
    self.bounce_noloop = false
end

function Soap:update()
    if self.physics.speed_y > self.vspeed_max then
        self.physics.speed_y = self.vspeed_max
    end

    local box = Game.battle.arena
    local bbox_bottom = self.y + (self.height * self.scale_y * 0.5)
    local bbox_left = self.x - (self.width * self.scale_x * 0.5)
    local bbox_right = self.x + (self.width * self.scale_x * 0.5)

    if (bbox_bottom + self.physics.speed_y) >= (box.bottom - 3) then
        self.y = box.bottom - 3 - (self.height * self.scale_y * 0.5)
        self.physics.speed_y = -self.physics.speed_y * 0.7

        if math.abs(self.physics.speed_y) < 0.15 then
            self.physics.speed_y = 0
        end

        if not self.bounce_noloop then
            self.physics.speed_x = Utils.pick({-2, 2})
            self.bounce_noloop = true
        end
    end

    if (bbox_left + self.physics.speed_x) <= (box.left + 3) or (bbox_right + self.physics.speed_x) >= (box.right - 3) then
        self.physics.speed_x = -self.physics.speed_x * 0.8
        if math.abs(self.physics.speed_x) < 0.15 then
            self.physics.speed_x = 0
        end
    end

    super.update(self)
end

function Soap:onCollide(soul)
    local member = Utils.pick(Game.battle.party)
    member:heal(4)
    Assets.playSound("heal_c", 0.7)

    local attackers = self.wave:getAttackers()
    for _, attacker in ipairs(attackers) do
        attacker:addMercy(100)
    end

    self:remove()
end

return Soap
