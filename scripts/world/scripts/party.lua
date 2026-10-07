return {
    dess_missle = function()
        local dess = Game.world:getCharacter("dess")
        if not dess or dess.timer ~= nil then return end
        dess.physics.gravity_direction = -math.rad(90)
        dess.physics.gravity = 0.5
        dess.timer = 1
        Assets.playSound("rocket_long")
        HookSystem.hook(dess, "update", function(orig, self)
            self.x = self.x + TableUtils.pick({ -1, 1 })
            self.y = self.y + TableUtils.pick({ -1, 1 })
            if self.timer == 0 then
                local smoke = Sprite("effects/launchsmoke", self.x, self.y)
                smoke:setOriginExact(12, 14)
                smoke:setScale(2)
                smoke.layer = self.layer - 0.01
                smoke.rotation = math.rad(MathUtils.randomInt(361))
                smoke.physics.direction = -math.rad(270 + MathUtils.random(-22.5, 22.5))
                smoke.physics.speed = 3 + MathUtils.random(3)
                Game.world:addChild(smoke)
                smoke:fadeOutAndRemove(1)
                self.timer = 1
            end
            self.timer = MathUtils.approach(self.timer, 0, DTMULT)
            orig(self)
        end)
        Game.world.timer:after(120 / 30, function() dess:remove() end)
    end
}
