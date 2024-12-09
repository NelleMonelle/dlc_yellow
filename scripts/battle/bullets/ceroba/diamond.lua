local CerobaDiamond, super = Class(Bullet)

function CerobaDiamond:init(x, y, dir, speed)
    -- Last argument = sprite path
    super.init(self, x, y, "battle/bullets/ceroba/diamond")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    self.collider = nil
    self.destroy_on_hit = false
    self.sprite:setAnimation({"battle/bullets/ceroba/diamond", 1/20, false})
    Assets.playSound("trap")
end

function CerobaDiamond:onCollide(soul)
    if soul.stunned ~= true then
        soul.stunned = true
        local color = soul.color
        soul:setColor(1, 1, 1)
        Game.battle.soul.can_move = false
        soul.graphics.shake_x = 1
        soul.graphics.shake_y = 1
        Game.battle.timer:after(1, function()
            soul.stunned = false
            Game.battle.soul.can_move = true
            soul:setColor(color)
            soul.graphics.shake_x = 0
            soul.graphics.shake_y = 0
        end)
    end
end

function CerobaDiamond:update()
    Game.battle.timer:after(0.35, function()
        self.collider = PolygonCollider(self, {{24.5,4.5},{41.5,21.5},{24.5,38.5},{23.5,38.5},{6.5,21.5},{23.5,4.5}})
    end)
    Game.battle.timer:after(0.55, function()
        self:remove()
    end)

    super.update(self)
end

return CerobaDiamond