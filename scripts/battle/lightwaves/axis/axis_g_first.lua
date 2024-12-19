local Basic, super = Class(LightWave)

function Basic:init()
    super:init(self)
    self:setArenaSize(160, 160)
    self:setArenaPosition(319, 360) -- orig 320, 385
    self.time = 8
end

function Basic:onStart()
    --group 1
    self.timer:after(1/3, function()
        local bullet1 = self:spawnBullet("axis/ball_bouncy", Game.battle.arena.x, Game.battle.arena.y - 148)
        local bullet2 = self:spawnBullet("axis/ball_bouncy", Game.battle.arena.x - 23, Game.battle.arena.y - 156)
        local bullet3 = self:spawnBullet("axis/ball_bouncy", Game.battle.arena.x + 23, Game.battle.arena.y - 156)
        self.timer:after(1/2, function()
            Assets.playSound("swoosh")
            bullet1.physics.direction = math.pi / 2 --go down
            bullet1.physics.speed = 5
            bullet2.physics.direction = math.pi * 0.75 --go down and left
            bullet2.physics.speed = 5
            bullet3.physics.direction = math.pi * 0.25 --go down and right
            bullet3.physics.speed = 5
        end)
        self.timer:after(2.5, function()
            bullet2:fadeOutAndRemove(0.25)
            bullet3:fadeOutAndRemove(0.25)
        end)
        self.timer:after(3.75, function()
            bullet1:fadeOutAndRemove(0.25)
        end)
    end)

    -- group 2
    self.timer:after(1.85, function()
        local bullet4 = self:spawnBullet("axis/ball_bouncy", Game.battle.arena.x - 90, Game.battle.arena.y - 70)
        local bullet5 = self:spawnBullet("axis/ball_bouncy", Game.battle.arena.x - 93, Game.battle.arena.y - 45)
        local bullet6 = self:spawnBullet("axis/ball_bouncy", Game.battle.arena.x - 93, Game.battle.arena.y - 95)
        self.timer:after(1/2, function()
            Assets.playSound("swoosh")
            bullet4.physics.direction = 0 --go right
            bullet4.physics.speed = 5
            bullet5.physics.direction = math.pi * 0.25 --go up and right
            bullet5.physics.speed = 5
            bullet6.physics.direction = -math.pi * 0.25 --go down and right
            bullet6.physics.speed = 5
        end)
        self.timer:after(2.25, function()
            bullet5:fadeOutAndRemove(0.25)
            bullet6:fadeOutAndRemove(0.25)
        end)
        self.timer:after(3.5, function()
            bullet4:fadeOutAndRemove(0.25)
        end)
    end)

    -- group 3
    self.timer:after(3.25, function()
        local bullet7 = self:spawnBullet("axis/ball_bouncy", Game.battle.arena.left, Game.battle.arena.bottom)
        local bullet8 = self:spawnBullet("axis/ball_bouncy", Game.battle.arena.left - 13, Game.battle.arena.bottom - 20)
        local bullet9 = self:spawnBullet("axis/ball_bouncy", Game.battle.arena.left + 3, Game.battle.arena.bottom + 20)
        self.timer:after(1/2, function()
            Assets.playSound("swoosh")
            bullet7.physics.direction = -math.pi * 0.25 --go left
            bullet7.physics.speed = 5
            bullet8.physics.direction = -math.pi * 0.45 --go up and left
            bullet8.physics.speed = 5
            bullet9.physics.direction = -math.pi * 0.05 --go down and left
            bullet9.physics.speed = 5
        end)
        self.timer:after(2.25, function()
            bullet8:fadeOutAndRemove(0.25)
            bullet9:fadeOutAndRemove(0.25)
        end)
        self.timer:after(2.75, function()
            bullet7:fadeOutAndRemove(0.25)
        end)
    end)

    -- group 4
    self.timer:after(4.85, function()
        local bullet10 = self:spawnBullet("axis/ball_bouncy", Game.battle.arena.x + 90, Game.battle.arena.y - 70)
        local bullet11 = self:spawnBullet("axis/ball_bouncy", Game.battle.arena.x + 93, Game.battle.arena.y - 45)
        local bullet12 = self:spawnBullet("axis/ball_bouncy", Game.battle.arena.x + 93, Game.battle.arena.y - 95)
        self.timer:after(1/2, function()
            Assets.playSound("swoosh")
            bullet10.physics.direction = math.pi --go left
            bullet10.physics.speed = 5
            bullet11.physics.direction = math.pi * 0.75 --go up and left
            bullet11.physics.speed = 5
            bullet12.physics.direction = -math.pi * 0.75 --go down and left
            bullet12.physics.speed = 5
        end)
    end)
end

function Basic:update()

    super.update(self)
end

return Basic