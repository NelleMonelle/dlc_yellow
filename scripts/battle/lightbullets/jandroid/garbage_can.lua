local GarbageCan, super = Class(LightBullet)

function GarbageCan:init(x, y)
    super.init(self, x, y, "battle/bullets/jandroid/garbage_can")
    self:setOrigin(0.5, 0.5)
    self.damage = 0
    self.collidable = false

    self.target_x = Game.battle.arena.x
    self.start_y = y

    self.scene = 0
    self.state_timer = 0
	self.layer = self.layer + 1 


    self.spawn_timer_max = 9
    self.spawn_timer = self.spawn_timer_max
    self.spawn_number = 3
    self.spawn_current = 0
    self.spawn_dir = 1
    self.spawn_offset_max = 70
    self.spawn_offset_inc = self.spawn_offset_max / self.spawn_number

    self.green_spawned = false
    self.pseudo_random = 150
end

function GarbageCan:update()
    super.update(self)

    if self.scene == 0 then

        if self.x < self.target_x - 1 then
            self.x = MathUtils.lerp(self.x, self.target_x, 0.3 * DTMULT)
        else
            self.x = self.target_x
            self.scene = 1
        end

    elseif self.scene == 1 then

        local charge_pos = self.start_y - 30
        if self.y > charge_pos + 0.5 then
            self.y = MathUtils.lerp(self.y, charge_pos, 0.5 * DTMULT)
        else
            self.y = charge_pos
            self.scene = 2
        end

        local charge_pct = (self.start_y - self.y) / (self.start_y - charge_pos)
        self.rotation = math.rad(-180 * charge_pct)

    elseif self.scene == 2 then

        self.x = self.target_x + math.random(-2, 2)

        self.spawn_timer = self.spawn_timer - 1 * DTMULT
        if self.spawn_timer <= 0 then
            local spawn_x = (self.x - (self.spawn_offset_max * 0.5)) + (self.spawn_current * self.spawn_offset_inc)
            local spawn_y = self.y + 15

            local spawn_soap = false
            if not self.green_spawned and (math.random(0, math.max(1, math.floor(self.pseudo_random))) <= 1 or self.pseudo_random <= 0) then
                spawn_soap = true
                self.green_spawned = true
            end

            if spawn_soap then
                self.wave:spawnBullet("jandroid/soap", spawn_x, spawn_y)
            else
                self.wave:spawnBullet("jandroid/garbage", spawn_x, spawn_y)
            end

            if (self.spawn_current + self.spawn_dir) > self.spawn_number or (self.spawn_current + self.spawn_dir) < 0 then
                self.spawn_dir = self.spawn_dir * -1
            end
            self.spawn_current = self.spawn_current + self.spawn_dir
            self.spawn_timer = self.spawn_timer_max
        end

        self.pseudo_random = math.max(0, self.pseudo_random - 1 * DTMULT)
    end
end

return GarbageCan
