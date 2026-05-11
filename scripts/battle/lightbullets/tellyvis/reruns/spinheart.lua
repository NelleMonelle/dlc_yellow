local RerunSpinHeart, super = Class(LightBullet)

function RerunSpinHeart:init(x, y, dir, speed)
    super.init(self, x, y, "battle/bullets/tellyvis/reruns/spinheart")
    self:setScale(3)

    self.physics.direction = dir
    self.physics.speed = speed
    self.destroy_on_hit = false
    self.collider = PolygonCollider(self, {
        {3,20},
        {0,16},
        {0,7},
        {7,0},
        {20,0},
        {41,20.5},
        {22,40},
        {7,40},
        {0,33},
        {0,24},
        {3,20},
        {8,20},
        {4,15},
        {4,8},
        {9,5},
        {19,5},
        {36,20.5},
        {19,36},
        {9,36},
        {4,32},
        {4,25},
        {8,20}
    })
    self.damage = 0

    self.con = 0
    self.htimer = 0
    self.alpha = 0
    self.spinmax = 0
    self.hmax = 0
end

function RerunSpinHeart:update()
    -- For more complicated bullet behaviours, code here gets called every update
    if self.con == 0 then
        self.alpha = self.alpha + 0.2 * DTMULT
        local scale = self.getScale(self)
        self:setScale(scale - 0.1)
        self.htimer = self.htimer + 1 * DTMULT
        if self.htimer >= 5 then
            self.con = 1
            self.htimer = 0
            self.damage = nil
        end
    end
    if self.con == 1 then
        self.htimer = self.htimer + 1 * DTMULT
        if self.htimer >= 10 then
			local rejected = {}
			if self.y < Game.battle.arena.top + 30 then
				table.insert(rejected, 26.25)
			end
			if self.x > Game.battle.arena.right - 30 then
				table.insert(rejected, 30)
			end
			if self.y > Game.battle.arena.bottom - 30 then
				table.insert(rejected, 33.75)
			end
			if self.x < Game.battle.arena.left + 30 then
				table.insert(rejected, 37.5)
			end
			self.spinmax = TableUtils.pick({26.25,30,33.75,37.5}, (function(value) return not TableUtils.contains(rejected, value) end))
            self.con = 2
            self.htimer = 0
        end
    end
    if self.con == 2 then
        self.htimer = self.htimer + 1 * DTMULT
        self.rotation = self.rotation + math.rad(24) * DTMULT
        if self.htimer >= self.spinmax then
            self.hmax = 19
            self.rotation = math.rad(self.spinmax * 24)
            self.con = 3
            self.htimer = 0
        end
    end
    if self.con == 3 then
        self.htimer = self.htimer + 1 * DTMULT
        if self.htimer >= self.hmax then
            self.physics.direction = self.rotation
            self.physics.speed = 2.5
            self.physics.friction = -0.5
            self.con = 4
            self.htimer = 0
        end
    end
    if self.con == 4 then
        self.htimer = self.htimer + 1 * DTMULT
        if self.htimer >= 10 then
            self.physics.friction = 0
            self.physics.speed = 0
			if self.htimer < 10 then
				self.htimer = 10
			end
        end
        if self.htimer >= 20 then
            self.damage = 0
            self.alpha = self.alpha - 0.2 * DTMULT
        end
        if self.htimer >= 25 then
			self:remove()
        end
    end

    super.update(self)
end

return RerunSpinHeart