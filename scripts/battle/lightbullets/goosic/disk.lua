local Disk, super = Class(LightBullet)
-- very not perfect
function Disk:init(x, y)
    super.init(self, x, y, "battle/bullets/goosic/disk")
    self:setOrigin(0.5, 0.5)
    self:setScale(1)

    self.destroy_on_hit = false 

    -- Start facing upwards
    self.physics.direction = -math.pi/2
    self.rotation = self.physics.direction

    self.sprite.alpha = 0
    self.spin_speed = 0
    
    self.scene = 0
    self.state_timer = 0
    
    self.launch_timer = 30
    self.arrow_alpha = 0
end

function Disk:update()
    
    if self.scene == 0 then
        if self.sprite.alpha < 1 then
            self.sprite.alpha = self.sprite.alpha + 0.1 * DTMULT
        else
            self.sprite.alpha = 1
            self.scene = 1
            self.state_timer = 0
        end

    elseif self.scene == 1 then
        self.state_timer = self.state_timer + 1 * DTMULT
        if self.state_timer >= 15 then
            self.scene = 2
        end

    elseif self.scene == 2 then
        if self.spin_speed < 20 then
            self.spin_speed = self.spin_speed + 1 * DTMULT
        else
            self.scene = 3
        end

    elseif self.scene == 3 then
        if self.launch_timer > 0 then
            self.launch_timer = self.launch_timer - 1 * DTMULT
        else
            local soul_dir = MathUtils.angle(self.x, self.y, Game.battle.soul.x, Game.battle.soul.y)
            local diff = math.deg(MathUtils.angleDiff(self.physics.direction, soul_dir))

            if math.abs(diff) <= self.spin_speed + 1 then
                self.scene = 4
            end
        end

    elseif self.scene == 4 then
        self.spin_speed = MathUtils.lerp(self.spin_speed, 0, 0.75 * DTMULT)
        if self.spin_speed < 0.1 then
            self.spin_speed = 0
            self.scene = 5
            self.state_timer = 0
        end

    elseif self.scene == 5 then
        self.state_timer = self.state_timer + 1 * DTMULT
        if self.state_timer >= 6 then
            self.scene = 6
            self.state_timer = 0
        end

    elseif self.scene == 6 then
        self.physics.speed = MathUtils.lerp(self.physics.speed, 14, 0.5 * DTMULT)

        self.state_timer = self.state_timer + 1 * DTMULT
        if self.state_timer >= 21 then
            self.launch_timer = 30
            self.scene = 1
            self.state_timer = 0
        end
    end

    -- Spin logic
    self.physics.direction = self.physics.direction - math.rad(self.spin_speed) * DTMULT
    self.rotation = self.physics.direction

    if self.scene ~= 6 then
        self.physics.speed = MathUtils.lerp(self.physics.speed, 0, 0.3 * DTMULT)
    end

    -- If the CD flies to the edge of the screen, 
    -- it bounces back instead of flying off into the void.
    local bounced = false
    if self.x < 24 then
        self.x = 24
        self.physics.direction = math.pi - self.physics.direction
        bounced = true
    elseif self.x > SCREEN_WIDTH - 24 then
        self.x = SCREEN_WIDTH - 24
        self.physics.direction = math.pi - self.physics.direction
        bounced = true
    end

    if self.y < 24 then
        self.y = 24
        self.physics.direction = -self.physics.direction
        bounced = true
    elseif self.y > SCREEN_HEIGHT - 24 then
        self.y = SCREEN_HEIGHT - 24
        self.physics.direction = -self.physics.direction
        bounced = true
    end

    if bounced then
        self.rotation = self.physics.direction
    end

    local alpha_new = (self.scene == 2 or self.scene == 3) and 1 or 0
    self.arrow_alpha = MathUtils.lerp(self.arrow_alpha, alpha_new, 0.2 * DTMULT)

    super.update(self)
end

function Disk:draw()
    super.draw(self)

    local arrow_tex = Assets.getTexture("battle/bullets/goosic/disk_arrow")
    if arrow_tex then
        Draw.setColor(1, 1, 1, self.arrow_alpha)
        
		-- probably should be further off tbh
        Draw.draw(
            arrow_tex, 
            (self.width / 2) + 25, self.height / 2, 
            0, 
            1, 1, 
            arrow_tex:getWidth() / 2, arrow_tex:getHeight() / 2
        )
    end
end

return Disk
